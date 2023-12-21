using System;
using AutoMapper;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;
using PetShopFatec.ProductAPI.Services.Interfaces;

namespace PetShopFatec.ProductAPI.Services.Entities
{
	public class ProductService : IProductService
	{
        private readonly IProductRepository _productRepository;
        private readonly IMapper _mapper;

        public ProductService(IProductRepository productRepository,
            IMapper mapper)
        {
            _productRepository = productRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<ProductDTO>> GetAll()
        {
            var products = await _productRepository.GetAll();
            return _mapper.Map<IEnumerable<ProductDTO>>(products);
        }

        public async Task<ProductDTO> GetById(int id)
        {
            
            var product = await _productRepository.GetById(id);
            return _mapper.Map<ProductDTO>(product);
        }

        public async Task Create(ProductDTO productDTO)
        {
            var product = _mapper.Map<Product>(productDTO);
            await _productRepository.Create(product);
            productDTO.Id = product.Id;
        }

        public async Task Update(ProductDTO productDTO)
        {
            var product = _mapper.Map<Product>(productDTO);
            await _productRepository.Update(product);
        }

        public async Task Remove(int id)
        {
            await _productRepository.Delete(id);
        }
    }
}

