using AutoMapper;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;
using PetShopFatec.ProductAPI.Services.Interfaces;

namespace PetShopFatec.ProductAPI.Services.Entities
{
	public class CategoryService : ICategoryService
	{
        private readonly ICategoryRepository _categoryRepository;
        private readonly IMapper _mapper;

        public CategoryService(ICategoryRepository categoryRepository,
            IMapper mapper)
        {
            _categoryRepository = categoryRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<CategoryDTO>> GetAll()
        {
            var categories = await _categoryRepository.GetAll();
            return _mapper.Map<IEnumerable<CategoryDTO>>(categories);
        }

        public async Task<IEnumerable<CategoryDTO>> GetCategoriesProducts()
        {
            var categories = await _categoryRepository.GetCategoriesProducts();
            return _mapper.Map<IEnumerable<CategoryDTO>>(categories);
        }

        public async Task<CategoryDTO> GetById(int id)
        {
            var category = await _categoryRepository.GetById(id);
            return _mapper.Map<CategoryDTO>(category);
        }

        public async Task Create(CategoryDTO categoryDTO)
        {
            var category = _mapper.Map<Category>(categoryDTO);
            await _categoryRepository.Create(category);
            categoryDTO.Id = category.Id;
        }

        public async Task Update(CategoryDTO categoryDTO)
        {
            var category = _mapper.Map<Category>(categoryDTO);
            await _categoryRepository.Update(category);
        }

        public async Task Remove(int id)
        {
            await _categoryRepository.Delete(id);
        }
    }
}

