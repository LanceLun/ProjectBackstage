using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class CustomizedShoesIndexVM
	{
		public int ShoesProductId { get; set; }

		[Display(Name = "鞋種編號")]
		public string ShoesName { get; set; }

		[Display(Name = "商品描述")]
		public string ShoesDescription { get; set; }

		[Display(Name = "產地")]
		public string ShoesOrigin { get; set; }

		[Display(Name = "商品售價")]
		public int ShoesUnitPrice { get; set; }

		//public DateTime? StartTime { get; set; }

		//public DateTime? EndTime { get; set; }

		public bool Status { get; set; }

		[Display(Name = "狀態")]
		public string StatusText
		{
			get
			{
				if (Status)
				{
					return "已下架";
				}
				else { return "上架中"; }
			}
		}

		//[Display(Name = "商品分類")]
		//public int? fk_ShoesCategoryId { get; set; }

		[Display(Name = "商品分類")]
		public string ShoesCategory { get; set; }

		//[Display(Name = "主顏色分類")]
		//public int? fk_ShoesColorId { get; set; }

		[Display(Name = "主顏色分類")]
		public string ShoesColoeCategory { get; set; }


	}
}
