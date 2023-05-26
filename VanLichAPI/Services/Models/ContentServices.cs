using VanLichAPI.Models.Databases;
using VanLichAPI.Models;
using MongoDB.Bson;
using MongoDB.Driver;
using System.Text.RegularExpressions;

namespace VanLichAPI.Services.Models;
public class ContentServices : IModelServices<Content>
{
    private readonly VanLichDbServices _vanLichDbServices;
    public ContentServices(VanLichDbServices vanLichDbServices)
    {
        _vanLichDbServices = vanLichDbServices;
        
    }
    
    #region Interface tasks
        public async Task CreateAsync(Content content)
        {
            await _vanLichDbServices.ContentCollection.InsertOneAsync(content);
        }
        public async Task<List<Content>> GetAllAsync(int skip = 0, int limit = 10) => await _vanLichDbServices.ContentCollection.Find(c => true).Skip(skip).Limit(limit).ToListAsync();
        public async Task<Content> GetAsync(string id) => await _vanLichDbServices.ContentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
    
        public async Task RemoveAsync(string? id)
        {
            await _vanLichDbServices.ContentCollection.DeleteOneAsync(c => c.Id == id);
        }
    
        public async Task UpdateAsync(string id, Content content)
        {
            await _vanLichDbServices.ContentCollection.ReplaceOneAsync(c => c.Id == id, content);
        }
    #endregion
        public async Task ResetDebug()
        {
            await _vanLichDbServices.ContentCollection.UpdateManyAsync(c => c.debug == true && c.name != "SchemeHolding", Builders<Content>.Update.Set(c => c.debug, false));
        }
        public async Task<List<Content>> GetByCollectionAsync(string? collectionID)
        {
            if (collectionID == null) 
                return await GetSuggestAsync();
            var collection = await _vanLichDbServices.ColCollection.Find(c => c.Id == collectionID).FirstOrDefaultAsync();
            var contentList = new List<Content>();
            foreach (var contentID in collection.contentIds)
            {
                var content = await _vanLichDbServices.ContentCollection.Find(c => c.Id == contentID).FirstOrDefaultAsync();
                contentList.Add(content);
            }
            return contentList;
        }
        public async Task<List<Content>> GetByNameAsync(string? name, int skip, int limit)
        {
            if (name == null) return await GetAllAsync(skip, limit);
            var filter = new BsonDocument{ { "name", new BsonDocument { { "$regex", name } } } };
            var contentList = await _vanLichDbServices.ContentCollection.
                                                        Find(filter).
                                                        Skip(skip).
                                                        Limit(limit).
                                                        ToListAsync();
            return contentList;
        }

        public async Task<List<Content>> GetSuggestAsync(int sample = 3)
        {
            var pipeline = new BsonDocument[]
            {
                new BsonDocument("$sample", new BsonDocument("size", sample))
            };
            var contentList = await _vanLichDbServices.ContentCollection.Aggregate<Content>(pipeline).ToListAsync();
            return contentList;
        }

        public async Task<List<Content>?> GetRelatedAsync(string? id, int skip, int limit)
        {
            var content = await _vanLichDbServices.ContentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
            if (content == null) return null;
            var contentList = await _vanLichDbServices.ContentCollection.Find(
                c => c.catagories.Any(
                    catagory => content.catagories.Contains(catagory))).
                    Skip(skip).
                    Limit(limit).ToListAsync();
            return contentList;
        }
        public async Task IncreaseCommentAsync(string? id)
        {
            //incresement nOfComments in content matching id
            var filter = Builders<Content>.Filter.Eq(c => c.Id, id);
            var update = Builders<Content>.Update.Inc(c => c.nOfComments, 1);
            await _vanLichDbServices.ContentCollection.UpdateOneAsync(filter, update);
        } 
        public async Task<List<Content>?> GetRelatedByTypeAsync(string? id, string? type, int skip = 0, int limit = 10)
        {
            if (type == null && id != null) return await GetRelatedAsync(id, skip, limit);
            if (type == null && id == null) return await GetAllAsync(skip, limit);
            var content = await _vanLichDbServices.ContentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
            if (content == null) return null;
            var contentList = await _vanLichDbServices.ContentCollection.Find(
                c => c.catagories.Any(
                    catagory => content.catagories.Contains(catagory)) && c.type == type).
                    Skip(skip).
                    Limit(limit).
                    ToListAsync();
            return contentList;
        }
}