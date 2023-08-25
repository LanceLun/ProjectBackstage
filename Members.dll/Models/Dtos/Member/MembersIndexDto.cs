using EFModels.EFModels;
using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace Members.dll.Models.Dtos
{
	public class MembersIndexDto
	{
		public int MemberId { get; set; }
		public string Name { get; set; }
		public bool? Gender { get; set; }
		public string Email { get; set; }
		public string LevelName { get; set; }
		public int PointSubtotal { get; set; } 
		public DateTime? Registration { get; set; }
		public int? fk_BlackListId { get; set; }
	}

}
