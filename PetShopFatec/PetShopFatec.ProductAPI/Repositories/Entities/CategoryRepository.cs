using Microsoft.EntityFrameworkCore;
using PetShopFatec.ProductAPI.Context.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;

namespace PetShopFatec.ProductAPI.Repositories.Entities
{
	public class CategoryRepository : ICategoryRepository
	{
        private readonly AppDbContext _dbContext;

        public CategoryRepository(AppDbContext dbContext)
		{
            _dbContext = dbContext;
		}

        public async Task<IEnumerable<Category>> GetAll()
        {
            return await _dbContext.Categories.ToListAsync();
        }

        public async Task<IEnumerable<Category>> GetCategoriesProducts()
        {
            return await _dbContext.Categories.Include(c => c.Products).ToListAsync();
        }

        public async Task<Category> GetById(int id)
        {
            return await _dbContext.Categories.Where(c => c.Id == id).FirstOrDefaultAsync();
        }


        public async Task<Category> Create(Category category)
        {
            _dbContext.Categories.Add(category);
            await _dbContext.SaveChangesAsync();
            return category;
        }

        public async Task<Category> Update(Category category)
        {
            _dbContext.Entry(category).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return category;
        }

        public async Task<Category> Delete(int id)
        {
            var category = await GetById(id);
            _dbContext.Categories.Remove(category);
            await _dbContext.SaveChangesAsync();
            return category;
        }

    }
}

