using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.ViewModels
{
    public class CouponIndexVM
    {
        public int CouponCategoryId { get; set; }
        public int CouponId { get; set; }
        public string CouponName { get; set; }
        public string CouponCategoryName { get; set; }
        public DateTime StartDate { get; set; }
        public string StartDateStr
            => StartDate.ToString("yyyy-MM-dd") + " 00:00";
        public bool? EndType { get; set; }
        public int? EndDays { get; set; }
        public DateTime? EndDate { get; set; }
        public string EndDateStr
            => CouponCategoryId == 1 ? (EndDate.HasValue ? EndDate.Value.ToString("yyyy-MM-dd") + " 23:59" : "無期限") : (EndDays.HasValue ? EndDays.Value.ToString() + " 天" : "無期限");
        public int MinimumPurchaseAmount { get; set; }
        public string MinimumPurchaseAmountStr
            => MinimumPurchaseAmount.ToString() + "元";

        public int? PersonMaxUsage { get; set; }
        public string PersonMaxUsageStr
            => PersonMaxUsage.HasValue ? PersonMaxUsage.Value.ToString() + "次" : "無限次數";
        public int DiscountType { get; set; }
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
                else if (EndDate.HasValue && EndDate.Value < today)
                {
                    return "已結束";
                }
                return "";
            }
        }
    }
    public static class CouponIndexVMExts
    {
        public static CouponIndexVM ToViewModel(this CouponIndexDto dto)
        {
            return new CouponIndexVM
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
            };
        }
    }
}
