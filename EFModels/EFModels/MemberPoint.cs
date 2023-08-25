namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MemberPoint
    {
        [Key]
        public int MemberPointsId { get; set; }

        public int PointSubtotal { get; set; }

        public int fk_PointHistoryId { get; set; }

        public int fk_MemberId { get; set; }

        public virtual Member Member { get; set; }

        public virtual PointHistory PointHistory { get; set; }
    }
}
