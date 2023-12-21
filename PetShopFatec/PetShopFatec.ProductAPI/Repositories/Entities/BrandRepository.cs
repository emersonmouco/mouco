using Microsoft.EntityFrameworkCore;
using PetShopFatec.ProductAPI.Context.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;

namespace PetShopFatec.ProductAPI.Repositories.Entities
{
    public class BrandRepository : IBrandRepository
    {
        // o que que os repositories fazem?
        // Fazem o acesso dos métodos ao banco de dados

        private readonly AppDbContext _dbContext;

        public BrandRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Brand>> GetAll()
        {
            return await _dbContext.Brands.ToListAsync();
        }

        public async Task<IEnumerable<Brand>> GetBrandsProducts()
        {
            return await _dbContext.Brands.Include(b => b.Products).ToListAsync();
        }

        public async Task<Brand> GetById(int id)
        {
            return await _dbContext.Brands.Where(b => b.Id == id).FirstOrDefaultAsync();
        }

        public async Task<Brand> Create(Brand brand)
        {
            _dbContext.Brands.Add(brand);
            await _dbContext.SaveChangesAsync();
            return brand;
        }

        public async Task<Brand> Update(Brand brand)
        {
            _dbContext.Entry(brand).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return brand;
        }

        public async Task<Brand> Delete(int id)
        {
            var brand = await GetById(id);
            _dbContext.Brands.Remove(brand);
            await _dbContext.SaveChangesAsync();
            return brand;
        }
    }
}

