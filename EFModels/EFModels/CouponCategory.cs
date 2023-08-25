namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CouponCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CouponCategory()
        {
            Coupons = new HashSet<Coupon>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CouponCategoryId { get; set; }

        [Required]
        [StringLength(20)]
        public string CouponCategoryName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Coupon> Coupons { get; set; }
    }
}
