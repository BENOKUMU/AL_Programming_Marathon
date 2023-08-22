// pageextension 50001 CustomerExt extends "Customer Card"
// {
//     layout
//     {
//         addafter(Invoicing)
//         {
//             group("Important Dates")
//             {
//                 Caption = 'Important Dates';
//                 field("Birth Date"; Rec."Birth Date")
//                 {
//                     ApplicationArea = BasicHR;
//                     Importance = Promoted;
//                     ShowMandatory = true;
//                     NotBlank = true;
//                     ToolTip = 'Specifies the employee''s date of birth.';

//                 }
//                 field(Age; Age)
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Age';
//                     Editable = false;

//                 }
//                 field("Employment Date"; Rec."Employment Date")
//                 {
//                     ApplicationArea = BasicHR;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the date when the employee began to work for the company.';
//                 }
//                 field(LengthOfService; Rec."Length of Service")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Length Of Service';
//                     Editable = false;
//                 }
//                 field(RetirementDate; Rec."Retirement Date")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Retirement Date';
//                     Editable = false;
//                 }
//             }
//         }
//     }


//     trigger OnAfterGetRecord()
//     begin
//         Age := '';
//         LengthOfService := '';
//         RetirementDate := '';

//         //Recalculate Important Dates
//         if (Rec."Retirement Date" = 0D) then begin
//             if (Rec."Birth Date" <> 0D) then begin
//                 Age := Dates.DetermineAge(Rec."Birth Date", Today);
//                 if (Age < '18') then
//                     Message('Employee must be at least 18 years old Please edit the age.');
//             end;

//             if (Rec."Employment Date" <> 0D) then
//                 LengthOfService := Dates.DetermineAge(Rec."Employment Date", Today);

//             if (Rec."Birth Date" <> 0D) then begin
//                 D := CalcDate('<+60Y>', Rec."Birth Date");
//                 RetirementDate := Format(D);
//             end;
//         end;
//     end;


//     trigger OnOpenPage()
//     begin
//         SetNoFieldVisible;
//         IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");

//         Age := '';
//         LengthOfService := '';
//         RetirementDate := '';

//         //Recalculate Important Dates
//         if (Rec."Termination Date" = 0D) then begin
//             if (Rec."Birth Date" <> 0D) then begin
//                 Age := Dates.DetermineAge(Rec."Birth Date", Today);
//                 // Message('Age is', Rec.Age);
//                 if (Age < '18') then
//                     Message('Employee must be at least 18 years old Please edit the age.');
//             end;

//             if (Rec."Employment Date" <> 0D) then
//                 LengthOfService := Dates.DetermineAge(Rec."Employment Date", Today);

//             if (Rec."Birth Date" <> 0D) then begin
//                 D := CalcDate('<+60Y>', Rec."Birth Date");
//                 RetirementDate := Format(D);
//             end;
//         end;
//     end;

//     trigger OnClosePage()
//     begin
//         SetNoFieldVisible;
//         IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");

//         Age := '';
//         LengthOfService := '';
//         RetirementDate := '';

//         //Recalculate Important Dates
//         if (Rec."Termination Date" = 0D) then begin
//             if (Rec."Birth Date" <> 0D) then begin
//                 Age := Dates.DetermineAge(Rec."Birth Date", Today);
//                 // Age:= '';
//                 if (Age < '18') then begin
//                     Error('Employee must be at least 18 years old.');
//                 end;



//                 if (Rec."Employment Date" <> 0D) then begin
//                     LengthOfService := Dates.DetermineAge(Rec."Employment Date", Today);
//                 end;

//                 if (Rec."Birth Date" <> 0D) then begin
//                     D := CalcDate('<+60Y>', Rec."Birth Date");
//                     RetirementDate := Format(D);
//                 end;
//             end;
//         end;
//     end;



//     var
//         ShowMapLbl: Label 'Show on Map';
//         FormatAddress: Codeunit 365;
//         NoFieldVisible: Boolean;
//         IsCountyVisible: Boolean;
//         Dates: Codeunit "HR Dates";
//         Age: Text[100];
//         LengthOfService: Text[100];
//         RetirementDate: Text[100];
//         D: Date;
//         // EmployeeMaster: Record "Client Employee Master";
//         isDisabled: Boolean;


//     local procedure SetNoFieldVisible()
//     var
//         DocumentNoVisibility: Codeunit DocumentNoVisibility;
//     begin
//         NoFieldVisible := DocumentNoVisibility.EmployeeNoIsVisible;
//     end;

// }
