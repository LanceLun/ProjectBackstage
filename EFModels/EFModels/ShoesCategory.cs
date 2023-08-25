namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ShoesCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShoesCategory()
        {
            CustomizedShoesPoes = new HashSet<CustomizedShoesPo>();
        }

        public int ShoesCategoryId { get; set; }

        [Required]
        [StringLength(254)]
        public string ShoesCategoryName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomizedShoesPo> CustomizedShoesPoes { get; set; }
    }
}
