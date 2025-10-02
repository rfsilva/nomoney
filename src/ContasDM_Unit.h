//---------------------------------------------------------------------------

#ifndef ContasDM_UnitH
#define ContasDM_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ConexaoDM_Unit.h"
#include <DB.hpp>
#include <DBClient.hpp>
#include <FMTBcd.hpp>
#include <Provider.hpp>
#include <SqlExpr.hpp>
//---------------------------------------------------------------------------
class TContas_DataModule : public TDataModule
{
__published:	// IDE-managed Components
        TSQLQuery *ContasMes_SQLQuery;
        TIntegerField *ContasMes_SQLQueryID;
        TIntegerField *ContasMes_SQLQueryCODIGO;
        TStringField *ContasMes_SQLQueryMOEDA;
        TSQLTimeStampField *ContasMes_SQLQueryVENCIMENTO;
        TStringField *ContasMes_SQLQueryTIPOCONTA;
        TIntegerField *ContasMes_SQLQuerySITUACAO;
        TStringField *ContasMes_SQLQueryDESCRICAO;
        TStringField *ContasMes_SQLQueryCREDITO;
        TFloatField *ContasMes_SQLQueryVALOR;
        TDataSetProvider *ContasMes_DataSetProvider;
        TClientDataSet *ContasMes_ClientDataSet;
        TIntegerField *ContasMes_ClientDataSetID;
        TIntegerField *ContasMes_ClientDataSetCODIGO;
        TStringField *ContasMes_ClientDataSetMOEDA;
        TSQLTimeStampField *ContasMes_ClientDataSetVENCIMENTO;
        TStringField *ContasMes_ClientDataSetTIPOCONTA;
        TIntegerField *ContasMes_ClientDataSetSITUACAO;
        TStringField *ContasMes_ClientDataSetPAGO;
        TStringField *ContasMes_ClientDataSetDESCRICAO;
        TStringField *ContasMes_ClientDataSetCREDITO;
        TStringField *ContasMes_ClientDataSetCREDITOSTRING;
        TFloatField *ContasMes_ClientDataSetVALOR;
        TDataSource *ContasMes_DataSource;
        TSQLQuery *ContasPagas_SQLQuery;
        TIntegerField *IntegerField1;
        TIntegerField *IntegerField2;
        TStringField *StringField1;
        TSQLTimeStampField *SQLTimeStampField1;
        TStringField *StringField2;
        TIntegerField *IntegerField3;
        TStringField *StringField3;
        TStringField *StringField4;
        TFloatField *FloatField1;
        TDataSetProvider *ContasPagas_DataSetProvider;
        TClientDataSet *ContasPagas_ClientDataSet;
        TIntegerField *IntegerField4;
        TIntegerField *IntegerField5;
        TStringField *StringField5;
        TSQLTimeStampField *SQLTimeStampField2;
        TStringField *StringField6;
        TIntegerField *IntegerField6;
        TStringField *StringField7;
        TStringField *StringField8;
        TStringField *StringField9;
        TStringField *StringField10;
        TFloatField *FloatField2;
        TDataSource *ContasPagas_DataSource;
        TSQLQuery *ContasAPagar_SQLQuery;
        TIntegerField *IntegerField7;
        TIntegerField *IntegerField8;
        TStringField *StringField11;
        TSQLTimeStampField *SQLTimeStampField3;
        TStringField *StringField12;
        TIntegerField *IntegerField9;
        TStringField *StringField13;
        TStringField *StringField14;
        TFloatField *FloatField3;
        TDataSetProvider *ContasAPagar_DataSetProvider;
        TClientDataSet *ContasAPagar_ClientDataSet;
        TIntegerField *IntegerField10;
        TIntegerField *IntegerField11;
        TStringField *StringField15;
        TSQLTimeStampField *SQLTimeStampField4;
        TStringField *StringField16;
        TIntegerField *IntegerField12;
        TStringField *StringField17;
        TStringField *StringField18;
        TStringField *StringField19;
        TStringField *StringField20;
        TFloatField *FloatField4;
        TDataSource *ContasAPagar_DataSource;
        TSQLQuery *ContasAtrasadas_SQLQuery;
        TIntegerField *IntegerField13;
        TIntegerField *IntegerField14;
        TStringField *StringField21;
        TSQLTimeStampField *SQLTimeStampField5;
        TStringField *StringField22;
        TIntegerField *IntegerField15;
        TStringField *StringField23;
        TStringField *StringField24;
        TFloatField *FloatField5;
        TDataSetProvider *ContasAtrasadas_DataSetProvider;
        TClientDataSet *ContasAtrasadas_ClientDataSet;
        TIntegerField *IntegerField16;
        TIntegerField *IntegerField17;
        TStringField *StringField25;
        TSQLTimeStampField *SQLTimeStampField6;
        TStringField *StringField26;
        TIntegerField *IntegerField18;
        TStringField *StringField27;
        TStringField *StringField28;
        TStringField *StringField29;
        TStringField *StringField30;
        TFloatField *FloatField6;
        TDataSource *ContasAtrasadas_DataSource;
        void __fastcall ContasClientDataSetCalcFields(
          TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
        __fastcall TContas_DataModule(TComponent* Owner);
        void AtualizarContas(int ID, TDateTime DataInicio, TDateTime DataFim);
        void AtualizarContasMes(void);
};
//---------------------------------------------------------------------------
extern PACKAGE TContas_DataModule *Contas_DataModule;
//---------------------------------------------------------------------------
#endif
