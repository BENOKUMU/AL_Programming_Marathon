codeunit 50003 "Customer Category Mgt_PKT"
{
    procedure createDefaultCategory()
    var
        CustomerCategory: record "Customer Category_PKT";
    begin
        CustomerCategory.Code := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then;
    end;


    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category_PKT";
    begin
        // Set Default category for a Customer
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer."Customer Category Code_PKT" := CustomerCategory.Code;
            Customer.Modify();
        end;
    end;

    procedure AssignDefaultcategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category_PKT";
    begin
        // Set default category for all Customers
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer.SetFilter("Customer Category Code_PKT", '%1', '');
            Customer.ModifyAll("Customer Category Code_PKT", CustomerCategory.Code, true);
        end;
    end;

    //  Returns the number of customers without an assigned customer category
    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        customer: Record Customer;
    begin
        customer.SetRange("Customer Category Code_PKT", '');
        exit(customer.Count());
    end;

    procedure GetSalesAmount(CustomerCategoryCode: Code[20]): Decimal
    var
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
        TotalAmount: Decimal;
    begin
        Customer.SetCurrentKey("Customer Category Code_PKT");
        Customer.SetRange("Customer Category Code_PKT", CustomerCategoryCode);
        if Customer.FindSet() then
            repeat
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::order);
                SalesLine.SetRange("Sell-to Customer No.", Customer."No.");
                if SalesLine.FindSet() then
                    repeat
                        TotalAmount += SalesLine."Line Amount";
                    until SalesLine.Next() = 0;
            until Customer.Next() = 0;
        exit(TotalAmount)

    end;


}
