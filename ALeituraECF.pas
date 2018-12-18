unit ALeituraECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Spin, Componentes1, ComCtrls, Buttons, ExtCtrls,
  PainelGradiente, UnECF;

type
  TFLeituraECF = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Data1: TCalendario;
    Data2: TCalendario;
    BitBtn3: TBitBtn;
    SpinEditColor1: TSpinEditColor;
    SpinEditColor2: TSpinEditColor;
    BitBtn4: TBitBtn;
    PanelColor2: TPanelColor;
    BitBtn8: TBitBtn;
    BBAjuda: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     ECF : TECF;
     procedure VerificaDataEcf;
   public
    { Public declarations }
  end;

var
  FLeituraECF: TFLeituraECF;

implementation

uses APrincipal,  constmsg, constantes, fundata;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFLeituraECF.FormCreate(Sender: TObject);
begin
   ECF := TECF.criar( self, FPrincipal.BaseDados );
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   if ECF.AbrePorta then
   begin
     Data1.DateTime := date;
     Data2.DateTime := date;
     VerificaDataEcf;
   end;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFLeituraECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ECF.FecharPorta;
 if ECF <> nil then
  ECF.Destroy;
 Action := CaFree;
end;


{********************* leitura X ******************************************** }
procedure TFLeituraECF.BitBtn1Click(Sender: TObject);
begin
  if ConfirmacaoFormato(CT_LeituraX,[ dateToStr(date)]) then
    ECF.LeituraX;
end;

{********************* Reducao Z ******************************************** }
procedure TFLeituraECF.BitBtn2Click(Sender: TObject);
begin
  if ConfirmacaoFormato(CT_ReducaoZ,[ dateToStr(date)]) then
    ECF.ReducaoZ;
end;

{  *************** Leitura por data *****************************************  }
procedure TFLeituraECF.BitBtn3Click(Sender: TObject);
begin
  ECF.LeituraMemoriaFiscalData(data1.DateTime,data2.DateTime);
end;

{************* leitura por intervalo ***************************************** }
procedure TFLeituraECF.BitBtn4Click(Sender: TObject);
begin
  ECF.LeituraMemoriaFiscalIntervalo(SpinEditColor1.Value,SpinEditColor2.Value);
end;

{*********** fecha o formulario ********************************************* }
procedure TFLeituraECF.BitBtn8Click(Sender: TObject);
begin
  close;
end;

{******* verifica a data do computador esta correta em relacao a imrpessora ** }
procedure TFLeituraECF.VerificaDataEcf;
begin
  if MontaDataTexto( copy(ECF.RetornaVariaveis( 23 ),1,6),true ) <> date then
  begin
    aviso(CT_DataDifECF);
    GroupBox1.Enabled := false;
    GroupBox2.Enabled := false;
    GroupBox3.Enabled := false;
  end;
end;


procedure TFLeituraECF.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FLeituraECF.HelpContext);
end;

procedure TFLeituraECF.Button1Click(Sender: TObject);
begin
  aviso(ECF.RetornaVariaveis(23));
end;

Initialization
 RegisterClasses([TFLeituraECF]);
end.
