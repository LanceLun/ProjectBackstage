using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Dtos
{
    public class CouponIndexDto
    {
        public int CouponCategoryId { get; set; }
        public int CouponId { get; set; }
        public string CouponName { get; set; }
        public string CouponCategoryName { get; set; }
        public DateTime StartDate { get; set; }
        public bool? EndType { get; set; }
        public int? EndDays { get; set; }
        public DateTime? EndDate { get; set; }
        public int MinimumPurchaseAmount { get; set; }
        public int? PersonMaxUsage { get; set; }
        public int DiscountType { get; set; }
        public int DiscountValue { get; set; }
    }
}
