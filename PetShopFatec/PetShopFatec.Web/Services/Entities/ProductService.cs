using System;
using PetShopFatec.Web.Models.Entities;
using System.Text.Json;
using PetShopFatec.Web.Services.Interfaces;
using System.Text;
using System.Net.Http.Headers;

namespace PetShopFatec.Web.Services.Entities
{
    public class ProductService : IProductService
	{
        private readonly IHttpClientFactory _clientFactory;
        private readonly JsonSerializerOptions _options;
        private const string apiEndpoint = "/api/product/";
        private ProductViewModel _productViewModel;
        private IEnumerable<ProductViewModel> products;

        public ProductService(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
            _options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        }

        public async Task<IEnumerable<ProductViewModel>> GetAllProducts(string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            var response = await client.GetAsync(apiEndpoint);

            if (response.IsSuccessStatusCode)
            {
                var apiResponse = await response.Content.ReadAsStreamAsync();
                products = await JsonSerializer
                    .DeserializeAsync<IEnumerable<ProductViewModel>>(apiResponse, _options);

            }
            else
                return null;

            return products;
        }

        public async Task<ProductViewModel> FindProductById(int id, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            using (var response = await client.GetAsync(apiEndpoint + id))
            { 
                if (response.IsSuccessStatusCode && response.Content != null)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _productViewModel = await JsonSerializer.DeserializeAsync<ProductViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }
            return _productViewModel;

        }

        public async Task<ProductViewModel> CreateProduct(ProductViewModel productViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            StringContent content = new StringContent(JsonSerializer.Serialize(productViewModel),
                    Encoding.UTF8, "application/json");

            using (var response = await client.PostAsync(apiEndpoint, content))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _productViewModel = await JsonSerializer.DeserializeAsync<ProductViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }
            return _productViewModel;
        }

        public async Task<ProductViewModel> UpdateProduct(ProductViewModel productViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");

            ProductViewModel productUpdate = new ProductViewModel();

            using (var response = await client.PutAsJsonAsync(apiEndpoint, productViewModel))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    productUpdate = await JsonSerializer.DeserializeAsync<ProductViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }

            return productUpdate;
        }

        public async Task<bool> DeleteProductById(int id, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
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

