using AutoMapper;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Model.Entities;

namespace PetShopFatec.ProductAPI.DTO.Mappings;

public class MappingProfile : Profile
{
	public MappingProfile()
	{
        CreateMap<Brand, BrandDTO>().ReverseMap();
        
        CreateMap<Category, CategoryDTO>().ReverseMap();

        CreateMap<Product, ProductDTO>().ReverseMap();

    }
}

