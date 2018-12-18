unit ALocalizaServico;
{          Autor: Rafael Budag
    Data Criação: 16/04/1999;
          Função: Gerar um orçamento

    Motivo alteração:
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Localizacao, StdCtrls, Buttons, Componentes1, Db, DBTables, ExtCtrls,
  PainelGradiente, DBGrids, Tabela, DBCtrls, Mask,
  numericos, LabelCorMove, CheckLst, BotaoCadastro, DBKeyViolation, Grids;

type
  TFlocalizaServico = class(TFormularioPermissao)
    CadServico: TQuery;
    PanelColor2: TPanelColor;
    PanelColor5: TPanelColor;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    LDesClassificacao: TLabel;
    CProAti: TCheckBox;
    PanelColor16: TPanelColor;
    ENomeServico: TEditColor;
    GProdutos: TGridIndice;
    DBMemoColor1: TDBMemoColor;
    PainelGradiente1: TPainelGradiente;
    BFechar: TBitBtn;
    BitBtn1: TBitBtn;
    BotaoCadastrar1: TBitBtn;
    CadServicoI_COD_SER: TIntegerField;
    CadServicoC_NOM_SER: TStringField;
    CadServicoN_VLR_VEN: TFloatField;
    CadServicoC_Nom_Moe: TStringField;
    CadServicoL_OBS_SER: TMemoField;
    DataCadServico: TDataSource;
    EClassificacao: TEditColor;
    Aux: TQuery;
    BBAjuda: TBitBtn;
    Label1: TLabel;
    ECodSer: TEditColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CProAtiClick(Sender: TObject);
    procedure EClassificacaoSelect(Sender: TObject);
    procedure EClassificacaoRetorno(Retorno1, Retorno2: String);
    procedure ENomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BFecharClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BotaoCadastrar1Click(Sender: TObject);
    procedure EClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ENomeServicoEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EClassificacaoExit(Sender: TObject);
    procedure GProdutosEnter(Sender: TObject);
    procedure GProdutosExit(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
  private
    { Private declarations }
    Cadastrou : Boolean;
    acao : boolean;
    procedure AtualizaConsulta;
    procedure AdicionaFiltrosProduto(VpaSelect : TStrings);
    function LocalizaClassificacao : Boolean;
    function ExisteClassificacao : Boolean;
  public
    procedure ConsultaServico;
    function LocalizaServico( var VpaCadastrou : Boolean; var VpaCodServico : integer; Var VpaValorVenda : Double ) : boolean; overload;
    function LocalizaServico( var VpaCadastrou : Boolean; var VpaCodServico : integer; var VpaNomServico : string; Var VpaValorVenda : Double ) : boolean; overload;
  end;

var
  FlocalizaServico: TFlocalizaServico;

implementation

uses APrincipal, Constantes,ConstMsg, ALocalizaClassificacao, FunSql;
{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFlocalizaServico.FormCreate(Sender: TObject);
begin
  AtualizaConsulta;
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  CadServicoN_VLR_VEN.EditFormat := Varia.MascaraValor;
  CadServicoN_VLR_VEN.DisplayFormat := Varia.MascaraValor;
  Cadastrou := false;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFlocalizaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;



{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                               eventos do filtro superior
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** carrega a select do localiza classificacao ****************}
procedure TFlocalizaServico.EClassificacaoSelect(Sender: TObject);
begin
{  EClassificacao.ASelectLocaliza.text := 'Select * from CadClassificacao '+
                                          ' where c_nom_Cla like ''@%'''+
                                          ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                          ' and C_Con_Cla  = ''S'''+
                                          ' and C_Tip_Cla = ''S''';
  EClassificacao.ASelectValida.text := 'Select * from CadClassificacao '+
                                       ' where C_Cod_Cla = ''@'''+
                                       ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                       ' and C_Con_Cla = ''S'''+
                                       ' and C_Tip_Cla = ''S''';}
end;

{**************** chama a rotina para atualizar a consulta ********************}
procedure TFlocalizaServico.EClassificacaoRetorno(Retorno1,
  Retorno2: String);
begin
  AtualizaConsulta;
end;

{*************Chama a Rotina para atualizar a select dos produtos**************}
procedure TFlocalizaServico.CProAtiClick(Sender: TObject);
begin
  AtualizaConsulta;
  
  BFechar.Default := true;
end;

{************ se for pressionado enter atualiza a consulta ********************}
procedure TFlocalizaServico.ENomeProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    13 : AtualizaConsulta;
  end;
end;

{******************* verifica as teclas pressionadas **************************}
procedure TFlocalizaServico.EClassificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    40 :
      begin
        GProdutos.setfocus;
        CadServico.next;
      end;
    Vk_Up :
      begin
        GProdutos.setfocus;
        Cadservico.Prior;
      end;
    vk_f3 :
        if EClassificacao.focused then
          LocalizaClassificacao;
  end;


  if Key = 13 then
    AtualizaConsulta;
end;

{******************* tira o botao fechar como default *************************}
procedure TFlocalizaServico.ENomeServicoEnter(Sender: TObject);
begin
  BFechar.Default := false;
end;

{********************* localiza as classificacoes *****************************}
Function TFlocalizaServico.LocalizaClassificacao : Boolean;
Var
  VpfCodClassificacao, VpfNomClassificacao : String;
begin
  FLocalizaClassificacao := TFLocalizaClassificacao.CriarSDI(application,'', true);
  result := FLocalizaClassificacao.LocalizaClassificacao(VpfCodClassificacao,VpfNomClassificacao,'S');

  if result then
  begin
    EClassificacao.Text := VpfCodClassificacao;
    LDesClassificacao.Caption  := VpfNomClassificacao;
  end;
  FLocalizaClassificacao.free;
  AtualizaConsulta;
end;

{****************** verifica se existe a classificacao ************************}
function TFlocalizaServico.ExisteClassificacao : Boolean;
begin
  LDesClassificacao.Caption := '';
  AdicionaSQLAbreTabela(Aux,'Select * from CadClassificacao ' +
                            ' where I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa) +
                            ' and C_Cod_Cla = '''+ EClassificacao.Text + '''' +
                            ' and C_Tip_Cla = ''S''');
  result := not Aux.Eof;

  if result Then
    LDesClassificacao.Caption := Aux.FieldByName('C_Nom_Cla').Asstring;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         ações da consulta do Servico
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** atualiza a consulta dos produtos **************************}
procedure TFlocalizaServico.AtualizaConsulta;
begin
  CadServico.sql.clear;
  CadServico.sql.add('Select ' +
                     ' SER.I_COD_SER, SER.C_NOM_SER, L_OBS_SER,' +
                     ' (PRE.N_VLR_VEN * MOE.N_Vlr_Dia) N_VLR_VEN, ' +
                     ' Moe.C_Nom_Moe  ' +
                     ' from dba.CadServico Ser, MovTabelaPrecoServico Pre, ' +
                     ' CadMoedas Moe');
  AdicionaFiltrosProduto(CadServico.Sql);
  CadServico.sql.add(' and Pre.I_Cod_Tab = ' + IntToStr(Varia.TabelaPrecoServico) +
                      ' and Pre.I_Cod_Emp = Ser.I_Cod_Emp '+
                      ' and Pre.I_Cod_Ser = Ser.I_Cod_Ser '+
                      ' and Moe.I_Cod_Moe = Pre.I_Cod_Moe' +
                      ' order by c_nom_ser ');
  CadServico.Open;
end;

{******************* adiciona os filtros da consulta **************************}
procedure TFlocalizaServico.AdicionaFiltrosProduto(VpaSelect : TStrings);
begin
  VpaSelect.add('Where Ser.I_Cod_Emp = ' + inttostr(Varia.CodigoEmpresa));

  if ENomeServico.text <> '' Then
    VpaSelect.Add('and Ser.C_Nom_Ser like '''+ENomeServico.text +'%''');

  if EClassificacao.text <> ''Then
    VpaSelect.add(' and Ser.C_Cod_Cla like '''+ EClassificacao.text+ '%''');

  if CProAti.Checked then
    VpaSelect.add(' and Ser.C_Ati_Ser = ''S''');

  if ECodSer.Text <> '' then
    VpaSelect.add(' and Ser.i_cod_ser = ' + ECodSer.Text);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                             eventos dos botoes inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************** fecha o formulario ***********************************}
procedure TFlocalizaServico.BFecharClick(Sender: TObject);
begin
  acao := true;
  self.close;
end;

{*********************** Cancela a consulta ***********************************}
procedure TFlocalizaServico.BitBtn1Click(Sender: TObject);
begin
  acao := false;
  self.close;
end;

{******************** cadastra um novo servico ********************************}
procedure TFlocalizaServico.BotaoCadastrar1Click(Sender: TObject);
begin
{  FNovoProduto := TFNovoProduto.CriarSDI(application, '', true);
  FNovoProduto.InsereNovoProduto;
  AtualizaConsulta;
  Cadastrou := true;}
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{********************** consulta o servico ************************************}
procedure TFlocalizaServico.ConsultaServico;
begin
  BotaoCadastrar1.Visible := false;
  ShowModal;
end;

{ ********************** chamada externa da localizacao de servicos ********** }
function TFlocalizaServico.LocalizaServico( var VpaCadastrou : Boolean; var VpaCodServico : integer; Var VpaValorVenda : Double ) : boolean;
begin
  BotaoCadastrar1.Visible  := Cadastrou;

  ShowModal;
  result := acao;
  Cadastrou := Self.Cadastrou;

  if CadServico.IsEmpty then
    result := false;

  if acao then
  begin
    VpaCodServico := CadServicoI_COD_SER.AsInteger;
    VpaValorVenda := CadServicoN_VLR_VEN.AsFloat;
  end
  else
  begin
    VpaCodServico := 0;
    VpaValorVenda := 0;
  end;
end;

{ ********************** chamada externa da localizacao de produtos ********** }
function TFlocalizaServico.LocalizaServico( var VpaCadastrou : Boolean; var VpaCodServico : integer; var VpaNomServico : string; Var VpaValorVenda : Double ) : boolean;
begin
  result := localizaServico(VpaCadastrou,VpaCodServico,VpaValorVenda);
  if result then
    VpaNomServico := CadServicoC_NOM_SER.AsString
  else
    VpaNomServico := '';

end;

{************************** localiza a classificacao **************************}
procedure TFlocalizaServico.SpeedButton1Click(Sender: TObject);
begin
  LocalizaClassificacao;
end;

{***************** valida a classificacao digitada ****************************}
procedure TFlocalizaServico.EClassificacaoExit(Sender: TObject);
begin
  if EClassificacao.text <> '' then
    if Not ExisteClassificacao Then
      if not LocalizaClassificacao then
        EClassificacao.SetFocus;
  AtualizaConsulta;      
end;

{********************** quando entra nos servicos *****************************}
procedure TFlocalizaServico.GProdutosEnter(Sender: TObject);
begin
  BFechar.Default := true;
end;

{********************* quando sai da grade ************************************}
procedure TFlocalizaServico.GProdutosExit(Sender: TObject);
begin
  BFechar.Default := false;
end;

procedure TFlocalizaServico.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FlocalizaServico.HelpContext);
end;

Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFlocalizaServico]);
end.
