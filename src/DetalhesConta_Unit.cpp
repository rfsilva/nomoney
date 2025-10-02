//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DetalhesConta_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDetalhesConta_Dialog *DetalhesConta_Dialog;
//---------------------------------------------------------------------------
__fastcall TDetalhesConta_Dialog::TDetalhesConta_Dialog(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void TDetalhesConta_Dialog::Personalizar(int Status, int ID, int Conta)
{
        TLocateOptions lo;
        lo.Clear();

        Banco_DataModule->AtivarQueriesApoio();
        PopularComboBoxes();

        Variant locvalues[2];
        locvalues[0] = ID;
        locvalues[1] = Conta;

        if(Status == ADICAO)
        {
                Banco_DataModule->Conta_ClientDataSet->Append();
                Banco_DataModule->Conta_ClientDataSet->FieldByName("ID")->AsInteger = ID;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("VENCIMENTO")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(Now().CurrentDate());
                Caption = "Adição";
        }
        else
        {
                Banco_DataModule->Conta_ClientDataSet->Locate("ID;CODIGO", VarArrayOf(locvalues, 1), lo);
                Banco_DataModule->QMoeda_ClientDataSet->Locate("CODIGO", Banco_DataModule->Conta_ClientDataSet->FieldByName("MOEDA")->AsInteger, lo);
                Banco_DataModule->QTipoConta_ClientDataSet->Locate("CODIGO", Banco_DataModule->Conta_ClientDataSet->FieldByName("TIPOCONTA")->AsInteger, lo);

                TipoConta_ComboBox->Text = Banco_DataModule->QTipoConta_ClientDataSet->FieldByName("TIPO")->AsString;
                Moeda_ComboBox->Text = Banco_DataModule->QMoeda_ClientDataSet->FieldByName("NOME")->AsString;

                if(Banco_DataModule->Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger == 0)
                        Status_ComboBox->Text = "Não Pago";
                else
                        Status_ComboBox->Text = "Pago";

                Banco_DataModule->Conta_ClientDataSet->Edit();
                Caption = "Edição";
        }
}
//---------------------------------------------------------------------------

void __fastcall TDetalhesConta_Dialog::BitBtn2Click(TObject *Sender)
{
        TLocateOptions lo;
        lo.Clear();

        lo << loCaseInsensitive;

        if(Status_ComboBox->Text == "Pago")
                Banco_DataModule->Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger = 1;
        else
                Banco_DataModule->Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger = 0;

        Banco_DataModule->QTipoConta_ClientDataSet->Locate("TIPO", TipoConta_ComboBox->Text, lo);
        Banco_DataModule->QMoeda_ClientDataSet->Locate("NOME", Moeda_ComboBox->Text, lo);

        Banco_DataModule->Conta_ClientDataSet->FieldByName("TIPOCONTA")->AsInteger = Banco_DataModule->QTipoConta_ClientDataSet->FieldByName("CODIGO")->AsInteger;
        Banco_DataModule->Conta_ClientDataSet->FieldByName("MOEDA")->AsInteger = Banco_DataModule->QMoeda_ClientDataSet->FieldByName("CODIGO")->AsInteger;

        int ID = Banco_DataModule->Conta_ClientDataSet->FieldByName("ID")->AsInteger;
        int Tipo = Banco_DataModule->Conta_ClientDataSet->FieldByName("TIPOCONTA")->AsInteger;
        int Moeda = Banco_DataModule->Conta_ClientDataSet->FieldByName("MOEDA")->AsInteger;
        TDateTime Vencimento = SQLTimeStampToDateTime(Banco_DataModule->Conta_ClientDataSet->FieldByName("VENCIMENTO")->AsSQLTimeStamp);
        AnsiString Descricao = Banco_DataModule->Conta_ClientDataSet->FieldByName("DESCRICAO")->AsString;
        float Valor = Banco_DataModule->Conta_ClientDataSet->FieldByName("VALOR")->AsFloat;
        int Situacao = Banco_DataModule->Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger;

        Banco_DataModule->Conta_ClientDataSet->Post();
        Banco_DataModule->Conta_ClientDataSet->ApplyUpdates(-1);
        Banco_DataModule->Conta_ClientDataSet->Refresh();

        Variant locvalues[7];
        locvalues[0] = ID;
        locvalues[1] = Tipo;
        locvalues[2] = Moeda;
        locvalues[3] = Vencimento;
        locvalues[4] = Descricao;
        locvalues[5] = Valor;
        locvalues[6] = Situacao;

        Banco_DataModule->Conta_ClientDataSet->Locate("ID;TIPOCONTA;MOEDA;VENCIMENTO;DESCRICAO;VALOR;SITUACAO", VarArrayOf(locvalues, 6), lo);
        Principal_Form->GetCodigoConta(Banco_DataModule->Conta_ClientDataSet->FieldByName("CODIGO")->AsInteger);

        if(Estender_CheckBox->Checked)
                EstenderAteOFimDoAno(ID, Tipo, Moeda, Vencimento, Descricao, Valor, Situacao);

        Close();
}
//---------------------------------------------------------------------------

void __fastcall TDetalhesConta_Dialog::BitBtn1Click(TObject *Sender)
{
        Banco_DataModule->Conta_ClientDataSet->Cancel();
        Banco_DataModule->Conta_ClientDataSet->CancelUpdates();
        Close();
}
//---------------------------------------------------------------------------

void TDetalhesConta_Dialog::PopularComboBoxes(void)
{
        if(Banco_DataModule->QMoeda_ClientDataSet->FindFirst())
        {
                do
                {
                        Moeda_ComboBox->Items->Add(Banco_DataModule->QMoeda_ClientDataSet->FieldByName("NOME")->AsString);
                }while(Banco_DataModule->QMoeda_ClientDataSet->FindNext());
        }

        TipoConta_ComboBox->Clear();
        if(Banco_DataModule->QTipoConta_ClientDataSet->FindFirst())
        {
                do
                {
                        TipoConta_ComboBox->Items->Add(Banco_DataModule->QTipoConta_ClientDataSet->FieldByName("TIPO")->AsString);
                }while(Banco_DataModule->QTipoConta_ClientDataSet->FindNext());
                if(NovoTipoConta != "")
                        TipoConta_ComboBox->Text = NovoTipoConta;
        }

        AnsiString ComboBoxSituacao[2];
        ComboBoxSituacao[0] = "Não Pago";
        ComboBoxSituacao[1] = "Pago";

        for(int i = 0; i < 2; i++)
                Status_ComboBox->Items->Add(ComboBoxSituacao[i]);
}
//---------------------------------------------------------------------------

void TDetalhesConta_Dialog::EstenderAteOFimDoAno(int ID, int Tipo, int Moeda, TDateTime Vencimento, AnsiString Descricao, float Valor, int Situacao)
{
        Word Ano, Mes, Dia;
        DecodeDate(Vencimento, Ano, Mes, Dia);

        Mes++;
        while(Mes <= 12)
        {
                Vencimento = EncodeDate(Ano, Mes, Dia);

                Banco_DataModule->Conta_ClientDataSet->Append();
                Banco_DataModule->Conta_ClientDataSet->FieldByName("ID")->AsInteger = ID;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("TIPOCONTA")->AsInteger = Tipo;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("MOEDA")->AsInteger = Moeda;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("VENCIMENTO")->AsSQLTimeStamp = DateTimeToSQLTimeStamp(Vencimento);
                Banco_DataModule->Conta_ClientDataSet->FieldByName("VALOR")->AsFloat = Valor;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("SITUACAO")->AsInteger = Situacao;
                Banco_DataModule->Conta_ClientDataSet->FieldByName("DESCRICAO")->AsString = Descricao;
                Banco_DataModule->Conta_ClientDataSet->Post();
                Banco_DataModule->Conta_ClientDataSet->ApplyUpdates(-1);
                Banco_DataModule->Conta_ClientDataSet->Refresh();
                Mes++;
        }
}
//---------------------------------------------------------------------------

void __fastcall TDetalhesConta_Dialog::Vencimento_DBEditClick(
      TObject *Sender)
{
        SelecionarMes_Dialog = new TSelecionarMes_Dialog(Application);
        SelecionarMes_Dialog->Personalizar(DETALHE);
        SelecionarMes_Dialog->ShowModal();
        delete SelecionarMes_Dialog;
}
//---------------------------------------------------------------------------


void __fastcall TDetalhesConta_Dialog::TipoConta_ComboBoxSelect(
      TObject *Sender)
{
/*
        if(TipoConta_ComboBox->Text.UpperCase() == "CHEQUE")
        {
                CadCheque_Dialog = new TCadCheque_Dialog(Application);
                CadCheque_Dialog->ShowModal();
                delete CadCheque_Dialog;
        }
*/
}
//---------------------------------------------------------------------------

void __fastcall TDetalhesConta_Dialog::FormCreate(TObject *Sender)
{
        Moeda_ComboBox->Text = "REAL";        
}
//---------------------------------------------------------------------------

void __fastcall TDetalhesConta_Dialog::SpeedButton1Click(TObject *Sender)
{
        NovoTipoConta_Form = new TNovoTipoConta_Form(Application);
        NovoTipoConta_Form->ShowModal();
        NovoTipoConta = NovoTipoConta_Form->GetTipoConta();
        delete NovoTipoConta_Form;

        this->PopularComboBoxes();
}
//---------------------------------------------------------------------------

