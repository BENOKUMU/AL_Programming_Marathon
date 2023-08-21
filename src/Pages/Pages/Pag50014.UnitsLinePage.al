page 50014 "Units Line Page"
{
    ApplicationArea = All;
    Caption = 'Units Line Page';
    PageType = ListPart;
    SourceTable = "Units Line";
    // AutoSplitKey = true;
    
    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Student No.";Rec."Student No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("1st Semester Score"; Rec."1st Semester Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 1st Semester Score field.';
                }
                field("2nd Semester Score"; Rec."2nd Semester Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 2nd Semester Score field.';
                }
                field("3rd Semester Score"; Rec."3rd Semester Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 3rd Semester Score field.';
                }
                field("Average Score"; Rec."Average Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Average Score field.';
                }
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Final Score"; Rec."Final Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Final Score field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Semester Type"; Rec."Semester Type")
                {
                    ApplicationArea = All;
                    
                    ToolTip = 'Specifies the value of the Semester Type field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Name field.';
                }
                field(Fee;Rec.Fee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee field.';
                }
                field("Total Fee";Rec."Total Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fee field.';
                }
                field("Special Fee";Rec."Special Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special Fee field.';
                }
            }
            group(Control991)
            {
                ShowCaption = false;
                field("StudentNo";Rec."Student No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.';
                    trigger OnValidate()
                    var
                        StudentNo: Code[20];
                    begin
                        StudentNo := Rec."Student No.";
                    end;
                }
                field("TotalFee";Rec."Total Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fee field.';
                    trigger OnValidate()
                    var
                        TotalFee: Decimal;
                    begin
                        TotalFee := Rec."Total Fee";
                    end;
                }
                field("SpecialFee";Rec."Special Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special Fee field.';
                    trigger OnValidate()
                    var
                        SpecialFee: Decimal;
                    begin
                        SpecialFee := Rec."Special Fee";
                    end;
                }
                field("No. of Units"; NoUnits)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Units field.';
                    trigger OnValidate()
                    var
                        NoUnits: Integer;
                    begin
                        
                    end;
                }
            }
        }
    }

    var
        NoUnits: Integer;
}
