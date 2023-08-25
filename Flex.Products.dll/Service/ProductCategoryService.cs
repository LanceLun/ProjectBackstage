using EFModels.EFModels;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.Exts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Service
{
	public class ProductCategoryService
	{
		private IProductCategoryRepository _repo;
		private AppDbContext _db;
        public ProductCategoryService(IProductCategoryRepository repo)
        {
			_repo = repo;
			_db = new AppDbContext();
        }
        public IEnumerable<ProductCategoryDto> SearchProductCategory()
		{
			var productCategory = _repo.Search();
			return productCategory;
		}

		public Result CreateProductCategory(ProductCategoryDto dto)
		{
			var result = ExisProductCategory(dto);
			if (result) return Result.Fail("分類已存在");

			_repo.CreateCategory(dto);
			return Result.Success();
		}
		public ProductCategoryDto GetProductCategoryById(int productCategoryId)
		{
			return _repo.GetCategoryById(productCategoryId);
		}

		public Result EditProductCategory(ProductCategoryDto dto)
		{
			var result=ExisProductCategory(dto);
			if(result) return Result.Fail("分類已存在");

			_repo.EditCategory(dto);
			return Result.Success();
		}

		public Result DeleteProductCategory(int productCategoryId)
		{
			try
			{
				_repo.DeleteCategory(productCategoryId);
				return Result.Success();
			}
			catch (Exception ex)
			{
				string emg = "删除失败：分類使用中，無法刪除，如確定要刪除請聯繫管理員，謝謝!!";
				return Result.Fail(emg);
			}
		}

		private bool ExisProductCategory(ProductCategoryDto dto)
		{
			return _db.ProductCategories.Any(p => p.fk_SalesCategoryId == dto.fk_SalesCategoryId && p.ProductCategoryName == dto.ProductCategoryName);
		}
	}
}
