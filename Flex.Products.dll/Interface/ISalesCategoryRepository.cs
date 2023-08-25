using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Interface
{
	public interface ISalesCategoryRepository
	{
		List<SalesCategoryDto> Search();

		void CreateCategory(SalesCategoryDto dto);

		SalesCategoryDto GetCategoryById(int salesCategoryId);

		void EditCategory(SalesCategoryDto dto);

		void DeleteCategory(int salesCategoryId);
	}
}
