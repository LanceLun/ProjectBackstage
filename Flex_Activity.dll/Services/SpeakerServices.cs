using EFModels.EFModels;
using Flex_Activity.dll.Interface;
using Flex_Activity.dll.Models.Dto;
using Flex_Activity.dll.Models.Exts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace Flex_Activity.dll.Services
{
    public class SpeakerServices
    {
        //建立了一個私有欄位 _repo，型別是 ISpeakerRepository
        private ISpeakerRepository _repo;
        private AppDbContext _db;

        //將實作了 ISpeakerRepository 介面的物件傳入。也就是說，我們將能夠執行資料庫操作的類別的物件傳入 SpeakerServices。
        //SpeakerServices 就可以使用 _repo 物件來執行與講者資料庫存取相關的操作
        public SpeakerServices(ISpeakerRepository repo)
        {
            this._repo = repo;
            _db = new AppDbContext();
        }

        public IEnumerable<SpeakerDetailDto> Search()
        {
            return _repo.Search();
        }

        public Result CreateSpeaker(SpeakerDetailDto dto)
        {
            //檢查手機號碼是否存在
            //if (HasPhone(dto.SpeakerPhone))
            //{
            //    return Result.Fail("此號碼已被使用");
            //}

            //手機號碼不存在就把dto傳給Repository存到database並回傳成功訊息
            _repo.CreateSpeaker(dto);
            return Result.Success();
        }

        public Result EditSpeaker(SpeakerDetailDto dto)
        {
            _repo.EditSpeaker(dto);
            return Result.Success();

        }

		public Result EditSpeakerImg(SpeakerDetailDto dto)
		{
			_repo.EditSpeakerImg(dto);
			return Result.Success();

		}


		//判斷手機號碼是否已經存在
		public bool HasPhone(string phone)
        {
            return _db.Speakers.Any(s => s.SpeakerPhone == phone);
            //return _db.Speakers.Any(s => s.SpeakerPhone == phone);
        }
    }

}
