//---------------------------------------------------------------------------

#ifndef RelatorioFinanceiroDM_UnitH
#define RelatorioFinanceiroDM_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "RpBase.hpp"
#include "RpDefine.hpp"
#include "RpRave.hpp"
#include "RpSystem.hpp"
#include "ContasDM_Unit.h"
#include "RpCon.hpp"
#include "RpConDS.hpp"
#include "RpRender.hpp"
#include "RpRenderHTML.hpp"
#include "RpRenderPDF.hpp"
#include "RpRenderRTF.hpp"
#include "RpRenderText.hpp"
#include "About_Unit.h"

#define ENTRADAS_ABERTAS   0
#define ENTRADAS_FECHADAS  1
#define TODAS_ENTRADAS     2
#define ENTRADAS_ATRASADAS 3

//---------------------------------------------------------------------------
class TRelatorioFinanceiro_DataModule : public TDataModule
{
__published:	// IDE-managed Components
        TRvProject *RelatorioFinanceiro_RvProject;
        TRvSystem *RelatorioFinanceiro_RvSystem;
        TRvDataSetConnection *Contas_RvDataSetConnection;
        TRvRenderPDF *RvRenderPDF1;
        TRvRenderHTML *RvRenderHTML1;
        TRvRenderRTF *RvRenderRTF1;
        TRvRenderText *RvRenderText1;
private:	// User declarations
public:		// User declarations
        __fastcall TRelatorioFinanceiro_DataModule(TComponent* Owner);
        void EmitirRelatorio(int Tipo, AnsiString MesAno, AnsiString Usuario);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelatorioFinanceiro_DataModule *RelatorioFinanceiro_DataModule;
//---------------------------------------------------------------------------
#endif
