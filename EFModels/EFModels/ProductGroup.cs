namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductGroup
    {
        public int ProductGroupId { get; set; }

        [Required]
        [StringLength(254)]
        public string fk_ProductId { get; set; }

        public int fk_ColorId { get; set; }

        public int fk_SizeId { get; set; }

        public int Qty { get; set; }

        public virtual ColorCategory ColorCategory { get; set; }

        public virtual Product Product { get; set; }

        public virtual SizeCategory SizeCategory { get; set; }
    }
}
