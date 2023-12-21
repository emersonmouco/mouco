using System;
using PetShopFatec.Web.Models.Entities;

namespace PetShopFatec.Web.Services.Interfaces
{
	public interface IBrandService
	{
        Task<IEnumerable<BrandViewModel>> GetAllBrands(string token);
        Task<BrandViewModel> FindBrandById(int id, string token);
        Task<BrandViewModel> CreateBrand(BrandViewModel brandViewModel, string token);
        Task<BrandViewModel> UpdateBrand(BrandViewModel brandViewModel, string token);
        Task<bool> DeleteBrandById(int id, string token);
    }
}

