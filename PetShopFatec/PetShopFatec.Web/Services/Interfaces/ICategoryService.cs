using PetShopFatec.Web.Models.Entities;

namespace PetShopFatec.Web.Services.Interfaces
{
	public interface ICategoryService
	{
        Task<IEnumerable<CategoryViewModel>> GetAllCategories(string token);
        Task<CategoryViewModel> FindCategoryById(int id, string token);
        Task<CategoryViewModel> CreateCategory(CategoryViewModel categoryViewModel, string token);
        Task<CategoryViewModel> UpdateCategory(CategoryViewModel categoryViewModel, string token);
        Task<bool> DeleteCategoryById(int id, string token);
    }
}

