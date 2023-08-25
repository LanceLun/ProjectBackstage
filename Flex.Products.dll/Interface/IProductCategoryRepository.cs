using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Interface
{
	public interface IProductCategoryRepository
	{
		void CreateCategory(ProductCategoryDto dto);


		void DeleteCategory(int productCategoryId);



		void EditCategory(ProductCategoryDto dto);



		ProductCategoryDto GetCategoryById(int productCategoryId);



		List<ProductCategoryDto> Search();
		
	}
}
