namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Discount
    {
        public int DiscountId { get; set; }

        [Required]
        [StringLength(20)]
        public string DiscountName { get; set; }

        [StringLength(50)]
        public string DiscountDescription { get; set; }

        public int? fk_ProjectTagId { get; set; }

        public int DiscountType { get; set; }

        public int DiscountValue { get; set; }

        public int ConditionType { get; set; }

        public int ConditionValue { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public int? OrderBy { get; set; }

        public virtual ProjectTag ProjectTag { get; set; }
    }
}
