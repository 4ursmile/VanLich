using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;
namespace VanLichAPI.Models
{
    public class Content
    {
        public Content(
            string? id,
            bool debug,
            string name,
            string? userID,
            string mainGraphicUrl,
            int nOfStars,
            int nOfFavs,
            int nOfComments,
            int nOfShares,
            string caption,
            string description,
            string content,
            string type,
            DateTime createDate,
            List<string> catagories,
            List<string> graphics)
        {
            Id = id;
            this.debug = debug;
            this.name = name;
            this.userID = userID;
            this.mainGraphicUrl = mainGraphicUrl;
            this.nOfStars = nOfStars;
            this.nOfFavs = nOfFavs;
            this.nOfComments = nOfComments;
            this.nOfShares = nOfShares;
            this.caption = caption;
            this.description = description;
            this.content = content;
            this.type = type;
            this.createDate = createDate;
            this.catagories = catagories;
            this.graphics = graphics;
        }

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id {get; set;}
        public bool debug {get; set;} = false;
        [BsonElement("name")]
        public string name {get; set;}
        [BsonElement("userID")]
        [JsonPropertyName("userID")]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? userID {get; set;}
        public string mainGraphicUrl {get; set;}
        public int nOfStars {get; set;}
        public int nOfFavs {get; set;}
        public int nOfComments {get; set;}
        public int nOfShares {get; set;}
        public string caption {get; set;}
        public string description {get; set;}
        public string content {get; set;}
        //type includes: story, video, gallary, article, blog, news, etc.
        public string type {get; set;}
        public DateTime createDate {get; set;}
        [BsonElement("catagories")]
        [JsonPropertyName("catagories")]
        public List<string> catagories {get; set;}
        [BsonElement("graphics")]
        [JsonPropertyName("graphics")]
        public List<string> graphics {get; set;}
    }
}