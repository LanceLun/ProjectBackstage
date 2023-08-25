using DocumentFormat.OpenXml.Wordprocessing;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductExcelReportVM
	{
		[Description("商品編碼")]
		public string ProductId { get; set; }

		[Description("商品名稱")]
		public string ProductName { get; set; }

		[Description("描述")]
		public string ProductDescription { get; set; }

		[Description("材質")]
		public string ProductMaterial { get; set; }

		[Description("產地")]
		public string ProductOrigin { get; set; }

		[Description("銷售分類")]
		public string SalesCategoryName { get; set; }

		[Description("商品分類")]
		public string ProductCategoryName { get; set; }

		[Description("商品子分類")]
		public string ProductSubCategoryName { get; set; }

		[Description("定價")]
		public int UnitPrice { get; set; }

		[Description("售價")]
		public int SalesPrice { get; set; }

		[Description("顏色")]
		public string ColorName { get; set; }

		[Description("尺寸")]
		public string SizeName { get; set; }

		[Description("庫存")]
		public int Qty { get; set; }

		[Description("狀態")]
		public string StatusText { get; set; }

		[Description("標籤")]
		public string Tag { get; set; }

		[Description("創建時間")]
		public DateTime CreateTime { get; set; }

		[Description("上次編輯時間")]
		public DateTime EditTime { get; set; }
	}
}
