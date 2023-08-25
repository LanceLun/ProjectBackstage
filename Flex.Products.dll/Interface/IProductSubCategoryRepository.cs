using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Interface
{
	public interface IProductSubCategoryRepository
	{
		void CreateCategory(ProductSubCategoryDto dto);


		void DeleteCategory(int productSubCategoryId);



		void EditCategory(ProductSubCategoryDto dto);



		ProductSubCategoryDto GetCategoryById(int productSubCategoryId);



		List<ProductSubCategoryDto> Search();
	}
}
