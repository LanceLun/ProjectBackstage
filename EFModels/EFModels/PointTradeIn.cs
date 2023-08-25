namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PointTradeIn")]
    public partial class PointTradeIn
    {
        public int PointTradeInId { get; set; }

        public int fk_MemberId { get; set; }

        public int? fk_OrderId { get; set; }

        [Required]
        [StringLength(30)]
        public string GiftThreshold { get; set; }

        [StringLength(30)]
        public string GetPoints { get; set; }

        [StringLength(30)]
        public string MaxGetPoints { get; set; }

        public DateTime EffectiveDate { get; set; }

        public DateTime ExpirationDate { get; set; }

        public virtual Member Member { get; set; }

        public virtual order order { get; set; }
    }
}
