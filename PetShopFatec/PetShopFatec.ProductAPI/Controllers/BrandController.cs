using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Services.Interfaces;

namespace PetShopFatec.ProductAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BrandController : Controller
    {
        private readonly IBrandService _brandService;

        public BrandController(IBrandService brandService)
        {
            _brandService = brandService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BrandDTO>>> Get()
        {
            var brandsDTO = await _brandService.GetAll();
            if (brandsDTO is null) return NotFound("Brands not found!");
            return Ok(brandsDTO);
        }

        [HttpGet("brands")]
        public async Task<ActionResult<IEnumerable<BrandDTO>>> GetBrandProducts()
        {
            var brandDTO = await _brandService.GetBrandProducts();
            if (brandDTO is null) return NotFound("Brands not found!");
            return Ok(brandDTO);
        }

        [HttpGet("{id:int}", Name = "GetBrand")]
        public async Task<ActionResult<BrandDTO>> Get(int id)
        {
            var brandDTO = await _brandService.GetById(id);
            if (brandDTO == null) return NotFound("Brand not found!");
            return Ok(brandDTO);
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] BrandDTO brandDTO)
        {
            if (brandDTO is null) return BadRequest("Invalid data!");
            await _brandService.Create(brandDTO);
            return new CreatedAtRouteResult("GetBrand", new { id = brandDTO.Id }, brandDTO);
        }

        [HttpPut]
        public async Task<ActionResult> Put([FromBody] BrandDTO brandDTO)
        {
            if (brandDTO is null) return BadRequest("Data invalid");
            await _brandService.Update(brandDTO);
            return Ok(brandDTO);
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<BrandDTO>> Delete(int id)
        {
            var brandDTO = await _brandService.GetById(id);
            if (brandDTO is null) return NotFound("Brand not found!");
            await _brandService.Remove(id);
            return Ok(brandDTO);
        }
    }
}

