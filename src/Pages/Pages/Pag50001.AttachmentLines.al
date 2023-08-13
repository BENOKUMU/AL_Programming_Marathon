page 50001 "Attachment Lines"
{
    ApplicationArea = All;
    // Caption = 'Attachment Lines';
    // AutoSplitKey = true;
    MultipleNewLines = false;
    UsageCategory = Lists;
    PageType = ListPart;
    SourceTable = "Portal Attachments";
    SourceTableView = sorting(Attachment);
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Attachment;Rec.Attachment)
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    TableRelation = AttachmentFromPortal;
                }
                field(URL;Rec.URL)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
