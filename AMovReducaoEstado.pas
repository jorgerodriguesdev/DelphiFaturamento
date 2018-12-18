unit AMovReducaoEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Grids, DBGrids, Tabela, ExtCtrls, StdCtrls, Mask, DBCtrls, Db,
  BotaoCadastro, Buttons, Componentes1, PainelGradiente, DBTables,
  Localizacao, DBKeyViolation;

type
  TFMovReducaoEstado = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    MoveBasico1: TMoveBasico;
    DataCadIcmsEstado: TDataSource;
    Bevel1: TBevel;
    DBGridColor1: TDBGridColor;
    Reducao: TSQL;
    BFechar: TBitBtn;
    ValidaGravacao1: TValidaGravacao;
    BBAjuda: TBitBtn;
    EditLocaliza1: TEditLocaliza;
    BCidade: TSpeedButton;
    Localiza: TConsultaPadrao;
    Label2: TLabel;
    Label3: TLabel;
    ReducaoI_COD_RED: TIntegerField;
    ReducaoC_EST_RED: TStringField;
    ReducaoC_DES_RED: TStringField;
    ReducaoN_PER_RED: TFloatField;
    ReducaoD_ULT_ALT: TDateField;
    BitBtn1: TBitBtn;
    Aux: TSQL;
    AuxI_COD_RED: TIntegerField;
    AuxC_EST_RED: TStringField;
    AuxC_DES_RED: TStringField;
    AuxN_PER_RED: TFloatField;
    AuxD_ULT_ALT: TDateField;
    DBFilialColor1: TDBFilialColor;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBComboBoxUF1: TDBComboBoxUF;
    Label4: TLabel;
    DBEditNumerico1: TDBEditNumerico;
    BotaoAlterar1: TBotaoAlterar;
    BotaoExcluir1: TBotaoExcluir;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    BotaoCadastrar1: TBotaoCadastrar;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure DBComboBoxUF1Change(Sender: TObject);
    procedure ReducaoBeforePost(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure EditLocaliza1Retorno(Retorno1, Retorno2: String);
    procedure ReducaoAfterInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure ReducaoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovReducaoEstado: TFMovReducaoEstado;

implementation

uses APrincipal,Constantes, ACadIcmsEstado, funsql, constmsg;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFMovReducaoEstado.FormCreate(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   DBFilialColor1.ACodFilial := varia.CodigoEmpFil;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFMovReducaoEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  reducao.close;
  aux.close;
 Action := CaFree;
end;


{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFMovReducaoEstado.BFecharClick(Sender: TObject);
begin
   close;
end;

{*************** valida a gravação **************************************** }
procedure TFMovReducaoEstado.DBComboBoxUF1Change(Sender: TObject);
begin
if reducao.State in [ dsInsert, dsEdit ] then
  ValidaGravacao1.execute;
end;

{******************* antes de gravar o registro *******************************}
procedure TFMovReducaoEstado.ReducaoBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  reducaoD_ULT_ALT.AsDateTime := Date;
end;

procedure TFMovReducaoEstado.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FCadIcmsEstado.HelpContext);
end;

procedure TFMovReducaoEstado.EditLocaliza1Retorno(Retorno1,
  Retorno2: String);
begin
  if retorno1 <> '' then
    AdicionaSQLAbreTabela(reducao, 'Select * from MOVREDUCOESICMS where i_cod_red = ' + Retorno1);
  if EditLocaliza1.Text = '' then
    Reducao.close;  
  BotaoAlterar1.Enabled := Reducao.Active;
  BotaoCadastrar1.Enabled := Reducao.Active;
  BotaoExcluir1.Enabled := Reducao.Active;
end;

procedure TFMovReducaoEstado.ReducaoAfterInsert(DataSet: TDataSet);
begin
  if EditLocaliza1.text <> '' then
  begin
     ReducaoC_DES_RED.AsString := label3.Caption;
     ReducaoI_COD_RED.AsInteger := StrToInt(EditLocaliza1.text);
  end;
end;

procedure TFMovReducaoEstado.BitBtn1Click(Sender: TObject);
var
  Nome : string;
  ProximoCodigo : string;
begin
  if Entrada( 'Nome', 'Nome da Descrição', nome, false, FPrincipal.CorFoco.AFundoComponentes, FPrincipal.CorForm.ACorPainel) then
  begin
    Aux.open;
    Aux.insert;
    DBFilialColor1.ProximoCodigo;
    AuxC_DES_RED.asstring := nome;
    AuxD_ULT_ALT.AsDateTime := date;
    AuxC_EST_RED.AsString := varia.EstadoPadrao;
    AuxN_PER_RED.AsCurrency := 0;
    aux.post;
    aux.close;
  end;
end;

procedure TFMovReducaoEstado.ReducaoAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(Reducao);
end;

Initialization
 RegisterClasses([TFMovReducaoEstado]);
end.
