//---------------------------------------------------------------------------

#ifndef Cheque_UnitH
#define Cheque_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include "BancoDM_Unit.h"
#include <DBCtrls.hpp>
#include "CadBanco_Unit.h"
//---------------------------------------------------------------------------
class TCadCheque_Dialog : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TBitBtn *BitBtn3;
        TEdit *NumeroCheque_Edit;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TLabel *Label2;
        TCheckBox *CheckBox2;
        TEdit *Agencia_Edit;
        TLabel *Label3;
        TLabel *Label4;
        TEdit *Conta_Edit;
        TDBLookupComboBox *Banco_DBLookupComboBox;
        TBitBtn *BitBtn4;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn4Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCadCheque_Dialog(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCadCheque_Dialog *CadCheque_Dialog;
//---------------------------------------------------------------------------
#endif
