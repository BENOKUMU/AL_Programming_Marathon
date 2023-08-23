table 50014 GiftCampaign_PKT
{
    Caption = 'Gift Campaign';
    DataClassification = CustomerContent;
    DrillDownPageId = "Gift Campaign List_PKT";
    LookupPageId = "Gift Campaign List_PKT";
    
    fields
    {
        field(1; "CustomeCategoryCode"; Code[20])
        {
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
            TableRelation = "Customer Category_PKT";
            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category_PKT";
                ErrNoGifts: Label 'This category is not enabled for Gift Campaigns';
                ErrBlocked: Label 'This category is blocked for Gift Campaigns';
            begin
                CustomerCategory.Get(CustomerCategory.Code);
                if CustomerCategory.Blocked then
                    Error(ErrBlocked);
                if not CustomerCategory.FreeGiftsAvailable then
                    Error(ErrNoGifts);
            end;
        }
        field(2; ItemNo; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(3; StartingDate; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(4; EndingDate; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(5; GiftQuantity; Decimal)
        {
            Caption = 'Free Gift Quantity';
            DataClassification = CustomerContent;
        }
        field(6; MinimumOrderQuantity; Decimal)
        {
            Caption = 'Minimum Order Quantity';
            DataClassification = CustomerContent;
        }
        field(7; Inactive; Boolean)
        {
            Caption = 'Inactive';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; CustomeCategoryCode, ItemNo, StartingDate, EndingDate) // composite key
        {
            Clustered = true;
        }
    }
}
