namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OneToOneReservation
    {
        [Key]
        public int ReservationId { get; set; }

        public int fk_BookerId { get; set; }

        public DateTime ReservationStartTime { get; set; }

        public DateTime ReservationEndTime { get; set; }

        public int fk_BranchId { get; set; }

        public int fk_ReservationSpeakerId { get; set; }

        public int fk_ReservationStatusId { get; set; }

        public DateTime ReservationCreatedDate { get; set; }

        public virtual Branch Branch { get; set; }

        public virtual Member Member { get; set; }

        public virtual Speaker Speaker { get; set; }

        public virtual ReservationStatus ReservationStatus { get; set; }
    }
}
