using Flex_Activity.dll.Infra.DapperRepositories;
using Flex_Activity.dll.Interface;
using Flex_Activity.dll.Models.Dto;
using Flex_Activity.dll.Models.Exts;
using Flex_Activity.dll.Models.ViewModels.DapperVM;
using Flex_Activity.dll.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Controllers
{
    public class OneToOneReservationController : Controller
    {
        // GET: OneToOneReservation
        public ActionResult Index()
        {
            IReservationRepository repo = new ReservationDapperRepository();
            OneToOneReservationServices service = new OneToOneReservationServices(repo);

            var reservations =service.GetAll();
            var vm = reservations.Select(r => r.ToIndexVM());       
            
            return View(vm);
        }

        public ActionResult ReservationList(int id)
        {
			
			IReservationRepository repo = new ReservationDapperRepository();
			OneToOneReservationServices service = new OneToOneReservationServices(repo);

            var reservations = service.GetAll(id);
            var vm = reservations.Select(r => r.ToIndexVM());

            return View(vm);

		}


    
        public ActionResult Delete(int id, int SpeakerId)
        {
			IReservationRepository repo = new ReservationDapperRepository();
			OneToOneReservationServices service = new OneToOneReservationServices(repo);

             service.Delete(id);

			return RedirectToAction("ReservationList",new { id = SpeakerId });
        }

        public ActionResult Details(int speakerId, int MemberId)
        {
            IReservationRepository repo = new ReservationDapperRepository();
            OneToOneReservationServices service = new OneToOneReservationServices(repo);

            var detailDto = service.GetOneDetail(speakerId, MemberId);
			var vm = detailDto.Select(d => d.ToDetailVM()).ToList();


			return View(vm);
            

		}

        //Get
        public ActionResult Edit (int fk_ReservationSpeakerId, int MemberId)
        {
            IReservationRepository repo = new ReservationDapperRepository();
            OneToOneReservationServices services = new OneToOneReservationServices(repo);

            var editInfoDto = services.GetOneEditInfo(fk_ReservationSpeakerId, MemberId);
            var vm = editInfoDto.ToEditVM();
            return View(vm);
            
        }

        [HttpPost]
        public ActionResult Edit (ReservationEditDapperVM vm)
        {
			IReservationRepository repo = new ReservationDapperRepository();
			OneToOneReservationServices service = new OneToOneReservationServices(repo);
			if (ModelState.IsValid)
            {
                var result = service.Update(vm.ToEditDto());
                if (result.IsSucces)
                {
					return RedirectToAction("Details", new { speakerId = vm.fk_ReservationSpeakerId, MemberId = vm.MemberId });
				}
                else
                {
                    ModelState.AddModelError(string.Empty, result.ErroeMessage);
                    return View(vm);
                }
               

            }
            return View(vm);

        }

    
	}
}

