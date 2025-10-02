//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RelatorioFinanceiroDM_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RpBase"
#pragma link "RpDefine"
#pragma link "RpRave"
#pragma link "RpSystem"
#pragma link "RpCon"
#pragma link "RpConDS"
#pragma link "RpRender"
#pragma link "RpRenderHTML"
#pragma link "RpRenderPDF"
#pragma link "RpRenderRTF"
#pragma link "RpRenderText"
#pragma resource "*.dfm"
TRelatorioFinanceiro_DataModule *RelatorioFinanceiro_DataModule;
//---------------------------------------------------------------------------
__fastcall TRelatorioFinanceiro_DataModule::TRelatorioFinanceiro_DataModule(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void TRelatorioFinanceiro_DataModule::EmitirRelatorio(int Tipo, AnsiString MesAno, AnsiString Usuario)
{
        AnsiString TipoRelatorio;
        AnsiString Versao = "Versão ";
        Versao += AboutBox->Versao_Label->Caption;

        switch(Tipo)
        {
                case ENTRADAS_ABERTAS:
                        TipoRelatorio = "Relatório Financeiro - Contas a Pagar";
                        Contas_RvDataSetConnection->DataSet = Contas_DataModule->ContasAPagar_ClientDataSet;
                        break;
                case ENTRADAS_FECHADAS:
                        TipoRelatorio = "Relatório Financeiro - Contas Pagas";
                        Contas_RvDataSetConnection->DataSet = Contas_DataModule->ContasPagas_ClientDataSet;
                        break;
                case ENTRADAS_ATRASADAS:
                        TipoRelatorio = "Relatório Financeiro - Contas Atrasadas";
                        Contas_RvDataSetConnection->DataSet = Contas_DataModule->ContasAtrasadas_ClientDataSet;
                        break;
                case TODAS_ENTRADAS:
                        TipoRelatorio = "Relatório Financeiro - Todas as Contas";
                        Contas_RvDataSetConnection->DataSet = Contas_DataModule->ContasMes_ClientDataSet;
                        break;
        }

        RelatorioFinanceiro_RvProject->SetParam("Usuario", Usuario);
        RelatorioFinanceiro_RvProject->SetParam("MesAno", MesAno);
        RelatorioFinanceiro_RvProject->SetParam("Versao", Versao);
        RelatorioFinanceiro_RvProject->SetParam("TipoRelatorio", TipoRelatorio);
        RelatorioFinanceiro_RvProject->ExecuteReport("RelatorioFinanceiro");
}

