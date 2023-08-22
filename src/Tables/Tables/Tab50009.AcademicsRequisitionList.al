table 50009 "Academics Requisition"
{
    Caption = 'Academics Requisition List';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Course No."; Code[20])
        {
            Caption = 'Course No.';
            DataClassification = CustomerContent;
        }
        field(4; "Course Name"; Text[250])
        {
            Caption = 'Course Name';
            DataClassification = CustomerContent;
        }
        field(5; "Year"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Year';
        }
        field(6; "Semester"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Semester';
        }
        field(7; "Section"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Section';
        }
        field(8; "Instructor"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Instructor';
        }
        field(9; "Instructor Name"; Text[250])
        {
            DataClassification = CustomerContent;
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
