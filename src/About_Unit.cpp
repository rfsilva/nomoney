//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "About_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TAboutBox *AboutBox;
//---------------------------------------------------------------------------
__fastcall TAboutBox::TAboutBox(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAboutBox::BitBtn1Click(TObject *Sender)
{
        Close();        
}
//---------------------------------------------------------------------------

