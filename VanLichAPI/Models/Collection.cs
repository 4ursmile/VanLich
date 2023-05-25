using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;
namespace VanLichAPI.Models
{
    public class Collection
    {
        public Collection(string? id,
            string name,
            List<string> contentIds)
        {
            Id = id;
            this.name = name;
            this.contentIds = contentIds;
        }

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id {get; set;}
        [BsonElement("name")]
        public string name {get; set;}
        public string? userId {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string> contentIds {get; set;}
        
    }
}