using Microsoft.AspNetCore.Mvc;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Services.Interfaces;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PetShopFatec.ProductAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class ProductController : Controller
{

    private readonly IProductService _productService;

    public ProductController(IProductService productService)
    {
        _productService = productService;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProductDTO>>> Get()
    {
        var productsDTO = await _productService.GetAll();
        if (productsDTO is null) return NotFound("Products not found!");
        return Ok(productsDTO);
    }

    [HttpGet("{id}", Name = "GetProduct")]
    public async Task<ActionResult<ProductDTO>> Get(int id)
    {
        var productDTO = await _productService.GetById(id);
        if (productDTO == null) return NotFound("Product not found!");
        return Ok(productDTO);
    }

    [HttpPost]
    public async Task<ActionResult> Post([FromBody] ProductDTO productDTO)
    {
        if (productDTO is null) return BadRequest("Invalid data");
        await _productService.Create(productDTO);
        return new CreatedAtRouteResult("GetProduct", new { id = productDTO.Id }, productDTO);
    }

    [HttpPut()]
    public async Task<ActionResult> Put([FromBody] ProductDTO productDTO)
    {
        if (productDTO is null) return BadRequest("Invalid data");
        await _productService.Update(productDTO);
        return Ok(productDTO);
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<ProductDTO>> Delete(int id)
    {
        var productDTO = await _productService.GetById(id);
        await _productService.Remove(id);
        return Ok(productDTO);
    }
}

