namespace EFModels.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Staff
    {
        public int StaffId { get; set; }

        [Required]
        [StringLength(30)]
        public string Name { get; set; }

        public byte? Age { get; set; }

        public bool? Gender { get; set; }

        [StringLength(10)]
        public string Mobile { get; set; }

        [Required]
        [StringLength(300)]
        public string Email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Birthday { get; set; }

        [Required]
        [StringLength(30)]
        public string Account { get; set; }

        [Required]
        [StringLength(70)]
        public string Password { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DueDate { get; set; }

        public int fk_PermissionsId { get; set; }

        public int fk_TitleId { get; set; }

        public int fk_DepartmentId { get; set; }

        [StringLength(255)]
        public string ConfirmCode { get; set; }

        public virtual Department Department { get; set; }

        public virtual JobTitle JobTitle { get; set; }

        public virtual StaffPermission StaffPermission { get; set; }
    }
}
