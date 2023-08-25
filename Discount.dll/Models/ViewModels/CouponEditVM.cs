using Discount.dll.Models.Dtos;
using Discount.dll.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.ViewModels
{
    public class CouponEditVM
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
        public string StartDateStr
            => StartDate.ToString("yyyy-MM-dd") + " 00:00";
        public bool? EndType { get; set; }
        [Display(Name = "結束天數")]
        public int? EndDays { get; set; }
        [Display(Name = "結束日期")]
        public DateTime? EndDate { get; set; }
        public string EndDateStr
            => CouponCategoryId == 1 ?
                    (EndDate.HasValue ? EndDate.Value.ToString("yyyy-MM-dd") + " 23:59" : "無期限") :
                    (EndDays.HasValue ? EndDays.Value.ToString() + " 天" : "無期限");

        [Display(Name = "消費門檻")]
        [Required]
        public int MinimumPurchaseAmount { get; set; }
        public string MinimumPurchaseAmountStr
            => MinimumPurchaseAmount.ToString() + "元";
        [Display(Name = "使用次數")]
        [Required]
        public int? PersonMaxUsage { get; set; }
        public string PersonMaxUsageStr
            => PersonMaxUsage.HasValue ? PersonMaxUsage.Value.ToString() + "次" : "無限次數";
        [Display(Name = "優惠類型")]
        public int DiscountType { get; set; }
        [Display(Name = "優惠價值")]
        [Required]
        public int DiscountValue { get; set; }
        public string DiscountValueStr
        {
            get
            {
                switch (DiscountType)
                {
                    case 0:
                        return DiscountValue + "元";
                    case 1:
                        return DiscountValue + "%";
                    case 2:
                        return "免運費";
                    default:
                        return "";
                }
            }
        }
        public string StatusStr
        {
            get
            {
                DateTime today = DateTime.Today;
                if (StartDate > today)
                {
                    return "未開始";
                }
                else if (StartDate < today && CouponCategoryId != 1 || EndDate == null || EndDate >= today)
                {
                    return "進行中";
                }
                else if (EndDate < today)
                {
                    return "已結束";
                }
                return "";
            }
        }
        [Display(Name = "獲得條件類型")]
        public int? RequirementType { get; set; }
        [Display(Name = "獲得條件")]
        public int? Requirement { get; set; }
        [Display(Name = "獲得條件產品")]
        public int? RequiredProjectTagID { get; set; }
        public string ProjectTagName { get; set; }
    }
}
public static class CouponEditVMExts
{
    public static CouponEditVM ToViewModel(this CouponEditDto dto)
    {
        return new CouponEditVM
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
    public static CouponEditDto ToDto(this CouponEditVM vm)
    {
        return new CouponEditDto
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
