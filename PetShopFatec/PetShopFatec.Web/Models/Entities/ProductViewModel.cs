using System;
using System.ComponentModel.DataAnnotations;

namespace PetShopFatec.Web.Models.Entities
{
	public class ProductViewModel
	{
        public int Id { get; set; }

        [Required]
        public string? Name { get; set; }

        [DisplayFormat(DataFormatString = "{0:C}")]
        [Required]
        public decimal CostPrice { get; set; }

        [DisplayFormat(DataFormatString = "{0:C}")]
        [Required]
        public decimal SalePrice { get; set; }
        public string? Description { get; set; }
        public string? ImageURL { get; set; }

        [Required]
        [Display(Name = "Brand")]
        public int BrandId { get; set; }
        [Display(Name = "Brand")]
        public string? BrandName { get; set; }

        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        [Display(Name = "Category")]
        public string? CategoryName { get; set; }
    }
}

