unit AConsultaPrecosProdutos;
{          Autor: Rafael Budag
    Data Criação: 16/04/1999;
          Função: Gerar um orçamento

    Motivo alteração:
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Localizacao, StdCtrls, Buttons, Componentes1, Db, DBTables, ExtCtrls,
  PainelGradiente,  DBGrids, Tabela, DBKeyViolation, DBCtrls,
  numericos, LabelCorMove, Parcela, BotaoCadastro,
  EditorImagem, ConvUnidade,UnCotacao, Grids, Mask;

type
  TFConsultaPrecosProdutos = class(TFormularioPermissao)
    CadProdutos: TQuery;
    Localiza: TConsultaPadrao;
    DataCadProdutos: TDataSource;
    PanelColor2: TPanelColor;
    PanelColor5: TPanelColor;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    EClassificacaoProduto: TEditLocaliza;
    CProAti: TCheckBox;
    PainelFoto: TPanelColor;
    PanelColor8: TPanelColor;
    Shape1: TShape;
    VerFoto: TCheckBox;
    Esticar: TCheckBox;
    Panel5: TPanel;
    Foto: TImage;
    ECodigoProduto: TEditColor;
    Label6: TLabel;
    ENomeProduto: TEditColor;
    CadProdutosC_COD_PRO: TStringField;
    CadProdutosC_COD_UNI: TStringField;
    CadProdutosC_NOM_PRO: TStringField;
    CadProdutosC_ATI_PRO: TStringField;
    CadProdutosC_KIT_PRO: TStringField;
    CadProdutosL_DES_TEC: TMemoField;
    CadProdutosC_PAT_FOT: TStringField;
    CadProdutosN_PER_KIT: TFloatField;
    CadProdutosN_QTD_MIN: TFloatField;
    CadProdutosN_QTD_PRO: TFloatField;
    CadProdutosN_VLR_VEN: TFloatField;
    CadProdutosVlrREal: TFloatField;
    DBMemoColor2: TDBMemoColor;
    GProdutos: TGridIndice;
    BCotacao: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BKit: TSpeedButton;
    BFechar: TSpeedButton;
    Bevel1: TBevel;
    CadProdutosC_Cod_Bar: TStringField;
    CadProdutosC_Nom_Moe: TStringField;
    CadProdutosI_SEQ_PRO: TIntegerField;
    CadProdutosN_QTD_RES: TFloatField;
    CadProdutosQTDREAL: TFloatField;
    SpeedButton6: TSpeedButton;
    PanelColor1: TPanelColor;
    CadProdutosTEste: TStringField;
    ECondicao: TEditColor;
    SpeedButton2: TSpeedButton;
    LCondicao: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    EValorCondicao: TEditColor;
    Aux: TQuery;
    CriaParcelas: TCriaParcelasReceber;
    SpeedButton3: TSpeedButton;
    CadProdutosN_Per_Max: TFloatField;
    SpeedButton5: TSpeedButton;
    Label18: TLabel;
    EClientes: TEditLocaliza;
    SpeedButton7: TSpeedButton;
    Label20: TLabel;
    CadProdutosn_vlr_com: TFloatField;
    CadProdutosn_est_max: TFloatField;
    CadProdutosn_vlr_max: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CProAtiClick(Sender: TObject);
    procedure CadProdutosAfterScroll(DataSet: TDataSet);
    procedure EsticarClick(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure BCotacaoClick(Sender: TObject);
    procedure VerFotoClick(Sender: TObject);
    procedure BKitClick(Sender: TObject);
    procedure EClassificacaoProdutoSelect(Sender: TObject);
    procedure EClassificacaoProdutoRetorno(Retorno1, Retorno2: String);
    procedure ENomeProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GProdutosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECondicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ECondicaoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ECodigoProdutoEnter(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EClientesRetorno(Retorno1, Retorno2: String);
  private
    { Private declarations }
    VprTeclaPresionada : Boolean;
    TabelaPrecoNormal : integer;
    procedure AdicionaFiltrosProduto(VpaSelect : TStrings);
    procedure CarregaFoto;
    procedure LocalizaCondicaoPgto;
    function ExisteCondicao(VpaCondicao: Integer):Boolean;
    Function ValorProduto(VpaValor : Double):Double;
  public
    procedure AtualizaConsulta;
  end;

var
  FConsultaPrecosProdutos: TFConsultaPrecosProdutos;

implementation

uses APrincipal, Constantes,ConstMsg,
     AProdutosKit,FunSql, ANovaCotacao, AConsultaCondicaoPgto, ANovaNotaFiscal,
     AVendaECF;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConsultaPrecosProdutos.FormCreate(Sender: TObject);
var
  laco : integer;
begin
  TabelaPrecoNormal := Varia.TabelaPrecoPadrao;
  VprTeclaPresionada := false;
  AtualizaConsulta;
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  CadProdutosN_VLR_VEN.EditFormat := Varia.MascaraValor;
  CadProdutosN_VLR_VEN.DisplayFormat := Varia.MascaraValor;
  PainelFoto.Align := alBottom;
  if Config.CodigoBarras then
    ActiveControl := ECodigoProduto;
  with GProdutos.AListaCAmpos do
  begin
    Clear;
    Add(varia.CodigoProduto);
    Add('C_Nom_Pro');
    add('C_NOM_MOE');
  end;

  for laco := 1 to length(varia.ItensConsultaVenda) do
    if Varia.ItensConsultaVenda[laco] = '0' then
      GProdutos.Columns[laco - 1].Visible := false;

  if not ConfigModulos.Estoque then
  begin
     GProdutos.Columns[5].Visible := false;
     GProdutos.Columns[7].Visible := false;
     GProdutos.Columns[8].Visible := false;
  end;

  BCotacao.Visible := ConfigModulos.OrcamentoVenda;
  SpeedButton3.Visible := ConfigModulos.NotaFiscal;
  SpeedButton4.Visible := ConfigModulos.Caixa;
  GProdutos.Columns[8].Visible := config.MostrarReservado;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConsultaPrecosProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   varia.TabelaPreco := varia.TabelaPrecoPadrao;
   CadProdutos.close;
   Aux.close;
   Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         ações da consulta do produto
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** atualiza a consulta dos produtos **************************}
procedure TFConsultaPrecosProdutos.AtualizaConsulta;
begin
  CadProdutos.sql.clear;
  CadProdutos.sql.add('Select PRO.I_SEQ_PRO,' + varia.CodigoProduto +' C_COD_PRO, C_COD_UNI,  C_NOM_PRO, ' +
                     ' C_ATI_PRO, C_KIT_PRO, L_DES_TEC, C_PAT_FOT, pro.n_vlr_max,'+
                     ' PRO.N_PER_KIT, Qtd.C_Cod_Bar, ' +
                     ' Qtd.N_QTD_MIN, Isnull(QTD.N_QTD_PRO,0) N_QTD_PRO, ' +
                     ' IsNull(QTD.N_QTD_RES,0) N_QTD_RES, ' +
                     ' (QTD.N_QTD_PRO - IsNull(QTD.N_QTD_RES,0)) QTDREAL,' +
                     ' PRE.N_VLR_VEN, (PRE.N_VLR_VEN * MOE.N_Vlr_Dia) VlrREal, '+
                     ' Moe.C_Nom_Moe, Pre.N_Per_Max, Qtd.n_vlr_com, qtd.n_est_max ' +
                     ' from dba.CadProdutos pro, MovQdadeProduto Qtd, MovTabelaPreco Pre, '+
                     ' CadMoedas Moe');
  AdicionaFiltrosProduto(Cadprodutos.Sql);
  CadProdutos.sql.add(' and Pre.I_Cod_Tab = ' + IntToStr(TabelaPrecoNormal) +
                      ' and Qtd.I_Seq_Pro = Pro.I_Seq_Pro '+
                      ' and Pre.I_Cod_Emp = Pro.I_Cod_Emp '+
                      ' and Pre.I_Seq_Pro = Pro.I_Seq_Pro '+
                      ' and Moe.I_Cod_Moe = Pre.I_Cod_Moe' );
  CadProdutos.Sql.add(' order by ' + varia.codigoproduto);
  CadProdutos.Open;
  GProdutos.ALinhaSQLOrderBy := CadProdutos.sql.count - 1;
end;

{******************* adiciona os filtros da consulta **************************}
procedure TFConsultaPrecosProdutos.AdicionaFiltrosProduto(VpaSelect : TStrings);
begin
  VpaSelect.add('Where Qtd.I_Emp_Fil = ' + inttostr(Varia.CodigoEmpFil));

  if ECodigoProduto.text <> '' Then
    VpaSelect.add(' and '+varia.CodigoProduto+ ' = ''' + ECodigoProduto.text+'''')
  else
  begin
    if ENomeProduto.text <> '' Then
      VpaSelect.Add('and Pro.C_Nom_Pro like '''+ENomeProduto.text +'%''');
    if EClassificacaoProduto.text <> ''Then
      VpaSelect.add(' and Pro.C_Cod_Cla like '''+ EClassificacaoProduto.text+ '%''');
    if CProAti.Checked then
      VpaSelect.add(' and Pro.C_Ati_Pro = ''S''');
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Servicos dos  botoes superiores
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********************Mostra ou esconde o painel do orçamento*******************}
procedure TFConsultaPrecosProdutos.BCotacaoClick(Sender: TObject);
begin
  FNovaCotacao := TFNovaCotacao.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaCotacao'));
  FNovaCotacao.NovaCotacao;
  FNovaCotacao.free;
  AtualizaConsulta;
end;

{ ******************* chama o formulario para visualizar kit **************** }
procedure TFConsultaPrecosProdutos.BKitClick(Sender: TObject);
begin
   FProdutosKit := TFProdutosKit.CriarSDI(Application,'',FPrincipal.VerificaPermisao('FProdutosKit'));
   FProdutosKit.MostraKit(CadProdutosI_Seq_Pro.Asstring,Varia.CodigoEmpFil);
end;

{****************************Fecha o Formulario corrente***********************}
procedure TFConsultaPrecosProdutos.BFecharClick(Sender: TObject);
begin
   close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                             Ações dos filtros superiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** carrega a select do localiza classificacao ****************}
procedure TFConsultaPrecosProdutos.EClassificacaoProdutoSelect(Sender: TObject);
begin
  EClassificacaoProduto.ASelectLocaliza.text := 'Select * from CadClassificacao '+
                                                ' where c_nom_Cla like ''@%'''+
                                                ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                                ' and C_Con_Cla  = ''S'''+
                                                ' and C_Tip_Cla = ''P''';
  EClassificacaoProduto.ASelectValida.text := 'Select * from CadClassificacao '+
                                                ' where C_Cod_Cla = ''@'''+
                                                ' and I_cod_emp = ' + InttoStr(Varia.CodigoEmpresa)+
                                                ' and C_Con_Cla = ''S'''+
                                                ' and C_Tip_Cla = ''P''';
end;

{**************** chama a rotina para atualizar a consulta ********************}
procedure TFConsultaPrecosProdutos.EClassificacaoProdutoRetorno(Retorno1,
  Retorno2: String);
begin
  AtualizaConsulta;
end;

{*************Chama a Rotina para atualizar a select dos produtos**************}
procedure TFConsultaPrecosProdutos.CProAtiClick(Sender: TObject);
begin
  AtualizaConsulta;
  if  config.CodigoBarras then
//    if ENomeProduto.Focused then
//    begin
//      ECodigoProduto.setfocus;
//      ECodigoProduto.SelectAll;
//    end;
end;

{**************  quando sair do campo de codigo de barra ******************* }
procedure TFConsultaPrecosProdutos.ECodigoProdutoEnter(Sender: TObject);
begin
  ECodigoProduto.SelectAll;
end;

{************ se for pressionado enter atualiza a consulta ********************}
procedure TFConsultaPrecosProdutos.ENomeProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    13 : AtualizaConsulta;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos da foto
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}
{********************************Mostra a Foto*********************************}
procedure TFConsultaPrecosProdutos.CarregaFoto;
begin
  try
    if (VerFoto.Checked) and (CadProdutosC_PAT_FOT.AsString <> '') then
      Foto.Picture.LoadFromFile(varia.DriveFoto + CadProdutosC_PAT_FOT.AsString)
    else
      Foto.Picture := nil;
  except
      Foto.Picture := nil;
  end;
end;

{******************* consulta a condicao de pagamento *************************}
procedure TFConsultaPrecosProdutos.LocalizaCondicaoPgto;
var
  VpfCondicao : Integer;
begin
  if Econdicao.text <> '' Then
    VpfCondicao := StrToInt(ECondicao.text)
  else
    VpfCondicao := 0;
  FConsultaCondicaoPgto := TFConsultaCondicaoPgto.criarSDI(Application,'',FPrincipal.VerificaPermisao(''));
  FConsultaCondicaoPgto.VisualizaParcelas(CadProdutosVlrREal.Asfloat,VpfCondicao, false);
  FConsultaCondicaoPgto.free;
  if VpfCondicao <> 0 then
  begin
    ECondicao.text := IntTostr(VpfCondicao);
    ExisteCondicao(VpfCondicao)
  end
  else
  begin
    ECondicao.Clear;
    LCondicao.caption := '';
    EValorCondicao.text := FormatFloat(Varia.MascaraMoeda,CadProdutosVlrReal.Asfloat);
  end;
end;

{************** verifica se existe a condicao de pagamento ********************}
function TFConsultaPrecosProdutos.ExisteCondicao(VpaCondicao: Integer):Boolean;
begin
  AdicionaSQLAbreTabela(Aux,'Select * from CADCONDICOESPAGTO ' +
                            ' Where I_Cod_Pag = ' + IntToStr(VpaCondicao));
  result := not aux.Eof;

  if result Then
  begin
    LCondicao.caption := Aux.FieldByName('C_Nom_Pag').Asstring;
    CriaParcelas.Parcelas(CadProdutosVlrReal.AsFloat,VpaCondicao,false,Date);
    EValorCondicao.text := FormatFloat(varia.MascaraValor,CriaParcelas.ValorTotal);
  end
  else
  begin
    LCondicao.caption := '';
    EValorcondicao.clear;
  end;
end;

{************** retorna o valor do produto na condicao de pagamento ***********}
Function TFConsultaPrecosProdutos.ValorProduto(VpaValor : Double):Double;
begin
  if ECondicao.text = '' then
    result := VpaValor
  else
  begin
    CriaParcelas.Parcelas(VpaValor,StrToInt(Econdicao.text),false,date);
    result := CriaParcelas.ValorTotal;
  end;
end;

{***************************Estica ou nao a foto*******************************}
procedure TFConsultaPrecosProdutos.EsticarClick(Sender: TObject);
begin
  Foto.Stretch := esticar.Checked;
end;

{********************Visualiza ou não a foto do produto************************}
procedure TFConsultaPrecosProdutos.VerFotoClick(Sender: TObject);
begin
  if VerFoto.Checked then
     CarregaFoto
  else
    Foto.Picture.Bitmap := nil;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            eventos diversos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************************eventos do produto**********************************}
procedure TFConsultaPrecosProdutos.CadProdutosAfterScroll(
  DataSet: TDataSet);
begin
  if not VprTeclaPresionada then
  begin
    BKit.Enabled := CadProdutosC_KIT_PRO.Asstring = 'K';
    carregaFoto;
    EValorCondicao.Text := FormatFloat(CurrencyString+' ###,###,##0.00',ValorProduto(CadProdutosVlrReal.AsFloat));
  end;
end;

{*************** quando e pressionado uma tecla no grid ***********************}
procedure TFConsultaPrecosProdutos.GProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  VprTeclaPresionada := true;
end;

procedure TFConsultaPrecosProdutos.GProdutosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  VprTeclaPresionada := false;
  if key in[37..40]  then
    CadProdutosAfterScroll(CadProdutos);
end;

{******************** localiza a condicao de pagamento ************************}
procedure TFConsultaPrecosProdutos.ECondicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case key of
    Vk_f3 :  LocalizaCondicaoPgto;
  end;
end;

{*************** valida a condicao de pagamento digitada **********************}
procedure TFConsultaPrecosProdutos.ECondicaoExit(Sender: TObject);
begin
  if ECondicao.text <> '' then
    if not ExisteCondicao(StrToInt(Econdicao.Text)) then
    begin
      LocalizaCondicaoPgto;
      ECondicao.SetFocus;
    end;

end;

{************** chama a rotina para localiza a condicao de pgto ***************}
procedure TFConsultaPrecosProdutos.SpeedButton2Click(Sender: TObject);
begin
  LocalizaCondicaoPgto;
end;

{********************** chama a nova nota fiscal ******************************}
procedure TFConsultaPrecosProdutos.SpeedButton3Click(Sender: TObject);
begin
  FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application, '',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));
  FNovaNotaFiscal.NovaNotaFiscal('V',true);
end;

{************************** chama o ecf ***************************************}
procedure TFConsultaPrecosProdutos.SpeedButton6Click(Sender: TObject);
begin
  FVendaECF := TFVendaECF.CriarSDI(application, '',FPrincipal.VerificaPermisao('FVendaECF'));
  FVendaECF.ShowModal;
end;

procedure TFConsultaPrecosProdutos.SpeedButton5Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConsultaPrecosProdutos.HelpContext);
end;

procedure TFConsultaPrecosProdutos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 27 then
    self.close;
end;

{*************** atualiza a tabela de preco dos produtos ******************** }
procedure TFConsultaPrecosProdutos.EClientesRetorno(Retorno1,
  Retorno2: String);
begin
  if Retorno1 <> '' then
    CodigoTabelaPreco(strtoInt(retorno1), FPrincipal.BaseDados)
  else
   CodigoTabelaPreco(0, FPrincipal.BaseDados);
  TabelaPrecoNormal := Varia.TabelaPreco;
  AtualizaConsulta;
end;

Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFConsultaPrecosProdutos]);
end.
