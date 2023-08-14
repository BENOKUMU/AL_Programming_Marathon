codeunit 50002 Percentage_Calculation
{
    TableNo = "Procurement Plan Header";
    
    trigger OnRun()   
    begin
        number1:= ProcHeader."AGPO Reservation";
        number2:= ProcHeader."Total Estimate";
        number3:= 100;
        Calculate(number1, number2, number3);
    end;

    procedure Calculate(number1: Decimal; number2: Decimal; number3: Decimal)
    var
        FProduct: Decimal;
    begin
        FProduct:= number1 / number2 * 100;
        Message('Multiply %1 and %2 ',number1,number2,number3);
    end;
    
    var
        Result: Decimal;
        ProcHeader: Record "Procurement Plan Header";
        ProcLine: Record "Procurement Plan Lines";
        number1: Decimal;
        number2: Decimal;
        number3: Decimal;
    
}
