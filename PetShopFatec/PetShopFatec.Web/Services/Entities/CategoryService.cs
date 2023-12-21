using System;
using PetShopFatec.Web.Models.Entities;
using System.Text.Json;
using PetShopFatec.Web.Services.Interfaces;
using System.Text;
using System.Net.Http.Headers;

namespace PetShopFatec.Web.Services.Entities
{
	public class CategoryService : ICategoryService
	{
        private readonly IHttpClientFactory _clientFactory;
        private readonly JsonSerializerOptions _options;
        private const string apiEndpoint = "/api/category/";
        private CategoryViewModel _categoryViewModel;
        private IEnumerable<CategoryViewModel> categories;

        public CategoryService(IHttpClientFactory clientFactory)
        {
            _clientFactory = clientFactory;
            _options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        }

        public async Task<IEnumerable<CategoryViewModel>> GetAllCategories(string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            var response = await client.GetAsync(apiEndpoint);

            if (response.IsSuccessStatusCode)
            {
                var apiResponse = await response.Content.ReadAsStreamAsync();
                categories = await JsonSerializer
                    .DeserializeAsync<IEnumerable<CategoryViewModel>>(apiResponse, _options);

            }
            else
                return null;

            return categories;
        }

        public async Task<CategoryViewModel> FindCategoryById(int id, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            using (var response = await client.GetAsync(apiEndpoint + id))
            {
                if (response.IsSuccessStatusCode && response.Content is not null)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _categoryViewModel = await JsonSerializer
                        .DeserializeAsync<CategoryViewModel>(apiResponse, _options);
                }
                else
                    return null;

            }
            return _categoryViewModel;
        }

        public async Task<CategoryViewModel> CreateCategory(CategoryViewModel categoryViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            StringContent content = new StringContent(JsonSerializer.Serialize(categoryViewModel),
                    Encoding.UTF8, "application/json");

            using (var response = await client.PostAsync(apiEndpoint, content))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    _categoryViewModel = await JsonSerializer.DeserializeAsync<CategoryViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }
            return _categoryViewModel;
        }

        public async Task<CategoryViewModel> UpdateCategory(CategoryViewModel categoryViewModel, string token)
        {
            var client = _clientFactory.CreateClient("ProductAPI");
            PutTokenInHeaderAuthorization(token, client);

            CategoryViewModel categoryUpdate = new CategoryViewModel();

            using (var response = await client.PutAsJsonAsync(apiEndpoint, categoryViewModel))
            {
                if (response.IsSuccessStatusCode)
                {
                    var apiResponse = await response.Content.ReadAsStreamAsync();
                    categoryUpdate = await JsonSerializer.DeserializeAsync<CategoryViewModel>(apiResponse, _options);
                }
                else
                    return null;
            }

            return categoryUpdate;
        }

        public async Task<bool> DeleteCategoryById(int id, string token)
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

