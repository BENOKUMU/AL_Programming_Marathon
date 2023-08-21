table 50009 "Academics Requisition"
{
    Caption = 'Academics Requisition List';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "Course No."; Code[20])
        {
            Caption = 'Course No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Course Name"; Text[250])
        {
            Caption = 'Course Name';
            DataClassification = ToBeClassified;
        }
        field(5; "Year"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';
        }
        field(6; "Semester"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Semester';
        }
        field(7; "Section"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Section';
        }
        field(8; "Instructor"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Instructor';
        }
        field(9; "Instructor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Instructor Name';
        }
        
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        
    }
}
