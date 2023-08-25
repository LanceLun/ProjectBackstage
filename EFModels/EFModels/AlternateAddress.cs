namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class AlternateAddress
    {
        [Key]
        public int AddressId { get; set; }

        [StringLength(300)]
        public string AlternateAddress1 { get; set; }

        [StringLength(300)]
        public string AlternateAddress2 { get; set; }

        public int? fk_MemberId { get; set; }

        public virtual Member Member { get; set; }
    }
}
