using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.ViewModels
{
    public class ProjectTagItemVM
    {
        public int ProjectTagId { get; set; }
        public string ProductId { get; set; }
    }

    public static class ProjectTagItemVMExts
    {
        public static ProjectTagItemDto ToDto(this ProjectTagItemVM vm)
        {
            return new ProjectTagItemDto
            {
                ProjectTagId = vm.ProjectTagId,
                ProductId = vm.ProductId
            };
        }
    }
}
