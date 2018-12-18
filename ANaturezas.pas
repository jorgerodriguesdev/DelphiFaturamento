unit ANaturezas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Db, BotaoCadastro, StdCtrls, Buttons, DBTables, Tabela,
  Componentes1, ExtCtrls, PainelGradiente, DBKeyViolation, Grids, DBGrids,
  Mask, DBCtrls, Localizacao;

type
  TFNaturezas = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoAlterar1: TBotaoAlterar;
    BotaoExcluir1: TBotaoExcluir;
    DataNatureza: TDataSource;
    BFechar: TBitBtn;
    PanelColor2: TPanelColor;
    Consulta: TLocalizaEdit;
    Label3: TLabel;
    CadNatureza: TQuery;
    GridIndice1: TGridIndice;
    BotaoConsultar1: TBotaoConsultar;
    CadNaturezaC_COD_NAT: TStringField;
    CadNaturezaC_NOM_NAT: TStringField;
    BBAjuda: TBitBtn;
    Ativas: TCheckBox;
    CadNaturezaC_GER_FIN: TStringField;
    CadNaturezaC_ENT_SAI: TStringField;
    CadNaturezaC_BAI_EST: TStringField;
    CadNaturezaC_GER_COM: TStringField;
    CadNaturezaC_MOS_FAT: TStringField;
    Label1: TLabel;
    EditColor1: TEditColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridColor1TitleClick(Column: TColumn);
    procedure BFecharClick(Sender: TObject);
    procedure BotaoCadastrar1AntesAtividade(Sender: TObject);
    procedure BotaoCadastrar1DepoisAtividade(Sender: TObject);
    procedure BotaoAlterar1Atividade(Sender: TObject);
    procedure BotaoExcluir1DepoisAtividade(Sender: TObject);
    procedure BotaoExcluir1DestroiFormulario(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure AtivasClick(Sender: TObject);
    procedure EditColor1Exit(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FNaturezas: TFNaturezas;

implementation

uses APrincipal, ANovaNatureza,Constantes, funsql;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFNaturezas.FormCreate(Sender: TObject);
begin
   CadNatureza.open;
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   Consulta.AtualizaTabela;
   BotaoCadastrar1.Enabled := not config.PermiteAlterarNaturezaOperacao;
   BotaoAlterar1.Enabled := not config.PermiteAlterarNaturezaOperacao;
   BotaoExcluir1.Enabled := not config.PermiteAlterarNaturezaOperacao;
   BotaoConsultar1.Enabled := not config.PermiteAlterarNaturezaOperacao;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFNaturezas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CadNatureza.close; { fecha tabelas }
   Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**********Altera a ordem da tabela e atualiza o indice do grid****************}
procedure TFNaturezas.DBGridColor1TitleClick(Column: TColumn);
begin
end;

{****************************Fecha o Formulario corrente***********************}
procedure TFNaturezas.BFecharClick(Sender: TObject);
begin
   close;
end;

{****************Cria o Formulario para inserir um novo registro***************}
procedure TFNaturezas.BotaoCadastrar1AntesAtividade(Sender: TObject);
begin
   FNovaNatureza := TFNovaNatureza.CriarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaNatureza'));
end;

{**************Mostra o novo formulario e na volta atualiza a Tabela***********}
procedure TFNaturezas.BotaoCadastrar1DepoisAtividade(Sender: TObject);
begin
   FNovaNatureza.ShowModal;
   Consulta.AtualizaTabela;
end;

{*****************************Posiciona o registro*****************************}
procedure TFNaturezas.BotaoAlterar1Atividade(Sender: TObject);
begin
   FNovaNatureza.PosicionaNatureza(CadNaturezaC_COD_NAT.AsString);
end;

{***********************Mostra o registro a ser excluído***********************}
procedure TFNaturezas.BotaoExcluir1DepoisAtividade(Sender: TObject);
begin
   FNovaNatureza.show;
end;

{********************Fecha o formulário do registro excluído*******************}
procedure TFNaturezas.BotaoExcluir1DestroiFormulario(Sender: TObject);
begin
   FNovaNatureza.close;
   Consulta.AtualizaTabela;
end;

{**************************Aciona o botão Alterar******************************}
procedure TFNaturezas.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FNaturezas.HelpContext);
end;

procedure TFNaturezas.AtivasClick(Sender: TObject);
var
  permite : string;
begin
   permite := '';
   if  EditColor1.text <> '' then
     permite :=  ' and isnull(c_fil_per,''' + EditColor1.text +
                 ''') like ''%' + EditColor1.text  + '%''';

   if not Ativas.Checked then
     Consulta.AOrdem := permite + 'order by c_cod_nat'
   else
     Consulta.AOrdem := permite + ' and c_ati_nat = ''S'' order by c_cod_nat';
  Consulta.AtualizaConsulta;
end;

procedure TFNaturezas.EditColor1Exit(Sender: TObject);
begin
  AtivasClick(nil);
  Consulta.AtualizaConsulta;
end;

Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFNaturezas]);
end.
