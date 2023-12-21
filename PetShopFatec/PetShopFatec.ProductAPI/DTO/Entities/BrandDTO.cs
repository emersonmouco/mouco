using System;
using System.ComponentModel.DataAnnotations;
using PetShopFatec.ProductAPI.Model.Entities;

namespace PetShopFatec.ProductAPI.DTO.Entities
{
	public class BrandDTO
	{
        public int Id { get; set; }

        [Required(ErrorMessage = "The Name is required!")]
        [MinLength(3)]
        [MaxLength(100)]
        public string? Name { get; set; }
        public string? Description { get; set; }

        public ICollection<ProductDTO>? ProductsDTO { get; set; }
    }
}

