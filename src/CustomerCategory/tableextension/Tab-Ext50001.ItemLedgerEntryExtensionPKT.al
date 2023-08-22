tableextension 50001 ItemLedgerEntryExtension_PKT extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "Customer Category Code_PKT"; Code[20])
        {
            Caption = 'Customer category';
            DataClassification = CustomerContent;
            TableRelation = "Customer Category_PKT".Code;
        }
    }
    keys
    {
        Key(FK; "Customer Category Code_PKT")
        {
            
        }
    }
}
