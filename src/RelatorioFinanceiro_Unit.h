//---------------------------------------------------------------------------

#ifndef RelatorioFinanceiro_UnitH
#define RelatorioFinanceiro_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <QuickRpt.hpp>
#include <QRCtrls.hpp>
#include "BancoDM_Unit.h"
#include <QRExport.hpp>
//---------------------------------------------------------------------------
class TRelatorioFinanceiro_Form : public TForm
{
__published:	// IDE-managed Components
        TQuickRep *RelatorioFinanceiro_QuickRep;
        TQRBand *QRBand1;
        TQRLabel *Titulo_QRLabel;
        TQRLabel *QRLabel1;
        TQRLabel *Mes_QRLabel;
        TQRSubDetail *Detalhes_SubDetail;
        TQRBand *QRBand2;
        TQRSysData *QRSysData1;
        TQRSysData *QRSysData2;
        TQRLabel *Usua;
        TQRLabel *Usuario_QRLabel;
        TQRLabel *QRLabel2;
        TQRLabel *QRLabel3;
        TQRLabel *QRLabel4;
        TQRLabel *QRLabel5;
        TQRLabel *QRLabel6;
        TQRLabel *QRLabel7;
        TQRDBText *Conta_QRDBText;
        TQRDBText *Moeda_QRDBText;
        TQRDBText *Valor_QRDBText;
        TQRDBText *Vencimento_QRDBText;
        TQRDBText *Situacao_QRDBText;
        TQRDBText *Tipo_QRDBText;
        TQRWMFFilter *QRWMFFilter1;
        TQRRTFFilter *QRRTFFilter1;
        TQRExcelFilter *QRExcelFilter1;
        TQRHTMLFilter *QRHTMLFilter1;
        TQRCSVFilter *QRCSVFilter1;
        TQRTextFilter *QRTextFilter1;
private:	// User declarations
public:		// User declarations
        __fastcall TRelatorioFinanceiro_Form(TComponent* Owner);
        void Personalizar(AnsiString Titulo, AnsiString MesSelecionado, TClientDataSet *Relatorio_ClientDataSet);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelatorioFinanceiro_Form *RelatorioFinanceiro_Form;
//---------------------------------------------------------------------------
#endif
