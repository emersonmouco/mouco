using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace PetShopFatec.ProductAPI.DTO.Entities;
public class ProductDTO
{
    public int Id { get; set; }

    [Required(ErrorMessage = "The Name is required!")]
    [MinLength(3)]
    [MaxLength(100)]
    public string? Name { get; set; }

    [Required(ErrorMessage = "The Cost Price is required!")]
    public decimal CostPrice { get; set; }

    [Required(ErrorMessage = "The Sale Price is required!")]
    public decimal SalePrice { get; set; }
    public string? Description { get; set; }
    public string? ImageURL { get; set; }

    [JsonIgnore]
    public BrandDTO? BrandDTO { get; set; }
    public int BrandId { get; set; }

    [JsonIgnore]
    public CategoryDTO? CategoryDTO { get; set; }
    public int CategoryId { get; set; }
}

