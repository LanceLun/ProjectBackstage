using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Discount.dll.Models.Dtos
{
	public class DiscountCreateOrEditDto
	{
		public int DiscountId { get; set; }
		public string DiscountName { get; set; }
		public string DiscountDescription { get; set; }
		public int? ProjectTagId { get; set; }
		public string ProjectTagName { get; set; }
		public int ConditionType { get; set; }
		public int ConditionValue { get; set; }
		public int DiscountType { get; set; }
		public int DiscountValue { get; set; }
		public DateTime StartDate { get; set; }
		public DateTime? EndDate { get; set; }
		public int? OrderBy { get; set; }
	}
}
