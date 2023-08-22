table 50010 "Units List"
{
    Caption = 'Units Line';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[25])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Unit Name"; Text[50])
        {
            Caption = 'Unit Name';
            DataClassification = CustomerContent;
        }
        field(4; "1st Semester Score"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = '1st Semester Score';
        }
        field(5; "2nd Semester Score"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = '2nd Semester Score';
        }
        field(6; "3rd Semester Score"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = '3rd Semester Score';
        }
        field(7; "Semester Type"; Text[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Semester Type";
            Caption = 'Semester Type';
        }
        field(8; "Average Score"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Average Score';
        }
        field(9; "Grade"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Grade';
        }
        field(10; "Final Score"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Final Score';
        }
        field(11; "Remarks"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Remarks';
        }
        field(12; "Student No."; Code[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Student No.';
        }
        field(13; "Fee"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Fee';
        }
        field(14; "Total Fee"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Fee';
        }
        field(15; "Special Fee"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Special Fee';
        }
        field(16; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(17; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Document No.';
        }
        field(18; "No. of Units"; Integer)
        {
            
            FieldClass = FlowField;
            CalcFormula = count("Units List" where("Student No." = field("Student No.")));
            Editable = false;
        }

    }
    keys
    {
        key(PK; "Document No.", "Student No.", "No.")
        {
            Clustered = true;
        }
       
      
    }
}
