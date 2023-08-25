namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProjectTagItem
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int fk_ProjectTagId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(254)]
        public string fk_ProductId { get; set; }

        public virtual Product Product { get; set; }

        public virtual ProjectTagItem ProjectTagItems1 { get; set; }

        public virtual ProjectTagItem ProjectTagItem1 { get; set; }
    }
}
