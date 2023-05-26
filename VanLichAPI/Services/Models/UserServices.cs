using VanLichAPI.Models.Databases;
using MongoDB.Driver;
using MongoDB.Bson;
using VanLichAPI.Models;
using VanLichAPI.Services;

namespace VanLichAPI.Services.Models;

public class UserServices : IModelServices<User>
{
    private readonly IMongoCollection<User> _userCollection;
    public UserServices(VanLichDbServices vanLichDbServices)
    {
        _userCollection = vanLichDbServices.UserCollection;
    }
    public async Task CreateAsync(User user)
    {
        await _userCollection.InsertOneAsync(user);
    }

    public async Task<List<User>> GetAllAsync(int skip, int limit)
    {
        var users = await _userCollection.Find(c => true).
                            Skip(skip).
                            Limit(limit).ToListAsync();
        return users;
    }

    public async Task<User> GetAsync(string? id)
    {
        return await _userCollection.Find(c => c.Id == id).FirstOrDefaultAsync(); 
    }

    public async Task RemoveAsync(string? id)
    {
        await _userCollection.DeleteOneAsync(c => c.Id == id);
    }

    public async Task UpdateAsync(string? id, User userIn)
    {
        await  _userCollection.ReplaceOneAsync(c => c.Id == id, userIn);
    }
    public async Task<User> GetSampleUserAsync()
    {
        var pipeline = new BsonDocument[]
            {
                new BsonDocument("$sample", new BsonDocument("size", 1))
            };
        return await _userCollection.Aggregate<User>(pipeline).FirstOrDefaultAsync();
    }
}