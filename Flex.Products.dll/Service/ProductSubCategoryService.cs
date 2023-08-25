using EFModels.EFModels;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.Exts;
using Flex.Products.dll.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Service
{
	public class ProductSubCategoryService
	{
		private IProductSubCategoryRepository _repo;
		private AppDbContext _db;
        public ProductSubCategoryService(IProductSubCategoryRepository repo)
        {
			_repo = repo;
			_db=new AppDbContext();
		}

		public List<ProductSubCategoryDto> SearchProductSubCategory()
		{
			return _repo.Search();
		}

		public Result CreateProductSubCategory(ProductSubCategoryDto dto)
		{
			var result = ExisProductSubCategory(dto);
			if (result) return Result.Fail("分類已存在");

			_repo.CreateCategory(dto);
			return Result.Success();
		}

		public ProductSubCategoryDto GetProductSubCategoryById(int productSubCategoryId)
		{
			return _repo.GetCategoryById(productSubCategoryId);
		}
		public Result EditProductSubCategory(ProductSubCategoryDto dto)
		{
			var result= ExisProductSubCategory(dto);
			if (result) return Result.Fail("分類已存在");

			_repo.EditCategory(dto);
			return Result.Success();
		}

		public Result DeleteProductSubCategory(int productSubCategoryId)
		{
			try
			{
				_repo.DeleteCategory(productSubCategoryId);
				return Result.Success();
			}
			catch (Exception ex)
			{
				string emg = "删除失败：分類使用中，無法刪除，如確定要刪除請聯繫管理員，謝謝!!";
				return Result.Fail(emg);
			}
		}

		private bool ExisProductSubCategory(ProductSubCategoryDto dto)
		{
			return _db.ProductSubCategories.Any(p => p.fk_ProductCategoryId == dto.fk_ProductCategoryId && p.ProductSubCategoryName == dto.ProductSubCategoryName);
		}

	}
}
