using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using PetShopFatec.Web.Models.Entities;
using PetShopFatec.Web.Services.Interfaces;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PetShopFatec.Web.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private readonly IBrandService _brandService;

        public ProductController(IProductService productService,
            ICategoryService categoryService, IBrandService brandService)
        {
            _productService = productService;
            _categoryService = categoryService;
            _brandService = brandService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductViewModel>>> Index()
        {
            var result = await _productService.GetAllProducts(await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        // criar a view CreateProduct
        [HttpGet]
        public async Task<IActionResult> CreateProduct()
        {
            ViewBag.CategoryId = new SelectList(await _categoryService.GetAllCategories(await GetAccessToken()), "Id", "Name");
            ViewBag.BrandId = new SelectList(await _brandService.GetAllBrands(await GetAccessToken()), "Id", "Name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateProduct(ProductViewModel productViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _productService.CreateProduct(productViewModel, await GetAccessToken());
                if (result != null) return RedirectToAction(nameof(Index));
            }
            else
            {
                ViewBag.CategoryId = new SelectList(await
                                     _categoryService.GetAllCategories(await GetAccessToken()), "Id", "Name");
                ViewBag.BrandId = new SelectList(await
                                     _brandService.GetAllBrands(await GetAccessToken()), "Id", "Name");
            }

            return View(productViewModel);
        }

        // criar view UpdateProduct
        [HttpGet]
        public async Task<IActionResult> UpdateProduct(int id)
        {
            
            ViewBag.CategoryId = new
            SelectList(await _categoryService.GetAllCategories(await GetAccessToken()), "Id", "Name");
            ViewBag.BrandId = new
            SelectList(await _brandService.GetAllBrands(await GetAccessToken()), "Id", "Name");

            var result = await _productService.FindProductById(id, await GetAccessToken());

            if (result is null) return View("Error");

            return View(result);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateProduct(ProductViewModel productViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _productService.UpdateProduct(productViewModel, await GetAccessToken());
                if (result is not null) return RedirectToAction(nameof(Index));
            }
            else
            {
                return BadRequest("Error");
            }

            return View(productViewModel);
        }

        [HttpGet]
        public async Task<ActionResult<ProductViewModel>> DeleteProduct(int id)
        {
            var result = await _productService.FindProductById(id, await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        [HttpPost(), ActionName("DeleteProduct")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var result = await _productService.DeleteProductById(id, await GetAccessToken());
            if (!result) return View("Error");
            return RedirectToAction("Index");
        }

        private async Task<string> GetAccessToken()
        {
            return await HttpContext.GetTokenAsync("access_token");
        }
    }
}

