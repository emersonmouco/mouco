using Microsoft.EntityFrameworkCore;
using PetShopFatec.ProductAPI.Context.Entities;
using PetShopFatec.ProductAPI.Repositories.Entities;
using PetShopFatec.ProductAPI.Repositories.Interfaces;
using PetShopFatec.ProductAPI.Services.Entities;
using PetShopFatec.ProductAPI.Services.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// pegando a string de conexão
var mySqlConnection = builder
    .Configuration.GetConnectionString("DefaultConnection");

// usar para que o Entity Framework
// crie nossas tabelas no banco de dados
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(mySqlConnection,
    ServerVersion.AutoDetect(mySqlConnection))
);

builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

// adicionando a injeção de dependencia
builder.Services.AddScoped<IBrandRepository, BrandRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();

builder.Services.AddScoped<IBrandService, BrandService>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IProductService, ProductService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

