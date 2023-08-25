namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ShoesColorCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShoesColorCategory()
        {
            CustomizedShoesPoes = new HashSet<CustomizedShoesPo>();
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        [Key]
        public int ShoesColorId { get; set; }

        [Required]
        [StringLength(50)]
        public string ColorName { get; set; }

        [StringLength(100)]
        public string ColorCode { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomizedShoesPo> CustomizedShoesPoes { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
