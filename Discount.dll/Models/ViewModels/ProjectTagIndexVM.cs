using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.ComponentModel.DataAnnotations;

namespace Discount.dll.Models.ViewModels
{
    public class ProjectTagIndexVM
    {
        public int ProjectTagId { get; set; }
        [Display(Name = "專案標籤名稱")]
        public string ProjectTagName { get; set; }
        public string ProductItems { get; set; }
        [Display(Name = "專案項目")]
        public string ProductItemsStr
        {
            get
            {
                if (String.IsNullOrEmpty(ProductItems))return string.Empty;
                return ProductItems.Length > 15 ? ProductItems.Substring(0, 10) + "..." : ProductItems;
            }
        }
        [Display(Name = "建立時間")]
        public DateTime CreateAt { get; set; }
        [Display(Name = "最後修改時間")]
        public DateTime ModifiedAt { get; set; }
        public bool Status { get; set; }
        [Display(Name = "狀態")]
        public string StatusStr => Status ? "進行中" : "已完結";
    }
    public static class ProjectTagIndexVMExts
    {
        public static ProjectTagIndexVM ToViewModel (this ProjectTagIndexDto dto) 
        {
            return new ProjectTagIndexVM { 
                ProjectTagId = dto.ProjectTagId, 
                ProjectTagName = dto.ProjectTagName, 
                ProductItems = dto.ProductItems, 
                Status = dto.Status, 
                CreateAt = dto.CreateAt, 
                ModifiedAt = dto.ModifiedAt };
        }
    }

    public class ProjectTagStatusChangeVM
    {
        public int ProjectTagId { get; set; }
        public bool Status { get; set; }
    }

    public static class ProjectTagStatusChangeVMExts
    {
        public static ProjectTagStatusChangeDto ToStatusChangeDto(this ProjectTagStatusChangeVM vm)
        {
            return new ProjectTagStatusChangeDto
            {
                ProjectTagId = vm.ProjectTagId,
                Status = vm.Status
            };
        }
    }

    public class ProjectTagEditNameVM
    {
        public int ProjectTagId { get; set; }
        [Display(Name = "標籤名稱")]
        [Required]
        public string ProjectTagName { get; set; }
        public bool Status { get; set; }
    }

    public static class ProjectTagEditNameVMExts
    {
        public static ProjectTagEditNameVM ToEditNameVM(this ProjectTagEditNameDto dto)
        {
            return new ProjectTagEditNameVM
            {
                ProjectTagId = dto.ProjectTagId,
                ProjectTagName = dto.ProjectTagName,
                Status = dto.Status
            };
        }
        public static ProjectTagEditNameDto ToEditNameDto(this ProjectTagEditNameVM vm)
        {
            return new ProjectTagEditNameDto
            {
                ProjectTagId = vm.ProjectTagId,
                ProjectTagName = vm.ProjectTagName,
                Status = vm.Status
            };
        }
    }
}
