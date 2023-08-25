using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Orders.ViewModels
{
    public class logistics_companiesVM
    {
        [Display(Name = "物流編號")]
        public int Id { get; set; }
        [Display(Name = "物流名稱")]
        [StringLength(50)]
        public string name { get; set; }
        [Display(Name = "物流電話")]
        [StringLength(12)]
        public string tel { get; set; }
        [Display(Name = "物流備註")]
        [StringLength(50)]
        public string logistics_description { get; set; }
    }
}
