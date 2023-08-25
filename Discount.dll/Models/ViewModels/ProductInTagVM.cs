using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.ViewModels
{
    public class ProductInTagVM
    {
        public string ProductId { get; set; }
        public string SubCategoryPath { get; set; }
        public string ProductName { get; set; }
        public bool Status { get; set; }
        public List<ProjectTagVM> ProjectTags { get; set; }
    }

    public static class ProductInTagVMExts
    {
        public static ProductInTagVM ToViewModel(this ProductInTagDto dto)
        {
            return new ProductInTagVM
            {
                ProductId = dto.ProductId,
                SubCategoryPath = dto.SubCategoryPath,
                ProductName = dto.ProductName,
                Status = dto.Status,
                ProjectTags = dto.ProjectTags.Select(x => x.ToViewModel()).ToList()
            };
        }
    }
}
