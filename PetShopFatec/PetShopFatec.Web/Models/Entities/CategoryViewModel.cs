using System;
using System.ComponentModel.DataAnnotations;

namespace PetShopFatec.Web.Models.Entities
{
	public class CategoryViewModel
	{
        public int Id { get; set; }
        [Required]
        public string? Name { get; set; }
    }
}

