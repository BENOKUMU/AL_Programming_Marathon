table 50001 "Portal Attachments"
{
    Caption = 'Portal Attachments';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Attachment"; Text[100])
        {
            Caption = 'Attachment';
        }
        field(2; URL; Text[50])
        {
            Caption = 'URL';
            DataClassification = CustomerContent;
        }
        field(3; Code; Code[100])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Code, Attachment)
        {
            Clustered = true;
        }
    }
}
