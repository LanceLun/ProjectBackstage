namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Activity
    {
        public int ActivityId { get; set; }

        [Required]
        [StringLength(50)]
        public string ActivityName { get; set; }

        public int fk_ActivityCategoryId { get; set; }

        public DateTime ActivityDate { get; set; }

        public int fk_SpeakerId { get; set; }

        [Required]
        [StringLength(100)]
        public string ActivityPlace { get; set; }

        [Required]
        [StringLength(300)]
        public string ActivityImage { get; set; }

        public DateTime ActivityBookStartTime { get; set; }

        public DateTime ActivityBookEndTime { get; set; }

        public byte ActivityAge { get; set; }

        public int ActivitySalePrice { get; set; }

        public int ActivityOriginalPrice { get; set; }

        [StringLength(300)]
        public string ActivityDescription { get; set; }

        public int fk_ActivityStatusId { get; set; }

        public virtual ActivityCategory ActivityCategory { get; set; }

        public virtual ActivityStatus ActivityStatus { get; set; }

        public virtual Speaker Speaker { get; set; }
    }
}
