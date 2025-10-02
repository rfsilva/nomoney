//---------------------------------------------------------------------------

#ifndef DetalhesConta_UnitH
#define DetalhesConta_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "BancoDM_Unit.h"
#include "SelecionarMes_Unit.h"
#include "NovoTipoConta_Unit.h"
#include "Cheque_Unit.h"
#include <Buttons.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>

#define ADICAO  1
#define EDICAO  2
#define DETALHE 4
//---------------------------------------------------------------------------
class TDetalhesConta_Dialog : public TForm
{
__published:	// IDE-managed Components
        TGroupBox *GroupBox1;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TDBEdit *Descricao_DBEdit;
        TDBEdit *Valor_DBEdit;
        TDBEdit *Vencimento_DBEdit;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Moeda_Label;
        TLabel *Label4;
        TLabel *Label5;
        TComboBox *TipoConta_ComboBox;
        TComboBox *Moeda_ComboBox;
        TCheckBox *Estender_CheckBox;
        TComboBox *Status_ComboBox;
        TSpeedButton *SpeedButton1;
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall Vencimento_DBEditClick(TObject *Sender);
        void __fastcall TipoConta_ComboBoxSelect(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall SpeedButton1Click(TObject *Sender);
private:	// User declarations
        AnsiString NovoTipoConta;
public:		// User declarations
        __fastcall TDetalhesConta_Dialog(TComponent* Owner);
        void Personalizar(int Status, int ID, int Conta);
        void PopularComboBoxes(void);
        void EstenderAteOFimDoAno(int ID, int Tipo, int Moeda, TDateTime Vencimento, AnsiString Descricao, float Valor, int Situacao);
};
//---------------------------------------------------------------------------
extern PACKAGE TDetalhesConta_Dialog *DetalhesConta_Dialog;
//---------------------------------------------------------------------------
#endif
