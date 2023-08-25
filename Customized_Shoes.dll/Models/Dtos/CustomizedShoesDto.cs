using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Customized_Shoes.dll.Models.Dtos
{
	public class CustomizedShoesDto
	{
		public int ShoesProductId { get; set; }

		public string ShoesName { get; set; }

		public string ShoesDescription { get; set; }

		public string ShoesOrigin { get; set; }

		public int ShoesUnitPrice { get; set; }

		//public DateTime? StartTime { get; set; }

		//public DateTime? EndTime { get; set; }

		public bool Status { get; set; }

		public int? fk_ShoesCategoryId { get; set; }

		public int? fk_ShoesColorId { get; set; }

		public string ShoesCategory { get; set; }

		public string ShoesColorCategory { get; set; }

		public DateTime DataCreateTime { get; set; }

		public DateTime DataEditTime { get; set; }

		public IEnumerable<string> ImgPaths { get; set; }
	}
}
