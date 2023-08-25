using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Dtos
{
	public class MembersEditDto
	{
		public int MemberId { get; set; }

		public string Name { get; set; }

		public bool? Gender { get; set; }

		public string Mobile { get; set; }

		public string Email { get; set; }

		public DateTime? Birthday { get; set; }
		
		public int fk_LevelId { get; set; }

		public int? fk_BlackListId { get; set; }
	}
}
