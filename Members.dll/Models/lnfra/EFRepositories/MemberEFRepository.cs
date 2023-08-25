using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.Exts;
using Members.dll.Models.Interfaces;
using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using static Dapper.SqlMapper;

namespace Members.dll.Models.lnfra.EFRepositories
{
	//Repository用來存取資料庫
	public class MemberEFRepository : IMemberRepository
	{
		private AppDbContext _db;
		public MemberEFRepository()
		{
			_db = new AppDbContext();
		}

		//會員資料管理
		public MembersEditDto GetMemberId(int? memberId)
		{
			var member = _db.Members.Include(m => m.MembershipLevel).Include(m=>m.BlackList);
			var members = member.ToList().FirstOrDefault(m => m.MemberId == memberId);
			return members.ToMembersEditDto();
		}

		//取得員工資料
		public List<MembersIndexDto> GetMemberList()
		{
			var members = _db.Members.Include(m => m.MemberPoints).Include(m => m.BlackList).Include(m => m.MembershipLevel);
			var memberList = members.ToList().Select(m => m.ToIndexDto()).ToList();
			return memberList;
		}

		//判斷帳號是否存在
		public bool ExistAccount(string account)
		{
			return _db.Members.Any(m => m.Account == account);//Any指的是有沒有
		}

		//通過 RegisterDto傳入Dto
		public void Register(RegisterDto dto)
		{
			//將RegisterDto 轉為 Member，Member是數據訪問層中對應數據表的實體對象(EF裡面的Member)。
			Member member = new Member
			{
				Account = dto.Account,
				EncryptedPassword = dto.EncryptedPassword,
				Name = dto.Name,
				Gender = dto.Gender,
				Mobile = dto.Mobile,
				Email = dto.Email,
				Birthday = dto.Birthday,
				IsConfirmed = dto.IsConfirmed,
				ConfirmCode = dto.ConfirmCode
			};

			//使用Entity Framework的DbContext將Member存到db
			_db.Members.Add(member);
			_db.SaveChanges();
		}

		public void EditMember(MembersEditDto dto)
		{
			var member = _db.Members.Find(dto.MemberId);
			member.Birthday = dto.Birthday;
			member.Name = dto.Name;
			member.Gender = dto.Gender;
			member.Mobile = dto.Mobile;
			member.Email = dto.Email;
			member.Birthday = dto.Birthday;
			member.fk_BlackListId = dto.fk_BlackListId;
			member.fk_LevelId = dto.fk_LevelId;


			_db.Entry(member).State = EntityState.Modified;
			_db.SaveChanges();
		}
	}
}
