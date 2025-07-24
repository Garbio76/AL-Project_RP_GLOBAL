page 50000 DataModelLedger
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "G/L Entry";
    
    layout
    {
        area(Content)
        {
            repeater(Control)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    ToolTip = 'Entry No.';
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Posting Date';
                }
                field("Document Type"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Document Type';
                }
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    ToolTip = 'Document No.';
                }
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    Caption = 'G/L Account No.';
                    ToolTip = 'G/L Account No.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    Caption = 'G/L Account Name';
                    ToolTip = 'G/L Account Name';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ToolTip = 'Description';
                }
                field(Amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ToolTip = 'Amount';
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    Caption = 'Gen. Posting Type';
                    ToolTip = 'Gen. Posting Type';
                }

                field("Source Type"; Rec."Source Type")
                {
                    Caption = 'Source Type';
                    ToolTip = 'Source Type';
                }

                field("Source No."; Rec."Source No.")
                {
                    Caption = 'Source No.';
                    ToolTip = 'Source No';
                }

                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    Caption = 'Bal. Account Type';
                    ToolTip = 'Bal. Account Type';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    Caption = 'Bal. Account No.';
                    ToolTip = 'Bal. Account No.';
                }

                field("PROGETTO"; Rec."Global Dimension 1 Code")
                {
                    Caption = 'PROGETTO';
                    ToolTip = 'PROGETTO';
                }
                field("LINEA BUDGET"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'LINEA BUDGET';
                    ToolTip = 'LINEA BUDGET';
                }

                field("GRUPPO"; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'GRUPPO';
                    ToolTip = 'GRUPPO';
                }
                field("VARIATIONS GROUP"; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'VARIATIONS GROUP';
                    ToolTip = 'VARIATIONS GROUP';
                }
                field("VARIATIONS CODE"; Rec."Shortcut Dimension 5 Code")

                {
                    Caption = 'VARIATIONS CODE';
                    ToolTip = 'VARIATIONS CODE';
                }
                field("FA Entry Type"; Rec."FA Entry Type")

                {
                    Caption = 'FA Entry Type';
                    ToolTip = 'FA Entry Type';
                }
                field("FA Entry No."; Rec."FA Entry No.")

                {
                    Caption = 'FA Entry No.';
                    ToolTip = 'FA Entry No.';
                }
                field("Customer No."; CustNo)
                {
                    Caption = 'Customer No.';
                    ToolTip = 'Customer No.';

                }
                field("Customer Name"; CustName)
                {
                    Caption = 'Customer Name';
                    ToolTip = 'Customer Name';
                }
                field("Customer VAT"; CustVATNo)
                {
                    Caption = 'Customer VAT';
                    ToolTip = 'Customer VAT';
                }
                field("Customer Fiscal Code"; CustFiscCode)
                {
                    Caption = 'Customer Fiscal Code';
                    ToolTip = 'Customer Fiscal Code';
                }
                field("Customer Default Dimension"; CustDefDim)
                {
                    Caption = 'Customer Default Dimension';
                    ToolTip = 'Customer Default Dimension';
                }

                field("Vendor No."; VendNo)
                {
                    Caption = 'Vendor No.';
                    ToolTip = 'Vendor No.';
                }
                field("Vendor Name"; VendName)
                {
                    Caption = 'Vendor Name';
                    ToolTip = 'Vendor Name';
                }
                field("Vendor VAT"; VendVATNo)
                {
                    Caption = 'Vendor VAT';
                    ToolTip = 'Vendor VAT';
                }
                field("Vendor Fiscal Code"; VendFiscCode)
                {
                    Caption = 'Vendor Fiscal Code';
                    ToolTip = 'Vendor Fiscal Code';
                }
                field("Vendor Default Dimension"; VendDefDim)
                {
                    Caption = 'Vendor Default Dimension';
                    ToolTip = 'Vendor Default Dimension';
                }
                field("FA Posting No."; FAPostNo)
                {
                    Caption = 'FA Posting No.';
                    ToolTip = 'FA Posting No.';
                }

                field("FA Posting Type"; FAPostType)
                {
                    Caption = 'FA Posting Type';
                    ToolTip = 'FA Posting Type';
                }
            }

        }

    }
    var
        lRcCustomer: Record Customer;
        lRcVendor: Record Vendor;
        lRcFALedgerEntry: Record "FA Ledger Entry";
        lRcDefDim: Record "Default Dimension";
        CustNo, CustFiscCode, CustDefDim, VendNo, VendFiscCode, VendDefDim : Code[20];
        CustName, VendName : Text[100];
        CustVATNo, VendVATNo : Text[20];
        FAPostNo: Integer;
        FAPostType: Enum "FA Ledger Entry FA Posting Type";

    trigger OnAfterGetRecord()
    
    begin
        
        CustNo := '';
        CustName := '';
        CustVATNo := '';
        CustFiscCode := '';
        CustDefDim := '';
        VendNo := '';
        VendName := '';
        VendVATNo := '';
        VendFiscCode := '';
        VendDefDim := '';
        FAPostNo := 0;

        case Rec."Source Type" of
            "Gen. Journal Source Type"::Customer:

                begin
                    ;
                    lRcCustomer.Reset();
                    lRcCustomer.SetRange("No.", rec."Source No.");
                    if lRcCustomer.FindFirst() then
                        CustNo := lRcCustomer."No.";
                    CustName := lRcCustomer.Name;
                    CustVATNo := lRcCustomer."VAT Registration No.";
                    CustFiscCode := lRcCustomer."Fiscal Code";
                    lRcDefDim.SetRange("Table ID", 18);
                    lRcDefDim.SetFilter("No.", Rec."Source No.");
                    if lRcDefDim.FindFirst() then
                        CustDefDim := lRcDefDim."Dimension Value Code";
                end;
        end;

        case Rec."Source Type" of
            "Gen. Journal Source Type"::Vendor:

                begin
                    ;
                    lRcVendor.Reset();
                    lRcVendor.SetRange("No.", rec."Source No.");
                    if lRcVendor.FindFirst() then
                        VendNo := lRcVendor."No.";
                    VendName := lRcVendor.Name;
                    VendVATNo := lRcVendor."VAT Registration No.";
                    VendFiscCode := lRcVendor."Fiscal Code";
                    lRcDefDim.SetRange("Table ID", 23);
                    lRcDefDim.SetFilter("No.", Rec."Source No.");
                    if lRcDefDim.FindFirst() then
                        VendDefDim := lRcDefDim."Dimension Value Code";
                end;
        end;

        case Rec."Source Type" of
            "Gen. Journal Source Type"::"Fixed Asset":
                begin
                    ;
                    lRcFALedgerEntry.Reset();
                    lRcFALedgerEntry.SetRange("Entry No.", rec."FA Entry No.");
                    if lRcFALedgerEntry.FindFirst() then
                        FAPostNo := lRcFALedgerEntry."Entry No.";
                    FAPostType := lRcFALedgerEntry."FA Posting Type";


                end;
        end;
    end;
}
