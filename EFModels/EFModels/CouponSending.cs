namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CouponSending
    {
        [Key]
        public int SendingId { get; set; }

        public int fk_CouponId { get; set; }

        public int? fk_MemberId { get; set; }

        public DateTime SentDate { get; set; }

        public bool RedemptionStatus { get; set; }

        public DateTime? RedeemedDate { get; set; }

        public virtual Coupon Coupon { get; set; }

        public virtual Member Member { get; set; }
    }
}
