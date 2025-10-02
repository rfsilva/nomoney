//---------------------------------------------------------------------------

#ifndef ConexaoDM_UnitH
#define ConexaoDM_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBXpress.hpp>
#include <SqlExpr.hpp>
#include <DBClient.hpp>
#include <FMTBcd.hpp>
#include <Provider.hpp>
//---------------------------------------------------------------------------
class TConexao_DataModule : public TDataModule
{
__published:	// IDE-managed Components
        TSQLConnection *Conexao_SQLConnection;
private:	// User declarations
public:		// User declarations
        __fastcall TConexao_DataModule(TComponent* Owner);
        void AtivarDataModule(TDataModule * DataModuleParaAtivar, TSQLConnection * SQLConnectionUtilizado, bool Ativar);
};
//---------------------------------------------------------------------------
extern PACKAGE TConexao_DataModule *Conexao_DataModule;
//---------------------------------------------------------------------------
#endif
