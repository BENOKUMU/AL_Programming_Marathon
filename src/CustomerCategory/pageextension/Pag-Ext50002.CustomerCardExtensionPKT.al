pageextension 50002 CustomerCardExtension_PKT extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            // field("Customer Category PKT"; CustomerCategoryPKT)
            // {
            //     ToolTip = 'Customer category';
            //     ApplicationArea = All;
            //     TableRelation = "Customer Category_PKT".Description;

            // }
            field("Customer Category Code_PKT";Rec."Customer Category Code_PKT")
            {
                ToolTip = 'Customer category';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action("Assign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                Caption = 'Assign default Category';
                ToolTip = 'Assigns efault category to the current customer';

                trigger OnAction()
                var
                    CustomerCategoryMgt: Codeunit "Customer Category Mgt_PKT";
                begin
                    CustomerCategoryMgt.AssignDefaultcategory(Rec."No.")
                end;
            }
        }
    }
}
