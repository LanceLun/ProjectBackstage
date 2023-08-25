using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Interfaces
{
	//Interface 類似轉接器，若需要存取資料庫都來實作這個介面
	public interface IMemberRepository
	{
		void EditMember(MembersEditDto dto); //將會員編輯資料寫到資料庫
		List<MembersIndexDto> GetMemberList();//取得員工資料
		void Register(RegisterDto dto); //將會員寫到資料庫裡
		bool ExistAccount(string account); //判斷帳號是否存在
		MembersEditDto GetMemberId(int? memberId);
	}
}
