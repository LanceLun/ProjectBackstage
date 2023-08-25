using Flex.Products.dll.Exts;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Flex.Products.dll.Service.ProductService;

namespace Flex.Products.dll.Interface
{
	public interface IProductRepository
	{
		List<ProductExcelReportDto> ReportToExcel();

		void CreateProduct(ProductDto dto);

		List<ProductDto> Search(IndexSearchCriteria criteria);

		void SaveChangeStatus(List<ProductDto> dto);

		ProductDto GetById(string productId);

		void EditProduct(ProductDto dto);

		List<ProductImgDto> GetImgById(string productId);

		void SaveEditImg(List<ProductImgDto> dto);

		void DeleteProduct(string productId);

		void CreateProductForExcel(ProductExcelImportDto dto);

		List<ProductDto> SearchIndexForExcel(List<string> productIds);
	}
}
