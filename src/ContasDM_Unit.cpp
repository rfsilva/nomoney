//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ContasDM_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TContas_DataModule *Contas_DataModule;
//---------------------------------------------------------------------------
__fastcall TContas_DataModule::TContas_DataModule(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContas_DataModule::ContasClientDataSetCalcFields(
      TDataSet *DataSet)
{
        if(DataSet->FieldByName("SITUACAO")->AsInteger == 0)
                DataSet->FieldByName("PAGO")->AsString = "Não Pago";
        else
                DataSet->FieldByName("PAGO")->AsString = "Pago";

        if(DataSet->FieldByName("DESCRICAO")->AsString != "")
                DataSet->FieldByName("TIPOCONTA")->AsString = DataSet->FieldByName("TIPOCONTA")->AsString + " - " + DataSet->FieldByName("DESCRICAO")->AsString;

        if(DataSet->FieldByName("CREDITO")->AsString == "D")
                DataSet->FieldByName("CREDITOSTRING")->AsString = "Débito";
        else
                DataSet->FieldByName("CREDITOSTRING")->AsString = "Crédito";
}
//---------------------------------------------------------------------------

void TContas_DataModule::AtualizarContas(int ID, TDateTime DataInicio, TDateTime DataFim)
{
        ContasMes_ClientDataSet->Active = false;
        ContasMes_SQLQuery->Active = false;
        ContasMes_SQLQuery->Close();
        ContasMes_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        ContasMes_SQLQuery->ParamByName("DataInicio")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataInicio);
        ContasMes_SQLQuery->ParamByName("DataFim")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataFim);
        ContasMes_SQLQuery->Open();
        ContasMes_SQLQuery->Active = true;
        ContasMes_ClientDataSet->Active = true;

        ContasPagas_ClientDataSet->Active = false;
        ContasPagas_SQLQuery->Active = false;
        ContasPagas_SQLQuery->Close();
        ContasPagas_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        ContasPagas_SQLQuery->ParamByName("DataInicio")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataInicio);
        ContasPagas_SQLQuery->ParamByName("DataFim")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataFim);
        ContasPagas_SQLQuery->Open();
        ContasPagas_SQLQuery->Active = true;
        ContasPagas_ClientDataSet->Active = true;

        ContasAPagar_ClientDataSet->Active = false;
        ContasAPagar_SQLQuery->Active = false;
        ContasAPagar_SQLQuery->Close();
        ContasAPagar_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        ContasAPagar_SQLQuery->ParamByName("DataInicio")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataInicio);
        ContasAPagar_SQLQuery->ParamByName("DataFim")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataFim);
        ContasAPagar_SQLQuery->Open();
        ContasAPagar_SQLQuery->Active = true;
        ContasAPagar_ClientDataSet->Active = true;

        ContasAtrasadas_ClientDataSet->Active = false;
        ContasAtrasadas_SQLQuery->Active = false;
        ContasAtrasadas_SQLQuery->Close();
        ContasAtrasadas_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        ContasAtrasadas_SQLQuery->ParamByName("DataAtual")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(Now());
        ContasAtrasadas_SQLQuery->Open();
        ContasAtrasadas_SQLQuery->Active = true;
        ContasAtrasadas_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void TContas_DataModule::AtualizarContasMes(void)
{
        ContasMes_ClientDataSet->Active = false;
        ContasMes_SQLQuery->Active = false;
        ContasMes_SQLQuery->Close();
        ContasMes_SQLQuery->Open();
        ContasMes_SQLQuery->Active = true;
        ContasMes_ClientDataSet->Active = true;

        ContasPagas_ClientDataSet->Active = false;
        ContasPagas_SQLQuery->Active = false;
        ContasPagas_SQLQuery->Close();
        ContasPagas_SQLQuery->Open();
        ContasPagas_SQLQuery->Active = true;
        ContasPagas_ClientDataSet->Active = true;

        ContasAPagar_ClientDataSet->Active = false;
        ContasAPagar_SQLQuery->Active = false;
        ContasAPagar_SQLQuery->Close();
        ContasAPagar_SQLQuery->Open();
        ContasAPagar_SQLQuery->Active = true;
        ContasAPagar_ClientDataSet->Active = true;

        ContasAtrasadas_ClientDataSet->Active = false;
        ContasAtrasadas_SQLQuery->Active = false;
        ContasAtrasadas_SQLQuery->Close();
        ContasAtrasadas_SQLQuery->Open();
        ContasAtrasadas_SQLQuery->Active = true;
        ContasAtrasadas_ClientDataSet->Active = true;
}
