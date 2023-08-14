table 50002 AttachmentFromPortal
{
    Caption = 'AttachmentFromPortal';
    DataClassification = CustomerContent;
    DrillDownPageId = "Attachment Lines";
    LookupPageId = "Portal Attachments";
    
    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            AutoIncrement = true;
        }
        field(2; Attachment; Text[100])
        {
            Caption = 'Attachment';
        }
        
    }
    keys
    {
        key(PK; Attachment)
        {
            Clustered = true;
        }
    }
}
