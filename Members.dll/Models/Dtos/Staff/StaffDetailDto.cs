using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Dtos.Staff
{
	public class StaffDetailDto
	{
		public int StaffId { get; set; }

		public bool? Gender { get; set; }

		public string Name { get; set; }

		public byte? Age { get; set; }

		public string Email { get; set; }

		public DateTime? DueDate { get; set; }

		public string Department { get; set; }

		public string TitleName { get; set; }

		public string LevelName { get; set; }

		public string Mobile { get; set; }

		public DateTime? Birthday { get;set; }
	}
}
