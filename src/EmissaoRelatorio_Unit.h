//---------------------------------------------------------------------------

#ifndef EmissaoRelatorio_UnitH
#define EmissaoRelatorio_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include "RelatorioFinanceiroDM_Unit.h"
#include <ExtCtrls.hpp>

//---------------------------------------------------------------------------
class TEmissaoRelatorio_Dialog : public TForm
{
__published:	// IDE-managed Components
        TBitBtn *Cancelar_BitBtn;
        TBitBtn *Emitir_BitBtn;
        TRadioGroup *Relatorio_RadioGroup;
        TRadioButton *Extrato_RadioButton;
        TRadioButton *EntradasAbertas_RadioButton;
        TRadioButton *EntradasFechadas_RadioButton;
        TLabel *Mes;
        TLabel *Mes_Label;
        TRadioButton *EntradasAtrasadas_RadioButton;
        void __fastcall Cancelar_BitBtnClick(TObject *Sender);
        void __fastcall Emitir_BitBtnClick(TObject *Sender);
        void __fastcall EntradasAbertas_RadioButtonClick(TObject *Sender);
        void __fastcall EntradasFechadas_RadioButtonClick(TObject *Sender);
        void __fastcall Extrato_RadioButtonClick(TObject *Sender);
        void __fastcall EntradasAbertas_RadioButtonDblClick(
          TObject *Sender);
        void __fastcall EntradasFechadas_RadioButtonDblClick(
          TObject *Sender);
        void __fastcall Extrato_RadioButtonDblClick(TObject *Sender);
        void __fastcall EntradasAtrasadas_RadioButtonDblClick(TObject *Sender);
        void __fastcall EntradasAtrasadas_RadioButtonClick(TObject *Sender);
private:	// User declarations
        int Opcao;
        AnsiString Titulo;
        AnsiString Usuario;
        int AnoAtual,
            MesAtual,
            ID;
public:		// User declarations
        __fastcall TEmissaoRelatorio_Dialog(TComponent* Owner);
        void Personalizar(AnsiString Mes, int AnoAtual, int MesAtual, int ID, AnsiString Usuario);
};
//---------------------------------------------------------------------------
extern PACKAGE TEmissaoRelatorio_Dialog *EmissaoRelatorio_Dialog;
//---------------------------------------------------------------------------
#endif
