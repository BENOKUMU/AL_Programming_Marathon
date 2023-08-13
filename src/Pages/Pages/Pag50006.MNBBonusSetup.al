page 50006 "MNB Bonus Setup"
{
    ApplicationArea = All;
    Caption = 'MNB Bonus Setup';
    PageType = Card;
    SourceTable = "MNB Bonus Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Bonus Nos."; Rec."Bonus Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies number series what will be used for bonus numbers';
                }

            }

        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
