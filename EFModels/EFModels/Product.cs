namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            ProductGroups = new HashSet<ProductGroup>();
            ProductImgs = new HashSet<ProductImg>();
            ProjectTagItems = new HashSet<ProjectTagItem>();
        }

        [StringLength(254)]
        public string ProductId { get; set; }

        [Required]
        [StringLength(254)]
        public string ProductName { get; set; }

        [Required]
        public string ProductDescription { get; set; }

        [StringLength(50)]
        public string ProductMaterial { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductOrigin { get; set; }

        public int? UnitPrice { get; set; }

        public int SalesPrice { get; set; }

        public DateTime? StartTime { get; set; }

        public DateTime? EndTime { get; set; }

        public bool Status { get; set; }

        public bool LogOut { get; set; }

        [StringLength(100)]
        public string Tag { get; set; }

        public int fk_ProductSubCategoryId { get; set; }

        public DateTime CreateTime { get; set; }

        public DateTime EditTime { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductGroup> ProductGroups { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductImg> ProductImgs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProjectTagItem> ProjectTagItems { get; set; }

        public virtual ProductSubCategory ProductSubCategory { get; set; }
    }
}
