namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class PointHistory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PointHistory()
        {
            MemberPoints = new HashSet<MemberPoint>();
        }

        public int PointHistoryId { get; set; }

        public bool GetOrDeduct { get; set; }

        public int UsageAmount { get; set; }

        public DateTime EffectiveDate { get; set; }

        public int? fk_MemberId { get; set; }

        public int? fk_OrderId { get; set; }

        public int? fk_TypeId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MemberPoint> MemberPoints { get; set; }

        public virtual Member Member { get; set; }

        public virtual order order { get; set; }

        public virtual Type Type { get; set; }
    }
}
