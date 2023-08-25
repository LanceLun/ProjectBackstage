using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.Dtos
{
	public class StaffsCreateDto
	{
		public string Department { get; set; }

		public string JobTitle { get; set; }

		public string Name { get; set; }

		public DateTime? Birthday { get; set; }

		public bool? Gender { get; set; }

		public byte? Age { get; set; }

		public string Email { get; set; }

		public string StaffPermission { get; set; }

		public string Mobile { get; set; }
		
		public string Account { get; set; }

		public string Password { get; set; }

		public int fk_PermissionsId { get; set; }

		public int fk_TitleId { get; set; }

		public int fk_DepartmentId { get; set; }
	}
}
