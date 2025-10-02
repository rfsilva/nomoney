//---------------------------------------------------------------------------

#ifndef About_UnitH
#define About_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TAboutBox : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TImage *Image1;
        TLabel *Label1;
        TBitBtn *BitBtn1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *Versao_Label;
        void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAboutBox(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAboutBox *AboutBox;
//---------------------------------------------------------------------------
#endif
