using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Discount.dll.Models.ViewModels
{
    public class CouponCreateVM
    {
        public int CouponCategoryId { get; set; }
        public int CouponId { get; set; }
        [Display(Name = "優惠券名稱")]
        [Required]
        public string CouponName { get; set; }
        public string CouponCategoryName { get; set; }
        [Display(Name = "開始日期")]
        [Required]
        public DateTime StartDate { get; set; }

        public bool? EndType { get; set; }
        [Display(Name = "結束天數")]
        public int? EndDays { get; set; }
        [Display(Name = "結束日期")]
        public DateTime? EndDate { get; set; }

        [Display(Name = "消費門檻")]
        [Required]
        public int MinimumPurchaseAmount { get; set; }

        [Display(Name = "使用次數")]
        public int? PersonMaxUsage { get; set; }

        [Display(Name = "優惠類型")]
        public int DiscountType { get; set; }
        [Display(Name = "優惠價值")]
        [Required]
        public int DiscountValue { get; set; }

        [Display(Name = "獲得條件類型")]
        public int? RequirementType { get; set; }
        [Display(Name = "獲得條件")]
        public int? Requirement { get; set; }
        [Display(Name = "獲得條件產品")]
        public int? RequiredProjectTagID { get; set; }
        public string ProjectTagName { get; set; }
    }

    public static class CouponCreateVMExts
    {
        public static CouponCreateVM ToViewModel(this CouponCreateDto dto)
        {
            return new CouponCreateVM
            {
                CouponCategoryId = dto.CouponCategoryId,
                CouponId = dto.CouponId,
                StartDate = dto.StartDate,
                EndDate = dto.EndDate,
                MinimumPurchaseAmount = dto.MinimumPurchaseAmount,
                PersonMaxUsage = dto.PersonMaxUsage,
                DiscountType = dto.DiscountType,
                DiscountValue = dto.DiscountValue,
                CouponCategoryName = dto.CouponCategoryName,
                CouponName = dto.CouponName,
                EndDays = dto.EndDays,
                EndType = dto.EndType,
                ProjectTagName = dto.ProjectTagName,
                Requirement = dto.Requirement,
                RequirementType = dto.RequirementType,
                RequiredProjectTagID = dto.RequiredProjectTagID,
            };
        }
        public static CouponCreateDto ToDto(this CouponCreateVM vm)
        {
            return new CouponCreateDto
            {
                CouponCategoryId = vm.CouponCategoryId,
                CouponId = vm.CouponId,
                StartDate = vm.StartDate,
                EndDate = vm.EndDate,
                MinimumPurchaseAmount = vm.MinimumPurchaseAmount,
                PersonMaxUsage = vm.PersonMaxUsage,
                DiscountType = vm.DiscountType,
                DiscountValue = vm.DiscountValue,
                CouponCategoryName = vm.CouponCategoryName,
                CouponName = vm.CouponName,
                EndDays = vm.EndDays,
                EndType = vm.EndType,
                ProjectTagName = vm.ProjectTagName,
                RequiredProjectTagID = vm.RequiredProjectTagID,
                Requirement = vm.Requirement,
                RequirementType = vm.RequirementType,
            };
        }
    }

}
