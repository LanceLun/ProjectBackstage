using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public static class SupplierExts
	{
		public static SuppliersIndexVM ToIndexVM(this Supplier entity)
		{

			return new SuppliersIndexVM
			{
				SupplierId = entity.SupplierId,
				SupplierCompanyName = entity.SupplierCompanyName,
				HasCertificate = entity.HasCertificate,
				Supply_Material = entity.Supply_Material,
				SupplierCompanyPhone = entity.SupplierCompanyPhone,
				SupplierCompanyEmail = entity.SupplierCompanyEmail,
				SupplierCompanyAddress = entity.SupplierCompanyAddress,
				SupplierCompanyNumber = entity.SupplierCompanyNumber,
				SupplierStartDate = entity.SupplierStartDate,
			};

		}

		public static SupplierCreateVM ToCreateVM(this Supplier vm)
		{

			return new SupplierCreateVM
			{
				SupplierId = vm.SupplierId,
				SupplierCompanyName = vm.SupplierCompanyName,
				HasCertificate = vm.HasCertificate,
				Supply_Material = vm.Supply_Material,
				SupplierCompanyPhone = vm.SupplierCompanyPhone,
				SupplierCompanyEmail = vm.SupplierCompanyEmail,
				SupplierCompanyAddress = vm.SupplierCompanyAddress,
				SupplierCompanyNumber = vm.SupplierCompanyNumber,
				SupplierStartDate = vm.SupplierStartDate,

			};

		}



		public static Supplier ToEntity(this SupplierCreateVM vm)
		{

			return new Supplier
			{
				SupplierId = vm.SupplierId,
				SupplierCompanyName = vm.SupplierCompanyName,
				HasCertificate = vm.HasCertificate,
				Supply_Material = vm.Supply_Material,
				SupplierCompanyPhone = vm.SupplierCompanyPhone,
				SupplierCompanyEmail = vm.SupplierCompanyEmail,
				SupplierCompanyAddress = vm.SupplierCompanyAddress,
				SupplierCompanyNumber= vm.SupplierCompanyNumber,
				SupplierStartDate = vm.SupplierStartDate,

			};

		}

	}
}
