//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Principal_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPrincipal_Form *Principal_Form;
//---------------------------------------------------------------------------
__fastcall TPrincipal_Form::TPrincipal_Form(TComponent* Owner)
        : TForm(Owner)
{
        User = false;
        Admin = false;
        JaMostrou = false;
}
//---------------------------------------------------------------------------

bool TPrincipal_Form::Login(void)
{
        if(User || Admin)
                return true;
        else
        {
                Login_Dialog = new TLogin_Dialog(Application);
                Login_Dialog->ShowModal();
                delete Login_Dialog;

                if(User || Admin)
                {
                        SetLabel(User, Admin);
                        return true;
                }
                else
                {
                        StatusBar1->Panels->Items[0]->Text = " Usuário Desconhecido";
                        StatusBar1->Panels->Items[1]->Text = " Status: Desconectado";
                        return false;
                }
        }
}
//---------------------------------------------------------------------------

void TPrincipal_Form::SetLogin(bool Valor)
{
        User = Valor;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Sair1Click(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------

void TPrincipal_Form::SetAdmin(bool Valor)
{
        Admin = Valor;
}
//---------------------------------------------------------------------------

void TPrincipal_Form::SetLabel(bool User, bool Admin)
{
        StatusBar1->Panels->Items[0]->Text = "  " + Tempo + Nome;

        if(User)
                StatusBar1->Panels->Items[1]->Text = " Status: Usuário Comum";
        else
                StatusBar1->Panels->Items[1]->Text = " Status: Administrador";
}
//---------------------------------------------------------------------------


void __fastcall TPrincipal_Form::FormShow(TObject *Sender)
{
        Word Year, Month, Day, Hour, Min, Sec, MiliSec;
        TDateTime dtPresent = Now();

        DecodeDate(dtPresent, Year, Month, Day);
        DecodeTime(dtPresent, Hour, Min, Sec, MiliSec);

        MesAtual = Month;
        AnoAtual = Year;

        AnsiString DiaDaSemana;
        GetDayOfWeek(DiaDaSemana, dtPresent.DayOfWeek());

        AnsiString Ano, Mes, Dia;

        if(Day < 10)
                Dia = "0" + IntToStr(Day);
        else
                Dia = IntToStr(Day);

        GetMonth(Mes, Month);
        Ano = IntToStr(Year);
        Mes_Label->Caption = Mes + "/" + Ano;

        StatusBar1->Panels->Items[2]->Text = DiaDaSemana + Dia + " de " + Mes + " de " + Ano;

        if(Hour >= 6 && Hour <12)
                Tempo = "Bom dia, ";
        else if(Hour >= 12 && Hour < 19)
                Tempo = "Boa tarde, ";
        else
                Tempo = "Boa noite, ";

        if(Login())
        {
                Geral_PageControl->Visible = true;
                Situacao_TabSheet->TabVisible = false;
                ConfiguracaoAdmin_TabSheet->TabVisible = false;
                DadosPessoais_TabSheet->TabVisible = false;
                Logon1->Visible = false;
                Logoff1->Visible = true;
                if(User)
                {
                        Situacao_TabSheet->TabVisible = true;
                        Situacao1->Visible = true;
                        DadosPessoais1->Visible = true;
                        Analise();
                        SetLabel(User, Admin);
                }
                else
                {
                        ConfiguracaoAdmin_TabSheet->TabVisible = true;
                        Situacao1->Visible = false;
                        DadosPessoais1->Visible = false;
                }
        }
        else
                Application->Terminate();
}
//---------------------------------------------------------------------------

void TPrincipal_Form::SetNome(AnsiString Nome)
{
        this->Nome = Nome;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Logoff1Click(TObject *Sender)
{
        User = Admin = false;
        Logoff1->Visible = false;
        Logon1->Visible = true;
        DadosPessoais1->Visible = false;
        Situacao1->Visible = false;

        Geral_PageControl->Visible = false;
        DadosPessoais_TabSheet->TabVisible = false;
        Situacao_TabSheet->TabVisible = false;
        ConfiguracaoAdmin_TabSheet->TabVisible = false;

        StatusBar1->Panels->Items[0]->Text = " Usuário Desconhecido";
        StatusBar1->Panels->Items[1]->Text = " Status: Desconectado";
}
//---------------------------------------------------------------------------

void TPrincipal_Form::GetMonth(AnsiString &Month, int Mes)
{
        switch(Mes)
        {
                case 1:
                        Month = "Janeiro";
                        break;
                case 2:
                        Month = "Fevereiro";
                        break;
                case 3:
                        Month = "Março";
                        break;
                case 4:
                        Month = "Abril";
                        break;
                case 5:
                        Month = "Maio";
                        break;
                case 6:
                        Month = "Junho";
                        break;
                case 7:
                        Month = "Julho";
                        break;
                case 8:
                        Month = "Agosto";
                        break;
                case 9:
                        Month = "Setembro";
                        break;
                case 10:
                        Month = "Outubro";
                        break;
                case 11:
                        Month = "Novembro";
                        break;
                case 12:
                        Month = "Dezembro";
                        break;
        }
}
//---------------------------------------------------------------------------

void TPrincipal_Form::GetDayOfWeek(AnsiString &Day, int DayOfWeek)
{
        switch(DayOfWeek)
        {
                case 1:
                        Day = " Domingo, ";
                        break;
                case 2:
                        Day = " Segunda-feira, ";
                        break;
                case 3:
                        Day = " Terça-feira, ";
                        break;
                case 4:
                        Day = " Quarta-feira, ";
                        break;
                case 5:
                        Day = " Quinta-feira, ";
                        break;
                case 6:
                        Day = " Sexta-feira, ";
                        break;
                case 7:
                        Day = " Sábado, ";
                        break;
        }
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Logon1Click(TObject *Sender)
{
        if(Login())
        {
                Logon1->Visible = false;
                Logoff1->Visible = true;
                Geral_PageControl->Visible = true;
                DadosPessoais_TabSheet->TabVisible = false;

                if(User)
                {
                        DadosPessoais1->Visible = true;
                        Situacao_TabSheet->TabVisible = true;
                        ConfiguracaoAdmin_TabSheet->TabVisible = false;
                        Analise();
                }
                else
                {
                        ConfiguracaoAdmin_TabSheet->TabVisible = true;
                        DadosPessoais1->Visible = false;
                        Situacao_TabSheet->TabVisible = false;
                }
        }
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn1Click(TObject *Sender)
{
        AnsiString Mess;

        if(MesAtual == 1)
        {
                MesAtual = 12;
                AnoAtual--;
        }
        else
                MesAtual--;

        GetMonth(Mess, MesAtual);
        Mes_Label->Caption = Mess + "/" + IntToStr(AnoAtual);
        Banco_DataModule->PrepararContasDados(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, MesAtual, AnoAtual);

        Analise();
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn2Click(TObject *Sender)
{
        AnsiString Mess;
        if(MesAtual == 12)
        {
                MesAtual = 1;
                AnoAtual++;
        }
        else
                MesAtual++;

        GetMonth(Mess, MesAtual);

        Mes_Label->Caption = Mess + "/" + IntToStr(AnoAtual);
        Banco_DataModule->PrepararContasDados(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, MesAtual, AnoAtual);

        Analise();
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn3Click(TObject *Sender)
{
        AnsiString Mess;

        SelecionarMes_Dialog = new TSelecionarMes_Dialog(Application);
        SelecionarMes_Dialog->Personalizar(PRINCIPAL);
        SelecionarMes_Dialog->ShowModal();
        delete SelecionarMes_Dialog;

        GetMonth(Mess, MesAtual);

        Mes_Label->Caption = Mess + "/" + IntToStr(AnoAtual);
        Banco_DataModule->PrepararContasDados(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, MesAtual, AnoAtual);

        Analise();
}
//---------------------------------------------------------------------------

void TPrincipal_Form::SetPeriodo(int Mes, int Ano)
{
        MesAtual = Mes;
        AnoAtual = Ano;
}
//---------------------------------------------------------------------------


void __fastcall TPrincipal_Form::BitBtn4Click(TObject *Sender)
{
        DetalhesConta_Dialog = new TDetalhesConta_Dialog(Application);
        DetalhesConta_Dialog->Personalizar(ADICAO, Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, NULL);
        DetalhesConta_Dialog->ShowModal();
        delete DetalhesConta_Dialog;

        Banco_DataModule->PrepararContasDados(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, MesAtual, AnoAtual);
        Banco_DataModule->AtualizarConta();

        Analise();
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn5Click(TObject *Sender)
{
        DetalhesConta_Dialog = new TDetalhesConta_Dialog(Application);
        DetalhesConta_Dialog->Personalizar(EDICAO, Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, Contas_DataModule->ContasMes_ClientDataSet->FieldByName("CODIGO")->AsInteger);
        DetalhesConta_Dialog->ShowModal();
        delete DetalhesConta_Dialog;

        Banco_DataModule->PrepararContasDados(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, MesAtual, AnoAtual);
        Banco_DataModule->AtualizarConta();
        Analise();
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn6Click(TObject *Sender)
{
        if(Application->MessageBox("Deseja realmente excluir esta conta?", "Confirmação de Exclusão", MB_YESNO + MB_ICONWARNING) == 6)
                Banco_DataModule->ExcluirConta(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, Contas_DataModule->ContasMes_ClientDataSet->FieldByName("CODIGO")->AsInteger);

        Banco_DataModule->AtualizarConta();
        Analise();
}
//---------------------------------------------------------------------------

void TPrincipal_Form::Analise(void)
{
        TLocateOptions lo;
        lo.Clear();

        TStringList *ContasAPagar = new TStringList();
        TStringList *DatasContas = new TStringList();
        TStringList *ValoresContas = new TStringList();
        TStringList *Moeda = new TStringList();

        float Credito = 0.0;
        float Debito = 0.0;
        float DebitoNaoPago = 0.0;
        float DebitoPago = 0.0;
        float SaldoMes = 0.0;
        float SaldoAtual = 0.0;
        int TotalContasPagas = 0;
        int TotalContasAPagar = 0;

        if(Contas_DataModule->ContasMes_ClientDataSet->FindFirst())
        {
                do
                {
                        if(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("SITUACAO")->AsInteger == 0)
                                TotalContasAPagar++;
                        else
                                TotalContasPagas++;

                        if(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("CREDITO")->AsString == "D")
                        {
                                if(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("SITUACAO")->AsInteger == 0)
                                        DebitoNaoPago += Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VALOR")->AsFloat;
                                else
                                        DebitoPago += Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VALOR")->AsFloat;

                                Debito += Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VALOR")->AsFloat;

                                if((SQLTimeStampToDateTime(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VENCIMENTO")->AsSQLTimeStamp) < Now()) && (Contas_DataModule->ContasMes_ClientDataSet->FieldByName("SITUACAO")->AsInteger == 0))
                                {
                                        ContasAPagar->Add(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("TIPOCONTA")->AsString);
                                        DatasContas->Add(FormatDateTime("dd/mm/yyyy",SQLTimeStampToDateTime(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VENCIMENTO")->AsSQLTimeStamp)));
                                        ValoresContas->Add(FormatFloat("#.00",Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VALOR")->AsFloat));
                                        Moeda->Add(Contas_DataModule->ContasMes_ClientDataSet->FieldByName("MOEDA")->AsString);
                                }
                        }
                        else
                                Credito += Contas_DataModule->ContasMes_ClientDataSet->FieldByName("VALOR")->AsFloat;

                }while(Contas_DataModule->ContasMes_ClientDataSet->FindNext());
        }

        SaldoMes = Credito - Debito;
        SaldoAtual = Credito - DebitoPago;
        if(SaldoMes < 0)
        {
                Real3->Font->Color = clRed;
                SobraMes_Label->Font->Color = clRed;
                SaldoMes = -SaldoMes;
        }
        else
        {
                Real3->Font->Color = clBlue;
                SobraMes_Label->Font->Color = clBlue;
        }
        if(SaldoAtual < 0)
        {
                Real1->Font->Color = clRed;
                SaldoMes_Label->Font->Color = clRed;
                SaldoMes = -SaldoMes;
        }
        else
        {
                Real1->Font->Color = clBlue;
                SaldoMes_Label->Font->Color = clBlue;
        }

        Credito_Label->Caption = FormatFloat("#,##0.00", Credito);
        Debito_Label->Caption = FormatFloat("#,##0.00", Debito);
        SaldoMes_Label->Caption = FormatFloat("#,##0.00", SaldoAtual);
        DebitoRestante_Label->Caption = FormatFloat("#,##0.00", DebitoNaoPago);
        SobraMes_Label->Caption = FormatFloat("#,##0.00", SaldoMes);
        TotalContasPagas_Label->Caption = IntToStr(TotalContasPagas);
        TotalContasAPagar_Label->Caption = IntToStr(TotalContasAPagar);
        TotalContas_Label->Caption = IntToStr(TotalContasPagas + TotalContasAPagar);

        if(Contas_DataModule->ContasMes_ClientDataSet->Locate("CODIGO", CodigoConta, lo) == false)
                Contas_DataModule->ContasMes_ClientDataSet->FindFirst();


        if(!JaMostrou)
        {
                JaMostrou = true;
                float Total = 0.0;

                if(ContasAPagar->Count > 0)
                {
                        AnsiString Mensagem = "Contas vencidas pendentes:\n\n";
                        for(int i = 0; i < ContasAPagar->Count; i++)
                        {
                                Mensagem += DatasContas->Strings[i];
                                Mensagem += " - ";
                                Mensagem += ContasAPagar->Strings[i];
                                Mensagem += " - ";
                                Mensagem += Moeda->Strings[i];
                                Mensagem += " ";
                                Mensagem += FormatFloat("#,##0.00", StrToFloat(ValoresContas->Strings[i]));
                                Mensagem += "\n";
                                Total += StrToFloat(ValoresContas->Strings[i]);
                        }
                        Mensagem += "\nTotal:\tR$ ";
                        Mensagem += FormatFloat("#,##0.00",Total);

                        Application->MessageBox(Mensagem.c_str(),"Alerta",MB_ICONWARNING + MB_OK);
                }
        }

        delete ContasAPagar;
        delete DatasContas;
        delete ValoresContas;
        delete Moeda;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Situacao_DBGridDblClick(TObject *Sender)
{
        TClientDataSet *DataSet = (TClientDataSet *)((TDBGrid *)Sender)->DataSource->DataSet;

        if(DataSet->RecordCount > 0)
        {
                if(DataSet->FieldByName("SITUACAO")->AsInteger == 0)
                {
                        if(Application->MessageBox("Deseja realmente fechar a conta?", "Fechamento de Conta", MB_ICONWARNING + MB_YESNO) == 6)
                                Banco_DataModule->AtualizarStatusConta(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, DataSet->FieldByName("CODIGO")->AsInteger, 1);
                }
                else
                {
                        if(Application->MessageBox("Deseja realmente re-abrir a conta?", "Re-abertura da Conta", MB_ICONWARNING + MB_YESNO) == 6)
                                Banco_DataModule->AtualizarStatusConta(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, DataSet->FieldByName("CODIGO")->AsInteger, 0);
                }

                Analise();
        }
        else
                Application->MessageBox("Não existem contas cadastradas.", "Erro", MB_OK + MB_ICONWARNING);
}
//---------------------------------------------------------------------------

void TPrincipal_Form::GetCodigoConta(int CodigoConta)
{
        this->CodigoConta = CodigoConta;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Sobre1Click(TObject *Sender)
{
        AboutBox->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::DadosPessoais1Click(TObject *Sender)
{
        Situacao_TabSheet->TabVisible = false;
        DadosPessoais_TabSheet->TabVisible = true;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Situacao1Click(TObject *Sender)
{
        Situacao_TabSheet->TabVisible = true;
        DadosPessoais_TabSheet->TabVisible = false;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::DadosPessoais_TabSheetShow(
      TObject *Sender)
{
        Banco_DataModule->AtualizarDadosPessoais(Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger);
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::BitBtn7Click(TObject *Sender)
{
        EmissaoRelatorio_Dialog = new TEmissaoRelatorio_Dialog(Application);
        EmissaoRelatorio_Dialog->Personalizar(Mes_Label->Caption, AnoAtual, MesAtual, Banco_DataModule->Pessoa_ClientDataSet->FieldByName("ID")->AsInteger, Banco_DataModule->QPessoa_ClientDataSet->FieldByName("NOMECOMPLETO")->AsString);
        EmissaoRelatorio_Dialog->ShowModal();
        delete EmissaoRelatorio_Dialog;
}
//---------------------------------------------------------------------------

void __fastcall TPrincipal_Form::Situacao_DBGridDrawColumnCell(
      TObject *Sender, const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
        try {
                TFontStyles FS;
                FS << fsBold;

                TDBGrid *Grid = (TDBGrid *)Sender;

                //Checa se a linha corrente é a linha selecionada
                if(((AnsiString)Grid->Columns->Items[4]->Field->Value == "Pago"))
                {
                        Grid->Canvas->Brush->Color = (TColor)0x0080FF80; //clGreen;
                        Grid->Canvas->Font->Color = clBlack;
                        Grid->Canvas->Font->Style = TFontStyles()<< fsBold;
                        Grid->Canvas->FillRect(Rect);
                        Grid->DefaultDrawDataCell(Rect, Column->Field, State);
                        return;
                }

                if(((AnsiString)Grid->Columns->Items[5]->Field->Value == "Crédito"))
                {
                        Grid->Canvas->Brush->Color = (TColor)0x00FFFF84; //clBlue;
                        Grid->Canvas->Font->Color = clBlack;
                        Grid->Canvas->Font->Style = TFontStyles()<< fsBold;
                        Grid->Canvas->FillRect(Rect);
                        Grid->DefaultDrawDataCell(Rect, Column->Field, State);
                        return;
                }

                if((TDateTime)Grid->Columns->Items[3]->Field->Value >= Now())
                {
                        Grid->Canvas->Brush->Color = (TColor)0x00BBFFFF; //clYellow
                        Grid->Canvas->Font->Color = clBlack;
                        Grid->Canvas->Font->Style = TFontStyles()<< fsBold;
                        Grid->Canvas->FillRect(Rect);
                        Grid->DefaultDrawDataCell(Rect, Column->Field, State);
                        return;
                }

                Grid->Canvas->Brush->Color = (TColor)0x00AAAAFF; //clRed;
                Grid->Canvas->Font->Color = clBlack;
                Grid->Canvas->Font->Style = TFontStyles()<< fsBold;
                Grid->Canvas->FillRect(Rect);
                Grid->DefaultDrawDataCell(Rect, Column->Field, State);
                return;
        /*
                //Destaca a célula selecionada
                if (State.Contains(gdSelected))
                {
                        Grid->Canvas->Font->Color = clBlack;
                        Grid->Canvas->Font->Style = TFontStyles()<< fsBold;
                        Grid->Canvas->Brush->Color = clYellow;
                        Grid->Canvas->FillRect(Rect);
                        Grid->DefaultDrawDataCell(Rect, Column->Field, State);
                }
        */
        } catch (...) { }
}
//---------------------------------------------------------------------------

