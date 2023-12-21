using System;
using PetShopFatec.ProductAPI.DTO.Entities;

namespace PetShopFatec.ProductAPI.Services.Interfaces
{
	public interface ICategoryService
	{
        Task<IEnumerable<CategoryDTO>> GetAll();
        Task<CategoryDTO> GetById(int id);
        Task<IEnumerable<CategoryDTO>> GetCategoriesProducts();
        Task Create(CategoryDTO categoryDTO);
        Task Update(CategoryDTO categoryDTO);
        Task Remove(int id);
    }
}

