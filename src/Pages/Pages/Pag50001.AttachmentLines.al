page 50001 "Attachment Lines"
{
    ApplicationArea = All;
    MultipleNewLines = false;
    UsageCategory = Lists;
    PageType = ListPart;
    SourceTable = "Portal Attachments";
    
    
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
