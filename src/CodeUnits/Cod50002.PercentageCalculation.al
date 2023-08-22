codeunit 50002 Percentage_Calculation
{

    [EventSubscriber(ObjectType::Table, 50004, 'OnAfterInsertEvent', '', false, false)]
    local procedure MyProcedure()
    begin
        
    end;
procedure CalculatePercentage(): Decimal
var
    Procline: Record "Procurement Plan Lines";
begin
    if Procline."Total Amount" <> 0 then begin
        Procline.Get(Procline."Total Amount");
        if Procline."Agpo Total Amount" <> 0 then begin
            Procline."AGPO %" := Procline."Agpo Total Amount";
            Procline.Modify()
            
        end;
    end;
end;

    
}
