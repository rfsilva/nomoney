//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("BancoDM_Unit.cpp", Banco_DataModule); /* TDataModule: File Type */
USEFORM("ConexaoDM_Unit.cpp", Conexao_DataModule); /* TDataModule: File Type */
USEFORM("Login_Unit.cpp", Login_Dialog);
USEFORM("Principal_Unit.cpp", Principal_Form);
USEFORM("SelecionarMes_Unit.cpp", SelecionarMes_Dialog);
USEFORM("DetalhesConta_Unit.cpp", DetalhesConta_Dialog);
USEFORM("About_Unit.cpp", AboutBox);
USEFORM("Splash_Unit.cpp", Splash_Form);
USEFORM("Cheque_Unit.cpp", CadCheque_Dialog);
USEFORM("CadBanco_Unit.cpp", CadBanco_Dialog);
USEFORM("EmissaoRelatorio_Unit.cpp", EmissaoRelatorio_Dialog);
USEFORM("RelatorioFinanceiro_Unit.cpp", RelatorioFinanceiro_Form);
USEFORM("NovoTipoConta_Unit.cpp", NovoTipoConta_Form);
USEFORM("ContasDM_Unit.cpp", Contas_DataModule); /* TDataModule: File Type */
USEFORM("RelatorioFinanceiroDM_Unit.cpp", RelatorioFinanceiro_DataModule); /* TDataModule: File Type */
//---------------------------------------------------------------------------
#include "Splash_Unit.h"
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                Splash_Form = new TSplash_Form(Application);
                Splash_Form->Show();
                Splash_Form->Update();
                Sleep(1000);
                Application->Initialize();
                Application->Title = "NoMoney 1.0";
                 Splash_Form->Update();
                Application->CreateForm(__classid(TConexao_DataModule), &Conexao_DataModule);
                 Application->CreateForm(__classid(TBanco_DataModule), &Banco_DataModule);
                 Application->CreateForm(__classid(TContas_DataModule), &Contas_DataModule);
                 Application->CreateForm(__classid(TRelatorioFinanceiro_DataModule), &RelatorioFinanceiro_DataModule);
                 Application->CreateForm(__classid(TPrincipal_Form), &Principal_Form);
                 Application->CreateForm(__classid(TAboutBox), &AboutBox);
                 Application->CreateForm(__classid(TNovoTipoConta_Form), &NovoTipoConta_Form);
                 Splash_Form->Update();
                Splash_Form->Hide();
                Splash_Form->Close();
                delete Splash_Form;
                Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        catch (...)
        {
                 try
                 {
                         throw Exception("");
                 }
                 catch (Exception &exception)
                 {
                         Application->ShowException(&exception);
                 }
        }
        return 0;
}
//---------------------------------------------------------------------------
