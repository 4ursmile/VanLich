using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;
namespace VanLichAPI.Models
{
    public class User
    {
        public User(
            string? id,
            string name,
            string email,
            string password,
            string avatarUrl,
            List<string?> contentIds,
            List<string?> commentIds,
            List<string?> favContentIds,
            List<string?> starContentIds,
            List<string?> saveContentIds)
        {
            Id = id;
            this.name = name;
            this.email = email;
            this.password = password;
            this.avatarUrl = avatarUrl;
            this.contentIds = contentIds;
            this.commentIds = commentIds;
            this.favContentIds = favContentIds;
            this.starContentIds = starContentIds;
            this.saveContentIds = saveContentIds;
        }
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id {get; set;}
        [BsonElement("name")]
        public string name {get; set;}
        public string email {get; set;}
        public string password {get; set;}
        public string avatarUrl {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string?>contentIds {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string?>commentIds {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string?>favContentIds {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string?>starContentIds {get; set;}
        [BsonElement("contentIds")]
        [JsonPropertyName("contentIds")]
        public List<string?>saveContentIds {get; set;}
        
    }
}