﻿using System;
using Duende.IdentityServer;
using Duende.IdentityServer.Models;

namespace PetShopFatec.IdentityServer.Configuration
{
    public class IdentityConfiguration
    {
        public const string Admin = "Admin";
        public const string Client = "Client";

        public static IEnumerable<IdentityResource>
            IdentityResources => new List<IdentityResource>
            {
                new IdentityResources.OpenId(), // usado para receber o token
                new IdentityResources.Email(),
                // email e profile são usados para poder acessar os recursos do cliente
                new IdentityResources.Profile()
            };

        public static IEnumerable<ApiScope>
            ApiScopes => new List<ApiScope>
            {
                // petshopfatec que irá acessar
                // para o IdentityServer obter o token
                new ApiScope("petshopfatec", "PetShopFatec Server"),
                new ApiScope(name: "read", "Read data."),
                new ApiScope(name: "write", "Write data."),
                new ApiScope(name: "delete", "Delete data.")
            };

        public static IEnumerable<Client>
            Clients => new List<Client>
            { 
                // cliente genérico
                new Client
                {
                    ClientId = "client",
                    // esse segredo também será adicionado ao appsettings.json do projeto web
                    ClientSecrets = { new Secret("vai_reprovar".Sha256())},
                    AllowedGrantTypes = GrantTypes.ClientCredentials,
                    // precisa das credenciais do usuario
                    AllowedScopes = {"read", "write", "profiles"}
                },
                new Client
                {
                    ClientId = "petshopfatec",
                    ClientSecrets = { new Secret("vai_reprovar".Sha256())},
                    AllowedGrantTypes = GrantTypes.Code,
                    RedirectUris = {"https://localhost:7256/signin-oidc"},//login
                    PostLogoutRedirectUris = {"https://localhost:7256/signout-callback-oidc"},//logout
                    AllowedScopes = new List<string>
                    {
                        IdentityServerConstants.StandardScopes.OpenId,
                        IdentityServerConstants.StandardScopes.Profile,
                        IdentityServerConstants.StandardScopes.Email,
                        "petshopfatec"
                    }
                }
            };
    }
}

