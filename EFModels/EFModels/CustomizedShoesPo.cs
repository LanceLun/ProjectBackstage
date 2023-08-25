namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CustomizedShoesPo")]
    public partial class CustomizedShoesPo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CustomizedShoesPo()
        {
            CustomizedOrders = new HashSet<CustomizedOrder>();
            ShoesPictures = new HashSet<ShoesPicture>();
            ShoesGroups = new HashSet<ShoesGroup>();
        }

        [Key]
        public int ShoesProductId { get; set; }

        [Required]
        [StringLength(254)]
        public string ShoesName { get; set; }

        [StringLength(254)]
        public string ShoesDescription { get; set; }

        [StringLength(50)]
        public string ShoesOrigin { get; set; }

        public int ShoesUnitPrice { get; set; }

        public DateTime? StartTime { get; set; }

        public DateTime? EndTime { get; set; }

        public bool Status { get; set; }

        public int? fk_ShoesCategoryId { get; set; }

        public int? fk_ShoesColorId { get; set; }

        public DateTime DataCreateTime { get; set; }

        public DateTime DataEditTime { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomizedOrder> CustomizedOrders { get; set; }

        public virtual ShoesCategory ShoesCategory { get; set; }

        public virtual ShoesColorCategory ShoesColorCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoesPicture> ShoesPictures { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoesGroup> ShoesGroups { get; set; }
    }
}
