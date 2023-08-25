using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Dtos
{
    public class ProductInTagDto
    {
        public string ProductId { get; set; }
        public string SubCategoryPath { get; set; }
        public string ProductName { get; set; }
        public bool Status { get; set; }
        public List<ProjectTagDto> ProjectTags { get; set; }
    }
}
