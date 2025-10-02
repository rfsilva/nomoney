//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Cheque_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TCadCheque_Dialog *CadCheque_Dialog;
//---------------------------------------------------------------------------
__fastcall TCadCheque_Dialog::TCadCheque_Dialog(TComponent* Owner)
        : TForm(Owner)
{
        Banco_DataModule->QBanco_ClientDataSet->Active = false;
        Banco_DataModule->QBanco_SQLQuery->Active = false;
        Banco_DataModule->QBanco_SQLQuery->Close();
        Banco_DataModule->QBanco_SQLQuery->Open();
        Banco_DataModule->QBanco_SQLQuery->Active = true;
        Banco_DataModule->QBanco_ClientDataSet->Active = true;
}
//---------------------------------------------------------------------------
void __fastcall TCadCheque_Dialog::BitBtn1Click(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------

void __fastcall TCadCheque_Dialog::BitBtn2Click(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------
void __fastcall TCadCheque_Dialog::BitBtn3Click(TObject *Sender)
{
        Close();
}
//---------------------------------------------------------------------------
void __fastcall TCadCheque_Dialog::BitBtn4Click(TObject *Sender)
{
        CadBanco_Dialog = new TCadBanco_Dialog(Application);
        CadBanco_Dialog->ShowModal();
        delete CadBanco_Dialog;
}
//---------------------------------------------------------------------------
