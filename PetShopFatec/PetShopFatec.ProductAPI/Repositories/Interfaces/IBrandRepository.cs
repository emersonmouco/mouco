using PetShopFatec.ProductAPI.Model.Entities;

namespace PetShopFatec.ProductAPI.Repositories.Interfaces;

public interface IBrandRepository
{
    Task<IEnumerable<Brand>> GetAll();
    Task<IEnumerable<Brand>> GetBrandsProducts();
    Task<Brand> GetById(int id);
    Task<Brand> Create(Brand brand);
    Task<Brand> Update(Brand brand);
    Task<Brand> Delete(int id);
}

