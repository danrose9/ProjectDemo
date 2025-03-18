using System;
using System.Collections.Generic;

namespace ProjectDemoApi.Models;

public partial class Customer
{
    public int CustomerId { get; set; }

    public string CompanyName { get; set; } = null!;

    public string? Website { get; set; }

    public string? Type { get; set; }

    public string? Address { get; set; }

    public string? City { get; set; }

    public string? State { get; set; }

    public string? PostalCode { get; set; }

    public string? Country { get; set; }

    public string? TaxId { get; set; }

    public DateTime? RegistrationDate { get; set; }

    public bool? IsActive { get; set; }

    public virtual ICollection<Contact>? Contact { get; set; } = new List<Contact>();
}
