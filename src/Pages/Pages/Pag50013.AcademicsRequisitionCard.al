page 50013 "Academics Requisition Card"
{
    ApplicationArea = All;
    Caption = 'Academics Requisition Card';
    PageType = Card;
    SourceTable = "Academics Requisition List";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course Name field.';
                }
                field("Course No."; Rec."Course No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Instructor; Rec.Instructor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor field.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Instructor Name field.';
                }
                
                field(Section; Rec.Section)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Year field.';
                }
            }
            part(Lines; "Units Line Page")
            {
                ApplicationArea = All;
                Caption = 'Units Line Page';
                SubPageLink = "No." = field("No.");
            }
        }
    }
}
