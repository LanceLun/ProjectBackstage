using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Orders.ViewModels
{
    public class PayMethodVM
    {
        public int Id { get; set; }
        [Display(Name = "付款方式")]
        [StringLength(50)]
        public string pay_method { get; set; }
    }
}
