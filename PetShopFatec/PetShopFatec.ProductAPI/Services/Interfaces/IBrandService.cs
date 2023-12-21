using System;
using PetShopFatec.ProductAPI.DTO.Entities;

namespace PetShopFatec.ProductAPI.Services.Interfaces
{
	public interface IBrandService
	{
        Task<IEnumerable<BrandDTO>> GetAll();
        Task<BrandDTO> GetById(int id);
        Task<IEnumerable<BrandDTO>> GetBrandProducts();
        Task Create(BrandDTO brandDTO);
        Task Update(BrandDTO brandDTO);
        Task Remove(int id);
    }
}

