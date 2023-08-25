using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.Exts;
using Customized_Shoes.dll.Models.Infra.EFRepository;
using Customized_Shoes.dll.Models.Interface;
using Customized_Shoes.dll.Models.Service;
using Customized_Shoes.dll.Models.ViewModels;
using EFModels.EFModels;
using Flex.Products.dll.Infra.EFRepository;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.ViewModel;
using Flex.Products.dll.Service;

namespace flexbackend.site.Controllers
{
    public class CustomizedShoesPoesController : Controller
    {
        private AppDbContext db = new AppDbContext();
        private IShoesRepository _repo = new CustomizedShoesEFRepository();

        // GET: CustomizedShoesPoes
        public ActionResult Index(ShoesSearchCriteria criteria)
        {
            criteria = criteria ?? new ShoesSearchCriteria();
			PrepareShoesCategoryDataSource(criteria.ShoesCategoryId);

			ViewBag.Criteria = criteria;
            ViewBag.StatusOption = new SelectList(criteria.StatusOption);
            

            var service = new CustomizedShoesService(_repo);
            var shoesproducts = service.IndexshoesPo(criteria).Select(p => p.ToIndexVM());

            if (Request.IsAjaxRequest()) 
            { 
                return Json(shoesproducts);
            }
            return View(shoesproducts);
        }

        [HttpPost]
        public ActionResult EditShoesStatus(List<CustomizedShoesIdAndStatusVM> vm) 
        {
            if (vm != null)
            {
                var dtos = new List<CustomizedShoesDto>();
                foreach (var shoesproduct in vm) 
                {
                    dtos.Add(shoesproduct.ToSaveShoesStatusDto());
                }
                var service = new CustomizedShoesService(_repo);
                var shoesproducts = service.EditShoesStatus(dtos);
                if (shoesproducts.IsSucces)
                {
                    var updatedProducts = service.IndexshoesPo(new ShoesSearchCriteria()).Select(p => p.ToIndexVM());

                    return Json(new { success = true });
                }
            }
            return Json(new { success = false });
        }

		// GET: CustomizedShoesPoes/Details/5
		public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomizedShoesPo customizedShoesPo = db.CustomizedShoesPoes.Find(id);
            if (customizedShoesPo == null)
            {
                return HttpNotFound();
            }
            return View(customizedShoesPo);
        }

        // GET: CustomizedShoesPoes/Create
        public ActionResult Create()
        {
            PrepareShoesCategoryDataSource(null);
            PrepareShoesColorDataSource(null);
            
            var vm = new CustomizedShoesCreateVM();
            return View(vm);
        }

        // POST: CustomizedShoesPoes/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CustomizedShoesCreateVM vm)
        {
            PrepareShoesCategoryDataSource(null);
            PrepareShoesColorDataSource(null);
            if(ModelState.IsValid ==  false) return View(vm);

			#region 照片上傳
			var files = Request.Files;
			if (files == null || files.Count == 0)
			{
				ModelState.AddModelError("ImgPaths", "請選擇檔案");
				return View(vm);
			}

			// 設定照片路徑不存在就新增一個
			string path = Server.MapPath("~/Public/Img");
			if (!Directory.Exists(path)) Directory.CreateDirectory(path);

			// 將CreateFile存檔，並取得最後存檔的名稱，副檔名可能不合規格，所以在做一次偵錯
			List<string> saveFileName = SaveFileName(path, files);
			if (saveFileName == null || saveFileName.Count == 0)
			{
				ModelState.AddModelError("ImgPaths", "請選擇檔案");
				return View(vm);
			}

			// 將雜湊後的檔名newFileName加到VM的ImgPaths
			foreach (var fileName in saveFileName)
			{
				vm.ImgPaths.Add(fileName);
			}
            #endregion

            var service = new CustomizedShoesService(_repo);
            var result = service.CreateShoes(vm.ToCreateDto());
            if (result.IsSucces)
            {
                return RedirectToAction("Index");
            }
            else 
            {
                if (result.ErroeMessage.Contains("編碼"))
                {
                    ModelState.AddModelError("ShoesName", result.ErroeMessage);
                }
                return View(vm);
            }
		}

		// GET: CustomizedShoesPoes/Edit/5
		public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var service = new CustomizedShoesService(_repo);
            var shoesproduct = service.GetById((int)id).ToEditVM();

            if (shoesproduct == null) return HttpNotFound();

            PrepareShoesCategoryDataSource(null);
            PrepareShoesColorDataSource(null);

            return View(shoesproduct);
        }

        // POST: CustomizedShoesPoes/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CustomizedShoesEditVM vm)
        {
            PrepareShoesCategoryDataSource(null);
            PrepareShoesColorDataSource(null);
            if(!ModelState.IsValid) return View(vm);

            var service = new CustomizedShoesService(_repo);
            var result = service.EditShoes(vm.VMToEditDto());
            if (result.IsSucces)
            {
                return RedirectToAction("Index");
            }
            else
            { 
                return View(vm);
            }
        }

        public ActionResult EditImg(int? id)
        {
			if (id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			var service = new CustomizedShoesService(_repo);
			var product = service.GetImgById((int)id);

			return View(product.ToEditImgVM((int)id));
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditImg(ShoesEditImgVM vm, List<string> createImgName, List<HttpPostedFileBase> createfile)
		{
			if (vm == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			var service = new CustomizedShoesService(_repo);

			var path = Server.MapPath("~/Public/Img");
			List<ShoesImgDto> editImg = EditShoesImg(path, createImgName, createfile, vm.ShoesProductId);

			if (vm.ShoesPictureUrl == null && createImgName == null)
			{
				var errorVm = service.GetImgById(vm.ShoesProductId);

				ModelState.AddModelError(string.Empty, "至少要有一張照片");

				return View(errorVm.ToEditImgVM(vm.ShoesProductId));
			}

			if (editImg != null && editImg.Count > 0)
			{
				foreach (var img in editImg)
				{
					vm.ShoesPictureUrl.Add(img);
				}
			}

			var product = service.SaveEditImg(vm.VMToEditImgDto());

			if (product.IsSucces)
			{
				return RedirectToAction("Index");
			}
			return View(vm);
		}

		// GET: CustomizedShoesPoes/Delete/5
		public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomizedShoesPo customizedShoesPo = db.CustomizedShoesPoes.Find(id);
            if (customizedShoesPo == null)
            {
                return HttpNotFound();
            }
            return View(customizedShoesPo);
        }

        // POST: CustomizedShoesPoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CustomizedShoesPo customizedShoesPo = db.CustomizedShoesPoes.Find(id);
            db.CustomizedShoesPoes.Remove(customizedShoesPo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

		private void PrepareShoesCategoryDataSource(int? ShoesCategoryId)
		{
            ViewBag.ShoesCategoryId = new SelectList(
                new ShoesCategoryRepository()
                .GetShoesCategory()
                .Prepend(new ShoesCategoryDto { ShoesCategoryId = 0, ShoesCategoryName = "功能分類" }), "ShoesCategoryId", "ShoesCategoryName", ShoesCategoryId);
		}

		private void PrepareShoesColorDataSource(int? ColorId)
		{
			ViewBag.ShoesColor = new SelectList(
				new ShoesColorRepository()
				.GetShoesColorCategory()
				.Prepend(new ShoesColorCategoryDto { ShoesColorId = 0, ColorName = "顏色",ColorCode = "顏色編碼" }), "ShoesColorId", "ColorName", "ColorCode", ColorId);
		}

		/// <summary>
		/// 上傳多張照片
		/// </summary>
		/// <param name="path">照片存放路徑</param>
		/// <param name="files">照片</param>
		/// <returns></returns>
		private List<string> SaveFileName(string path, HttpFileCollectionBase files)
		{
			//沒上傳或是空值，就不處理;
			if (files == null || files.Count == 0) return new List<string>();

			List<string> result = new List<string>();

			//允許的副檔名
			var allowExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".tif" };
			for (int i = 0; i < files.Count; i++)
			{
				var file = files[i];

				if (file == null || file.ContentLength == 0 || file.ContentLength > 2 * 1024 * 1024) continue;

				//取得副檔名
				string ext = System.IO.Path.GetExtension(file.FileName);

				//檢查副檔名是否在允許範圍，不允許就不處理
				if (!allowExts.Contains(ext.ToLower())) continue;

				//生成一個新的檔名
				string newFileName = $"{Guid.NewGuid().ToString("N")}{ext}";

				//儲存檔案
				file.SaveAs(System.IO.Path.Combine(path, newFileName));

				//將檔案名稱加入結果清單
				result.Add(newFileName);
			}
			return result;
		}

		/// <summary>
		/// 相片編輯
		/// </summary>
		/// <param name="path">存放路徑</param>
		/// <param name="createImgName">預覽回傳照片名稱</param>
		/// <param name="createfile">file回傳檔案</param>
		/// <param name="productId">產品Id</param>
		/// <returns></returns>
		private List<ShoesImgDto> EditShoesImg(string path, List<string> createImgName, List<HttpPostedFileBase> createfile, int ShoesId)
		{
			if (createImgName == null || createImgName.Count <= 0) return new List<ShoesImgDto>();

			var allowExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".tif" };
			var result = new List<ShoesImgDto>();

			for (var i = 0; i < createfile.Count; i++)
			{
				var file = createfile[i];
				var fileName = file.FileName;
				if (file == null || file.ContentLength == 0 || file.ContentLength > 2 * 1024 * 1024) continue;
				if (createImgName.Any(imgName => imgName == fileName))
				{
					var ext = System.IO.Path.GetExtension(fileName);

					if (!allowExts.Contains(ext.ToLower())) continue;

					var newFileName = $"{Guid.NewGuid().ToString("N")}{ext}";

					file.SaveAs(System.IO.Path.Combine(path, newFileName));
					result.Add(new ShoesImgDto
					{
						fk_ShoesProductId = ShoesId,
						ShoesPictureUrl = newFileName,
					});
				}
				else
				{
					continue;
				}
			}

			return result;
		}
	}
}
