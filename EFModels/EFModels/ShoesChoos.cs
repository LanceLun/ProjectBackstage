namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ShoesChooses")]
    public partial class ShoesChoos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShoesChoos()
        {
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        [Key]
        public int OptionId { get; set; }

        [Required]
        [StringLength(50)]
        public string OptinName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
