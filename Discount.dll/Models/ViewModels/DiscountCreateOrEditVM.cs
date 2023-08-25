using Discount.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Discount.dll.Models.ViewModels
{
	public class DiscountCreateOrEditVM
	{
		public int DiscountId { get; set; }
		[Display(Name = "折扣名稱")]
		[Required]
		public string DiscountName { get; set; }
		[Display(Name = "折扣描述")]
        [Required]
        public string DiscountDescription { get; set; }
		[Display(Name = "對應商品")]
		public int? ProjectTagId { get; set; }
		public string ProjectTagName { get; set; }

		[Display(Name = "優惠條件")]
		public int ConditionType { get; set; }

		[Display(Name = "優惠價值")]
		public int ConditionValue { get; set; }
		
		[Display(Name = "折扣方式")]
		public int DiscountType { get; set; }

		[Display(Name = "折扣價值")]
		public int DiscountValue { get; set; }

		[Display(Name = "開始時間")]
		[Required]
		public DateTime StartDate { get; set; }
		
		[Display(Name = "結束時間")]
		public DateTime? EndDate { get; set; }

		[Display(Name = "優先度")]
        [Required]
        public int? OrderBy { get; set; }
	}

	public static class DiscountCreateOrEditVMExts
	{
		public static DiscountCreateOrEditVM ToCreateOrEditVM(this DiscountCreateOrEditDto dto)
		{
			return new DiscountCreateOrEditVM
			{
				DiscountType = dto.DiscountType,
				DiscountValue = dto.DiscountValue,
				DiscountDescription = dto.DiscountDescription,
				DiscountId = dto.DiscountId,
				DiscountName = dto.DiscountName,
				EndDate = dto.EndDate,
				StartDate = dto.StartDate,
				ConditionType = dto.ConditionType,
				ConditionValue = dto.ConditionValue,
				ProjectTagId = dto.ProjectTagId,
				ProjectTagName = dto.ProjectTagName,
				OrderBy = dto.OrderBy,
			};
		}

		public static DiscountCreateOrEditDto ToDto(this DiscountCreateOrEditVM vm)
		{
			return new DiscountCreateOrEditDto
			{
				DiscountType = vm.DiscountType,
				DiscountValue = vm.DiscountValue,
				DiscountDescription = vm.DiscountDescription,
				DiscountId = vm.DiscountId,
				DiscountName = vm.DiscountName,
				EndDate = vm.EndDate,
				StartDate = vm.StartDate,
				ConditionType = vm.ConditionType,
				ConditionValue = vm.ConditionValue,
				ProjectTagId = vm.ProjectTagId,
				ProjectTagName = vm.ProjectTagName,
				OrderBy = vm.OrderBy,
			};
		}
	}
}
