page 50015 "Semester Type"
{
    ApplicationArea = All;
    Caption = 'Semester Type';
    PageType = List;
    SourceTable = "Semester Type";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                
                field("Semester Type"; Rec."Semester Type")
                {
                    ToolTip = 'Specifies the value of the Semester Type field.';
                }
                field("Is Special Group"; Rec."Is Special Group")
                {
                    ToolTip = 'Specifies the value of the Is Special Group field.';
                }
            }
        }
    }
}
