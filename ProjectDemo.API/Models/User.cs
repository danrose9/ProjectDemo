﻿using System.ComponentModel.DataAnnotations;

namespace ProjectDemoApi.Models
{
    public partial class User
    {
        public Guid Id { get; set; }
        public string? Username { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string? Password { get; set; } = null!;

        public string[] Roles { get; set; } = null!;
    }
}
