using System;
using System.Collections.Generic;

namespace ProjectDemoApi.Models;

public partial class CustomerContact
{
    public int ContactId { get; set; }

    public int CustomerId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Phone { get; set; }

    public string? JobTitle { get; set; }

    public bool? IsPrimaryContact { get; set; }

    public virtual Customer Customer { get; set; } = null!;
}
