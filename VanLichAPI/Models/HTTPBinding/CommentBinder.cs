using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VanLichAPI.Models.HTTPBinding
{
    public class CommentBinder : Related
    {
        public string? ContentId { get; set; }
        public string? ParentCommentIds { get; set; }
        public bool order { get; set; }
    }
}