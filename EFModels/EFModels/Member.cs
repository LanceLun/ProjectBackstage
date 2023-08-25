namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Member
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Member()
        {
            AlternateAddresses = new HashSet<AlternateAddress>();
            CouponSendings = new HashSet<CouponSending>();
            CustomizedOrders = new HashSet<CustomizedOrder>();
            MemberPoints = new HashSet<MemberPoint>();
            orders = new HashSet<order>();
            PointHistories = new HashSet<PointHistory>();
            OneToOneReservations = new HashSet<OneToOneReservation>();
            orders1 = new HashSet<order>();
            PointTradeIns = new HashSet<PointTradeIn>();
            ShoppingCarts = new HashSet<ShoppingCart>();
        }

        public int MemberId { get; set; }

        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        public byte? Age { get; set; }

        public bool? Gender { get; set; }

        [Required]
        [StringLength(10)]
        public string Mobile { get; set; }

        [Required]
        [StringLength(300)]
        public string Email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Birthday { get; set; }

        [Required]
        [StringLength(100)]
        public string CommonAddress { get; set; }

        [Required]
        [StringLength(30)]
        public string Account { get; set; }

        [Required]
        [StringLength(70)]
        public string EncryptedPassword { get; set; }

        public DateTime? Registration { get; set; }

        public bool? IsConfirmed { get; set; }

        [StringLength(50)]
        public string ConfirmCode { get; set; }

        public int fk_LevelId { get; set; }

        public int? fk_BlackListId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AlternateAddress> AlternateAddresses { get; set; }

        public virtual BlackList BlackList { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CouponSending> CouponSendings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CustomizedOrder> CustomizedOrders { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MemberPoint> MemberPoints { get; set; }

        public virtual MembershipLevel MembershipLevel { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order> orders { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PointHistory> PointHistories { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OneToOneReservation> OneToOneReservations { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<order> orders1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PointTradeIn> PointTradeIns { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShoppingCart> ShoppingCarts { get; set; }
    }
}
