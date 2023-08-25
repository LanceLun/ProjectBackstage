using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.Exts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Interface
{
	public interface IShoesRepository
	{
		void CreateShoes(CustomizedShoesDto dto);

		IEnumerable<CustomizedShoesDto> Search(ShoesSearchCriteria criteria);

		void EditShoesStatus(IEnumerable<CustomizedShoesDto> dto);

		CustomizedShoesDto GetById(int ShoesId);

		void EditShoes(CustomizedShoesDto dto);

		List<ShoesImgDto> GetImgById(int ShoesId);

		void SaveEditShoesImg(List<ShoesImgDto> dto);
	}
}
