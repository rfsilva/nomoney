//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BancoDM_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TBanco_DataModule *Banco_DataModule;
//---------------------------------------------------------------------------
__fastcall TBanco_DataModule::TBanco_DataModule(TComponent* Owner)
        : TDataModule(Owner)
{
        Conexao_DataModule->AtivarDataModule(this,Conexao_DataModule->Conexao_SQLConnection,true);
}
//---------------------------------------------------------------------------

bool TBanco_DataModule::ChecarLoginUser(AnsiString Login, AnsiString Senha)
{
        TLocateOptions lo;
        lo.Clear();
        lo << loCaseInsensitive;

        TDateTime DataAtual = Now();
        Word Ano, Mes, Dia;
        DecodeDate(DataAtual, Ano, Mes, Dia);

        Variant locvalues[2];
        locvalues[0] = Login;
        locvalues[1] = Senha;

        if(Login_ClientDataSet->Locate("LOGIN;SENHA", VarArrayOf(locvalues, 1), lo) == true)
        {
                Pessoa_ClientDataSet->Locate("ID", Login_ClientDataSet->FieldByName("ID")->AsInteger, lo);
                Principal_Form->SetNome(Pessoa_ClientDataSet->FieldByName("PRIMEIRO_NOME")->AsString);
                PrepararContasDados(Login_ClientDataSet->FieldByName("ID")->AsInteger, Mes, Ano);
                return true;
        }
        else
                return false;
}
//---------------------------------------------------------------------------

bool TBanco_DataModule::ChecarLoginAdmin(AnsiString Login, AnsiString Senha)
{
        TLocateOptions lo;
        lo.Clear();
        lo << loCaseInsensitive;

        Variant locvalues[2];
        locvalues[0] = Login;
        locvalues[1] = Senha;

        if(Administrador_ClientDataSet->Locate("LOGIN;SENHA", VarArrayOf(locvalues, 1), lo) == true)
        {
                Principal_Form->SetNome("Rodrigo");
                return true;
        }
        else
                return false;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::PrepararContasDados(int ID, int Mes, int Ano)
{
        TDateTime DataInicio, DataFim;
        DataInicio = EncodeDate(Ano, Mes, 1);

        Word DiaT, MesT, AnoT;
        DataFim = EncodeDate(Ano, Mes, 28);
        Word MesAtual = MesT = Mes;

        // Pegar ultimo dia do mes
        while(MesT == MesAtual)
        {
                DataFim = DataFim + 1;
                DecodeDate(DataFim, AnoT, MesT, DiaT);
        }
        DataFim = DataFim - 1;
        DecodeDate(DataFim, AnoT, MesT, DiaT);
        DataFim = EncodeDate(Ano, Mes, DiaT);

        Contas_DataModule->AtualizarContas(ID, DataInicio, DataFim);
}
//---------------------------------------------------------------------------

TDateTime TBanco_DataModule::SetarParametrosProc(void)
{
        TDateTime UltimaDataMesPassado = Now();
        Word Dia, Mes, Ano;
        DecodeDate(UltimaDataMesPassado, Ano, Mes, Dia);
        Word MesAtual = Mes;

        while(Mes == MesAtual)
        {
                UltimaDataMesPassado = UltimaDataMesPassado - 1;
                DecodeDate(UltimaDataMesPassado, Ano, Mes, Dia);
        }

        return UltimaDataMesPassado;
}
//---------------------------------------------------------------------------


void TBanco_DataModule::ExcluirConta(int ID, int Codigo)
{
        TLocateOptions lo;
        lo.Clear();

        lo << loCaseInsensitive;
        TipoConta_ClientDataSet->Locate("TIPO", "CHEQUE", lo);

        Variant locvalues[2];
        locvalues[0] = ID;
        locvalues[1] = Codigo;

        if(Conta_ClientDataSet->Locate("ID;CODIGO", VarArrayOf(locvalues, 1), lo) == true)
        {
                if(Conta_ClientDataSet->FieldByName("TIPOCONTA")->AsInteger == TipoConta_ClientDataSet->FieldByName("CODIGO")->AsInteger)// cheque
                {
                        if(Cheque_ClientDataSet->Locate("CODCONTA", Codigo, lo))
                        {
                                Cheque_ClientDataSet->Delete();
                                Cheque_ClientDataSet->ApplyUpdates(-1);
                                Cheque_ClientDataSet->Refresh();
                        }
                }

                Conta_ClientDataSet->Delete();
                Conta_ClientDataSet->ApplyUpdates(-1);
                Conta_ClientDataSet->Refresh();

                AtualizarConta();
        }
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarConta(void)
{
        Contas_DataModule->AtualizarContasMes();
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarStatusConta(int ID, int Conta, int NovoStatus)
{
        TLocateOptions lo;
        lo.Clear();

        Variant locvalues[2];
        locvalues[0] = ID;
        locvalues[1] = Conta;

        Conta_ClientDataSet->Locate("ID;CODIGO", VarArrayOf(locvalues, 1), lo);
        Conta_ClientDataSet->Edit();
        Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger = NovoStatus;
        Conta_ClientDataSet->Post();
        Conta_ClientDataSet->ApplyUpdates(-1);
        Conta_ClientDataSet->Refresh();

        AtualizarConta();
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtivarQueriesApoio(void)
{
        AtualizarTipoConta();
        AtualizarMoeda();
}
//---------------------------------------------------------------------------


void __fastcall TBanco_DataModule::QPessoa_ClientDataSetCalcFields(
      TDataSet *DataSet)
{
        QPessoa_ClientDataSet->FieldByName("DIA_STRING")->AsString = "Todo dia " + IntToStr(QPessoa_ClientDataSet->FieldByName("DIA_PAGTO")->AsInteger);

        if(QPessoa_ClientDataSet->FieldByName("SEXO")->AsString == "M")
                QPessoa_ClientDataSet->FieldByName("SEXO_STRING")->AsString = "Masculino";
        else
                QPessoa_ClientDataSet->FieldByName("SEXO_STRING")->AsString = "Feminino";

        QPessoa_ClientDataSet->FieldByName("NOMECOMPLETO")->AsString = QPessoa_ClientDataSet->FieldByName("PRIMEIRO_NOME")->AsString + " " + QPessoa_ClientDataSet->FieldByName("SOBRENOME")->AsString;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarDadosPessoais(int ID)
{
        AtualizarPessoa(ID);
        AtualizarTelefone(ID);
        AtualizarEndereco(ID);
}
//---------------------------------------------------------------------------

void __fastcall TBanco_DataModule::QTelefone_ClientDataSetCalcFields(
      TDataSet *DataSet)
{
        QTelefone_ClientDataSet->FieldByName("TELEFONE_STR")->AsString = "(" + IntToStr(QTelefone_ClientDataSet->FieldByName("DDD")->AsInteger) + ") " + QTelefone_ClientDataSet->FieldByName("TELEFONE")->AsString;
}
//---------------------------------------------------------------------------


void __fastcall TBanco_DataModule::QEndereco_ClientDataSetCalcFields(
      TDataSet *DataSet)
{
        QEndereco_ClientDataSet->FieldByName("ENDERECO_STRING")->AsString = QEndereco_ClientDataSet->FieldByName("SIGLATIPO")->AsString + " " + QEndereco_ClientDataSet->FieldByName("ENDERECO")->AsString + ", " + IntToStr(QEndereco_ClientDataSet->FieldByName("NUMERO")->AsInteger); 
        QEndereco_ClientDataSet->FieldByName("ESTADO_STRING")->AsString = QEndereco_ClientDataSet->FieldByName("SIGLAESTADO")->AsString + " - " + QEndereco_ClientDataSet->FieldByName("ESTADO")->AsString;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarContasDivididas(int Ano, int Mes, int ID, int Tipo)
{
        TDateTime DataInicio, DataFim;
        DataInicio = EncodeDate(Ano, Mes, 1);

        Word DiaT, MesT, AnoT;
        DataFim = EncodeDate(Ano, Mes, 28);
        Word MesAtual = MesT = Mes;

        // Pegar ultimo dia do mes
        while(MesT == MesAtual)
        {
                DataFim = DataFim + 1;
                DecodeDate(DataFim, AnoT, MesT, DiaT);
        }
        DataFim = DataFim - 1;
        DecodeDate(DataFim, AnoT, MesT, DiaT);
        DataFim = EncodeDate(Ano, Mes, DiaT);

        ContasDivididas_ClientDataSet->Active = false;
        ContasDivididas_SQLQuery->Active = false;
        ContasDivididas_SQLQuery->Close();
        ContasDivididas_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        ContasDivididas_SQLQuery->ParamByName("DataInicio")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataInicio);
        ContasDivididas_SQLQuery->ParamByName("DataFim")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(DataFim);
        ContasDivididas_SQLQuery->ParamByName("TipoConta")->AsString = Tipo;
        ContasDivididas_SQLQuery->Open();
        ContasDivididas_SQLQuery->Active = true;
        ContasDivididas_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void __fastcall TBanco_DataModule::ContasDivididas_ClientDataSetCalcFields(
      TDataSet *DataSet)
{
        if(ContasDivididas_ClientDataSet->FieldByName("SITUACAO")->AsInteger == 0)
                ContasDivididas_ClientDataSet->FieldByName("PAGO")->AsString = "Não Pago";
        else
                ContasDivididas_ClientDataSet->FieldByName("PAGO")->AsString = "Pago";

        if(ContasDivididas_ClientDataSet->FieldByName("DESCRICAO")->AsString != "")
                ContasDivididas_ClientDataSet->FieldByName("TIPOCONTA")->AsString = ContasDivididas_ClientDataSet->FieldByName("TIPOCONTA")->AsString + " - " + ContasDivididas_ClientDataSet->FieldByName("DESCRICAO")->AsString;

        if(ContasDivididas_ClientDataSet->FieldByName("CREDITO")->AsString == "D")
                ContasDivididas_ClientDataSet->FieldByName("CREDITOSTRING")->AsString = "Débito";
        else
                ContasDivididas_ClientDataSet->FieldByName("CREDITOSTRING")->AsString = "Crédito";
}
//---------------------------------------------------------------------------

bool TBanco_DataModule::AdicionarTipoConta(AnsiString Nome, AnsiString Descricao, AnsiString Situacao)
{
        if(!ExisteTipoConta(Nome))
        {
                TipoConta_ClientDataSet->Append();
                TipoConta_ClientDataSet->FieldByName("TIPO")->AsString = Nome;
                TipoConta_ClientDataSet->FieldByName("DESCRICAO")->AsString = Descricao;
                //VERIFICAR CATEGORIA ... NÃO IMPLEMENTADO
                TipoConta_ClientDataSet->FieldByName("CATEGORIA")->AsInteger = 2;
                TipoConta_ClientDataSet->FieldByName("SITUACAO")->AsString = Situacao;
                TipoConta_ClientDataSet->Post();
                TipoConta_ClientDataSet->ApplyUpdates(-1);
                TipoConta_ClientDataSet->Refresh();

                AtualizarTipoConta();
                return true;
        }
        else
                return false;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarTipoConta(void)
{
        QTipoConta_ClientDataSet->Active = false;
        QTipoConta_SQLQuery->Active = false;
        QTipoConta_SQLQuery->Close();
        QTipoConta_SQLQuery->Open();
        QTipoConta_SQLQuery->Active = true;
        QTipoConta_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarMoeda(void)
{
        QMoeda_ClientDataSet->Active = false;
        QMoeda_SQLQuery->Active = false;
        QMoeda_SQLQuery->Close();
        QMoeda_SQLQuery->Open();
        QMoeda_SQLQuery->Active = true;
        QMoeda_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarPessoa(int ID)
{
        QPessoa_ClientDataSet->Active = false;
        QPessoa_SQLQuery->Active = false;
        QPessoa_SQLQuery->Close();
        QPessoa_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        QPessoa_SQLQuery->Open();
        QPessoa_SQLQuery->Active = true;
        QPessoa_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarTelefone(int ID)
{
        QTelefone_ClientDataSet->Active = false;
        QTelefone_SQLQuery->Active = false;
        QTelefone_SQLQuery->Close();
        QTelefone_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        QTelefone_SQLQuery->Open();
        QTelefone_SQLQuery->Active = true;
        QTelefone_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

void TBanco_DataModule::AtualizarEndereco(int ID)
{
        QEndereco_ClientDataSet->Active = false;
        QEndereco_SQLQuery->Active = false;
        QEndereco_SQLQuery->Close();
        QEndereco_SQLQuery->ParamByName("CodID")->AsInteger = ID;
        QEndereco_SQLQuery->Open();
        QEndereco_SQLQuery->Active = true;
        QEndereco_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------

bool TBanco_DataModule::ExisteTipoConta(AnsiString Nome)
{
        TLocateOptions lo;
        lo.Clear();

        return TipoConta_ClientDataSet->Locate("TIPO", Nome, lo);
}
