//---------------------------------------------------------------------------

#ifndef NovoTipoConta_UnitH
#define NovoTipoConta_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "BancoDM_Unit.h"
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TNovoTipoConta_Form : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TEdit *NovoTipoConta_Edit;
        TComboBox *Situacao_ComboBox;
        TLabel *TipoConta_Label;
        TLabel *Label1;
        TBitBtn *Adicionar_BitBtn;
        TBitBtn *Fechar_BitBtn;
        void __fastcall Fechar_BitBtnClick(TObject *Sender);
        void __fastcall Adicionar_BitBtnClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TNovoTipoConta_Form(TComponent* Owner);
        AnsiString GetTipoConta(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TNovoTipoConta_Form *NovoTipoConta_Form;
//---------------------------------------------------------------------------
#endif
