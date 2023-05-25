
namespace VanLichAPI.Models.Databases
{
    public class VanLichDatabaseSettings
    {
        public string ConnectionString {get; set;} = null!;
        public string DatabaseName {get; set;} = null!;
        public string ContentCollectionName {get; set;} = null!;
        public string CommentCollectionName {get; set;} = null!; 
        public string UserCollectionName {get; set;} = null!;
        public string CollectionCollectionName {get; set;} = null!;
    }
}