using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Infra.DapperRepository;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.EFRepository;
using Flex.Products.dll.Models.Infra.Exts;
using Flex.Products.dll.Models.ViewModel;
using Flex.Products.dll.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Controllers
{
	public class ProductCategoriesController : Controller
	{
		private ISalesCategoryRepository _repo = new SalesCategotyDPRepository();
		private IProductCategoryRepository _repoProductCategory=new ProductCategoryDPRepository();
		private IProductSubCategoryRepository _repoProductSubCategory=new ProductSubCategoryDPRepository();
		private AppDbContext _db = new AppDbContext();

		// GET: ProductCategories
		public ActionResult SalesCategoryIndex()
		{
			var service = new CategoryService(_repo).SearchSalesCategory();
			var vm = service.Select(s => s.ToIndexVM());
			if (Request.IsAjaxRequest())
			{
				return Json(vm);
			}
			return View(vm);
		}

		//[HttpPost]
		//public ActionResult ReLoadSalesCategoryIndex()
		//{
		//	var service = new CategoryService(_repo).Search();
		//	var vm = service.Select(s => s.ToIndexVM());
		//	return Json(new { data = vm });
		//}

		// GET: ProductCategories/CreateSalesCategory
		public ActionResult CreateSalesCategory()
		{
			var vm = new SalesCategoryCreateVM();
			return View(vm);
		}

		// POST: ProductCategories/CreateSalesCategory
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult CreateSalesCategory(SalesCategoryCreateVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);

			var service = new CategoryService(_repo);
			Result result = service.CreateSalesCategory(vm.ToCreateDto());

			if (result.IsFailed)
			{
				ModelState.AddModelError("SalesCategoryName", result.ErroeMessage);
				return View(vm);
			}

			return RedirectToAction("SalesCategoryIndex");

		}

		// GET: ProductCategories/EditSalesCategory/
		public ActionResult EditSalesCategory(int salesCategoryId)
		{
			if (salesCategoryId == 0) return new HttpStatusCodeResult(HttpStatusCode.BadGateway);

			var service = new CategoryService(_repo);
			var vm = service.GetSalesCategoryById(salesCategoryId).ToEditVM();

			if (vm == null) return HttpNotFound();

			return View(vm);
		}

		//POST: ProductCategories/EditSalesCategory/
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditSalesCategory(SalesCategoryEditVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);
			var service = new CategoryService(_repo);
			Result result = service.EditSalesCategory(vm.ToEditDto());

			if (result.IsFailed)
			{
				ModelState.AddModelError("SalesCategoryName", result.ErroeMessage);
				return View(vm);
			}

			return RedirectToAction("SalesCategoryIndex");
		}


		// POST: ProductCategories/Delete/5
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteSalesCategory(int salesCategoryId)
		{

			var service = new CategoryService(_repo);
			Result result = service.DeleteSalesCategory(salesCategoryId);

			if (result.IsSuccess)
			{
				return Json(new { success = true });
			}
			return Json(new { success = false,message=result.ErroeMessage });

		}

		public ActionResult ProductCategoryIndex()
		{
			var service=new ProductCategoryService(_repoProductCategory);
			var vm = service.SearchProductCategory().Select(p => p.ToIndexVM());
			return View(vm);
		}

		public ActionResult CreateProductCategory()
		{
			PrepareSalesCategoryDataSource(null);
			var vm=new ProductCategoryCreateVM();
			return View(vm);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult CreateProductCategory(ProductCategoryCreateVM vm)
		{
			PrepareSalesCategoryDataSource(vm.fk_SalesCategoryId);

			if(!ModelState.IsValid)return View(vm);

			var service=new ProductCategoryService(_repoProductCategory);
			Result result = service.CreateProductCategory(vm.ToCreateDto());

			if (result.IsFailed)
			{
				ModelState.AddModelError(string.Empty, result.ErroeMessage);
				return View(vm);
			}

			return RedirectToAction("ProductCategoryIndex");
		}

		public ActionResult EditProductCategory(int productCategoryId)
		{
			if(productCategoryId==0)return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			var service=new ProductCategoryService(_repoProductCategory);
			var vm = service.GetProductCategoryById(productCategoryId).ToEditVM();

			if(vm==null)return HttpNotFound();

			PrepareSalesCategoryDataSource(vm.fk_SalesCategoryId);
			return View(vm);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditProductCategory(ProductCategoryEditVM vm)
		{

			PrepareSalesCategoryDataSource(vm.fk_SalesCategoryId);
			if (!ModelState.IsValid) return View(vm);

			var service= new ProductCategoryService(_repoProductCategory);
			Result result = service.EditProductCategory(vm.ToDto());

			if (result.IsFailed)
			{
				ModelState.AddModelError(string.Empty, result.ErroeMessage);
				return View(vm);
			}

			return RedirectToAction("ProductCategoryIndex");

		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteProductCategory(int productCategoryId)
		{
			var service = new ProductCategoryService(_repoProductCategory);
			Result result = service.DeleteProductCategory(productCategoryId);
			if (result.IsSuccess) 
			{
				return Json(new { success = true });
			}
			return Json(new { success = false,message=result.ErroeMessage });
		}

		public ActionResult ProductSubCategoryIndex()
		{
			var service = new ProductSubCategoryService(_repoProductSubCategory);
			var vm = service.SearchProductSubCategory().Select(p => p.ToIndexVM());
			return View(vm);
		}

		public ActionResult CreateProductSubCategory()
		{
			PrepareProductCategoryDataSource(null);
			var vm=new ProductSubCategoryCreateVM();
			return View(vm);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult CreateProductSubCategory(ProductSubCategoryCreateVM vm)
		{
			PrepareProductCategoryDataSource(vm.fk_ProductCategoryId);

			if(!ModelState.IsValid) return View(vm);

			Result result = new ProductSubCategoryService(_repoProductSubCategory).CreateProductSubCategory(vm.ToDto());

			if (result.IsFailed)
			{
				ModelState.AddModelError(string.Empty, result.ErroeMessage);
				return View(vm);
			}
			return RedirectToAction("ProductSubCategoryIndex");

		}

		public ActionResult EditProductSubCategory(int productSubCategoryId)
		{
			if (productSubCategoryId==0) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			PrepareProductCategoryDataSource(null);
			var service=new ProductSubCategoryService(_repoProductSubCategory);
			var vm = service.GetProductSubCategoryById(productSubCategoryId).ToEditVM();
			return View(vm);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditProductSubCategory(ProductSubCategoryEditVM vm)
		{
			PrepareProductCategoryDataSource(vm.fk_ProductCategoryId);
			if (!ModelState.IsValid) return View(vm);

			var service = new ProductSubCategoryService(_repoProductSubCategory);
			Result reault = service.EditProductSubCategory(vm.ToDto());

			if (reault.IsFailed)
			{
				ModelState.AddModelError(string.Empty, reault.ErroeMessage);
				return View(vm);
			}
			return RedirectToAction("ProductSubCategoryIndex");

		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteProductSubCategory(int productSubCategoryId)
		{
			var service = new ProductSubCategoryService(_repoProductSubCategory);
			Result result = service.DeleteProductSubCategory(productSubCategoryId);

			if (result.IsSuccess)
			{
				return Json(new { success = true });
			}
			return Json(new { success = false ,message=result.ErroeMessage});
		}

		private void PrepareSalesCategoryDataSource(int? salesCategoryId)
		{
			ViewBag.SalesCategoryId = new SelectList(
				new SalesCategotyDPRepository()
				.GetSalesCategoty()
				.Prepend(new SalesCategoryDto { SalesCategoryId = 0, SalesCategoryName = "請選擇分類" }), "SalesCategoryId", "SalesCategoryName", salesCategoryId);
		}

		private void PrepareProductCategoryDataSource(int? productSubCategoryId)
		{
			ViewBag.ProductCategory = new SelectList(
				new ProductCategoryDPRepository()
				.GetProductCategory()
				.Prepend(new ProductCategoryDto { ProductCategoryId = 0, SalesCategoryName = "請選擇分類" }),
				"ProductCategoryId", "CategoryPath", productSubCategoryId);
		}
	}

}
