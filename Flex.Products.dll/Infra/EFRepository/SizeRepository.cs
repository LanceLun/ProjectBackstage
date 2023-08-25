using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Infra.EFRepository
{
	public class SizeRepository
	{
		public List<SizeDto> GetSizeCategory()
		{
			return new AppDbContext()
				.SizeCategories
				.OrderBy(s => s.SizeId)
				.ToList()
				.Select(s=>s.ToDto())
				.ToList();
		}
		public int GetSizeId(string sizeName)
		{
			var result = new AppDbContext().SizeCategories.FirstOrDefault(s => s.SizeName == sizeName);
			if (result != null)
			{
				return result.SizeId;
			}
			return 0;
		}
	}
}
