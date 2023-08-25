using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using Discount.dll.Models.Infra.DapperRepositories;
using Discount.dll.Models.Interfaces;
using Discount.dll.Models.Services;
using Discount.dll.Models.ViewModels;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Controllers
{
    public class ProjectTagController : Controller
    {
        private readonly IProjectTagRepository _repo;
        private readonly ProjectTagService _service;
        public ProjectTagController()
        {
            _repo = new ProjectTagDapperRepository();
            _service = new ProjectTagService(_repo);
        }
        // GET: ProjectTag
        public ActionResult Index()
        {
            IEnumerable<ProjectTagIndexVM> ProjectTags = GetProjectTags();
            return View(ProjectTags);
        }
        [HttpPost]
        public ActionResult UpdateStatus(int[] ids, bool isComplete)
        {
            List<ProjectTagStatusChangeVM> vms = new List<ProjectTagStatusChangeVM>();
            for (int i = 0; i < ids.Length; i++)
            {
                vms.Add(new ProjectTagStatusChangeVM
                {
                    ProjectTagId = ids[i],
                    Status = !isComplete
                });
            }

            var result = UpdateProjectTag(vms);

            return Json(new { success = result.IsSuccess, error = result.ErrorMessage });
        }
        [HttpPost]
        public ActionResult GetDatas(string input, bool getCompleteResult)
        {
            return Json(GetProjectTags(input, getCompleteResult));
        }
        [HttpPost]
        public ActionResult GetProducts(int projectTagId, bool excludeNonTaggedProducts = true, bool excludeOutOfStockProducts = false, string subCategoryPath = null, string productName = null)
        {
            return Json(_service.GetProducts(projectTagId, excludeNonTaggedProducts, excludeOutOfStockProducts, subCategoryPath, productName));
        }
        [HttpPost]
        public ActionResult GetEditData(int id)
        {
            return Json(GetProjectTag(id));
        }
        [HttpPost]
        public ActionResult DeleteTag(string pdId, int pjId)
        {
            var vms = new ProjectTagItemVM { ProductId = pdId, ProjectTagId = pjId };
            _service.DeleteTagItems(new List<ProjectTagItemDto> { vms.ToDto() });
            return new EmptyResult();
        }
        [HttpPost]
        public ActionResult InsertTag(string pdId, int pjId)
        {
            var vms = new ProjectTagItemVM { ProductId = pdId, ProjectTagId = pjId };
            _service.InsertTagItems(new List<ProjectTagItemDto> { vms.ToDto() });
            return new EmptyResult();
        }
        [HttpPost]
        public ActionResult DeleteTags(string[] pdIds, int pjId)
        {
            List <ProjectTagItemVM> vms =  new List <ProjectTagItemVM> ();
            for (int i = 0; i < pdIds.Length; i++)
            {
                vms.Add( new ProjectTagItemVM { ProductId = pdIds[i], ProjectTagId = pjId });

            }
            _service.DeleteTagItems(vms.Select(x=>x.ToDto()).ToList());
            return new EmptyResult();
        }
        [HttpPost]
        public ActionResult InsertTags(string[] pdIds, int pjId)
        {
            List<ProjectTagItemVM> vms = new List<ProjectTagItemVM>();
            for (int i = 0; i < pdIds.Length; i++)
            {
                vms.Add(new ProjectTagItemVM { ProductId = pdIds[i], ProjectTagId = pjId });

            }
            _service.InsertTagItems(vms.Select(x => x.ToDto()).ToList());
            return new EmptyResult();
        }

        private IEnumerable<ProjectTagIndexVM> GetProjectTags(string projectTagName = null, bool getCompleteResult = false)
        {
            return _service.Search(projectTagName, getCompleteResult).Select(x => x.ToViewModel());
        }
        private ProjectTagEditNameVM GetProjectTag(int id = 0)
        {
            return _service.GetProjectTag(id).ToEditNameVM();
        }
        private Result UpdateProjectTag(List<ProjectTagStatusChangeVM> vms)
        {
            return _service.Update(vms.Select(x => x.ToStatusChangeDto()).ToList());
        }

        public ActionResult CreateOrEdit(ProjectTagService.Criteria criteria)
        {
            bool result = int.TryParse(criteria.ProjectTagId,out int id);
            if (Request.QueryString["excludeNonTaggedProducts"] != null)
            {
                criteria.excludeNonTaggedProducts = Request.QueryString["excludeNonTaggedProducts"] == "on";
            }

            if (Request.QueryString["excludeOutOfStockProducts"] != null)
            {
                criteria.excludeOutOfStockProducts = Request.QueryString["excludeOutOfStockProducts"] == "on";
            }

            // 其他邏輯
            ViewBag.Criteria = criteria;
            if (result && id != 0)
            {
                // 如果有id為 edit
                var vm = _service.GetProjectTag(id).ToEditNameVM();
                return View(vm);
            }
            else
            {
                // 如果id為null 為create
                var vm = new ProjectTagEditNameVM
                {
                    ProjectTagId = 0
                };
                return View(vm);
            }
        }
        [HttpPost]
        public ActionResult CreateOrEdit(int id, string projectName)
        {
            if (!ModelState.IsValid) return Json(GetProjectTag(id));
            var vm = new ProjectTagEditNameVM { ProjectTagId = id, ProjectTagName = projectName, Status = true };
            if (id != 0)
            {
                // 如果有id為 edit
                var result = _service.Update(vm.ToEditNameDto());
                if (result.IsFail)
                {
                    var newVM = vm;
                    return Json(new { newVM, result.IsFail, result.ErrorMessage });
                }
                else
                {
                    var newVM = GetProjectTag(id);
                    return Json(new { newVM, result.IsFail, result.ErrorMessage });
                }
            }
            else
            {
                // 如果id為null 為create
                var result = _service.Create(vm.ToEditNameDto());
                if (result.result.IsFail)
                {
                    var newVM = vm;
                    return Json(new { newVM, result.result.IsFail, result.result.ErrorMessage });
                }
                else
                {
                    var newVM = GetProjectTag(result.id);
                    return Json(new { newVM, result.result.IsFail, result.result.ErrorMessage });
                }
            }
        }
    }
}