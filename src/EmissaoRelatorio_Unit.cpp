//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EmissaoRelatorio_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEmissaoRelatorio_Dialog *EmissaoRelatorio_Dialog;
//---------------------------------------------------------------------------
__fastcall TEmissaoRelatorio_Dialog::TEmissaoRelatorio_Dialog(TComponent* Owner)
        : TForm(Owner)
{
        Opcao = -1;
        Titulo = "NADA";
}
//---------------------------------------------------------------------------
void __fastcall TEmissaoRelatorio_Dialog::Cancelar_BitBtnClick(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::Emitir_BitBtnClick(TObject *Sender)
{
        if(Titulo != "NADA")
        {
                RelatorioFinanceiro_DataModule->EmitirRelatorio(Opcao, Mes_Label->Caption, Usuario);
                Close();
        }
        else
                Application->MessageBox("Selecione uma Opção.","ERRO",MB_ICONWARNING + MB_OK);
}
//---------------------------------------------------------------------------

void TEmissaoRelatorio_Dialog::Personalizar(AnsiString Mes, int AnoAtual, int MesAtual, int ID, AnsiString Usuario)
{
        Mes_Label->Caption = Mes;
        this->Usuario = Usuario;
        this->AnoAtual = AnoAtual;
        this->MesAtual = MesAtual;
        this->ID = ID;
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasAbertas_RadioButtonClick(
      TObject *Sender)
{
        Titulo = EntradasAbertas_RadioButton->Caption;
        Opcao = ENTRADAS_ABERTAS;
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasFechadas_RadioButtonClick(
      TObject *Sender)
{
        Titulo = EntradasFechadas_RadioButton->Caption;
        Opcao = ENTRADAS_FECHADAS;
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::Extrato_RadioButtonClick(
      TObject *Sender)
{
        Titulo = Extrato_RadioButton->Caption;
        Opcao = TODAS_ENTRADAS;
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasAbertas_RadioButtonDblClick(
      TObject *Sender)
{
        Titulo = EntradasAbertas_RadioButton->Caption;
        Opcao = ENTRADAS_ABERTAS;
        Emitir_BitBtnClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasFechadas_RadioButtonDblClick(
      TObject *Sender)
{
        Titulo = EntradasFechadas_RadioButton->Caption;
        Opcao = ENTRADAS_FECHADAS;
        Emitir_BitBtnClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::Extrato_RadioButtonDblClick(
      TObject *Sender)
{
        Titulo = Extrato_RadioButton->Caption;
        Opcao = TODAS_ENTRADAS;
        Emitir_BitBtnClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasAtrasadas_RadioButtonDblClick(
      TObject *Sender)
{
        Titulo = Extrato_RadioButton->Caption;
        Opcao = ENTRADAS_ATRASADAS;
        Emitir_BitBtnClick(this);
}
//---------------------------------------------------------------------------

void __fastcall TEmissaoRelatorio_Dialog::EntradasAtrasadas_RadioButtonClick(
      TObject *Sender)
{
        Titulo = EntradasAtrasadas_RadioButton->Caption;
        Opcao = ENTRADAS_ATRASADAS;
}
//---------------------------------------------------------------------------

