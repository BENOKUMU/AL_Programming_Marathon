pageextension 50000 PurchaseQuoteExt extends "Purchase Quote"
{
    layout
    {
        addbefore("Invoice Details")
        {
            group(Attachments)
            {
                part(AttachmentList; "Attachment Lines")
                {
                    ApplicationArea = All;
                    UpdatePropagation = Both;
                    SubPageLink = Code = field("No.");
                }
            }
        }
    }
}
