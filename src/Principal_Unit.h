//---------------------------------------------------------------------------

#ifndef Principal_UnitH
#define Principal_UnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "Login_Unit.h"
#include "BancoDM_Unit.h"
#include "ContasDM_Unit.h"
#include "SelecionarMes_Unit.h"
#include "DetalhesConta_Unit.h"
#include "EmissaoRelatorio_Unit.h"
//#include "TabelasDM_Unit.h"
#include "About_Unit.h"
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <DBGrids.hpp>
#include <Grids.hpp>
#include <Buttons.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>

#define ADICAO  1
#define EDICAO  2
#define PRINCIPAL 3   
//---------------------------------------------------------------------------
class TPrincipal_Form : public TForm
{
__published:	// IDE-managed Components
        TMainMenu *MainMenu1;
        TImageList *ImageList1;
        TMenuItem *Sobre1;
        TMenuItem *Sair1;
        TPageControl *Geral_PageControl;
        TTabSheet *Situacao_TabSheet;
        TStatusBar *StatusBar1;
        TMenuItem *Logoff1;
        TGroupBox *GroupBox1;
        TMenuItem *Logon1;
        TTabSheet *ConfiguracaoAdmin_TabSheet;
        TBitBtn *BitBtn1;
        TBitBtn *BitBtn2;
        TBitBtn *BitBtn3;
        TBitBtn *BitBtn4;
        TBitBtn *BitBtn5;
        TBitBtn *BitBtn6;
        TGroupBox *GroupBox2;
        TLabel *Label2;
        TLabel *Label3;
        TLabel *Label4;
        TLabel *TotalContas_Label;
        TLabel *TotalContasAPagar_Label;
        TLabel *TotalContasPagas_Label;
        TLabel *Label7;
        TLabel *Real3;
        TLabel *SobraMes_Label;
        TLabel *Label8;
        TLabel *Label9;
        TLabel *Label10;
        TLabel *Label11;
        TLabel *Credito_Label;
        TLabel *Debito_Label;
        TGroupBox *GroupBox3;
        TLabel *Label5;
        TLabel *SaldoMes_Label;
        TLabel *Real1;
        TLabel *Label6;
        TLabel *DebitoRestante_Label;
        TLabel *Real2;
        TTabSheet *DadosPessoais_TabSheet;
        TMenuItem *DadosPessoais1;
        TMenuItem *Situacao1;
        TGroupBox *GroupBox4;
        TGroupBox *GroupBox5;
        TLabel *Label12;
        TDBEdit *Sobrenome_DBEdit;
        TDBEdit *Apelido_DBEdit;
        TLabel *Label14;
        TDBEdit *Cargo_DBEdit;
        TLabel *Label17;
        TDBEdit *Sexo_DBEdit;
        TLabel *Label16;
        TDBEdit *Nascimento_DBEdit;
        TLabel *Label15;
        TDBEdit *Salario_DBEdit;
        TLabel *Label18;
        TDBEdit *Moeda_DBEdit;
        TLabel *Label19;
        TDBEdit *DiaPagto_DBEdit;
        TLabel *Label20;
        TGroupBox *GroupBox6;
        TDBGrid *DBGrid1;
        TLabel *Label22;
        TBitBtn *BitBtn12;
        TBitBtn *BitBtn13;
        TBitBtn *BitBtn8;
        TBitBtn *BitBtn14;
        TDBEdit *Endereco_DBEdit;
        TDBEdit *Bairro_DBEdit;
        TDBEdit *Cidade_DBEdit;
        TDBEdit *CEP_DBEdit;
        TLabel *Label23;
        TLabel *Label24;
        TLabel *Label25;
        TLabel *Label26;
        TLabel *Label21;
        TDBEdit *Email_DBEdit;
        TLabel *Label27;
        TDBEdit *Estado_DBEdit;
        TGroupBox *GroupBox8;
        TBitBtn *BitBtn7;
        TButton *Button1;
        TButton *Button2;
        TButton *Button3;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TTabSheet *TabSheet2;
        TTabSheet *TabSheet3;
        TTabSheet *TabSheet4;
        TDBGrid *Situacao_DBGrid;
        TLabel *Mes_Label;
        TLabel *Label1;
        TDBGrid *DBGrid2;
        TDBGrid *DBGrid3;
        TDBGrid *DBGrid4;
        void __fastcall Sair1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall Logoff1Click(TObject *Sender);
        void __fastcall Logon1Click(TObject *Sender);
        void __fastcall BitBtn1Click(TObject *Sender);
        void __fastcall BitBtn2Click(TObject *Sender);
        void __fastcall BitBtn3Click(TObject *Sender);
        void __fastcall BitBtn4Click(TObject *Sender);
        void __fastcall BitBtn5Click(TObject *Sender);
        void __fastcall BitBtn6Click(TObject *Sender);
        void __fastcall Situacao_DBGridDblClick(TObject *Sender);
        void __fastcall Sobre1Click(TObject *Sender);
        void __fastcall DadosPessoais1Click(TObject *Sender);
        void __fastcall Situacao1Click(TObject *Sender);
        void __fastcall DadosPessoais_TabSheetShow(TObject *Sender);
        void __fastcall BitBtn7Click(TObject *Sender);
        void __fastcall Situacao_DBGridDrawColumnCell(TObject *Sender,
          const TRect &Rect, int DataCol, TColumn *Column,
          TGridDrawState State);
private:	// User declarations
        AnsiString Tempo;
        bool User;
        bool Admin;
        AnsiString Nome;
        int MesAtual;
        int AnoAtual;
        int CodigoConta;
        bool JaMostrou;
public:		// User declarations
        __fastcall TPrincipal_Form(TComponent* Owner);
        bool Login(void);
        void SetLogin(bool Valor);
        void SetAdmin(bool Valor);
        void SetLabel(bool User, bool Admin);
        void SetNome(AnsiString Nome);
        void GetMonth(AnsiString &Month, int Mes);
        void GetDayOfWeek(AnsiString &Day, int DayOfWeek);
        void SetPeriodo(int Mes, int Ano);
        void Analise(void);
        void GetCodigoConta(int CodigoConta);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrincipal_Form *Principal_Form;
//---------------------------------------------------------------------------
#endif
