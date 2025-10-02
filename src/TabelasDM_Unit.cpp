//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TabelasDM_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TTabelas_DataModule *Tabelas_DataModule;
//---------------------------------------------------------------------------
__fastcall TTabelas_DataModule::TTabelas_DataModule(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTabelas_DataModule::DataModuleCreate(TObject *Sender)
{
        Conexao_DataModule->AtivarDataModule(this,Conexao_DataModule->Conexao_SQLConnection,true);
}
//---------------------------------------------------------------------------
void __fastcall TTabelas_DataModule::DataModuleDestroy(TObject *Sender)
{
        Conexao_DataModule->AtivarDataModule(this, Conexao_DataModule->Conexao_SQLConnection, false);
}
//---------------------------------------------------------------------------
