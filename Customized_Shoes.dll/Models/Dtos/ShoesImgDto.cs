using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Dtos
{
	public class ShoesImgDto
	{
		public int ShoesImgId { get; set; }

		public int fk_ShoesProductId { get; set; }

		public string ShoesPictureUrl { get; set; }
	}
}
