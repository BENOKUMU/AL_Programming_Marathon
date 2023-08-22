table 50013 "Packt Extension Setup"
{
    Caption = 'Packt Extension Setup';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Primary key"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Minimum Accepted vendor Rate"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Minimum Accepted vendor Rate for Purchases';
        }
        field(3; "Gift Tolerance Qty"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Gift Tolerance Quantity for Sales';
        }
    }
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
        
    }
}
