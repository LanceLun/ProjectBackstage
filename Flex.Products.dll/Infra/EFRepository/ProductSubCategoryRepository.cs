using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Linq.Expressions;

namespace Flex.Products.dll.Models.Infra.EFRepository
{
	public class ProductSubCategoryRepository
	{
		private AppDbContext _db;
        public ProductSubCategoryRepository()
        {
			_db = new AppDbContext();
        }
        public List<ProductSubCategoryDto> GetProductSubCategory()
		{
			return new AppDbContext().ProductSubCategories
				.OrderBy(c => c.ProductSubCategoryId)
				.ToList()
				.Select(c => c.ToDto())
				.ToList();
		}

		public int GetProductSubCategoryId(string productSubName)
		{
			var result = new AppDbContext().ProductSubCategories.FirstOrDefault(p =>p.SubCategoryPath== productSubName);
			if (result != null) return result.ProductSubCategoryId;
			else return 0;
		}
	}
}
