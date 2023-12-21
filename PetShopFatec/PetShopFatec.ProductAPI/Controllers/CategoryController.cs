using Microsoft.AspNetCore.Mvc;
using PetShopFatec.ProductAPI.DTO.Entities;
using PetShopFatec.ProductAPI.Services.Interfaces;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PetShopFatec.ProductAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class CategoryController : Controller
{
    private readonly ICategoryService _categoryService;

    public CategoryController(ICategoryService categoryService)
    {
        _categoryService = categoryService;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<CategoryDTO>>> Get()
    {
        var categoriesDTO = await _categoryService.GetAll();
        if (categoriesDTO is null) return NotFound("Categories not found!");
        return Ok(categoriesDTO);
    }

    [HttpGet("categories")]
    public async Task<ActionResult<IEnumerable<CategoryDTO>>> GetCategoryProducts()
    {
        var categoriesDTO = await _categoryService.GetCategoriesProducts();
        if (categoriesDTO is null) return NotFound("Categories not found!");
        return Ok(categoriesDTO);
    }

    [HttpGet("{id:int}", Name = "GetCategory")]
    public async Task<ActionResult<CategoryDTO>> Get(int id)
    {
        var categoriesDTO = await _categoryService.GetById(id);
        if (categoriesDTO is null) return NotFound("Category not found!");
        return Ok(categoriesDTO);
    }

    [HttpPost]
    public async Task<ActionResult> Post([FromBody] CategoryDTO categoryDTO)
    {
        if (categoryDTO is null) return BadRequest("Invalid data!");
        await _categoryService.Create(categoryDTO);
        return new CreatedAtRouteResult("GetCategory", new { id = categoryDTO.Id }, categoryDTO);
    }

    [HttpPut]
    public async Task<ActionResult> Put([FromBody] CategoryDTO categoryDTO)
    {
        if (categoryDTO is null) return BadRequest("Data invalid");
        await _categoryService.Update(categoryDTO);
        return Ok(categoryDTO);
    }

    [HttpDelete("{id}")]
    public async Task<ActionResult<CategoryDTO>> Delete(int id)
    {
        var categoryDTO = await _categoryService.GetById(id);
        if (categoryDTO is null) return NotFound("Brand not found!");
        await _categoryService.Remove(id);
        return Ok(categoryDTO);
    }

}

