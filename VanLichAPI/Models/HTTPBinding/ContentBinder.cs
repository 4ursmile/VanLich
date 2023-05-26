using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VanLichAPI.Models.HTTPBinding
{
    public class RelatedByType : Related 
    {
        public string? Type {get; set;}
        public string? Id {get; set;}
    }
    public class SearchBinder : Related
    {
        public string? name {get; set;}
    }
}