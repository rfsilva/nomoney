//---------------------------------------------------------------------------

#ifndef Splash_UnitH
#define Splash_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TSplash_Form : public TForm
{
__published:	// IDE-managed Components
        TAnimate *Animate1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSplash_Form(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSplash_Form *Splash_Form;
//---------------------------------------------------------------------------
#endif
