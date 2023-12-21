using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using PetShopFatec.Web.Models.Entities;
using PetShopFatec.Web.Services.Interfaces;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PetShopFatec.Web.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CategoryViewModel>>> Index()
        {
            var result = await _categoryService.GetAllCategories(await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        // criar a view CreateCategory
        [HttpGet]
        public async Task<IActionResult> CreateCategory()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateCategory(CategoryViewModel categoryViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _categoryService.CreateCategory(categoryViewModel, await GetAccessToken());
                if (result is not null) return RedirectToAction(nameof(Index));
            }
            else
                return BadRequest("Error");

            return View(categoryViewModel);
        }

        // criar view UpdateCategory
        [HttpGet]
        public async Task<IActionResult> UpdateCategory(int id)
        {
            var result = await _categoryService.FindCategoryById(id, await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateCategory(CategoryViewModel categoryViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _categoryService.UpdateCategory(categoryViewModel, await GetAccessToken());
                if (result is not null) return RedirectToAction(nameof(Index));
            }

            return View(categoryViewModel);
        }

        // criar a view Delete
        public async Task<ActionResult> DeleteCategory(int id)
        {
            var result = await _categoryService.FindCategoryById(id, await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        [HttpPost(), ActionName("DeleteCategory")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var result = await _categoryService.DeleteCategoryById(id, await GetAccessToken());
            if (!result) return View("Error");
            return RedirectToAction("Index");
        }

        private async Task<string> GetAccessToken()
        {
            return await HttpContext.GetTokenAsync("access_token");
        }
    }
}

