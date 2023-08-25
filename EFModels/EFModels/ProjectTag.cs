namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProjectTag
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProjectTag()
        {
            Coupons = new HashSet<Coupon>();
            Discounts = new HashSet<Discount>();
        }

        public int ProjectTagId { get; set; }

        [Required]
        [StringLength(30)]
        public string ProjectTagName { get; set; }

        public DateTime CreateAt { get; set; }

        public DateTime ModifiedAt { get; set; }

        public bool Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Coupon> Coupons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Discount> Discounts { get; set; }

    }
}
