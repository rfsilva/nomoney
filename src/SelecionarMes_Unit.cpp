//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SelecionarMes_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSelecionarMes_Dialog *SelecionarMes_Dialog;
//---------------------------------------------------------------------------
__fastcall TSelecionarMes_Dialog::TSelecionarMes_Dialog(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSelecionarMes_Dialog::BitBtn1Click(TObject *Sender)
{
        Word Day, Month, Year;
        DecodeDate(MonthCalendar1->Date, Year, Month, Day);

        if(Tipo == PRINCIPAL)
                Principal_Form->SetPeriodo(Month, Year);
        else
                DetalhesConta_Dialog->Vencimento_DBEdit->Text = MonthCalendar1->Date;

        Close();
}
//---------------------------------------------------------------------------
void __fastcall TSelecionarMes_Dialog::BitBtn2Click(TObject *Sender)
{
        Close();        
}
//---------------------------------------------------------------------------

void TSelecionarMes_Dialog::Personalizar(int Tipo)
{
        this->Tipo = Tipo;
}

void __fastcall TSelecionarMes_Dialog::FormCreate(TObject *Sender)
{
        MonthCalendar1->Date = Now().CurrentDate();
}
//---------------------------------------------------------------------------

