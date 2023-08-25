namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductCategory()
        {
            ProductSubCategories = new HashSet<ProductSubCategory>();
        }

        public int ProductCategoryId { get; set; }

        [Required]
        [StringLength(50)]
        public string ProductCategoryName { get; set; }

        public int fk_SalesCategoryId { get; set; }

        [Required]
        [StringLength(100)]
        public string CategoryPath { get; set; }

        public virtual SalesCategory SalesCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductSubCategory> ProductSubCategories { get; set; }
    }
}
