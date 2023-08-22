table 50012 "Customer Category_PKT"
{
    Caption = 'Customer Category';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }
        field(4; enableNewsletter; Enum NewsletterType)
        {
            DataClassification = CustomerContent;
            Caption = 'Enable Newsletter';
        }
        field(5; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked';
        }
        field(7; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Customer where("Customer Category Code_PKT" = field(Code)));
            Caption = 'No. of associated customers';
        }
    }
    keys
    {
        key(PK; Code) // Primary key
        {
            Clustered = true;
        }
        key(k2; Description) // Secondary key
        {
            Unique = true;
        }
    }

    procedure GetSalesAmount(): Decimal
    var
        CustomerCategoryMgt: Codeunit "Customer category Mgt_PKT";
        begin
            exit(CustomerCategoryMgt.GetSalesAmount(Rec.Code));
        end;
}
