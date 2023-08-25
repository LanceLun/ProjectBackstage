using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Upload.Exts.Image
{
	public static class UploadImage
	{
		#region 呼叫使用範例
		//var files = Request.Files;
		//if (files == null || files.Count == 0)
		//         {
		//	ModelState.AddModelError("ImgPaths", "請選擇檔案");
		//	return View(vm);
		//}

		//// 設定照片路徑不存在就新增一個
		//string path = Server.MapPath("~/Public/Img");
		//         if(!Directory.Exists(path)) Directory.CreateDirectory(path);

		//// 將CreateFile存檔，並取得最後存檔的名稱，副檔名可能不合規格，所以在做一次偵錯
		//List<string> saveFileName = SaveFileName(path, files);
		//if (saveFileName == null || saveFileName.Count == 0)
		//{
		//	ModelState.AddModelError("ImgPaths", "請選擇檔案");
		//	return View(vm);
		//}

		//// 將雜湊後的檔名newFileName加到VM的ImgPaths
		//foreach (var fileName in saveFileName)
		//{
		//	vm.ImgPaths.Add(fileName);
		//}
		#endregion

		/// <summary>
		/// 上傳多張照片
		/// </summary>
		/// <param name="path">照片存放路徑</param>
		/// <param name="files">照片</param>
		/// <returns></returns>
		public static List<string> SaveFileName(this string path, HttpFileCollectionBase files)
		{
			//沒上傳或是空值，就不處理;
			if (files == null || files.Count == 0) return new List<string>();

			List<string> result = new List<string>();

			//允許的副檔名
			var allowExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".tif" };
			for (int i = 0; i < files.Count; i++)
			{
				var file = files[i];

				if (file == null || file.ContentLength == 0) continue;

				//取得副檔名
				string ext = Path.GetExtension(file.FileName);

				//檢查副檔名是否在允許範圍，不允許就不處理
				if (!allowExts.Contains(ext.ToLower())) continue;

				//生成一個新的檔名
				string newFileName = Guid.NewGuid().ToString("N") + ext;

				//儲存檔案
				file.SaveAs(Path.Combine(path, newFileName));

				//將檔案名稱加入結果清單
				result.Add(newFileName);
			}
			return result;
		}


	}
}
