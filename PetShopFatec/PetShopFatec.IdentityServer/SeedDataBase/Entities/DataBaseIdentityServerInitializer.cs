﻿using System;
using IdentityModel;
using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using PetShopFatec.IdentityServer.Configuration;
using PetShopFatec.IdentityServer.Data.Entities;
using PetShopFatec.IdentityServer.SeedDataBase.Interfaces;

namespace PetShopFatec.IdentityServer.SeedDataBase.Entities
{
    public class DataBaseIdentityServerInitializer : IDatabaseInitializer
    {

        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public DataBaseIdentityServerInitializer(UserManager<ApplicationUser>
            userManager, RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public void InitializeSeedRoles()
        {
            if (!_roleManager.RoleExistsAsync(IdentityConfiguration.Admin).Result)
            {
                // cria o perfil Admin
                IdentityRole roleAdmin = new IdentityRole();
                roleAdmin.Name = IdentityConfiguration.Admin;
                roleAdmin.NormalizedName = IdentityConfiguration.Admin.ToUpper();
                _roleManager.CreateAsync(roleAdmin).Wait();
            }

            // se o perfil Client não existir, então cria o perfil
            if (!_roleManager.RoleExistsAsync(IdentityConfiguration.Client).Result)
            {
                // cria o perfil Client
                IdentityRole roleClient = new IdentityRole();
                roleClient.Name = IdentityConfiguration.Client;
                roleClient.NormalizedName = IdentityConfiguration.Client.ToUpper();
                _roleManager.CreateAsync(roleClient).Wait();
            }
        }

        public void InitializeSeedUsers()
        {
            // se o usuario admin não existir, cria o usuario, definindo a senha e atribuindo o perfil
            if (_userManager.FindByEmailAsync("emerson@gmail.com").Result is null)
            {
                // define os dados dos usuário admin
                ApplicationUser admin = new ApplicationUser()
                {
                    UserName = "emerson",
                    NormalizedUserName = "EMERSON",
                    Email = "emerson@gmail.com",
                    NormalizedEmail = "EMERSON@GMAIL.COM",
                    EmailConfirmed = true,
                    LockoutEnabled = false,
                    PhoneNumber = "+55 (17) 99012-3456",
                    FirstName = "Usuario",
                    LastName = "Emerson",
                    SecurityStamp = Guid.NewGuid().ToString(),
                };

                // cria o usuário Admin e atribui a senha a ele
                // obrigatoriamente deve ter 1 maiusc, minuscula, numero e caracter especial
                IdentityResult resultAdmin =
                    _userManager.CreateAsync(admin, "Admin@1234").Result;
                if (resultAdmin.Succeeded)
                {
                    // inclui o usuário admin ao perfil admin
                    _userManager.AddToRoleAsync(admin, IdentityConfiguration.Admin).Wait();

                    // inclui as claims do usuário admin
                    var adminClaims = _userManager.AddClaimsAsync(admin, new Claim[]
                    {
                    new Claim(JwtClaimTypes.Name, $"{admin.FirstName} {admin.LastName}"),
                    new Claim(JwtClaimTypes.GivenName, admin.FirstName),
                    new Claim(JwtClaimTypes.FamilyName, admin.LastName),
                    new Claim(JwtClaimTypes.Role, IdentityConfiguration.Admin)
                    }).Result;
                }
            }


            // se o usuario client não existir, cria o usuario,
            // definindo a senha e atribuindo o perfil
            if (_userManager.FindByEmailAsync("client@gmail.com").Result is null)
            {
                // define os dados dos usuário client
                ApplicationUser client = new ApplicationUser()
                {
                    UserName = "emersonclient",
                    NormalizedUserName = "EMERSONCLIENT",
                    Email = "client@gmail.com",
                    NormalizedEmail = "CLIENT@GMAIL.COM",
                    EmailConfirmed = true,
                    LockoutEnabled = false,
                    PhoneNumber = "+55 (11) 99012-3456",
                    FirstName = "Usuario",
                    LastName = "Client",
                    SecurityStamp = Guid.NewGuid().ToString(),
                };

                // cria o usuário Client e atribui a senha a ele
                IdentityResult resultClient =
                    _userManager.CreateAsync(client, "Client@1234").Result;
                if (resultClient.Succeeded)
                {
                    // inclui o usuário client ao perfil client
                    _userManager.AddToRoleAsync(client, IdentityConfiguration.Client).Wait();

                    // inclui as claims do usuário Client
                    var clientClaims = _userManager.AddClaimsAsync(client, new Claim[]
                    {
                    new Claim(JwtClaimTypes.Name, $"{client.FirstName} {client.LastName}"),
                    new Claim(JwtClaimTypes.GivenName, client.FirstName),
                    new Claim(JwtClaimTypes.FamilyName, client.LastName),
                    new Claim(JwtClaimTypes.Role, IdentityConfiguration.Client)
                    }).Result;
                }
            }
        }
    }
}

