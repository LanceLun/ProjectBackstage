namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ColorCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ColorCategory()
        {
            ProductGroups = new HashSet<ProductGroup>();
        }

        [Key]
        public int ColorId { get; set; }

        [Required]
        [StringLength(50)]
        public string ColorName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductGroup> ProductGroups { get; set; }
    }
}
