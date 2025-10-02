//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Login_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TLogin_Dialog *Login_Dialog;
//---------------------------------------------------------------------------
__fastcall TLogin_Dialog::TLogin_Dialog(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLogin_Dialog::BitBtn1Click(TObject *Sender)
{
        // Usuário?
        if(Tipo_ComboBox->Text.UpperCase() == "USUÁRIO COMUM")
        {
                if(Banco_DataModule->ChecarLoginUser(Login_Edit->Text, Senha_Edit->Text) == true)
                {
                        Principal_Form->SetLogin(true);
                        Principal_Form->SetAdmin(false);
                        ConfigurarIniFile(Login_Edit->Text, Senha_Edit->Text, Senha_CheckBox->Checked, Tipo_ComboBox->Text);
                        Close();
                }
                else
                        Application->MessageBox("Login/Senha inválidos!", "Erro", MB_ICONWARNING + MB_OK);
        }
        //Administrador?
        else
        {
                if(Banco_DataModule->ChecarLoginAdmin(Login_Edit->Text, Senha_Edit->Text) == true)
                {
                        Principal_Form->SetLogin(false);
                        Principal_Form->SetAdmin(true);
                        ConfigurarIniFile(Login_Edit->Text, Senha_Edit->Text, Senha_CheckBox->Checked, Tipo_ComboBox->Text);
                        Close();
                }
                else
                        Application->MessageBox("Login/Senha inválidos!", "Erro", MB_ICONWARNING + MB_OK);
        }
}
//---------------------------------------------------------------------------
void __fastcall TLogin_Dialog::BitBtn2Click(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------

void TLogin_Dialog::ConfigurarIniFile(AnsiString Login, AnsiString Senha, bool Guarda, AnsiString TipoAcesso)
{
        TIniFile *NoMoney_IniFile = new TIniFile("NoMoney.ini");

        NoMoney_IniFile->WriteString("Usuario", "Login", Login);
        NoMoney_IniFile->WriteString("Usuario", "TipoAcesso", TipoAcesso);
        if(Guarda)
                NoMoney_IniFile->WriteString("Usuario", "Senha", Senha);
        else
                NoMoney_IniFile->WriteString("Usuario", "Senha", "");

        delete NoMoney_IniFile;
}
//---------------------------------------------------------------------------

void __fastcall TLogin_Dialog::FormShow(TObject *Sender)
{
        TIniFile *NoMoney_IniFile = new TIniFile("NoMoney.ini");

        if(NoMoney_IniFile->SectionExists("Usuario"))
        {
                Login_Edit->Text = NoMoney_IniFile->ReadString("Usuario", "Login", "");
                Senha_Edit->Text = NoMoney_IniFile->ReadString("Usuario", "Senha", "");
                Tipo_ComboBox->Text = NoMoney_IniFile->ReadString("Usuario", "TipoAcesso", "");

                if(Login_Edit->Text != "")
                {
                        if(Senha_Edit->Text != "")
                        {
                                ActiveControl = BitBtn1;
                                Senha_CheckBox->Checked = true;
                        }
                        else
                                ActiveControl = Senha_Edit;
                }
                else
                        ActiveControl = Login_Edit;
        }
        else
        {
                NoMoney_IniFile->WriteString("Usuario", "Login", "");
                NoMoney_IniFile->WriteString("Usuario", "Senha", "");
                NoMoney_IniFile->WriteString("Usuario", "TipoAcesso", "");
                ActiveControl = Login_Edit;
        }
        delete NoMoney_IniFile;
}
//---------------------------------------------------------------------------

