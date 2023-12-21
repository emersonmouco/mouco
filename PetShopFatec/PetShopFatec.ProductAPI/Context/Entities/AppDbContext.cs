using Microsoft.EntityFrameworkCore;
using PetShopFatec.ProductAPI.Model.Entities;
using PetShopFatec.ProductAPI.Repositories.Entities;

namespace PetShopFatec.ProductAPI.Context.Entities;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {

    }

    // fazemos o mapeamento do objeto relacional do nosso BD
    public DbSet<Brand> Brands { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<Product> Products { get; set; }

    // usamos a fluent API e nao Data Annotations
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Brand>().HasKey(b => b.Id);
        modelBuilder.Entity<Brand>().Property(b => b.Name).HasMaxLength(100).IsRequired();
        modelBuilder.Entity<Brand>().Property(b => b.Description).HasMaxLength(200);

        modelBuilder.Entity<Category>().HasKey(c => c.Id);
        modelBuilder.Entity<Category>().Property(c => c.Name).HasMaxLength(100).IsRequired();

        modelBuilder.Entity<Product>().HasKey(p => p.Id);
        modelBuilder.Entity<Product>().Property(p => p.Name).HasMaxLength(100).IsRequired();
        modelBuilder.Entity<Product>().Property(p => p.CostPrice).HasPrecision(8, 2);
        modelBuilder.Entity<Product>().Property(p => p.SalePrice).HasPrecision(8, 2);
        modelBuilder.Entity<Product>().Property(p => p.Description).HasMaxLength(200);
        modelBuilder.Entity<Product>().Property(p => p.ImageURL).HasMaxLength(255);

       

        // relacionamento
        modelBuilder.Entity<Brand>()
            .HasMany(b => b.Products).WithOne(p => p.Brand)
            .IsRequired().OnDelete(DeleteBehavior.Cascade);

        modelBuilder.Entity<Category>()
            .HasMany(c => c.Products).WithOne(p => p.Category)
            .IsRequired().OnDelete(DeleteBehavior.Cascade);


        // Populando o BD com as primeiras marcas
        modelBuilder.Entity<Brand>().HasData(
            new Brand
            {
                Id = 1,
                Name = "Fatec Dog",
                Description = "Fatec Dog Description"
            },
            new Brand
            {
                Id = 2,
                Name = "Fatec Cat",
                Description = "Fatec Cat Description"
            });

        modelBuilder.Entity<Category>().HasData(
            new Category
            {
                Id = 1,
                Name = "Dog Food"
            },
            new Category
            {
                Id = 2,
                Name = "Cat Food"
            });

        modelBuilder.Entity<Product>().HasData(
           new Product
           {
               Id = 1,
               Name = "Pedigree",
               CostPrice = 10.00m,
               SalePrice = 15.00m,
               Description = "Dog food",
               ImageURL = "teste",
               BrandId = 1,
               CategoryId = 1
           });

        modelBuilder.Entity<Product>().HasData(
           new Product
           {
               Id = 2,
               Name = "Golden",
               CostPrice = 12.00m,
               SalePrice = 17.00m,
               Description = "Cat food",
               ImageURL = "teste",
               BrandId = 2,
               CategoryId = 2
           });
    }
}

