using VanLichAPI.Models.Databases;
using MongoDB.Driver;
using Microsoft.Extensions.Options;
using VanLichAPI.Models;

namespace VanLichAPI.Services;
public class VanLichDbServices
{
    private readonly IMongoCollection<Comment> _commentCollection;
    private readonly IMongoCollection<Content> _contentCollection;
    private readonly IMongoCollection<User> _userCollection;
    private readonly IMongoCollection<Collection> _collectionCollection;
    public IMongoCollection<Comment> CommentCollection {get => _commentCollection;}
    public IMongoCollection<Content> ContentCollection {get => _contentCollection;}
    public IMongoCollection<User> UserCollection {get => _userCollection;}
    public IMongoCollection<Collection> ColCollection {get => _collectionCollection;}
    

    public VanLichDbServices( IOptions<VanLichDatabaseSettings> vanLichDbSettings)
    {
        var mongoClient = new MongoClient(vanLichDbSettings.Value.ConnectionString);
        var mongoDb = mongoClient.GetDatabase(vanLichDbSettings.Value.DatabaseName);

        _commentCollection = mongoDb.GetCollection<Comment>(vanLichDbSettings.Value.CommentCollectionName);
        _contentCollection = mongoDb.GetCollection<Content>(vanLichDbSettings.Value.ContentCollectionName);
        _userCollection = mongoDb.GetCollection<User>(vanLichDbSettings.Value.UserCollectionName);
        _collectionCollection = mongoDb.GetCollection<Collection>(vanLichDbSettings.Value.CollectionCollectionName);
    }

}