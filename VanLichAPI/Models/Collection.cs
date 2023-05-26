using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;
namespace VanLichAPI.Models
{
    public class Collection
    {
        public Collection(string? id,
                          string name,
                          string? userId,
                          string description,
                          string thumbnail,
                          List<string?> contentIds)
        {
            Id = id;
            this.name = name;
            this.userId = userId;
            this.description = description;
            this.thumbnail = thumbnail;
            this.contentIds = contentIds;
        }

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id {get; set;}
        [BsonElement("name")]
        public string name {get; set;}
        [BsonElement("userId")]
        [JsonPropertyName("userId")]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? userId {get; set;}
        [BsonElement("description")]
        [JsonPropertyName("description")]
        public string description {get; set;}
        [BsonElement("thumbnail")]
        [JsonPropertyName("thumbnail")]
        public string thumbnail {get; set;}
        
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        [BsonRepresentation(BsonType.ObjectId)]
        public List<string?> contentIds {get; set;}
        
    }
}