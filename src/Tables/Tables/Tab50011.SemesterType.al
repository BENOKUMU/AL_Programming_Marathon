table 50011 "Semester Type"
{
    Caption = 'Semester Type';
    DataClassification = ToBeClassified;
    LookupPageId = "Semester Type";
    DrillDownPageId = "Semester Type";
    
    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Semester Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Is Special Group"; Boolean)
        {
            DataClassification = ToBeClassified;
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
