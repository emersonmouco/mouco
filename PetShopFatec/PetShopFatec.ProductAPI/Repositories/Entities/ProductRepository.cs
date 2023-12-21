using System;
using Microsoft.EntityFrameworkCore;
using PetShopFatec.ProductAPI.Context.Entities;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;

namespace PetShopFatec.ProductAPI.Repositories.Entities
{
    public class ProductRepository : IProductRepository
    {

        private readonly AppDbContext _dbContext;

        public ProductRepository(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Product>> GetAll()
        {
            return await _dbContext.Products.ToListAsync();
        }

        public async Task<Product> GetById(int id)
        {

            return await _dbContext.Products
                .Include(c => c.Category)
                .Include(b => b.Brand)
                .Where(p => p.Id == id).FirstOrDefaultAsync();
           
        }

        public async Task<Product> Create(Product product)
        {
            _dbContext.Products.Add(product);
            await _dbContext.SaveChangesAsync();
            return product;
        }

        public async Task<Product> Update(Product product)
        {
            _dbContext.Entry(product).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return product;
        }

        public async Task<Product> Delete(int id)
        {
            var product = await GetById(id);
            _dbContext.Products.Remove(product);
            await _dbContext.SaveChangesAsync();
            return product;
        }
    }
}
