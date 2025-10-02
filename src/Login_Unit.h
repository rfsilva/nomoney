//---------------------------------------------------------------------------

#ifndef Login_UnitH
#define Login_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Buttons.hpp>
#include "Principal_Unit.h"
#include "BancoDM_Unit.h"
#include <IniFiles.hpp>
//---------------------------------------------------------------------------
class TLogin_Dialog : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TEdit *Login_Edit;
        TEdit *Senha_Edit;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TComboBox *Tipo_ComboBox;
        TLabel *Label4;
        TCheckBox *Senha_CheckBox;
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:
public:		// User declarations
        __fastcall TLogin_Dialog(TComponent* Owner);
        void ConfigurarIniFile(AnsiString Login, AnsiString Senha, bool Guarda, AnsiString TipoAcesso);
};
//---------------------------------------------------------------------------
extern PACKAGE TLogin_Dialog *Login_Dialog;
//---------------------------------------------------------------------------
#endif
