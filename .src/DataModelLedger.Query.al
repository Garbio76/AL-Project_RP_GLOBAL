query 50000 DataModelLedger

{
    QueryType = Normal;


    elements
    {
        dataitem(G_L_Entry; "G/L Entry")
        {
            column(Entry_No_; "Entry No.") { }
            column(Posting_Date; "Posting Date") { }
            column(Document_Type; "Document Type") { }
            column(Document_No_; "Document No.") { }
            column(G_L_Account_No_; "G/L Account No.") { }
            column(G_L_Account_Name; "G/L Account Name") { }
            column(Description; Description) { }
            column(Amount; Amount) { }
            column(Gen__Posting_Type; "Gen. Posting Type") { }
            column(Source_Type; "Source Type") { }
            column(Source_No_; "Source No.") { }
            column(Bal__Account_Type; "Bal. Account Type") { }
            column(Bal__Account_No_; "Bal. Account No.") { }
            column(PROGETTO; "Global Dimension 1 Code") { Caption = 'PROGETTO'; }
            column(LINEA_BUDGET; "Global Dimension 2 Code") { Caption = 'LINEA BUDGET'; }
            column(GRUPPO; "Shortcut Dimension 3 Code") { Caption = 'GRUPPO'; }
            column(VARIATIONS_GROUP; "Shortcut Dimension 4 Code") { Caption = 'VARIATIONS GROUP'; }
            column(VARIATIONS_CODE; "Shortcut Dimension 5 Code") { Caption = 'VARIATIONS CODE'; }
            column(Shortcut_Dimension_6_Code; "Shortcut Dimension 6 Code") { }
            column(Shortcut_Dimension_7_Code; "Shortcut Dimension 7 Code") { }
            column(Shortcut_Dimension_8_Code; "Shortcut Dimension 8 Code") { }
            column(FA_Entry_No_; "FA Entry No.") { }
            column(FA_Entry_Type; "FA Entry Type") { }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = G_L_Entry."Source No.";
                SqlJoinType = LeftOuterJoin;

                column(No_Customer; "No.") { }
                column(Name_Customer; Name) { }
                column(VAT_Registration_No_Customer; "VAT Registration No.") { }
                column(Fiscal_Code_Customer; "Fiscal Code") { }
                

                dataitem(Default_Dimension_Customer; "Default Dimension")
                {
                    DataItemLink = "No." = Customer."No.";
                    SqlJoinType = LeftOuterJoin;
                    DataItemTableFilter = "Table ID" = const(18);

                    column(Dimension_Value_Code_Customer; "Dimension Value Code") { }

                    dataitem(Vendor; Vendor)

                    {
                        DataItemLink = "No." = G_L_Entry."Source No.";
                        SqlJoinType = LeftOuterJoin;
                        column(No_Vendor; "No.") { }
                        column(Name_Vendor; Name) { }
                        column(VAT_Registration_No_Vendor; "VAT Registration No.") { }
                        column(Fiscal_Code_Vendor; "Fiscal Code") { }

                        dataitem(Default_Dimension_Vendor; "Default Dimension")
                        {
                            DataItemLink = "No." = Vendor."No.";
                            SqlJoinType = LeftOuterJoin;
                            DataItemTableFilter = "Table ID" = const(23);

                            column(Dimension_Value_Code_Vendor; "Dimension Value Code") { }

                            dataitem(FA_Ledger_Entry; "FA Ledger Entry")
                            {
                                DataItemLink = "Entry No." = G_L_Entry."FA Entry No.", "G/L Entry No." = G_L_Entry."Entry No.";
                                SqlJoinType = LeftOuterJoin;

                                column(FA_Entry_No; "Entry No.") { }
                                column(FA_Posting_Type; "FA Posting Type") { }

                            }

                        }
                    }

                }

            }

        }
    }

}