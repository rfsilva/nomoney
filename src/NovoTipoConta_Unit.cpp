//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "NovoTipoConta_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TNovoTipoConta_Form *NovoTipoConta_Form;
//---------------------------------------------------------------------------
__fastcall TNovoTipoConta_Form::TNovoTipoConta_Form(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

AnsiString TNovoTipoConta_Form::GetTipoConta(void)
{
        return NovoTipoConta_Edit->Text.UpperCase();
}
void __fastcall TNovoTipoConta_Form::Fechar_BitBtnClick(TObject *Sender)
{
        NovoTipoConta_Edit->Text = "";
        Close();
}
//---------------------------------------------------------------------------
void __fastcall TNovoTipoConta_Form::Adicionar_BitBtnClick(TObject *Sender)
{
        bool Resultado;
        if(Situacao_ComboBox->Text.UpperCase() == "CRÉDITO")
                Resultado = Banco_DataModule->AdicionarTipoConta(NovoTipoConta_Edit->Text, "", "C");
        else
                Resultado = Banco_DataModule->AdicionarTipoConta(NovoTipoConta_Edit->Text, "", "D");

        if(!Resultado)
                Application->MessageBox("Este tipo de conta já existe.", "Erro", MB_OK + MB_ICONWARNING);
        else
                Close();
}
//---------------------------------------------------------------------------
