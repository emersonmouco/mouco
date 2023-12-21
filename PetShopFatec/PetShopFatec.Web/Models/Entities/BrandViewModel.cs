using System.ComponentModel.DataAnnotations;

namespace PetShopFatec.Web.Models.Entities
{
	public class BrandViewModel
	{
        public int Id { get; set; }
        [Required]
        public string? Name { get; set; }
        public string? Description { get; set; }
    }
}

