using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Exts
{
	public static class MembersExts
	{
		//擴充方法，將MembersIndexDto 轉為 MembersIndexVM，將資料取出

		public static MembersIndexVM ToIndexVM(this MembersIndexDto dto)
		{
			return new MembersIndexVM()
			{
				MemberId = dto.MemberId,
				Name = dto.Name,
				Gender = dto.Gender,
				Email = dto.Email,
				LevelName = dto.LevelName,
				PointSubtotal = dto.PointSubtotal,
				Registration = dto.Registration,
				fk_BlackListId = dto.fk_BlackListId
			};
		}
		//擴充方法，將EF entity 轉為 MembersIndexDto，將資料取出
		public static MembersIndexDto ToIndexDto(this Member entity)
		{
			return new MembersIndexDto
			{
				MemberId = entity.MemberId,
				Name = entity.Name,
				Gender = entity.Gender,
				Email = entity.Email,
				LevelName = entity.MembershipLevel.LevelName,
				PointSubtotal = entity.MemberPoints.Sum(p => p.PointSubtotal),
				Registration = entity.Registration,
				fk_BlackListId = entity.fk_BlackListId
			};
		}

		public static MembersIndexVM ToIndexVM(this Member entity)
		{
			return new MembersIndexVM
			{
				MemberId = entity.MemberId,
				Name = entity.Name,
				Gender = entity.Gender,
				Email = entity.Email,
				LevelName = entity.MembershipLevel.LevelName,
				PointSubtotal = entity.MemberPoints.Sum(p => p.PointSubtotal),
				Registration = entity.Registration,
				fk_BlackListId = entity.fk_BlackListId
			};
		}


		public static MemberEditVM ToMembersEditVM(this MembersEditDto dto)
		{
			return new MemberEditVM
			{
				MemberId = dto.MemberId,
				Name = dto.Name,
				Gender = dto.Gender,
				Mobile = dto.Mobile,
				Email = dto.Email,
				Birthday = dto.Birthday,
				fk_LevelId = dto.fk_LevelId,
				fk_BlackListId = dto.fk_BlackListId
			};
		}
		public static MembersEditDto ToMembersEditDto(this Member entity)
		{
			return new MembersEditDto
			{
				MemberId = entity.MemberId,
				Name = entity.Name,
				Gender = entity.Gender,
				Mobile = entity.Mobile,
				Email = entity.Email,
				Birthday = entity.Birthday,
				fk_LevelId = entity.fk_LevelId,
				fk_BlackListId=entity.fk_BlackListId
			};
		}
		public static Member ToMembersEditEntity(this MembersEditDto dto)
		{
			return new Member
			{
				MemberId = dto.MemberId,
				Name = dto.Name,
				Gender = dto.Gender,
				Mobile = dto.Mobile,
				Email = dto.Email,
				Birthday = dto.Birthday,
				fk_LevelId = dto.fk_LevelId,
				fk_BlackListId = dto.fk_BlackListId
			};
		}
		public static MembersEditDto ToMembersEditDto(this MemberEditVM vm)
		{
			return new MembersEditDto
			{
				MemberId = vm.MemberId,
				Name = vm.Name,
				Gender = vm.Gender,
				Mobile = vm.Mobile,
				Email = vm.Email,
				Birthday = vm.Birthday,
				fk_LevelId = vm.fk_LevelId,
				fk_BlackListId = vm.fk_BlackListId
			};
		}
	}
}
