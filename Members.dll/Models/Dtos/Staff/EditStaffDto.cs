using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Dtos.Staff
{
	public class EditStaffDto
	{
		public int StaffId { get; set; }

		public string Name { get; set; }

		public byte? Age { get; set; }

		public bool? Gender { get; set; }

		public string Mobile { get; set; }

		public string Email { get; set; }

		public DateTime? Birthday { get; set; }

		public DateTime? DueDate { get; set; }

		public int fk_DepartmentId { get; set; }

		public int fk_TitleId { get; set; }

		public int fk_PermissionsId { get; set; }
	}
}
