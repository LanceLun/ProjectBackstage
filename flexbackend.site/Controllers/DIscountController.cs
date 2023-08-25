using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra.DapperRepositories;
using Discount.dll.Models.Infra.EFRepositories;
using Discount.dll.Models.Interfaces;
using Discount.dll.Models.Services;
using Discount.dll.Models.ViewModels;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace flexbackend.site.Controllers
{
	public class DiscountController : Controller
	{
		private IDiscountRepository _repo;
		private DiscountService _service;
		public DiscountController()
		{
			_repo = new DiscountEFRepository();
			_service = new DiscountService(_repo);
		}

		// GET: Discount
		public ActionResult Index(bool searchExpired = false, string searchDiscountName = null)
		{
			ViewBag.searchExpired = searchExpired;
			ViewBag.searchDiscountName = searchDiscountName;

			return View();
		}
		[HttpPost]
		public ActionResult GetDatas(bool searchExpired = false, string searchDiscountName = null)
		{
			return Json(GetDiscounts(searchExpired, searchDiscountName));
		}

		public IEnumerable<DiscountIndexVM> GetDiscounts(bool searchExpired = false, string searchDiscountName = null)
		{
			return _service.GetDiscounts(searchExpired, searchDiscountName).Select(x => x.ToIndexVM());
		}
		public ActionResult CreateOrEdit(int? id)
		{
			List<SelectListItem> projectTagitems = new List<SelectListItem>();
			var db = new AppDbContext();
			projectTagitems.AddRange(db.ProjectTags.Where(p => p.Status == true)
							.Select(p => new SelectListItem { Value = p.ProjectTagId.ToString(), Text = p.ProjectTagName }));

			List<SelectListItem> discountType = new List<SelectListItem>
			{
				new SelectListItem { Value = "0" , Text = "金額" },
				new SelectListItem { Value = "1" , Text = "百分比" },
			};

			List<SelectListItem> conditionType = new List<SelectListItem>
			{
				new SelectListItem { Value = "0" , Text = "依照購買價格" },
				new SelectListItem { Value = "1" , Text = "依照商品件數" },
			};

			ViewBag.ConditionType = conditionType;
			ViewBag.DiscountType = discountType;
			if (id == null || id.Value == 0)
			{
				ViewBag.projectTagitems = new SelectList(projectTagitems, "Value", "Text", null);
				DiscountCreateOrEditVM vm = new DiscountCreateOrEditVM
				{
					DiscountId = 0,
					DiscountName = null,
					DiscountDescription = null,
					ProjectTagId = null,
					ConditionType = 0,
					ConditionValue = 0,
					DiscountType = 0,
					DiscountValue = 0,
					StartDate = DateTime.Today,
					EndDate = null,
					OrderBy = null
				};

				return View(vm);
			}
			else
			{
				DiscountCreateOrEditVM vm = _service.GetDiscountById(id.Value).ToCreateOrEditVM();
				IProjectTagRepository repo = new ProjectTagDapperRepository();
				ProjectTagService service = new ProjectTagService(repo);

				var projectTag = service.GetProjectTag(vm.ProjectTagId);
				if (projectTag != null && projectTag.Status == false)
				{
					projectTagitems.Add(new SelectListItem { Value = vm.ProjectTagId.ToString(), Text = vm.ProjectTagName });
				}

				ViewBag.projectTagitems = new SelectList(projectTagitems, "Value", "Text", vm.ProjectTagId);
				return View(vm);
			}
		}
		[HttpPost]
		public ActionResult CreateOrEdit(DiscountCreateOrEditVM vm)
		{
			if (vm.DiscountId == 0)
			{
				if (ModelState.IsValid)
				{
					var result = _service.Create(vm.ToDto());
					return Json(result.result);
				}
			}
			else
			{
				if (ModelState.IsValid)
				{
					return Json(_service.Update(vm.ToDto()));
				}
			}
			return Json("");
		}

		[HttpDelete]
		public ActionResult Delete(int id)
		{
			int[] ids = new int[1];
			ids[0] = id;
			_service.Delete(ids);
			return Content("Resource deleted successfully.");
		}

	}
}