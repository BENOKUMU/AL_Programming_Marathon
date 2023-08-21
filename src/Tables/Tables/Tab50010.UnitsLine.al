table 50010 "Units Line"
{
    Caption = 'Units Line';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[25])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Unit Name"; Text[50])
        {
            Caption = 'Unit Name';
            DataClassification = ToBeClassified;
        }
        field(4; "1st Semester Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = '1st Semester Score';
        }
        field(5; "2nd Semester Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = '2nd Semester Score';
        }
        field(6; "3rd Semester Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = '3rd Semester Score';
        }
        field(7; "Semester Type"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Semester Type';
        }
        field(8; "Average Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Average Score';
        }
        field(9; "Grade"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Grade';
        }
        field(10; "Final Score"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Final Score';
        }
        field(11; "Remarks"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Remarks';
        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
