using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Exts
{
	public class ShoesSearchCriteria
	{
		public string Name { get; set; }
		public int? ShoesCategoryId { get; set; }
		public string Status { get; set; }
		public List<string> StatusOption { get; set; }
		public ShoesSearchCriteria()
		{
			StatusOption = new List<string>
			{
				"請選擇狀態",
				"上架中",
				"已下架"
			};
		}
	}
}
