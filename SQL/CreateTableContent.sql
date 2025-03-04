-- Insert Customers (Companies)
INSERT INTO Customers (CompanyName, Website, Address, City, State, PostalCode, Country, TaxID, RegistrationDate, IsActive)
VALUES 
    ('Acme Corp', 'https://www.acmecorp.com', '123 Main St', 'New York', 'NY', '10001', 'USA', 'US-123456789', GETDATE(), 1),
    ('Globex Ltd', 'https://www.globex.com', '456 Business Rd', 'London', 'London', 'EC1A 1BB', 'UK', 'GB-987654321', GETDATE(), 1),
    ('Initech Inc', 'https://www.initech.com', '789 Tech Ave', 'San Francisco', 'CA', '94105', 'USA', 'US-112233445', GETDATE(), 1),
    ('Soylent Corp', 'https://www.soylentcorp.com', '321 Green St', 'Berlin', 'Berlin', '10115', 'Germany', 'DE-556677889', GETDATE(), 1),
    ('Cyberdyne Systems', 'https://www.cyberdyne.com', '654 AI Blvd', 'Los Angeles', 'CA', '90001', 'USA', 'US-998877665', GETDATE(), 1);

-- Insert Customer Contacts
INSERT INTO CustomerContacts (CustomerID, FirstName, LastName, Email, Phone, JobTitle, IsPrimaryContact)
VALUES 
    -- Contacts for Acme Corp
    (1, 'John', 'Doe', 'john.doe@acmecorp.com', '+1-555-1010', 'CEO', 1),
    (1, 'Jane', 'Smith', 'jane.smith@acmecorp.com', '+1-555-1011', 'Sales Manager', 0),

    -- Contacts for Globex Ltd
    (2, 'Alice', 'Brown', 'alice.brown@globex.com', '+44-20-7946-0011', 'Managing Director', 1),
    (2, 'Bob', 'Johnson', 'bob.johnson@globex.com', '+44-20-7946-0022', 'Account Manager', 0),

    -- Contacts for Initech Inc
    (3, 'Peter', 'Gibbons', 'peter.gibbons@initech.com', '+1-555-2020', 'Software Engineer', 1),
    (3, 'Samir', 'Nagheenanajar', 'samir.n@initech.com', '+1-555-2021', 'IT Specialist', 0),

    -- Contacts for Soylent Corp
    (4, 'Linda', 'Green', 'linda.green@soylentcorp.com', '+49-30-1234-5678', 'Marketing Director', 1),
    (4, 'Mark', 'White', 'mark.white@soylentcorp.com', '+49-30-1234-5679', 'Operations Manager', 0),

    -- Contacts for Cyberdyne Systems
    (5, 'Sarah', 'Connor', 'sarah.connor@cyberdyne.com', '+1-555-3030', 'Security Analyst', 1),
    (5, 'Miles', 'Dyson', 'miles.dyson@cyberdyne.com', '+1-555-3031', 'CTO', 0);
