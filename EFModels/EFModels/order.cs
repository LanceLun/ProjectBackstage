namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public order()
        {
            orderItems = new HashSet<orderItem>();
            PointHistories = new HashSet<PointHistory>();
            PointTradeIns = new HashSet<PointTradeIn>();
        }

        public int Id { get; set; }

        public DateTime ordertime { get; set; }

        public int fk_member_Id { get; set; }

        public int total_quantity { get; set; }

        public int logistics_company_Id { get; set; }

        public int order_status_Id { get; set; }

        public int pay_method_Id { get; set; }

        public int pay_status_Id { get; set; }

        [StringLength(50)]
        public string coupon_name { get; set; }

        public int? coupon_discount { get; set; }

        public int? freight { get; set; }

        [Required]
        [StringLength(12)]
        public string cellphone { get; set; }

        [StringLength(50)]
        public string receipt { get; set; }

        [StringLength(50)]
        public string receiver { get; set; }

        [StringLength(50)]
        public string recipient_address { get; set; }

        [StringLength(50)]
        public string order_description { get; set; }

        public int total_price { get; set; }

        public bool? close { get; set; }

        public DateTime? close_time { get; set; }

        public virtual logistics_companies logistics_companies { get; set; }

        public virtual Member Member { get; set; }

        public virtual Member Member1 { get; set; }

        public virtual order_statuses order_statuses { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<orderItem> orderItems { get; set; }

        public virtual pay_methods pay_methods { get; set; }

        public virtual pay_statuses pay_statuses { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PointHistory> PointHistories { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PointTradeIn> PointTradeIns { get; set; }
    }
}
