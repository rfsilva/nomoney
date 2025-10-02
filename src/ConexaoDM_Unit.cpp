//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ConexaoDM_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TConexao_DataModule *Conexao_DataModule;
//---------------------------------------------------------------------------
__fastcall TConexao_DataModule::TConexao_DataModule(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void TConexao_DataModule::AtivarDataModule(TDataModule * DataModuleParaAtivar, TSQLConnection * SQLConnectionUtilizado, bool Ativar)
{
        int     Cont,
                NumeroComponentes;

        AnsiString NomeClasse;
        TSQLTable * table;
        TSQLQuery * query;
        TSQLStoredProc *storedProcedure;
        TDataSetProvider * dataProvider;
        TClientDataSet * clientDataSet;

        NumeroComponentes=DataModuleParaAtivar->ComponentCount;
        for(Cont=0;Cont<NumeroComponentes;Cont++)
        {
                NomeClasse=DataModuleParaAtivar->Components[Cont]->ClassName();
                if(NomeClasse=="TSQLTable")
                {
                        table = (TSQLTable*) DataModuleParaAtivar->Components[Cont];
                        if(SQLConnectionUtilizado!=NULL)
                                table->SQLConnection=SQLConnectionUtilizado;
                        table->Active = Ativar;
                }
                if(NomeClasse=="TClientDataSet")
                {
                        clientDataSet = (TClientDataSet*) DataModuleParaAtivar->Components[Cont];
                        clientDataSet->Name;
                        clientDataSet->Active = Ativar;
                }
                if(NomeClasse=="TSQLQuery")
                {
                        query = (TSQLQuery*) DataModuleParaAtivar->Components[Cont];
                        if(SQLConnectionUtilizado!=NULL)
                                query->SQLConnection=SQLConnectionUtilizado;
                }
        }
}
