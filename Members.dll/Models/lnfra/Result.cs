using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.lnfra
{
	public class Result
	{
		public bool IsSuccess { get; private set; } //結果為成功
		public string ErrorMessage { get; private set; } //結果失敗的訊息

		//返回一個新的Result對象，且設有預設值
		public static Result Success()=>new Result { IsSuccess=true,ErrorMessage=null}; 
		public static Result Fail(string errormessage) => new Result { IsSuccess = false, ErrorMessage = errormessage };
	}
}
