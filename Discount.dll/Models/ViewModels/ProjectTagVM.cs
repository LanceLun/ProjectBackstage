using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.ViewModels
{
    public class ProjectTagVM
    {
        public int ProjectTagId { get; set; }
        public string ProjectTagName { get; set; }
    }
    public static class ProjectTagVMExts
    {
        public static ProjectTagVM ToViewModel(this ProjectTagDto dto)
        {
            return new ProjectTagVM
            {
                ProjectTagId = dto.ProjectTagId,
                ProjectTagName = dto.ProjectTagName
            };
        }
    }
}
