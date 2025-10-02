//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Splash_Unit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSplash_Form *Splash_Form;
//---------------------------------------------------------------------------
__fastcall TSplash_Form::TSplash_Form(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSplash_Form::FormCreate(TObject *Sender)
{
        Animate1->Visible = true;
        Animate1->Active = true;
}
//---------------------------------------------------------------------------

void __fastcall TSplash_Form::FormDestroy(TObject *Sender)
{
        Animate1->Active = false;
        Animate1->Visible = false;
}
//---------------------------------------------------------------------------

