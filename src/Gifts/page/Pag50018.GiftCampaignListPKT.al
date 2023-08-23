page 50018 "Gift Campaign List_PKT"
{
    ApplicationArea = All;
    Caption = 'Gift Campaign List_PKT';
    PageType = List;
    SourceTable = GiftCampaign_PKT;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(CustomeCategoryCode; Rec.CustomeCategoryCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Category Code field.';
                }
                field(ItemNo; Rec.ItemNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field(StartingDate; Rec.StartingDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field(EndingDate; Rec.EndingDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field(MinimumOrderQuantity; Rec.MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Minimum Order Quantity field.';
                    Style = Strong;
                }
                field(GiftQuantity; Rec.GiftQuantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Free Gift Quantity field.';
                    Style = Strong;
                }
                field(Inactive; Rec.Inactive)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inactive field.';
                }
            }
        }
    }
    views
    {
        view(ActiveCampaigns)
        {
            Caption = 'Active Gift Campaigns';
            Filters = where (Inactive = const (false));
        }
        view(InactiveCampaigns)
        {
            Caption = 'Inactive Gift Campaigns';
            Filters = where (Inactive = const (true));
        }
    }
}
