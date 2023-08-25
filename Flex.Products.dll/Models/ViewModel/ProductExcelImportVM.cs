using Flex.Products.dll.Infra.EFRepository;
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
	public class ProductExcelImportVM
	{
		[Description("商品編碼")]
		[Required(ErrorMessage = "{0}必填")]
		[RegularExpression(@"^[^\u4e00-\u9fa5]+$", ErrorMessage = "不能輸入中文")]
		[StringLength(254)]
		public string ProductId { get; set; }

		[Description("商品名稱")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(254)]
		public string ProductName { get; set; }

		[Description("描述")]
		[Required(ErrorMessage = "{0}必填")]
		public string ProductDescription { get; set; }

		[Description("材質")]
		[StringLength(50)]
		[MaxLength(50, ErrorMessage = "長度限制為{1}個字")]
		public string ProductMaterial { get; set; }

		[Description("產地")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(50)]
		[MaxLength(50, ErrorMessage = "長度限制為{1}個字")]
		public string ProductOrigin { get; set; }

		[Description("銷售分類")]
		public string SalesCategoryName { get; set; }

		[Description("商品分類")]
		public string ProductCategoryName { get; set; }

		[Description("商品子分類")]
		public string ProductSubCategoryName { get; set; }

		[Description("定價")]
		[Range(0, 99999, ErrorMessage = "{0}須介於{1}至{2}之間")]
		[DisplayFormat(DataFormatString = "{0:#,#}", ApplyFormatInEditMode = false)]
		public int? UnitPrice { get; set; }

		[Description("售價")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(0, 99999, ErrorMessage = "{0}須介於{1}至{2}之間")]
		[DisplayFormat(DataFormatString = "{0:#,#}", ApplyFormatInEditMode = false)]
		public int SalesPrice { get; set; }

		[Description("顏色")]
		public string ColorName { get; set; }

		[Description("尺寸")]
		public string SizeName { get; set; }

		[Description("庫存")]
		public int Qty { get; set; }

		[Description("狀態")]
		public string StatusText { get; set; }

		public bool Status { get; set; }

		public string CategoryName
		{
			get
			{
				return $"{SalesCategoryName}/{ProductCategoryName}/{ProductSubCategoryName}";
			}
		}

		public int fk_ProductSubCategoryId { get; set; }

		//public List<string> ImgPaths { get; set; }

		public List<ProductGroupsDto> ProductGroups { get; set; }

		public ProductExcelImportVM()
        {
			ProductGroups = new List<ProductGroupsDto>();
		}
    }
}
