using DocumentFormat.OpenXml.Wordprocessing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Dtos
{
	public class ProductExcelReportDto
	{
		public string ProductId { get; set; }

		public string ProductName { get; set; }

		public string ProductDescription { get; set; }

		public string ProductMaterial { get; set; }

		public string ProductOrigin { get; set; }

		public string SalesCategoryName { get; set; }

		public string ProductCategoryName { get; set; }

		public string ProductSubCategoryName { get; set; }

		public int UnitPrice { get; set; }

		public int SalesPrice { get; set; }

		public string ColorName { get; set; }

		public string SizeName { get; set; }

		public int Qty { get; set; }

		public bool Status { get; set; }

		public string StatusText
		{
			get
			{
				if (Status)
				{
					return "已下架";
				}
				else { return "上架中"; }
			}
		}

		public string Tag { get; set; }

		public bool LogOut { get; set; }

		public DateTime CreateTime { get; set; }
		public DateTime EditTime { get; set; }
	}
}
