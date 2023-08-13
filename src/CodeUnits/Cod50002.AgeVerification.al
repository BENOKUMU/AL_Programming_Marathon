// codeunit 50002 "Age Verification"
// {
//     [EventSubscriber(ObjectType::Table, 5200, 'OnBeforeValidateEvent', 'Birth Date', false, false)]
//     local procedure OnAgeValidate(var Rec: Record Employee; var xRec: Record Employee);
//     var
//         notRequiredAge: Label 'Age must not be less than 18';
//         Age: Integer;
//     begin
//         Age := Today - Rec."Birth Date";
//         if Age < 18 then begin
//             xRec := Rec;
//             xRec."Birth Date" := 0D;
//             Error(notRequiredAge);
//         end;

//     end;
// }
