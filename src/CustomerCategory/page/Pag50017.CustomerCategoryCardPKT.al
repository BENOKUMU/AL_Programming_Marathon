page 50017 CustomerCategoryCard_PKT
{
    ApplicationArea = All;
    Caption = 'CustomerCategoryCard_PKT';
    PageType = Card;
    SourceTable = "Customer Category_PKT";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = All;

                }
                field(enableNewsletter; Rec.enableNewsletter)
                {
                    ApplicationArea = All;
                }
                field(FreeGiftsAvailable; Rec.FreeGiftsAvailable)
                {
                    ApplicationArea = All;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }

            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field(TotalCustomersForCategory; Rec.TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field(TotalSalesAmount; TotalSalesAmount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Sales order Amount';
                    Editable = false;
                    Style = Strong;
                }

            }
        }
    }
    var
        TotalSalesAmount: Decimal;
    trigger OnAfterGetRecord()
    begin
        TotalSalesAmount := Rec.GetSalesAmount();
    end;
}
