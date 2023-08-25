namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class MembershipLevel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MembershipLevel()
        {
            Members = new HashSet<Member>();
            Privileges = new HashSet<Privilege>();
        }

        [Key]
        public int LevelId { get; set; }

        [Required]
        [StringLength(10)]
        public string LevelName { get; set; }

        [Required]
        [StringLength(30)]
        public string MinSpending { get; set; }

        public int? Discount { get; set; }

        [StringLength(300)]
        public string Description { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Member> Members { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Privilege> Privileges { get; set; }
    }
}
