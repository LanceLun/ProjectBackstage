namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductSubCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductSubCategory()
        {
            Products = new HashSet<Product>();
        }

        public int ProductSubCategoryId { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductSubCategoryName { get; set; }

        public int fk_ProductCategoryId { get; set; }

        [Required]
        [StringLength(150)]
        public string SubCategoryPath { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
    }
}
