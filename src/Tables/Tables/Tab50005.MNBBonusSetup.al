table 50005 "MNB Bonus Setup"
{
    Caption = 'MNB Bonus Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;

        }
        field(2; "Bonus Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Nos.';
            TableRelation = "No. Series";
        }
        // field(3; MyField; Blob)
        // {
        //     DataClassification = ToBeClassified;
        // }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
