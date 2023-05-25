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
        public async Task<List<Content>> GetAllAsync(int top) => await _vanLichDbServices.ContentCollection.Find(c => c.debug == false).Limit(top).ToListAsync();
        public async Task<Content> GetAsync(string id) => await _vanLichDbServices.ContentCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
    
        public async Task RemoveAsync(string id)
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
        public async Task<List<Content>> GetByCollectionAsync(string collectionID)
        {
            var collection = await _vanLichDbServices.ColCollection.Find(c => c.Id == collectionID).FirstOrDefaultAsync();
            var contentList = new List<Content>();
            foreach (var contentID in collection.contentIds)
            {
                var content = await _vanLichDbServices.ContentCollection.Find(c => c.Id == contentID).FirstOrDefaultAsync();
                contentList.Add(content);
            }
            return contentList;
        }
        public async Task<List<Content>> GetByNameAsync(string name)
        {
        
            var filter = new BsonDocument{ { "name", new BsonDocument { { "$regex", name } } } };
            var contentList = await _vanLichDbServices.ContentCollection.Find(filter).Limit(10).ToListAsync();
            return contentList;
        }
}