page 50002 "Portal Attachments"
{
    ApplicationArea = All;
    Caption = 'Portal Attachments';
    PageType = List;
    SourceTable = AttachmentFromPortal;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea  = All;
                }
            }
        }
    }
}
