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
        public async Task<List<Content>> GetByCollectionAsync(string? collectionID, int skip = 0, int limit = 10)
        {
            if (collectionID == null) 
                return await GetSuggestAsync(limit);

            var collection = await _vanLichDbServices.ColCollection.Find(c => c.Id == collectionID).FirstOrDefaultAsync();
            if (collection == null) return await GetSuggestAsync(limit);
            var contentList = collection.contentIds;
            var filter = Builders<Content>.Filter.In(c => c.Id, contentList);
            var contentLists = await _vanLichDbServices.ContentCollection.Find(filter).Skip(skip).Limit(limit).ToListAsync();
            return contentLists;
        }
        public async Task<List<Content>> GetByNameAsync(string? name, int skip, int limit)
        {
            if (name == null) return await GetAllAsync(skip, limit);
            //var filter = new BsonDocument{ { "name", new BsonDocument { { "$regex", name } } } };
            var filter = new BsonDocument{ {"name", new BsonRegularExpression(name, "i")} };
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
            if (type != null && id == null) return await GetByTypeAsync(type, skip, limit);
            var content = await _vanLichDbServices.ContentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
            if (content == null) return await GetByTypeAsync(type, skip, limit);
            var contentList = await _vanLichDbServices.ContentCollection.Find(
                c => c.catagories.Any(
                    catagory => content.catagories.Contains(catagory)) && c.type == type).
                    Skip(skip).
                    Limit(limit).
                    ToListAsync();
            if (contentList.Count >= limit) return contentList;
            var contentList2 = await _vanLichDbServices.ContentCollection.Find(
                c => c.type==type&& 
                contentList.All(c1=> c1.Id!=c.Id)).
                    Limit(limit - contentList.Count).
                    ToListAsync();
            var contentList3 = Enumerable.Union(contentList, contentList2).ToList();
            return contentList3;
        }
        public async Task<List<Content>?> GetByTypeAsync(string? type, int skip = 0, int limit = 10)
        {
            if (type == null) return await GetAllAsync(skip, limit);
            var contentList = await _vanLichDbServices.ContentCollection.Find(c => c.type == type).Skip(skip).Limit(limit).ToListAsync();
            return contentList;
        }
}