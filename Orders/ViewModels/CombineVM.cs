using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Orders.ViewModels
{
    public class CombineVM
    {
        public IEnumerable<PayMethodVM> PayMethods { get; set; }
        public IEnumerable<logistics_companiesVM> Companies { get; set; }
    }
}
