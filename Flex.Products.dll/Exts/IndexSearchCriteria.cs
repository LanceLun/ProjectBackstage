using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Exts
{
	public class IndexSearchCriteria
	{
		public string Name { get; set; }
		public int? ProductSubCategoryId { get; set; }
		public string Status { get; set; }
		public List<string> StatusOption { get; set; }
		public IndexSearchCriteria()
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
