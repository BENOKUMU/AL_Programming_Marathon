page 50016 "Customer Category List_PKT"
{
    ApplicationArea = All;
    Caption = 'Customer Category List_PKT';
    CardPageId = CustomerCategoryCard_PKT;
    PageType = List;
    SourceTable = "Customer Category_PKT";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'ranking, categorization';
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Default;Rec.Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomersForCategory;Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total number of customers for this category';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Default cateory")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Create default category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Category Mgt_PKT";
                    begin
                        CustManagement.CreateDefaultCategory();
                    end;
            }
        }
    }
}
