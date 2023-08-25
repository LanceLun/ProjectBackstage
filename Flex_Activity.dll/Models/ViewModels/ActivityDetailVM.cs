using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.ViewModels
{
    public class ActivityDetailVM
    {
        [Display(Name = "活動編號")]
        public int ActivityId { get; set; }

        [Display(Name = "活動名稱")]
        public string ActivityName { get; set; }

        [Display(Name = "活動類別")]
        public string ActivityCategoryName { get; set; }



        [Display(Name = "活動日期")]
        public DateTime ActivityDate { get; set; }

        [Display(Name = "活動講者")]
        public string SpeakerName { get; set; }


        [Display(Name = "活動地點")]     
        public string ActivityPlace { get; set; }

        [Display(Name = "報名時間(起)")]
        public DateTime ActivityBookStartTime { get; set; }

        [Display(Name = "報名時間(迄)")]
        public DateTime ActivityBookEndTime { get; set; }


        [Display(Name = "活動圖片")]
        public string ActivityImage { get; set; }


        [Display(Name = "參加年齡")]
        //public byte ActivityAge { get; set; }
        public int ActivityAge { get; set; }

        [Display(Name = "活動特價")]
        public int ActivitySalePrice { get; set; }

        [Display(Name = "活動原價")]
        public int ActivityOriginalPrice { get; set; }

        [Display(Name = "活動描述")]
        public string ActivityDescription { get; set; }


        //public int fk_ActivityStatusId { get; set; }
        //public ActivityDetailVM()
        //{
        //    fk_ActivityStatusId = 1;
        //}

    }
}
