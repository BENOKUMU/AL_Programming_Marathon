pageextension 50001 CustomerListExtension extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("Assign Default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assigns Default Category to all customers';
                ToolTip = 'Assigns the Default category to all customers';

                trigger OnAction()
                var
                    CustomerCategoryMgt: Codeunit "Customer category Mgt_PKT";
                begin
                    CustomerCategoryMgt.AssignDefaultCategory();
                end;
            }
        }
    }
    views
    {
        addlast
        {
            view(CustomerWithoutCategory)
            {
                Caption = 'Customers without Category assigned';
                Filters = where("Customer Category Code_PKT" = filter(''));
            }
        }
    }
}
