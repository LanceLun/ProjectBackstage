namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PointManage")]
    public partial class PointManage
    {
        public int PointManageId { get; set; }

        public bool GetOrDeduct { get; set; }

        public int Amount { get; set; }

        public int fk_TypeId { get; set; }

        public int? TypeProductId { get; set; }

        public DateTime? PointExpirationDate { get; set; }

        public virtual PointManage PointManage1 { get; set; }

        public virtual PointManage PointManage2 { get; set; }

        public virtual Type Type { get; set; }
    }
}
