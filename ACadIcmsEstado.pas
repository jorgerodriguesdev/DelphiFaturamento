unit ACadIcmsEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Grids, DBGrids, Tabela, ExtCtrls, StdCtrls, Mask, DBCtrls, Db,
  BotaoCadastro, Buttons, Componentes1, PainelGradiente, DBTables,
  Localizacao, DBKeyViolation;

type
  TFCadIcmsEstado = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    BotaoCancelar1: TBotaoCancelar;
    BotaoGravar1: TBotaoGravar;
    BotaoExcluir1: TBotaoExcluir;
    BotaoAlterar1: TBotaoAlterar;
    BotaoCadastrar1: TBotaoCadastrar;
    MoveBasico1: TMoveBasico;
    Label1: TLabel;
    DataCadIcmsEstado: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    DBComboBoxUF1: TDBComboBoxUF;
    DBEditColor1: TDBEditColor;
    DBEditColor3: TDBEditColor;
    Bevel1: TBevel;
    DBGridColor1: TDBGridColor;
    Consulta: TLocalizaEdit;
    Label3: TLabel;
    CadIcmsEstado: TSQL;
    CadIcmsEstadoC_COD_EST: TStringField;
    CadIcmsEstadoN_ICM_INT: TFloatField;
    CadIcmsEstadoN_ICM_EXT: TFloatField;
    BFechar: TBitBtn;
    ValidaGravacao1: TValidaGravacao;
    CadIcmsEstadoD_ULT_ALT: TDateField;
    BBAjuda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure DBComboBoxUF1Change(Sender: TObject);
    procedure CadIcmsEstadoBeforePost(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadIcmsEstado: TFCadIcmsEstado;

implementation

uses APrincipal,Constantes;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFCadIcmsEstado.FormCreate(Sender: TObject);
begin
   CadIcmsEstado.open;
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFCadIcmsEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CadIcmsEstado.close;
 Action := CaFree;
end;


{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFCadIcmsEstado.BFecharClick(Sender: TObject);
begin
   close;
end;

{*************** valida a gravação **************************************** }
procedure TFCadIcmsEstado.DBComboBoxUF1Change(Sender: TObject);
begin
if CadIcmsEstado.State in [ dsInsert, dsEdit ] then
  ValidaGravacao1.execute;
end;

{******************* antes de gravar o registro *******************************}
procedure TFCadIcmsEstado.CadIcmsEstadoBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadIcmsEstadoD_ULT_ALT.AsDateTime := Date;
end;

procedure TFCadIcmsEstado.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FCadIcmsEstado.HelpContext);
end;

Initialization
 RegisterClasses([TFCadIcmsEstado]);
end.
