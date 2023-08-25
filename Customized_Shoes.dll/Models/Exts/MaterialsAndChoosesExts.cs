using Customized_Shoes.dll.Models.ViewModels;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Exts
{
	public static class MaterialsAndChoosesExts
	{
		public static Customized_materialsVM ToMaVM(this Customized_materials entity)
		{

			return new Customized_materialsVM
			{
				Shoesmaterial_Id = entity.Shoesmaterial_Id,
				Material_Name = entity.material_Name,
			};
		}

		public static Customized_materials ToMaEntity(this Customized_materialsVM vm)
		{

			return new Customized_materials
			{
				Shoesmaterial_Id = vm.Shoesmaterial_Id,
				material_Name = vm.Material_Name,
			};
		}

		public static ShoesChoosesVM ToChooseVM(this ShoesChoos entity)
		{

			return new ShoesChoosesVM
			{
				OptionId = entity.OptionId,
				OptinName = entity.OptinName,
			};
		}
		public static ShoesChoos ToChooseEntity(this ShoesChoosesVM vm)
		{

			return new ShoesChoos
			{
				OptionId = vm.OptionId,
				OptinName = vm.OptinName,
			};
		}
	}
}
