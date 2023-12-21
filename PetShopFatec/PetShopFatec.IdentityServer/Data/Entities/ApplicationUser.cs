using Microsoft.AspNetCore.Identity;

namespace PetShopFatec.IdentityServer.Data.Entities
{
	public class ApplicationUser : IdentityUser
	{
		// outra opcao para tirar o aviso de nulo String.Empty
		public string FirstName { get; set; } = String.Empty;
		public string LastName { get; set; } = String.Empty;
	}
}

