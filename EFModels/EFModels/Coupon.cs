namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Coupon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Coupon()
        {
            CouponSendings = new HashSet<CouponSending>();
        }

        public int CouponId { get; set; }

        public int fk_CouponCategoryId { get; set; }

        [Required]
        [StringLength(50)]
        public string CouponName { get; set; }

        [StringLength(50)]
        public string CouponCode { get; set; }

        public int MinimumPurchaseAmount { get; set; }

        public int DiscountType { get; set; }

        public int DiscountValue { get; set; }

        public DateTime StartDate { get; set; }

        public bool? EndType { get; set; }

        public int? EndDays { get; set; }

        public DateTime? EndDate { get; set; }

        public int? PersonMaxUsage { get; set; }

        public int? RequirementType { get; set; }

        public int? Requirement { get; set; }

        public int? fk_RequiredProjectTagID { get; set; }

        public virtual CouponCategory CouponCategory { get; set; }

        public virtual ProjectTag ProjectTag { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CouponSending> CouponSendings { get; set; }
    }
}
