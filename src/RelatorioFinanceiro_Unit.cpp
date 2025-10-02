//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RelatorioFinanceiro_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRelatorioFinanceiro_Form *RelatorioFinanceiro_Form;
//---------------------------------------------------------------------------
__fastcall TRelatorioFinanceiro_Form::TRelatorioFinanceiro_Form(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void TRelatorioFinanceiro_Form::Personalizar(AnsiString Titulo, AnsiString MesSelecionado, TClientDataSet *Relatorio_ClientDataSet)
{
        Titulo_QRLabel->Caption = Titulo;
        Mes_QRLabel->Caption = MesSelecionado;
        Usuario_QRLabel->Caption = Banco_DataModule->QPessoa_ClientDataSet->FieldByName("NOMECOMPLETO")->AsString;

        Detalhes_SubDetail->DataSet = Relatorio_ClientDataSet;
        Conta_QRDBText->DataSet = Relatorio_ClientDataSet;
        Moeda_QRDBText->DataSet = Relatorio_ClientDataSet;
        Valor_QRDBText->DataSet = Relatorio_ClientDataSet;
        Vencimento_QRDBText->DataSet = Relatorio_ClientDataSet;
        Situacao_QRDBText->DataSet = Relatorio_ClientDataSet;
        Tipo_QRDBText->DataSet = Relatorio_ClientDataSet;
}
