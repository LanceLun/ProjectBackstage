namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProductImg
    {
        public int ProductImgId { get; set; }

        [Required]
        [StringLength(254)]
        public string fk_ProductId { get; set; }

        [Required]
        [StringLength(100)]
        public string ImgPath { get; set; }

        public virtual Product Product { get; set; }
    }
}
