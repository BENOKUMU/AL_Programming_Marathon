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
        GiftCampaign.SetFilter(StartingDate, '<=%1', SalesHeader."Order Date");
        GiftCampaign.SetFilter(EndingDate, '>%1', SalesHeader."Order Date");
        GiftCampaign.SetRange(Inactive, FALSE);
        GiftCampaign.SetFilter(MinimumOrderQuantity, '<=%1', SalesLine.Quantity);
        if GiftCampaign.FindFirst() then begin
            LineNo := GetLastSalesDocumentLineNo(SalesHeader);
            SalesLineGift.Init;
            SalesLineGift.TransferFields(SalesLine);
            SalesLineGift."Line No." := LineNo + 10000;
            SalesLineGift.Validate(Quantity, GiftCampaign.GiftQuantity);
            SalesLineGift.Validate("Line Discount %", 100);
            if SalesLineGift.Insert() then;
        end;
    end;

    local procedure GetLastSalesDocumentLineNo(var SalesHeader: Record "Sales Header"): Integer
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindLast() then
            exit(SalesLine."Line No.")
        else
            exit(0);
    end;

    [EventSubscriber(ObjectType::Table, Database::, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure CheckGiftEligibility(var Rec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        Customer: Record Customer;
        GiftCampaign: Record GiftCampaign_PKT;
        Handled: Boolean;
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then begin
            SalesHeader.Get(Rec."Document Type", Rec."Document No.");
            GiftCampaign.SetRange(CustomeCategoryCode, Customer."Customer Category Code_PKT");
            GiftCampaign.SetRange(ItemNo, Rec."No.");
            GiftCampaign.SetFilter(StartingDate, '<=%1', SalesHeader."Order Date");
            GiftCampaign.SetFilter(EndingDate, '>%1', SalesHeader."Order Date");
            GiftCampaign.SetRange(Inactive, FALSE);
            GiftCampaign.SetFilter(MinimumOrderQuantity, '<=%1', Rec.Quantity);
            if GiftCampaign.FindFirst() then begin
                OnBeforeFreeGiftAlert(Rec, Handled);
                DoGiftCheck(Rec, GiftCampaign, Handled);
                OnAfterFreeGiftAlert(Rec);
            end
        end;
    end;

    local procedure DoGiftCheck(var Rec: Record "Sales Line"; var GiftCampaign: Record GiftCampaign_PKT; var Handled: Boolean)
    var
        SalesLine: Record "Sales Line";
        PacktSetup: Record "PacktSetup_PKT Setup";
        GiftAlert: Label 'Attention: there is an active promotion for %1. if you buy %2 you have a gift of %3';
    begin
        if Handled then
            exit;
        PacktSetup.Get();
        if (SalesLine.Quantity < GiftCampaign.MinimumOrderQuantity) and (GiftCampaign.MinimumOrderQuantity - SalesLine.Quantity <= PackSetup."Gift Tolerance Qty") then
            Message(GiftAlert, SalesLine."No.", Format(GiftCampaign.MinimumOrderQuantity), Format(GiftCampaign.GiftQuantity));
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var SalesLine: Record "Sales Line"; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftSalesLineAdded(var SalesLine: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnBeforeFreeGiftAlert(var SalesLine: Record "Sales Line"; var Handled: Boolean)
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterFreeGiftAlert(var SalesLine: Record "Sales Line")
    begin
    end;

OnBeforeFreeGiftSalesLineAdded(SalesLine, Handled);
AddFreeGiftSalesLine(SalesLine, Handled);
OnAfterFreeGiftSalesLineAdded(SalesLine);
    
}
