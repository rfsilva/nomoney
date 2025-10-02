//---------------------------------------------------------------------------

#ifndef SelecionarMes_UnitH
#define SelecionarMes_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ComCtrls.hpp>
#include "Principal_Unit.h"
#include "DetalhesConta_Unit.h"

#define PRINCIPAL 3
#define DETALHE   4

//---------------------------------------------------------------------------
class TSelecionarMes_Dialog : public TForm
{
__published:	// IDE-managed Components
        TMonthCalendar *MonthCalendar1;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        int Tipo;
public:		// User declarations
        __fastcall TSelecionarMes_Dialog(TComponent* Owner);
        void Personalizar(int Tipo);
};
//---------------------------------------------------------------------------
extern PACKAGE TSelecionarMes_Dialog *SelecionarMes_Dialog;
//---------------------------------------------------------------------------
#endif
