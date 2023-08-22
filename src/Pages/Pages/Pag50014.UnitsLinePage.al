page 50014 "Units Line Page"
{
    ApplicationArea = All;
    Caption = 'Units Line Page';
    PageType = ListPart;
    SourceTable = "Units List";
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
                    trigger OnValidate()
                    var
                        UnitLine: Record "Units List";
                    begin
                        Rec."Average Score" := (Rec."1st Semester Score" + Rec."2nd Semester Score" + Rec."3rd Semester Score") / 3;
                    end;
                }
                field("Average Score"; Rec."Average Score")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Average Score field.';
                }
                // field("Code"; Rec."Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Code field.';
                // }
                field(Description; Rec.Description)
                {
                    Visible = false;
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
                    
                }
                field("TotalFee";Rec."Total Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Fee field.';
                   
                }
                field("SpecialFee";Rec."Special Fee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Special Fee field.';
                    
                }
                field("No. of Units";Rec."No. of Units")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Units field.';
                    trigger OnValidate()
                    begin
                        // calculateTotalFee();
                    end;
                }
            }
        }
    }

    var
        // NoUnits: Integer;

    
    trigger OnAfterGetRecord()
    var
        myInteger: Integer;
        myResult: Integer;
        TotalFee: Record "Units List";
    begin
        myInteger := 23;
        myResult := MyFunction(myInteger);
        TotalFee.SystemRowVersion := myInteger;
        

        // Message('The result is %1', myResult);
        // Message('The result is %1', myInteger);
    end;

    procedure MyFunction(var myInteger: Integer): Integer;
    begin
        myInteger := myInteger + 1;
        exit(myInteger);
    end;

    Procedure TotalLinesCount(var NoUnits: Integer): Integer;
    begin
        NoUnits := 0;
        while Rec.FindSet() do
        begin
            NoUnits := NoUnits + 1;
        end;
        exit(NoUnits);
        Message('The result is %1', NoUnits);
    end;
    
}
