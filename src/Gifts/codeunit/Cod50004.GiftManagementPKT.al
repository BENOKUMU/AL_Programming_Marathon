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

    local procedure AddFreeGiftsSalesLine(var SalesLine: Record "Sales Line"; var Handled: Boolean)
    var
        GiftCampaign: Record GiftCampaign_PKT;
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
        SalesLineGift: Record "Sales Line";
        LineNo: Integer;
    begin
        if Handled then
            exit;
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        Customer.Get(SalesLine."Sell-to Customer No.");
        GiftCampaign.SetRange(CustomeCategoryCode, Customer."Customer Category Code_PKT");
        GiftCampaign.SetRange(ItemNo, SalesLine."No.");
        GiftCampaign.SetFilter();;
    end;
}
