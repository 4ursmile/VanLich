using VanLichAPI.Models.Databases;
using MongoDB.Driver;
using VanLichAPI.Models;
using VanLichAPI.Services;
using MongoDB.Bson;

namespace VanLichAPI.Services.Models;
public class CollectionServices : IModelServices<Collection>
{
    private readonly IMongoCollection<Collection> _collectionCollection;
    public CollectionServices(VanLichDbServices vanLichDbServices)
    {
        _collectionCollection = vanLichDbServices.ColCollection;
    }
    public async Task CreateAsync(Collection collection)
    {
        await _collectionCollection.InsertOneAsync(collection);
    }

    public async Task<List<Collection>> GetAllAsync(int skip = 0, int limit = 10)
    {
        return await _collectionCollection.Find(c => true).
                            Skip(skip).
                            Limit(limit).ToListAsync();
    }

    public async Task<Collection> GetAsync(string? id)
    {
        return await _collectionCollection.Find(c => c.Id == id).FirstOrDefaultAsync();
    }

    public async Task RemoveAsync(string? id)
    {
        await _collectionCollection.DeleteOneAsync(c => c.Id == id);
    }

    public async Task UpdateAsync(string? id, Collection userIn)
    {
        await _collectionCollection.ReplaceOneAsync(c => c.Id == id, userIn);
    }
    public async Task DeleteAsync(string? id)
    {
        await _collectionCollection.DeleteOneAsync(c => c.Id == id);
    }
    public async Task<List<Collection>> GetCollectionsByNameAsync(string? name, int skip = 0, int limit = 10)
    {
        if (name == null)
            return await GetAllAsync(skip, limit);
        var filter = new BsonDocument{ {"name", new BsonRegularExpression(name, "i")} };
        var collectionList = await _collectionCollection.
                                                    Find(filter).
                                                    Skip(skip).
                                                    Limit(limit).
                                                    ToListAsync();
        return collectionList;
    }
    public async Task<List<Collection>> GetSuggestAsync(int limit = 3)
    {
        var pipeline = new BsonDocument[]
            {
                new BsonDocument("$sample", new BsonDocument("size", limit))
            };
        var collectionList = await _collectionCollection.Aggregate<Collection>(pipeline).ToListAsync();
        return collectionList;
    }
}