using Discount.dll.Models.Dtos;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Interfaces
{
    public interface IProjectTagRepository
    {
        IEnumerable<ProjectTagIndexDto> SearchProjectTags(string projectTagName = null,bool getCompleteResult = false);
        void UpdateProjectTag(ProjectTagStatusChangeDto dto);
        void UpdateProjectTag(ProjectTagEditNameDto dto);
        int CreateProjectTag(ProjectTagEditNameDto dto);
        ProjectTagEditNameDto GetProjectTag(int? id);
        bool ExistsTagName(string tagName);
        bool ExistsTagName(string tagName,int excludeId);
        List<ProductInTagDto> GetProducts(int projectTagId, bool excludeNonTaggedProducts = true, bool excludeOutOfStockProducts = false, string subCategoryPath = null, string productName = null);
        bool IsDuplicateProjectTagItem(ProjectTagItemDto dto);
        void DeleteProjectTagItem(ProjectTagItemDto dto);
        void InsertProjectTagItem(ProjectTagItemDto dto);
    }
}
