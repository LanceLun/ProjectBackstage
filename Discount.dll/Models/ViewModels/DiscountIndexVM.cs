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
	public class DiscountIndexVM
	{
		public int DiscountId { get; set; }
		[Display(Name = "折扣名稱")]
		public string DiscountName { get; set; }
		[Display(Name = "折扣描述")]
		public string DiscountDescription { get; set; }
		public int? ProjectTagId { get; set; }
		public string ProjectTagName { get; set; }
		[Display(Name = "對應商品")]
		public string ProjectTagNameToShow
		{
			get
			{
				if (!ProjectTagId.HasValue) return "全部商品";
				return ProjectTagName;
			}
		}
		public int ConditionType { get; set; }
		public int ConditionValue { get; set; }
		[Display(Name = "優惠條件")]
		public string ConditionValueStr
		{
			get
			{
				switch (ConditionType)
				{
					case 0:
						return $"滿 {ConditionValue} 元";
					case 1:
						return $"滿 {ConditionValue} 件";
					default:
						return string.Empty;
				}
			}
		}
		public int DiscountType { get; set; }
		public int DiscountValue { get; set; }
		[Display(Name = "折扣方式")]
		public string DiscountValueStr
		{
			get
			{
				switch (DiscountType)
				{
					case 0:
						return $"{DiscountValue} 元";
					case 1:
						return $"{DiscountValue} %";
					default:
						return string.Empty;
				}
			}
		}

		public DateTime StartDate { get; set; }
		[Display(Name = "開始時間")]
		public string StartDateStr
			=> StartDate.ToString("yyyy'-'MM'-'dd") + " 00:00";

		public DateTime? EndDate { get; set; }
		[Display(Name = "結束時間")]
		public string EndDateStr
			=> EndDate.HasValue ? EndDate.Value.ToString("yyyy'-'MM'-'dd") + " 23:59" : "無期限";

		[Display(Name = "狀態")]
		public string Status
		{
			get
			{
				if (EndDate.HasValue && EndDate.Value < DateTime.Today)
				{
					return "已過期";
				}
				else if (StartDate > DateTime.Today)
				{
					return "未開始";
				}
				else
				{
					return "進行中";
				}
			}
		}


		public int? OrderBy { get; set; }
		[Display(Name = "折扣優先順序")]
		public string OrderByStr => OrderBy.HasValue ? OrderBy.Value.ToString() : "--";
	}

	public static class DiscountIndexVMExts
	{
		public static DiscountIndexVM ToIndexVM(this DiscountIndexDto dto)
		{
			return new DiscountIndexVM
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
	}
}
