namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ShoesGroup
    {
        public int ShoesGroupId { get; set; }

        public int fk_ShoesMainId { get; set; }

        public int fk_OptionId { get; set; }

        public int fk_MaterialId { get; set; }

        public int fk_ShoesColorId { get; set; }

        [StringLength(254)]
        public string Remark { get; set; }

        public virtual Customized_materials Customized_materials { get; set; }

        public virtual CustomizedShoesPo CustomizedShoesPo { get; set; }

        public virtual ShoesChoos ShoesChoos { get; set; }

        public virtual ShoesColorCategory ShoesColorCategory { get; set; }
    }
}
