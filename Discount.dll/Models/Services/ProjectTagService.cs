using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using Discount.dll.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Services
{
    public class ProjectTagService  
    {
        private IProjectTagRepository _repo;
        public ProjectTagService(IProjectTagRepository repo)
        {
            _repo = repo;
        }
        public IEnumerable<ProjectTagIndexDto> Search(string projectTagName = null, bool getCompleteResult = false)
        {
            return _repo.SearchProjectTags(projectTagName, getCompleteResult);
        }

        /// <summary>
        /// 更新專案狀態
        /// </summary>
        /// <param name="dtos"></param>
        /// <returns></returns>
        public Result Update(List<ProjectTagStatusChangeDto> dtos)
        {
            for (int i = 0; i < dtos.Count; i++)
            {
                _repo.UpdateProjectTag(dtos[i]);
            }
            return Result.Success();
        }

		/// <summary>
		/// 更新專案名稱(單一)
		/// </summary>
		/// <param name="dtos"></param>
		/// <returns></returns>
		public Result Update(ProjectTagEditNameDto dto)
		{
            // 檢查是否有重複名稱
            if (_repo.ExistsTagName(dto.ProjectTagName, dto.ProjectTagId))
            {
                return Result.Fail($"標籤名稱 {dto.ProjectTagName} 已存在， 請更換後再重試一次");
            }

            _repo.UpdateProjectTag(dto);
			
			return Result.Success();
		}

        public (Result result,int id) Create(ProjectTagEditNameDto dto)
        {
            // 檢查是否有重複名稱
            if (_repo.ExistsTagName(dto.ProjectTagName))
            {
                return (Result.Fail($"標籤名稱 {dto.ProjectTagName} 已存在， 請更換後再重試一次"),0);
            }

            int id = _repo.CreateProjectTag(dto);

            return (Result.Success(), id);
        }

        public ProjectTagEditNameDto GetProjectTag(int? id)
        {
            id = id == 0 ? null : id;
            return _repo.GetProjectTag(id);
        }
        public List<ProductInTagDto> GetProducts(int projectTagId, bool excludeNonTaggedProducts = true, bool excludeOutOfStockProducts = false, string subCategoryPath = null, string productName = null)
        {
            return _repo.GetProducts(projectTagId, excludeNonTaggedProducts, excludeOutOfStockProducts, subCategoryPath, productName);
        }

        public Result DeleteTagItems(List<ProjectTagItemDto> dtos)
        {
            for(int i = 0;i < dtos.Count;i++)
            {
                _repo.DeleteProjectTagItem(dtos[i]);
            }
            return Result.Success();
        }

        public Result InsertTagItems(List<ProjectTagItemDto> dtos)
        {
            for (int i = 0; i < dtos.Count; i++)
            {
                if (_repo.IsDuplicateProjectTagItem(dtos[i])) break;
                _repo.InsertProjectTagItem(dtos[i]);
            }

            return Result.Success();
        }

        public class Criteria
        {
            public string ProjectTagId { get; set; }
            public string CategoryName { get; set; }
            public string ProductName { get; set; }
            public bool? excludeNonTaggedProducts { get; set; }
            public bool? excludeOutOfStockProducts { get; set; }
        }
    }
}
