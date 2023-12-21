using System;
using PetShopFatec.ProductAPI.DTO.Entities;

namespace PetShopFatec.ProductAPI.Services.Interfaces
{
	public interface IProductService
	{
        Task<IEnumerable<ProductDTO>> GetAll();
        Task<ProductDTO> GetById(int id);
        Task Create(ProductDTO productDTO);
        Task Update(ProductDTO productDTO);
        Task Remove(int id);
    }
}

