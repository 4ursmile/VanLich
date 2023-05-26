using MongoDB.Driver;
using VanLichAPI.Models.Databases;
using VanLichAPI.Models;
using VanLichAPI.Services;

namespace VanLichAPI.Services.Models;
public class CommentServices : IModelServices<Comment>
{
    private readonly VanLichDbServices _dbServices;
    private readonly ContentServices _contentServices;
    public CommentServices(VanLichDbServices dbServices, ContentServices contentServices)
    {
        _dbServices = dbServices;
        _contentServices = contentServices;
    }
    public async Task CreateAsync (Comment comment)
    {
        await _dbServices.CommentCollection.InsertOneAsync(comment);
        await _contentServices.IncreaseCommentAsync(comment.contentId);
        if (comment.parentCommentIds != null)
        {
            // increase nOfChildComments of parent comment
            await _dbServices.CommentCollection.UpdateOneAsync(
                c => c.contentId == comment.contentId & c.Id == comment.parentCommentIds, 
                Builders<Comment>.Update.Inc(c => c.nOfChildComments, 1));

        }
    }

    public async Task<List<Comment>> GetAllAsync(int skip=0, int limit=10)
    {
        return await _dbServices.CommentCollection.Find(c => true).Skip(skip).Limit(limit).ToListAsync();
    }
    public async Task<Comment> GetAsync(string id)
    {
        return await _dbServices.CommentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
    }

    public async Task RemoveAsync(string? id)
    {
        await _dbServices.CommentCollection.DeleteOneAsync(c => c.Id == id);
    }

    public async Task UpdateAsync(string id, Comment userIn)
    {
        await _dbServices.CommentCollection.ReplaceOneAsync(c => c.Id == id, userIn);
    }
    public async Task<List<Comment>> GetCommentsAsync(string? contentID, string? parentCommentId, int skip=0, int limit=10, bool order = false)
    {
        if (contentID == null && parentCommentId != null && !order)
            return await _dbServices.CommentCollection.Find(c => c.parentCommentIds == parentCommentId).Skip(skip).Limit(limit).ToListAsync();
        else if (contentID == null && parentCommentId != null)
            return await _dbServices.CommentCollection.
                                        Find(c => c.parentCommentIds == parentCommentId).
                                        SortByDescending(c=> c.nOfLikes).
                                        Skip(skip).Limit(limit).
                                        ToListAsync();
        else if (contentID == null)
            return await GetAllAsync(skip, limit);
        if (!order)
            return await _dbServices.CommentCollection.
                                        Find(c => c.contentId == contentID && c.parentCommentIds == parentCommentId).
                                        Skip(skip).Limit(limit).
                                        ToListAsync();
        else
            return await _dbServices.CommentCollection.
                                        Find(c => c.contentId == contentID && c.parentCommentIds == parentCommentId).
                                        SortByDescending(c => c.nOfLikes).
                                        Skip(skip).Limit(limit).
                                        ToListAsync();

    }
}