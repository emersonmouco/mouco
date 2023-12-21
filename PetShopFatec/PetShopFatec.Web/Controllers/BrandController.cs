using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using PetShopFatec.Web.Models.Entities;
using PetShopFatec.Web.Services.Interfaces;

namespace PetShopFatec.Web.Controllers
{
    public class BrandController : Controller
    {
        private readonly IBrandService _brandService;

        public BrandController(IBrandService brandService)
        {
            _brandService = brandService;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BrandViewModel>>> Index()
        {
            var result = await _brandService.GetAllBrands(await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        // criar a view CreateBrand
        [HttpGet]
        public async Task<IActionResult> CreateBrand()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateBrand(BrandViewModel brandViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _brandService.CreateBrand(brandViewModel, await GetAccessToken());
                if (result is not null) return RedirectToAction(nameof(Index));
            }
            else
                return BadRequest("Error");

            return View(brandViewModel);
        }

        // Criar a view UpdateBrand
        [HttpGet]
        public async Task<IActionResult> UpdateBrand(int id)
        {
            var result = await _brandService.FindBrandById(id, await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }

        [HttpPost]
        public async Task<IActionResult> UpdateBrand(BrandViewModel brandViewModel)
        {
            if (ModelState.IsValid)
            {
                var result = await _brandService.UpdateBrand(brandViewModel, await GetAccessToken());
                if (result is not null) return RedirectToAction(nameof(Index));
            }

            return View(brandViewModel);
        }

        // criar a view delete brand
        [HttpGet]
        public async Task<ActionResult<BrandViewModel>> DeleteBrand(int id)
        {
            var result = await _brandService.FindBrandById(id, await GetAccessToken());
            if (result is null) return View("Error");
            return View(result);
        }
        
        // nesse caso os dois precisariam ter o msm nome, só que como não pode ter 
        // duas assinaturas de métodos iguais, foi nomeado como DeleteConfirmed
        // porém é necessário chamar uma ação DeleteBrand
        // por isso tem o ActionName
        [HttpPost(), ActionName("DeleteBrand")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var result = await _brandService.DeleteBrandById(id, await GetAccessToken());
            if (!result) return View("Error");
            return RedirectToAction("Index");
        }

        private async Task<string> GetAccessToken()
        {
            return await HttpContext.GetTokenAsync("access_token");
        }
    }
}

