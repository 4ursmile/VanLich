using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace VanLichAPI.Models
{
    public class Comment
    {
        public Comment(
            string? id,
            string? userID,
            string? contentID,
            string text,
            string? parentCommentIds,
            DateTime createDate,
            int nOfLikes,
            int nOfChildComments)
        {
            Id = id;
            this.userID = userID;
            this.contentID = contentID;
            this.text = text;
            this.parentCommentIds = parentCommentIds;
            this.createDate = createDate;
            this.nOfLikes = nOfLikes;
            this.nOfChildComments = nOfChildComments;
        }

        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        string? Id {get; set;}
        string? userID {get; set;}
        string? contentID {get; set;}
        string text {get; set;}
        string? parentCommentIds {get; set;}
        DateTime createDate {get; set;}
        int nOfLikes {get; set;}
        int nOfChildComments {get; set;}
    }
}