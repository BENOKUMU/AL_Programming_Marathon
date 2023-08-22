tableextension 50002 CustomerTableExtension_PKT extends Customer
{
    fields
    {
        field(50100; "Customer Category Code_PKT"; Code[20])
        {
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
            TableRelation = "Customer Category_PKT".Code;

            trigger OnValidate()
            var
                CustomerCategory: Record "Customer Category_PKT";
                ErrBlocked: label 'This category is Blocked';
            begin
                CustomerCategory.Get("Customer Category Code_PKT");
                if CustomerCategory.Blocked then
                    Error(ErrBlocked);
            end;
        }
    }
    keys
    {
        key(CustomerCategory; "Customer Category Code_PKT")
        {

        }

    }
}
