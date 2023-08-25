using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Infra.Exts
{
	public class Result
	{
		public bool IsSuccess { get; set; }
		public bool IsFailed => !IsSuccess;
		public string ErroeMessage { get; set; }
		public static Result Success()=>new Result { IsSuccess = true,ErroeMessage=null};
		
		public static Result Fail(string errormessage)=>new Result { IsSuccess = false, ErroeMessage = errormessage };
	}
}
