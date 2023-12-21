using System;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using PetShopFatec.Web.Models.Entities;
using PetShopFatec.Web.Services.Interfaces;

namespace PetShopFatec.Web.Services.Entities
{
    public class BrandService : IBrandService
    {

        private readonly IHttpClientFactory _clientFactory;
        private readonly JsonSerializerOptions _options;
        private const string apiEndpoint = "/api/brand/"; 
        private BrandViewModel _brandViewModel;
        private IEnumerable<BrandViewModel> brands;

        public BrandService(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
            _options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true};
        }

        public async Task<IEnumerable<BrandViewModel>> GetAllBrands(string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            var response = await client.GetAsync(apiEndpoint);

            if (response.IsSuccessStatusCode)
            {
                var apiResponse = await response.Content.ReadAsStreamAsync();
                brands = await JsonSerializer
                    .DeserializeAsync<IEnumerable<BrandViewModel>>(apiResponse, _options);

            }
            else
                return null;

            return brands;
        }

        public async Task<BrandViewModel> FindBrandById(int id, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            using (var response = await client.GetAsync(apiEndpoint + id))
            {
                if (response.IsSuccessStatusCode && response.Content is not null)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _brandViewModel = await JsonSerializer
                        .DeserializeAsync<BrandViewModel>(apiResponse, _options);
                }
                else
                    return null;

            }
            return _brandViewModel;
        }

        public async Task<BrandViewModel> CreateBrand(BrandViewModel brandViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            StringContent content = new StringContent(JsonSerializer.Serialize(brandViewModel),
                    Encoding.UTF8, "application/json");

            using (var response = await client.PostAsync(apiEndpoint, content))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _brandViewModel = await JsonSerializer
                        .DeserializeAsync<BrandViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }
            return _brandViewModel;
        }

        public async Task<BrandViewModel> UpdateBrand(BrandViewModel brandViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            BrandViewModel brand = new BrandViewModel();

            using (var response = await client.PutAsJsonAsync(apiEndpoint, brandViewModel))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    brand = await JsonSerializer.DeserializeAsync<BrandViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }

            return brand;
        }

        public async Task<bool> DeleteBrandById(int id, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            using (var response = await client.DeleteAsync(apiEndpoint + id))
            {
                if (response.IsSuccessStatusCode) return true;
            }
            return false;
        }

        private static void PutTokenInHeaderAuthorization(string token,
        HttpClient client)
        {
            client.DefaultRequestHeaders.Authorization =
                new AuthenticationHeaderValue("Bearer", token);
        }
    }

}

