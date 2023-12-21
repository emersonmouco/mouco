namespace PetShopFatec.ProductAPI.Model.Entities;

public class Product
{
	public int Id { get; set; }
	public string? Name { get; set; }
	public decimal CostPrice { get; set; }
	public decimal SalePrice { get; set; }
	public string? Description { get; set; }
	public string? ImageURL { get; set; }

	public Brand? Brand { get; set; }
	public int BrandId { get; set; }
	public Category? Category { get; set; }
	public int CategoryId { get; set; }
}

