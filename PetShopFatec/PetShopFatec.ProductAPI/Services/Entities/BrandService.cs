using System;
using AutoMapper;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;
using PetShopFatec.ProductAPI.Services.Interfaces;

namespace PetShopFatec.ProductAPI.Services.Entities
{
	public class BrandService : IBrandService
	{
        // O que os services fazem?
        // eles fazem as chamadas dos métodos
        // que realizarão as operações
        // no banco de dados, ou seja, os repositories

        private readonly IBrandRepository _brandRepository;
        private readonly IMapper _mapper;

        public BrandService(IBrandRepository brandRepository,
            IMapper mapper)
        {
            _brandRepository = brandRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<BrandDTO>> GetAll()
        {
            var brands = await _brandRepository.GetAll();
            return _mapper.Map<IEnumerable<BrandDTO>>(brands);
        }

        public async Task<IEnumerable<BrandDTO>> GetBrandProducts()
        {
            var brands = await _brandRepository.GetBrandsProducts();
            return _mapper.Map<IEnumerable<BrandDTO>>(brands);
        }

        public async Task<BrandDTO> GetById(int id)
        {
            var brand = await _brandRepository.GetById(id);
            return _mapper.Map<BrandDTO>(brand);
        }

        public async Task Create(BrandDTO brandDTO)
        {
            var brand = _mapper.Map<Brand>(brandDTO);
            await _brandRepository.Create(brand);
            brandDTO.Id = brand.Id;
        }

        public async Task Update(BrandDTO brandDTO)
        {
            var brand = _mapper.Map<Brand>(brandDTO);
            await _brandRepository.Update(brand);
        }

        public async Task Remove(int id)
        {
            await _brandRepository.Delete(id);
        }
    }
}

