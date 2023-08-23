codeunit 50004 GiftManagement_PKT
{
    procedure AddGifts(var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("Line Discount %", '<> 100');
        if SalesLine.FindSet() then
        repeat
            OnBeforeFreeGiftsSalesLineAdded(SalesLine, Handled);
            AddFreeGiftsSalesLine(SalesLine, Handled);
            OnAfterFreeGiftsSalesLineAdded(SalesLine);
        until SalesLine.Next() = 0;
    end;
}
