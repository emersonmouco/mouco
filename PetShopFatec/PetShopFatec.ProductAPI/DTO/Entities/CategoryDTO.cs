using System.ComponentModel.DataAnnotations;

namespace PetShopFatec.ProductAPI.DTO.Entities
{
	public class CategoryDTO
	{
        public int Id { get; set; }

        [Required(ErrorMessage = "The Name is required!")]
        [MinLength(3)]
        [MaxLength(100)]
        public string? Name { get; set; }

        public ICollection<ProductDTO>? ProductsDTO { get; set; }
    }
}

