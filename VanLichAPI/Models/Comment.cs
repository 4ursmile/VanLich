using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System.Text.Json.Serialization;   
namespace VanLichAPI.Models
{
    public class Comment
    {
        public Comment(
            string? id,
            string? userId,
            string? contentId,
            string text,
            string? parentCommentId,
            DateTime createDate,
            int nOfLikes,
            int nOfChildComments)
        {
            Id = id;
            this.userId = userId;
            this.contentId = contentId;
            this.text = text;
            this.parentCommentId = parentCommentId;
            if (createDate < DateTime.Parse("1/1/2000"))
                this.createDate = DateTime.Now;
            else
                this.createDate = createDate;
            this.nOfLikes = nOfLikes;
            this.nOfChildComments = nOfChildComments;
        }

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id {get; set;}
        [BsonElement("userId")]
        [JsonPropertyName("userId")]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? userId {get; set;}
        [BsonRepresentation(BsonType.ObjectId)]
        public string? contentId {get; set;}
        public string text {get; set;}
        [BsonRepresentation(BsonType.ObjectId)]
        public string? parentCommentId {get; set;}
        public DateTime createDate {get; set;}
        public int nOfLikes {get; set;}
        public int nOfChildComments {get; set;}
    }
}