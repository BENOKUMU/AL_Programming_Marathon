table 50004 "Procurement Plan Lines"
{
    DataClassification = CustomerContent;
    // DrillDownPageID = "Procurement Plan Lines";
    // LookupPageID = "Procurement Plan Lines";

    fields
    {
        field(1; "Plan No"; Code[10])
        {
            DataClassification = CustomerContent;
            //NotBlank = true;
            trigger OnValidate()
            var
                ProcureHeader: Record "Procurement Plan Header";
            begin
                // if ProcureHeader.get("Plan No") then begin
                //     if ProcureHeader.status = ProcureHeader.status::Open then
                //         "Plan Status" := "Plan Status"::Open;
                // end;

            end;
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        // field(3; "Procurement Type"; Enum ProcurementType)
        // {

        //     trigger OnValidate()
        //     var
        //         GLAccount: Record "G/L Account";
        //     begin
        //         if "Procurement Type" = "Procurement Type"::Service then
        //             Type := Type::"G/L Account";


        //         if "Procurement Type" = "Procurement Type"::Goods then
        //             Type := Type::Item;

        //         if "Procurement Type" = "Procurement Type"::Works then
        //             Type := Type::"G/L Account";


        //         GLAccount.Reset();
        //         GLAccount.SetRange("No.", Rec."No.");
        //         if GLAccount.FindSet() then
        //             Description := GLAccount.Name;
        //     end;
        // }
        field(4; "Unit of Measure"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                SupplierCategory: Record "Supplier Category";
                procHeader: Record "Procurement Plan Header";
                procLine: Record "Procurement Plan Lines";


            begin

                "Estimated Cost" := Quantity * "Unit Price";
                if Category <> '' then begin
                    SupplierCategory.Get(Category);
                    if SupplierCategory."Is Special Group" = true then begin
                        "AGPO Reservation Est. Amnt." := "Estimated Cost";
                        if (procHeader."AGPO Reservation" <> 0) and (procHeader."Total Estimate" <> 0) then
                            procHeader."% of AGPO Reservation" := Round(procHeader."AGPO Reservation" / procHeader."Total Estimate" * 100);
                        // Message('%AGPO is %1, special %2, resevation is %3', procHeader."% of AGPO Reservation", "Estimated Cost", procHeader."AGPO Reservation");

                        // else  
                        // if SupplierCategory."Is Special Group" <> true then 
                        // "AGPO Reservation Est. Amnt." := 0.00;

                    end;


                end;
                // "AGPO Reservation Est. Amnt." := Quantity * "Unit Price";
            end;
        }
        field(6; "Procurement Method"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Procurement Method";
        }
        field(7; "Source of Funds"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(8; "Estimated Cost"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Advertisement Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Bid/Quotation Opening Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(11; "Proposal Evaluation date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(12; "Financial Opening date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(13; "Negotiation date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(14; "Notification of award date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(15; "Contract Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(16; "Contract End Date (Planned)"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(17; "Department Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(18; "TOR/Technical specs due Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(19; Description; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(20; Quantity; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Validate("Unit Price");
            end;
        }
        field(21; Category; code[20])
        {
            // FieldClass = FlowField;
            DataClassification = CustomerContent;
            TableRelation = "Supplier Category"."Category Code";

        }
        field(22; "Process Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ",Direct,RFQ,RFP,Tender;
        }
        field(23; "Approved Budget"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        // field(24; "Plan Status"; Enum "Document Status")
        // {
        //     DataClassification = CustomerContent;
        //     Caption = 'Status';
        //  DataClassification = CustomerContent;
        //             TableRelation = "Supplier Category"."Category Code" where("Is Special Group" = filter(true));
        //             trigger OnValidate()
        //             var
        //                 SupplierCategory: Record "Supplier Category";
        //             begin
        //                 if Category <> '' then
        //                 begin
        //                     SupplierCategory.Get(Category);
        //                     if SupplierCategory."Is Special Group" then
        //                     begin
        //                         "AGPO Reservation Est. Amnt." := "Estimated Cost" * Quantity;
        //                     end;
        //                 end;
        //             end;
        // }
        field(25; Type; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = " ","G/L Account",Item,"Fixed Asset","Charge (Item)";
        }
        field(26; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = IF (Type = CONST(" ")) "Standard Text"
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"
            ELSE
            IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF (Type = CONST("Charge (Item)")) "Item Charge";

            trigger OnValidate()
            begin
                if GLAcc.Get("No.") then begin

                end;

                if ItemRec.Get("No.") then begin
                    Description := ItemRec.Description;
                    "Unit of Measure" := ItemRec."Base Unit of Measure";
                    "Unit Price" := ItemRec."Last Direct Cost";
                end;

                if AssetRec.Get("No.") then begin
                    Description := AssetRec.Description;
                end;
            end;
        }
        field(27; Actual; Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No." = FIELD("Source of Funds")));
            FieldClass = FlowField;
        }
        field(28; Commitment; Decimal)
        {
            // CalcFormula = Sum("Commitment Register".Amount WHERE("Budget Line" = FIELD("Source of Funds")));
            // FieldClass = FlowField;
        }
        field(29; Manufacturer; text[50])
        {
            DataClassification = CustomerContent;
        }
        field(30; Model; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(31; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = CustomerContent;
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(32; "Global Dimension 3 Code"; code[20])
        {
            DataClassification = CustomerContent;
            CaptionClass = '1,2,3';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }

        field(40; "Q1 Qty"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(41; "Q2 Qty"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(42; "Q3 Qty"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(43; "Q4 Qty"; Decimal)
        {
            DataClassification = CustomerContent;
        }

        field(44; "Q1 Cost Estimate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(45; "Q2 Cost Estimate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(46; "Q3 Cost Estimate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(47; "Q4 Cost Estimate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(48; "AGPO Reservation Est. Amnt."; Decimal)
        {
            DataClassification = CustomerContent;

            // trigger OnValidate()
            // var

            //     procHeader: Record "Procurement Plan Header";
            // begin
            //     procHeader."% of AGPO Reservation" := procHeader."AGPO Reservation" / procHeader."Total Estimate" * 100;

            //     Message('%AGPO is %1', procHeader."% of AGPO Reservation");
            // end;
        }
    }

    keys
    {
        key(Key1; "Plan No", "Line No")
        {
            SumIndexFields = "Estimated Cost", "AGPO Reservation Est. Amnt.";
        }
        key(Key2; "Source of Funds")
        {
            SumIndexFields = "Estimated Cost", "AGPO Reservation Est. Amnt.";
        }
        key(key3; "Category")
        {
            SumIndexFields = "AGPO Reservation Est. Amnt.";
        }
    }

    var
        GLAcc: Record "G/L Account";
        ItemRec: Record Item;
        AssetRec: Record "Fixed Asset";
        CalculatePerc: Codeunit Percentage_Calculation;


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    local procedure PercentageAGPO()
    var
        ProcHeader: Record "Procurement Plan Header";
    begin
        ProcHeader."% of AGPO Reservation" := ProcHeader."AGPO Reservation" / ProcHeader."Total Estimate" * 100;
    end;
}
