unit ANovaCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Db, DBTables, ExtCtrls, Componentes1, Buttons, Localizacao,
  Mask, DBCtrls, Tabela, Grids, DBGrids, DBKeyViolation, UnCotacao,
  ConvUnidade, Parcela,UnProdutos, UCrpe32;

Const
  CT_PRODUTONAOCADASTRADO = 'CODIGO PRODUTO INVÁLIDO!!! Não existe nenhum produto cadastrado com esse código...';
  CT_UNIDADEVAZIA = 'UNIDADE INVALIDA!!! Unidade digitada inválida....';
  CT_VALORINVALIDO = 'VALOR UNITÁRIO INVALIDO!!! Valor unitário inválido...';
  CT_PRODUTOINVALIDO = 'PRODUTO INVALIDO!!! Produto digitado inválido...';
  CT_SERVICONAOCADASTRADO = 'SERVIÇO NÃO CADASTRADO!!! Serviço digitado inválido...';
  CT_QTDBAIXADAPRODUTO = 'QUANTIDADE INVÁLIDA!!! A quantidade do produto tem que ser obrigatoriamente maior que a quantidade já baixada...';

type
  TFNovaCotacao = class(TFormularioPermissao)
    PanelColor2: TPanelColor;
    Aux: TQuery;
    Localiza: TConsultaPadrao;
    CadOrcamento: TQuery;
    CadOrcamentoI_EMP_FIL: TIntegerField;
    CadOrcamentoI_LAN_ORC: TIntegerField;
    CadOrcamentoI_COD_CLI: TIntegerField;
    CadOrcamentoI_COD_PAG: TIntegerField;
    CadOrcamentoD_DAT_ORC: TDateField;
    CadOrcamentoT_HOR_ORC: TTimeField;
    CadOrcamentoD_DAT_ENT: TDateField;
    CadOrcamentoT_HOR_ENT: TTimeField;
    CadOrcamentoN_DIA_VAL: TIntegerField;
    CadOrcamentoN_PER_ACR: TFloatField;
    CadOrcamentoN_PER_DES: TFloatField;
    CadOrcamentoC_FLA_RES: TStringField;
    CadOrcamentoC_FLA_SIT: TStringField;
    CadOrcamentoI_COD_SIT: TIntegerField;
    CadOrcamentoD_DAT_PRE: TDateField;
    CadOrcamentoC_CON_ORC: TStringField;
    CadOrcamentoL_OBS_ORC: TMemoField;
    CadOrcamentoI_COD_VEN: TIntegerField;
    DataCadOrcamento: TDataSource;
    BFechar: TBitBtn;
    ScrollBox1: TScrollBox;
    MovOrcamentos: TQuery;
    MovOrcamentosI_EMP_FIL: TIntegerField;
    MovOrcamentosI_SEQ_PRO: TIntegerField;
    MovOrcamentosI_LAN_ORC: TIntegerField;
    MovOrcamentosN_VLR_PRO: TFloatField;
    MovOrcamentosN_QTD_PRO: TFloatField;
    MovOrcamentosN_VLR_TOT: TFloatField;
    MovOrcamentosC_COD_UNI: TStringField;
    MovOrcamentosC_IMP_FOT: TStringField;
    MovOrcamentosC_OBS_ORC: TStringField;
    DataMovOrcamento: TDataSource;
    LNomeFantasia: TLabel;
    Label3: TLabel;
    EVendedor: TDBEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Shape2: TShape;
    Label1: TLabel;
    ECliente: TDBEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    LEnderecoCliente: TLabel;
    Label5: TLabel;
    DBEditColor1: TDBEditColor;
    DBEditColor2: TDBEditColor;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    DBEditColor3: TDBEditColor;
    DBEditColor4: TDBEditColor;
    Label9: TLabel;
    ECondPagamento: TDBEditLocaliza;
    SpeedButton3: TSpeedButton;
    Label10: TLabel;
    GOrcamento: TGridIndice;
    Label11: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    ProximoCodigo: TProximoCodigoFilial;
    MovOrcamentosC_COD_PRO: TStringField;
    DBMemoColor1: TDBMemoColorLimite;
    Shape5: TShape;
    CadProdutos: TQuery;
    MovOrcamentosNomProduto: TStringField;
    ValidaUnidade: TValidaUnidade;
    ESituacao: TDBEditLocaliza;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    Label12: TLabel;
    MovOrcamentosC_FLA_RES: TStringField;
    MovOrcamentosC_IMP_DES: TStringField;
    Caption15: TLabel;
    BGravar: TBitBtn;
    BCancelar: TBitBtn;
    BImprimir: TBitBtn;
    SpeedButton5: TSpeedButton;
    ValidaGravacao1: TValidaGravacao;
    CadOrcamentoN_VLR_TOT: TFloatField;
    CriaParcelas: TCriaParcelasReceber;
    GServico: TGridIndice;
    Shape6: TShape;
    Label20: TLabel;
    MovServicoOrcamento: TQuery;
    DataMovServicoOrcamento: TDataSource;
    MovServicoOrcamentoI_EMP_FIL: TIntegerField;
    MovServicoOrcamentoI_LAN_ORC: TIntegerField;
    MovServicoOrcamentoI_COD_SER: TIntegerField;
    MovServicoOrcamentoN_VLR_SER: TFloatField;
    MovServicoOrcamentoN_QTD_SER: TFloatField;
    MovServicoOrcamentoI_COD_EMP: TIntegerField;
    CadServico: TQuery;
    MovServicoOrcamentoNomeServico: TStringField;
    MovServicoOrcamentoN_VLR_TOT: TFloatField;
    EValidade: TDBEditColor;
    CadOrcamentoD_DAT_VAL: TDateTimeField;
    Label13: TLabel;
    DBEditColor5: TDBEditColor;
    MovOrcamentosN_QTD_BAI: TFloatField;
    CadOrcamentoD_ULT_ALT: TDateField;
    MovOrcamentosD_ULT_ALT: TDateField;
    MovServicoOrcamentoD_ULT_ALT: TDateField;
    BBAjuda: TBitBtn;
    CadOrcamentoI_NRO_PED: TIntegerField;
    CadOrcamentoI_NRO_ORC: TIntegerField;
    ProximoCodigoFilial1: TProximoCodigoFilial;
    ProximoCodigoFilial2: TProximoCodigoFilial;
    CadOrcamentoC_TIP_CAD: TStringField;
    CadOrcamentoI_PRA_ENT: TIntegerField;
    DBEditNumerico1: TDBEditNumerico;
    lprazo: TLabel;
    BCadastrar: TBitBtn;
    MovOrcamentosN_DES_PRO: TFloatField;
    DBEditNumerico2: TDBEditNumerico;
    Label36: TLabel;
    EDescAcr: TDBEditNumerico;
    AcrDes: TDBRadioGroup;
    VlrPer: TDBRadioGroup;
    CadOrcamentoN_VLR_PER: TFloatField;
    CadOrcamentoC_DES_ACR: TStringField;
    CadOrcamentoC_VLR_PER: TStringField;
    Label14: TLabel;
    info: TLabel;
    obs: TLabel;
    Labeltotal: TLabel;
    BHistorico: TSpeedButton;
    BImpCupom: TBitBtn;
    CadOrcamentoI_QTD_IMP: TIntegerField;
    CadOrcamentoI_COD_USU: TIntegerField;
    MovOrcamentosC_IMP_VAL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EClienteRetorno(Retorno1, Retorno2: String);
    procedure BFecharClick(Sender: TObject);
    procedure CadOrcamentoAfterInsert(DataSet: TDataSet);
    procedure MovOrcamentosAfterInsert(DataSet: TDataSet);
    procedure CadOrcamentoBeforePost(DataSet: TDataSet);
    procedure GOrcamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GOrcamentoColExit(Sender: TObject);
    procedure GOrcamentoColEnter(Sender: TObject);
    procedure GOrcamentoEnter(Sender: TObject);
    procedure EClienteCadastrar(Sender: TObject);
    procedure GOrcamentoEditButtonClick(Sender: TObject);
    procedure MovOrcamentosBeforePost(DataSet: TDataSet);
    procedure ESituacaoCadastrar(Sender: TObject);
    procedure EVendedorCadastrar(Sender: TObject);
    procedure ECondPagamentoCadastrar(Sender: TObject);
    procedure MovOrcamentosBeforeInsert(DataSet: TDataSet);
    procedure GOrcamentoKeyPress(Sender: TObject; var Key: Char);
    procedure MovOrcamentosAfterPost(DataSet: TDataSet);
    procedure MovOrcamentosN_QTD_PROChange(Sender: TField);
    procedure GOrcamentoExit(Sender: TObject);
    procedure ESituacaoChange(Sender: TObject);
    procedure BGravarClick(Sender: TObject);
    procedure MovOrcamentosC_COD_UNIChange(Sender: TField);
    procedure MovOrcamentosAfterEdit(DataSet: TDataSet);
    procedure GOrcamentoCellClick(Column: TColumn);
    procedure MovOrcamentosN_VLR_PROChange(Sender: TField);
    procedure BImprimirClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ECondPagamentoSelect(Sender: TObject);
    procedure MovServicoOrcamentoAfterInsert(DataSet: TDataSet);
    procedure MovServicoOrcamentoAfterPost(DataSet: TDataSet);
    procedure MovServicoOrcamentoBeforeInsert(DataSet: TDataSet);
    procedure MovServicoOrcamentoBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GServicoEnter(Sender: TObject);
    procedure GServicoColEnter(Sender: TObject);
    procedure GServicoEditButtonClick(Sender: TObject);
    procedure GServicoExit(Sender: TObject);
    procedure GServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GServicoKeyPress(Sender: TObject; var Key: Char);
    procedure MovOrcamentosAfterDelete(DataSet: TDataSet);
    procedure MovServicoOrcamentoN_QTD_SERChange(Sender: TField);
    procedure ECodServicoCadastrar(Sender: TObject);
    procedure GServicoColExit(Sender: TObject);
    procedure ECondPagamentoRetorno(Retorno1, Retorno2: String);
    procedure BBAjudaClick(Sender: TObject);
    procedure DBEditNumerico1Exit(Sender: TObject);
    procedure BCadastrarClick(Sender: TObject);
    procedure VlrPerClick(Sender: TObject);
    procedure EDescAcrExit(Sender: TObject);
    procedure BHistoricoClick(Sender: TObject);
    procedure BImpCupomClick(Sender: TObject);
    procedure MovServicoOrcamentoAfterEdit(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CadOrcamentoBeforeEdit(DataSet: TDataSet);
    procedure MovOrcamentosBeforeCancel(DataSet: TDataSet);
    procedure ECondPagamentoExit(Sender: TObject);
  private
    { Private declarations }
    VprCodProduto,
    VprProdutoAnterior,
    VprUnidadeOriginal,
    VprProdutos : String;
    VprSeqProduto, VprServicoAnterior : Integer;
    Cotacao : TFuncoesCotacao;
    VprKit, AdiconaKiT,
    VprInsercao : Boolean;
    VprValorOriginal,
    VprQtdEstoque,
    VprQtdMinima,
    VprQtdPedido : Double;
    Produtos : TFuncoesProduto;
    TipoOrcamento, Alterando : Boolean;
    CodVenCli : integer;
    rel : TCrpe;
    procedure CarregaDadosCliente(VpaCodCliente : String);
    function  LocalizaProduto : Boolean;
    function ExisteProduto : Boolean;
    procedure CalculaValorTotal;
    procedure GravaCotacao;
    procedure CarregaDadosPadrao(VpaSeqProduto : integer);
    function  LocalizaServico : Boolean;
    function ExisteServico : Boolean;
    procedure DirecionaFoco;
    procedure AlteraParaPedido;
    procedure EscondeServico;
    procedure AlteraBotoes( acao : Boolean);
    procedure MostraDescontoItem( Orcamento : Boolean);
  public
    { Public declarations }
    procedure NovaCotacao;
    procedure NovoPedido;
    procedure AlteraCotacao(VpaLanOrcamento : String; Orcamento : Boolean);
    procedure ConsultaCotacao(VpaLanOrcamento : String; Orcamento : Boolean);
  end;

var
  FNovaCotacao: TFNovaCotacao;

implementation

uses APrincipal, Funsql, Constantes, FunObjeto, ALocalizaProdutos,  Fundata,
     ANovoCliente, ConstMsg, ASituacoes, ANovoVendedor, ACondicoesPgtos,
     AConsultaCondicaoPgto, ANovoServico, ALocalizaServico, AImpCotacao, funnumeros,
     AconsultaHistorico, AConsultaPrecosProdutos, Funsistema;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFNovaCotacao.FormCreate(Sender: TObject);
begin
  VprInsercao := false;
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  Cotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDados);
  Produtos := TFuncoesProduto.criar(Self,FPrincipal.BaseDados);
  ValidaUnidade.AInfo.UnidadeCX := Varia.UnidadeCX;
  ValidaUnidade.Ainfo.UnidadeUN := varia.unidadeUN;
  AdicionaSQLAbreTabela(CAdServico,'Select * from CadServico '+
                                   ' Where I_Cod_EMp = ' + IntToStr(Varia.CodigoEmpresa));

  MudaMacaraEdicaoDisplay([MovOrcamentosN_QTD_PRO],varia.mascaraQTD);
  MudaMacaraEdicaoDisplay([MovOrcamentosN_VLR_PRO],varia.mascaraValorUnitario);
  VprKit := false;
  LNomeFantasia.Caption := Varia.NomeFilial + ' - Orçamento ';
  VprProdutos := '1';
  if not ConfigModulos.Servico then
    EscondeServico;
  BImpCupom.Visible := Varia.CupomVinculado_Ped_Orc = 'S';
  Alterando := false;
  GOrcamento.Columns[7].Visible := config.MostrarReservado;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFNovaCotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  varia.TabelaPreco := varia.TabelaPrecoPadrao;
  FPrincipal.CodProduto := '';
  CadOrcamento.close;
  Movorcamentos.close;
  CadProdutos.close;
  MovServicoOrcamento.close;
  CadServico.close;
  aux.close;
  Produtos.free;
  Cotacao.free;
  rel.free;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos da tabela cadorcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************** apos a insercao da tabela de orcamentos *********************}
procedure TFNovaCotacao.CadOrcamentoAfterInsert(DataSet: TDataSet);
begin
  LimpaLabel([LEnderecoCliente]);
  CadOrcamentoI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
  ProximoCodigo.execute('CadOrcamentos','I_Emp_Fil',Varia.CodigoEmpfil);
  MarcaTransacao(5,CadOrcamentoI_LAN_ORC.AsInteger, varia.CodigoEmpFil);
  BFechar.Enabled := false;

  if TipoOrcamento then
  begin
    ProximoCodigoFilial1.execute('CadOrcamentos','I_Emp_Fil',Varia.CodigoEmpfil);
    CadOrcamentoC_TIP_CAD.AsString := 'O';
    if varia.SituacaoPadraoOrcamento  <> 0  then
    begin
      CadOrcamentoI_COD_SIT.AsInteger := varia.SituacaoPadraoOrcamento;
      ESituacao.Atualiza;
    end;
  end
  else
  begin
    ProximoCodigoFilial2.execute('CadOrcamentos','I_Emp_Fil',Varia.CodigoEmpfil);
    CadOrcamentoC_TIP_CAD.AsString := 'P';
  end;
  CadOrcamentoD_DAT_ORC.AsDateTime := date;
  CadOrcamentoT_HOR_ORC.AsDateTime := time;
  CadOrcamentoC_FLA_SIT.AsString := 'A';
  CadOrcamentoD_DAT_VAL.AsDateTime := incDia(Date,Varia.DiasValidade);
  CadOrcamentoD_DAT_PRE.AsDateTime := date;
  CadOrcamentoC_DES_ACR.AsString := 'D';
  CadOrcamentoC_VLR_PER.AsString := 'P';
  CadOrcamentoI_QTD_IMP.AsInteger := 0;
  CadOrcamentoI_COD_USU.AsInteger := Varia.CodigoUsuario;
  AcrDes.ItemIndex := 1;
  VlrPer.ItemIndex := 1;
  cadOrcamentoN_VLR_PER.DisplayFormat := '##0.00 %';
  cadOrcamentoN_VLR_PER.EditFormat := Varia.MascaraValor;
  EVendedor.Enabled := true;
  SpeedButton2.Enabled := true;
end;

{******************* antes de gravar o registro *******************************}
procedure TFNovaCotacao.CadOrcamentoBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadOrcamentoD_ULT_ALT.AsDateTime := Date;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            eventos da tabela movorcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*************** carrega os dados default do movorcamento *********************}
procedure TFNovaCotacao.MovOrcamentosAfterInsert(DataSet: TDataSet);
begin
  VprProdutoAnterior := '-1';
  MovorcamentosI_Emp_fil.Asinteger := Varia.Codigoempfil;
  MovorcamentosI_Lan_Orc.AsInteger := CadorcamentoI_Lan_Orc.Asinteger;
  MovOrcamentosN_QTD_PRO.AsFloat := 1;
  MovOrcamentosC_IMP_FOT.AsString := 'N';
  MovOrcamentosC_IMP_DES.AsString := 'N';
  MovOrcamentosC_IMP_VAL.AsString := 'N';

  if TipoOrcamento then
    MovOrcamentosC_FLA_RES.AsString := 'N'
  else
    MovOrcamentosC_FLA_RES.AsString := 'S';
end;

{****************** verifica a duplicidade dos produtos ***********************}
procedure TFNovaCotacao.MovOrcamentosAfterPost(DataSet: TDataSet);
begin
  if not  vprKit then
    Cotacao.VerificaDuplicidadeProdutos(MovOrcamentos);  // rotina que verifica se o produto e duplicado
  CalculaValorTotal;
  FPrincipal.CodProduto := '';
end;

{********************** calcula o valor total *********************************}
procedure TFNovaCotacao.MovOrcamentosN_QTD_PROChange(Sender: TField);
begin
  if not VprKit then
    if MovOrcamentosI_SEQ_PRO.AsInteger <> 0 Then
    begin
        if (VprQtdEstoque -  MovOrcamentosN_QTD_PRO.AsFloat) < VprQtdMinima Then
        begin
          if config.AvisaQtdMinima then
            aviso(CT_EstoqueProdutoMinimo);
        end
        else
        if (VprQtdEstoque -  MovOrcamentosN_QTD_PRO.AsFloat) < VprQtdPedido Then
          if Config.AvisaQtdPedido Then
            aviso(CT_EstoquePedido);
    end;
    MovOrcamentosN_VLR_PROChange(SENDER);
end;

{************************ calcula o valor total do produto ********************}
procedure TFNovaCotacao.MovOrcamentosN_VLR_PROChange(Sender: TField);
begin
  MovOrcamentosN_VLR_TOT.AsFloat :=  (MovOrcamentosN_VLR_PRO.AsFloat - (MovOrcamentosN_VLR_PRO.AsFloat * (MovOrcamentosN_DES_PRO.AsFloat/100) ))
                                     * MovOrcamentosN_QTD_PRO.AsFloat;
end;

{**************** valida os dados antes de serem gravados *********************}
procedure TFNovaCotacao.MovOrcamentosBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  MovOrcamentosD_ULT_ALT.AsDateTime := Date;

  if MovOrcamentosN_VLR_PRO.AsCurrency < 0 then
  begin
    aviso('O valor unitario não pode ser negativo !');
    if GOrcamento.Enabled then
      GOrcamento.SetFocus;
    abort;
  end;


  if not VprKit Then
    if MovOrcamentosC_COD_PRO.AsString <> '' then
    begin
      if not ExisteProduto then  // verifica se o produto digitado é valido
      begin
        ActiveControl := GOrcamento;
        GOrcamento.SelectedIndex := 0;
        aviso(CT_PRODUTONAOCADASTRADO);
        abort;
      end
      else
        if GOrcamento.Columns[2].PickList.IndexOf(MovOrcamentosC_COD_UNI.AsString) < 0 Then  // valida a unidade com as unidades parentes
        begin
          ActiveControl := GOrcamento;
          GOrcamento.SelectedIndex := 2;
          aviso(CT_UNIDADEVAZIA);
          abort;
        end
        else
          if MovOrcamentosN_QTD_PRO.AsFloat < MovOrcamentosN_QTD_BAI.Asfloat Then
          begin
            ActiveControl := GOrcamento;
            GOrcamento.SelectedIndex := 3;
            aviso(CT_QTDBAIXADAPRODUTO);
            abort;
          end
          else
            GOrcamento.SelectedIndex := 0;//posiciona na coluna zero porque se estiver na coluna unidade e der um insert, a consistencia da unidade nao permitira mais sair da coluna unidade.
      if GOrcamento.SelectedIndex = 0 then
        if not VprKit then
          if not Produtos.VerificaEstoque( MovOrcamentosC_COD_UNI.AsString, VprUnidadeOriginal, MovOrcamentosN_QTD_PRO.AsFloat,MovOrcamentosI_SEQ_PRO.AsString) then
            abort;
    end
    else
      begin
        ActiveControl := GOrcamento;
        GOrcamento.SelectedIndex := 0;// produto em branco, tem que digitar algum produto para gravar
        aviso(CT_PRODUTOINVALIDO);
        abort;
      end;
end;

{******************* controles antes da insercao ******************************}
procedure TFNovaCotacao.MovOrcamentosBeforeInsert(DataSet: TDataSet);
begin
  GOrcamento.SelectedIndex := 0;
end;

{****************** quando altera a unidade ***********************************}
procedure TFNovaCotacao.MovOrcamentosC_COD_UNIChange(Sender: TField);
begin
  if not VprKit then
    MovOrcamentosN_VLR_PRO.AsFloat := Cotacao.ValorPelaUnidade(VprUnidadeOriginal,MovOrcamentosC_COD_UNI.AsString,MovOrcamentosI_SEQ_PRO.AsInteger,
                                                               VprValorOriginal);
end;

{****************** Atualiza as unidades parentes *****************************}
procedure TFNovaCotacao.MovOrcamentosAfterEdit(DataSet: TDataSet);
begin
  CarregaDadosPadrao(MovOrcamentosI_SEQ_PRO.AsInteger);
end;

{*********************** recalcula o valor total ******************************}
procedure TFNovaCotacao.MovOrcamentosAfterDelete(DataSet: TDataSet);
begin
  CalculaValorTotal;
end;

{******************** no edit do servico ************************************* }
procedure TFNovaCotacao.MovServicoOrcamentoAfterEdit(DataSet: TDataSet);
begin
  VprServicoAnterior := MovServicoOrcamentoI_COD_SER.Asinteger;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            eventos da grade movorcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************** validacoes quando sai da coluna da grade **********************}
procedure TFNovaCotacao.GOrcamentoColExit(Sender: TObject);
begin
  if MovOrcamentos.State in [dsedit,dsinsert] then
    if GOrcamento.SelectedIndex = 0 then
    begin
      if not ExisteProduto then
      begin
        LocalizaProduto;
        abort;
      end;
    end
    else
      if GOrcamento.SelectedIndex = 2 then
        if MovOrcamentos.state in [dsedit,dsinsert] then
          if GOrcamento.Columns[2].PickList.IndexOf(MovOrcamentosC_COD_UNI.AsString) < 0 Then
          begin
            aviso(CT_UNIDADEVAZIA);
            abort;
          end;
end;

{********************* filtra as teclas pressionadas **************************}
procedure TFNovaCotacao.GOrcamentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F3 : if GOrcamento.SelectedIndex = 0 then  // localiza o produto;
              LocalizaProduto;
    vK_Delete :
      if MovOrcamentos.State in [dsBrowse] then  // exclui item
        if Confirmacao(CT_DeletarItem) then
          MovOrcamentos.delete;
    VK_F2 : if GOrcamento.SelectedIndex = 2 then
              MovOrcamentos.edit;
    VK_DOWN : if  [ssAlt] = Shift then
                MovOrcamentos.edit;
  end;
end;

{************************ grava quando sai ************************************}
procedure TFNovaCotacao.GOrcamentoExit(Sender: TObject);
begin
  if MovOrcamentos.State in [dsedit,dsinsert] then
    if MovOrcamentosC_COD_UNI.AsString = '' then
      MovOrcamentos.Cancel
    else
      MovOrcamentos.post;
  FPrincipal.CodProduto := '';
end;


{**************** validaçoes das colunas da grade *****************************}
procedure TFNovaCotacao.GOrcamentoColEnter(Sender: TObject);
begin
  VprProdutoAnterior := MovOrcamentosC_COD_PRO.asstring;
end;

{**************** faz as validacoes quando entra na grade *********************}
procedure TFNovaCotacao.GOrcamentoEnter(Sender: TObject);
begin
  VprProdutoAnterior := '-1';
  if MovOrcamentos.active = false then
    Cotacao.LocalizaMovOrcamento(MovOrcamentos,IntToStr(Varia.CodigoEmpFil),CadOrcamentoI_LAN_ORC.asstring);
end;

{***************** chama a rotina para localizar o produto ********************}
procedure TFNovaCotacao.GOrcamentoEditButtonClick(Sender: TObject);
begin
  LocalizaProduto;
end;

{***************** trata as teclas pressionadas *******************************}
procedure TFNovaCotacao.GOrcamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if GOrcamento.SelectedIndex in [7,8,9] then  //permite digitar somente S/N
    if not (key in ['s','S','n','N',#8]) then
      key := #
    else
      if key = 's' Then
        key := 'S'
      else
        if key = 'n' Then
          key := 'N';

  case key of
    '.' : if GOrcamento.SelectedIndex in [3,4] then
            Key := DecimalSeparator;
  end;
end;

{******************* quando da um click na celula *****************************}
procedure TFNovaCotacao.GOrcamentoCellClick(Column: TColumn);
begin
  if Column.Index = 2 then
    MovOrcamentos.Edit;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              eventos do movorcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************** localiza o produto digitado *****************************}
Function TFNovaCotacao.LocalizaProduto : Boolean;
var
  VpfCadastrouProduto : Boolean;
begin
  VpfCadastrouProduto := true;
  if not (MovOrcamentos.state in [dsedit,dsinsert]) then//para localizar coloca em edicao
    MovOrcamentos.edit;
  FlocalizaProduto := TFlocalizaProduto.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaProduto'));
  Result := FlocalizaProduto.LocalizaProduto(VpfCadastrouProduto,VprSeqProduto,VprCodProduto,VprUnidadeOriginal,VprValorOriginal,vprQtdEstoque,VprQtdPedido,VprQtdMinima, cadorcamentoi_cod_cli.Asinteger); //localiza o produto
  FlocalizaProduto.free; // destroi a classe;
  if VpfCadastrouProduto then
    AtualizaSQLTabela(CadProdutos);
  if result then  // se o usuario nao cancelou a consulta
    begin
      MovOrcamentosI_SEQ_PRO.AsInteger := VprSeqProduto;
      MovOrcamentosC_COD_PRO.AsString := VprCodProduto;
      MovOrcamentosC_COD_UNI.AsString := VprUnidadeOriginal;
      MovOrcamentosN_VLR_PRO.AsFloat := VprValorOriginal;
      MovOrcamentosN_QTD_PRO.AsFloat := 1;
      GOrcamento.Columns[2].PickList := ValidaUnidade.UnidadesParentes(VprUnidadeOriginal);
      Gorcamento.SelectedIndex := 0;
      FPrincipal.CodProduto := MovOrcamentosC_COD_PRO.AsString;
    end;
end;

{******************** verifica se o produto existe ****************************}
function TFNovaCotacao.ExisteProduto : Boolean;
begin
  if MovOrcamentos.state in [dsedit,dsinsert] then
  begin
    if MovOrcamentosC_COD_PRO.asstring <> VprProdutoAnterior Then  //somente verifica se o produto foi alterado
    begin
      if MovOrcamentosC_COD_PRO.AsString <> '' then  // Verifica se produto existe
      begin
        AdicionaSQLAbreTabela(Aux,'Select pro.I_Seq_Pro, ' + varia.CodigoProduto +
                                  ', Pro.C_Cod_Uni, Pro.C_Kit_Pro, '+
                                  ' (Pre.N_Vlr_Ven * Moe.N_Vlr_Dia) VlrReal, ' +
                                  ' (QTD.N_QTD_PRO - QTD.N_QTD_RES) QdadeReal, '+
                                  ' Qtd.N_QTD_MIN, QTD.N_QTD_PED , pro.l_des_tec' +
                                  ' from CadProdutos Pro, MovTabelaPreco Pre, CadMoedas Moe,  '+
                                  ' MovQdadeProduto Qtd ' +
                                  ' Where '+Varia.CodigoProduto +' = ''' + MovOrcamentosC_COD_PRO.AsString +''''+
                                  ' and Pre.I_Cod_Emp = ' + IntTosTr(Varia.CodigoEmpresa) +
                                  ' and Pre.I_Cod_Tab = ' + IntToStr(Varia.TabelaPreco)+
                                  ' and Pro.I_Seq_Pro = Pre.I_Seq_Pro ' +
                                  ' and Pre.I_Cod_Moe = Moe.I_Cod_Moe '+
                                  ' and Qtd.I_Emp_Fil =  ' + IntTostr(Varia.CodigoEmpFil)+
                                  ' and Qtd.I_Seq_Pro = Pro.I_Seq_Pro '+
                                  ' and Pro.c_ven_avu = ''S''');
        result := not Aux.Eof;
        if Result then  // se existe carrega os dados default dos produtos
        begin
          if (Aux.FieldByName('C_Kit_Pro').Asstring = 'K') and (AdiconaKiT) then
          begin
            GOrcamento.SelectedIndex := 0;
            if Produtos.TextoPossuiEstoque(1, VprQtdEstoque,'kit') then
            begin
              VprKit := true;
              if MovOrcamentos.state = dsinsert then
                MovOrcamentos.cancel
              else
                MovOrcamentos.Delete;
              Cotacao.AdicionaProdutoKit(MovOrcamentos,CadOrcamentoI_Lan_Orc.Asinteger,Aux.FieldByName('i_seq_pro').AsInteger,vprProdutos);
              GOrcamento.SelectedIndex := 0;
              AdicionaSQLAbreTabela(CadProdutos,'Select * from CadProdutos ' +
                           ' Where I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa)+
                           ' and I_Seq_Pro in ('+ VprProdutos+ ')');
              MovOrcamentos.Edit;// e efetuado uma edicao para atualizar os lookup;
              MovOrcamentos.post;
              MovOrcamentos.last;
              VprKit := false;
              abort;
            end
            else
              abort;
          end
          else
          begin
            if TipoOrcamento then
              if config.AdicionaDesTecOrc then    // caso adicionar descr tecn na obs
                 if aux.FieldByName('L_DES_TEC').AsString <> '' then
                   DBMemoColor1.Lines.Add(aux.FieldByName('L_DES_TEC').Asstring);
            VprUnidadeOriginal :=Aux.FieldByName('C_Cod_Uni').Asstring;
            VprValorOriginal := Aux.FieldByName('VlrReal').AsFloat;
            VprQtdEstoque := Aux.FieldByName('QdadeReal').AsFloat;
            VprQtdMinima := Aux.FieldByName('N_QTD_Min').AsFloat;
            VprQtdPedido := Aux.FieldByName('N_QTD_Ped').AsFloat;
            MovOrcamentosC_COD_PRO.AsString := Aux.FieldByName(Varia.CodigoProduto).Asstring;
            MovOrcamentosC_COD_UNI.AsString := Aux.FieldByName('C_Cod_Uni').Asstring;
            MovOrcamentosN_VLR_PRO.AsFloat := Aux.FieldByName('VlrReal').AsFloat;
            MovOrcamentosN_QTD_PRO.AsFloat := 1;
            GOrcamento.Columns[2].PickList := ValidaUnidade.UnidadesParentes(VprUnidadeOriginal);
            VprProdutos := VprProdutos +',' + Aux.FieldByName('i_seq_pro').Asstring;
            AdicionaSQLAbreTabela(CadProdutos,'Select * from CadProdutos ' +
                                    ' Where I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa)+
                                    ' and I_Seq_Pro in ('+ VprProdutos+ ')');
            MovOrcamentosNomProduto.RefreshLookupList;
            MovOrcamentosI_SEQ_PRO.AsInteger :=Aux.FieldByName('i_seq_pro').AsInteger;
          end;
        end;
      end
      else
        result := false;  // nao encontrou
    end
    else
      result := true;  // produto nao foi alterado.
  end
  else
    result := true;
end;

{**************** carrega os dados padrao do produto **************************}
procedure TFNovaCotacao.CarregaDadosPadrao(VpaSeqProduto : integer);
begin
  AdicionaSQLAbreTabela(Aux,'Select pro.I_Seq_Pro,  Pro.C_Cod_Uni,'+
                            ' (Pre.N_Vlr_Ven * Moe.N_Vlr_Dia) VlrReal, ' +
                            ' (QTD.N_QTD_PRO - QTD.N_QTD_RES) QdadeReal, '+
                            ' Qtd.N_QTD_MIN, QTD.N_QTD_PED ' +
                            ' from CadProdutos Pro, MovTabelaPreco Pre, CadMoedas Moe,  '+
                            ' MovQdadeProduto Qtd ' +
                            ' Where Pro.I_Seq_Pro = '+ InttoStr(VpaSeqProduto) +
                            ' and Pre.I_Cod_Emp = ' + IntTosTr(Varia.CodigoEmpresa) +
                            ' and Pre.I_Cod_Tab = ' + IntToStr(Varia.TabelaPreco)+
                            ' and Pro.I_Seq_Pro = Pre.I_Seq_Pro ' +
                            ' and Pre.I_Cod_Moe = Moe.I_Cod_Moe '+
                            ' and Qtd.I_Emp_Fil =  ' + IntTostr(Varia.CodigoEmpFil)+
                            ' and Qtd.I_Seq_Pro = Pro.I_Seq_Pro ');
  VprUnidadeOriginal :=Aux.FieldByName('C_Cod_Uni').Asstring;
  VprValorOriginal := Aux.FieldByName('VlrReal').AsFloat;
  VprQtdEstoque := Aux.FieldByName('QdadeReal').AsFloat;
  VprQtdMinima := Aux.FieldByName('N_QTD_Min').AsFloat;
  VprQtdPedido := Aux.FieldByName('N_QTD_Ped').AsFloat;
  GOrcamento.Columns[2].PickList := ValidaUnidade.UnidadesParentes(VprUnidadeOriginal);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos da tabela servico orcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************** apos a inserção carrega os dados default ****************}
procedure TFNovaCotacao.MovServicoOrcamentoAfterInsert(DataSet: TDataSet);
begin
  MovServicoOrcamentoI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
  MovServicoOrcamentoI_COD_EMP.AsInteger := Varia.CodigoEmpresa;
  MovServicoOrcamentoI_LAN_ORC.AsInteger := CadOrcamentoI_LAN_ORC.AsInteger;
end;

{************************ faz as operações apos gravar ************************}
procedure TFNovaCotacao.MovServicoOrcamentoAfterPost(DataSet: TDataSet);
begin
  Cotacao.VerificaDuplicidadeServico(MovServicoOrcamento);  // rotina que verifica se o produto e duplicado
  CalculaValorTotal;
end;

{******************* posiciona a grade na posicao 0 ***************************}
procedure TFNovaCotacao.MovServicoOrcamentoBeforeInsert(DataSet: TDataSet);
begin
  GServico.SelectedIndex := 0;
end;

{***************** faz a validação dos campos antes de gravar *****************}
procedure TFNovaCotacao.MovServicoOrcamentoBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  MovServicoOrcamentoD_ULT_ALT.AsDateTime := Date;
  if MovServicoOrcamentoI_Cod_Ser.AsInteger <> 0 then
  begin
    if not ExisteServico then  // verifica se o produto digitado é valido
    begin
      ActiveControl := GServico;
      GServico.SelectedIndex := 0;
      aviso(CT_SERVICONAOCADASTRADO);
      abort;
    end
    else
      GServico.SelectedIndex := 0;//posiciona na coluna zero porque se estiver na coluna unidade e der um insert, a consistencia da unidade nao permitira mais sair da coluna unidade.
  end
  else
    begin
      ActiveControl := GServico;
      GServico.SelectedIndex := 0;// produto em branco, tem que digitar algum produto para gravar
      aviso(CT_SERVICONAOCADASTRADO);
      abort;
    end;
end;

{****************** atualiza o valor total do servico *************************}
procedure TFNovaCotacao.MovServicoOrcamentoN_QTD_SERChange(Sender: TField);
begin
  MovServicoOrcamentoN_VLR_TOT.AsFloat := MovServicoOrcamentoN_VLR_SER.asfloat * HoraParaDecimal(MovServicoOrcamentoN_QTD_SER.asfloat);
end;

{*********************** cadastra um novo servico *****************************}
procedure TFNovaCotacao.ECodServicoCadastrar(Sender: TObject);
var
  CodCla, CodServico,DescCal : string;
begin
  FNovoServico := TFNovoServico.CriarSDI(application, '', true);
  FNovoServico.InsereNovoServico(CodCla,CodServico,DescCal,true);
  Localiza.AtualizaConsulta;
  AtualizaSQLTabela(CadServico);
end;

{****************** quando sai da coluna do orcamento *************************}
procedure TFNovaCotacao.GServicoColExit(Sender: TObject);
begin
  if (GOrcamento.SelectedIndex = 0) and (MovServicoOrcamento.State = dsInsert) then
    if not ExisteServico then
      if LocalizaServico Then
        abort;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          eventos do servico orcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************** localiza o servico ********************************}
function  TFNovaCotacao.LocalizaServico : Boolean;
var
  VpfCadastrouServico : Boolean;
  VpfCodServico : Integer;
  VpfValorVenda : Double;
begin
  VpfCadastrouServico  := true;
  if not (MovServicoOrcamento.state in [dsedit,dsinsert]) then//para localizar coloca em edicao
    MovServicoOrcamento.edit;

  FlocalizaServico := TFlocalizaServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaServico'));
  result := FlocalizaServico.LocalizaServico(VpfCadastrouServico,VpfCodServico,VpfValorVenda);
  if VpfCadastrouServico Then
    AtualizaSQLTabela(CadServico);

   if result then  // se o usuario nao cancelou a consulta
   begin
      MovServicoOrcamentoI_Cod_Ser.AsInteger := VpfCodServico;
      MovServicoOrcamentoN_Vlr_Ser.AsFloat := VpfValorVenda;
      MovServicoOrcamentoN_QTD_Ser.AsFloat := 1;
      VprServicoAnterior := VpfCodServico;
   end;
  FlocalizaServico.free; // destroi a classe;
end;

{************** Verifica se existe o servico digitado *************************}
function TFNovaCotacao.ExisteServico : Boolean;
begin
  result := true;
  if MovServicoOrcamento.state in [dsedit,dsinsert] then
  begin
    if MovServicoOrcamentoI_COD_Ser.AsInteger <> VprServicoAnterior Then  //somente verifica se o produto foi alterado
    begin
      if MovServicoOrcamentoI_COD_SER.AsInteger <> 0 then  // Verifica se produto existe
      begin
        AdicionaSQLAbreTabela(Aux,'Select (Moe.N_Vlr_dia * Pre.N_Vlr_Ven) Valor from cadservico Ser, MovTabelaPrecoServico Pre, CadMoedas Moe ' +
                           ' where Ser.I_Cod_ser = ' + MovServicoOrcamentoI_COD_SER.Asstring +
                           ' and Pre.I_Cod_ser = Ser.I_Cod_Ser ' +
                           ' and Pre.i_cod_emp = ' + IntToStr(varia.codigoEmpresa) +
                           ' and Pre.I_Cod_tab = '+ IntToStr(Varia.TabelaPrecoServico)+
                           ' and Moe.I_cod_Moe = Pre.I_Cod_Moe');
        result := not Aux.Eof;
        if Result then  // se existe carrega os dados default dos produtos
           MovServicoOrcamentoN_Vlr_Ser.AsFloat := Aux.FieldByName('Valor').AsFloat;
      end
      else
        result := false;  // nao encontrou
    end;
  end;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos da grade de servico
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************** quando a grade ganha o foco *****************************}
procedure TFNovaCotacao.GServicoEnter(Sender: TObject);
begin
  VprServicoAnterior := -1;
  if MovServicoOrcamento.active = false then
    Cotacao.LocalizaMovServicoOrcamento(MovServicoOrcamento,CadOrcamentoI_LAN_ORC.asstring);
end;

{********************** atualiza o servico anterior ***************************}
procedure TFNovaCotacao.GServicoColEnter(Sender: TObject);
begin
  VprServicoAnterior := MovServicoOrcamentoI_COD_SER.Asinteger;
end;

{****************** localiza o servico da cotacao *****************************}
procedure TFNovaCotacao.GServicoEditButtonClick(Sender: TObject);
begin
  LocalizaServico;
end;

{******************** quando sa da grade de servicos **************************}
procedure TFNovaCotacao.GServicoExit(Sender: TObject);
begin
  if MovServicoOrcamento.State in [dsedit,dsinsert] then
    if MovServicoOrcamentoN_QTD_SER.IsNull then
      MovServicoOrcamento.cancel
    else
      MovServicoOrcamento.post;
end;

{*********** trata as teclas pressionadas na grade de orcamento ***************}
procedure TFNovaCotacao.GServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F3 : if GServico.SelectedIndex = 0 then  // localiza o Servico;
              LocalizaServico;
    vK_Delete :
      if MovServicoOrcamento.State in [dsBrowse] then  // exclui item
        if Confirmacao(CT_DeletarItem) then
          MovServicoOrcamento.delete;
  end;
end;

{****************** altera os pontos pela vírgula *****************************}
procedure TFNovaCotacao.GServicoKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '.' : if GServico.SelectedIndex in [2,3] then
            Key := DecimalSeparator;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************* carrega os dados do cliente ******************************}
procedure TFNovaCotacao.CarregaDadosCliente(VpaCodCliente : String);
begin
  if VpaCodCliente <> '' then
  begin
    AdicionaSQLAbreTabela(Aux,'Select I_Cod_Cli, C_Con_Cli, C_End_Cli, I_Num_end,'+
                               ' C_Bai_Cli, C_Cep_Cli, C_Cid_Cli, C_Est_Cli, i_cod_pag, i_cod_frm '+
                               ' from CadClientes '+
                               ' Where I_Cod_Cli = ' + VpaCodCliente);
    LEnderecoCliente.caption :=  Aux.FieldByName('C_End_Cli').Asstring + ', '+
                                Aux.FieldByName('I_Num_End').Asstring + '   ' + Aux.FieldByName('C_Bai_Cli').Asstring +
                                '    ' + 'CEP ' + Aux.FieldByName('C_Cep_Cli').Asstring + '      ' +
                               Aux.FieldByName('C_Cid_Cli').Asstring + '/' + Aux.FieldByName('C_Est_Cli').Asstring;
    if CadOrcamento.state in [dsedit,dsinsert] then
      if CadOrcamentoC_CON_ORC.AsString = '' then
        CadOrcamentoC_CON_ORC.AsString := Aux.FieldByName('c_con_Cli').Asstring;

    CodigoTabelaPreco(Aux.FieldByName('i_cod_cli').AsInteger, FPrincipal.BaseDados);

   ECondPagamento.Text := '';
   if Aux.fieldByName('i_cod_pag').AsInteger <>  0 then
   begin
     ECondPagamento.Text := aux.fieldByName('i_cod_pag').AsString;
     ECondPagamento.Atualiza;
   end;
  end
  else
    LimpaLabel([LEnderecoCliente]);
end;

{****************** configura o item desc ************************************ }
procedure TFNovaCotacao.MostraDescontoItem( Orcamento : Boolean);
begin
  if not Orcamento then
  begin
    if not config.MostraDescItemPedido then
      GOrcamento.Columns[6].Visible := false;
  end
  else
  begin
    if not config.MostraDescItemOrcamento then
      GOrcamento.Columns[6].Visible := false;
  end;
end;

{********************** faz uma nova cotacao **********************************}
procedure TFNovaCotacao.NovaCotacao;
begin
  GOrcamento.Columns[4].ReadOnly := config.NaoPermiteAltValorORC;
  AdiconaKiT := not config.NaoAdicionarProKit;
  MostraDescontoItem(true);
  TipoOrcamento := true;
  VprInsercao := true;
  CadOrcamento.CachedUpdates := false;
  CadOrcamento.open;
  CadOrcamento.insert;
  CadOrcamento.post;
  CadOrcamento.Edit;
  ScrollBox1.VertScrollBar.Position := 0;
  if not self.Visible then
    showmodal;
end;

{*************** cria um novo pedido ***************************************** }
procedure TFNovaCotacao.NovoPedido;
begin
  AdiconaKiT := true;
  MostraDescontoItem(false);
  TipoOrcamento := false;
  AlteraParaPedido;
  VprInsercao := true;
  CadOrcamento.CachedUpdates := false;
  CadOrcamento.open;
  CadOrcamento.insert;
  CadOrcamento.post;
  CadOrcamento.Edit;
  if not self.Visible then
    self.showmodal;
end;

{************************ altera uma cotacao **********************************}
procedure TFNovaCotacao.AlteraCotacao(VpaLanOrcamento : String; Orcamento : Boolean);
begin
  Alterando := true;
  TipoOrcamento := Orcamento;
  if not Orcamento then
    AlteraParaPedido;
  MostraDescontoItem(Orcamento);
  AdicionaSqlAbreTabela(CadProdutos,'Select * from CadProdutos Pro, MovOrcamentos Orc ' +
                                    ' Where I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa)+
                                    ' and Pro.I_Seq_Pro = Orc.I_Seq_Pro ' +
                                    ' and orc.I_Lan_Orc = ' + VpaLanOrcamento +
                                    ' and orc.I_emp_fil = ' + IntToStr(Varia.CodigoEmpFil));
  Cotacao.LocalizaCadOrcamento(CadOrcamento,VpaLanOrcamento);
  Cotacao.LocalizaMovOrcamento(MovOrcamentos,intToStr(Varia.CodigoEmpFil),VpaLanOrcamento);
  Cotacao.LocalizaMovServicoOrcamento(MovServicoOrcamento,VpaLanOrcamento);
  AtualizaLocalizas([Evendedor,ECondPagamento, ESituacao]); //atualiza os localizas
  Cotacao.BaixaReservaProdutoOrcamento(MovOrcamentos);  // subtrai do estoque a qtd reservada
  CadOrcamento.edit;  //coloca a tabela em edicao
  ECondPagamento.Atualiza;
  ECliente.atualiza;
  if config.TrancaVendedorOrcamento then
  begin
    ECliente.Enabled := false;
    SpeedButton1.Enabled := false;
  end;  
  ShowModal; // mostra o formulario
  Cotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDados);
  Cotacao.BaixaOrcamento(VpaLanOrcamento, TipoOrcamento);
  Cotacao.free;
end;


{************************* consulta a cotacao *********************************}
procedure TFNovaCotacao.ConsultaCotacao(VpaLanOrcamento : String; Orcamento : Boolean);
begin
  TipoOrcamento := Orcamento;
  MostraDescontoItem(Orcamento);
  if not Orcamento then
    AlteraParaPedido;
  Cotacao.LocalizaCadOrcamento(CadOrcamento,VpaLanOrcamento);
  AdicionaSqlAbreTabela(CadProdutos,'Select * from CadProdutos Pro, MovOrcamentos Orc ' +
                                    ' Where I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa)+
                                    ' and Pro.I_Seq_Pro = Orc.I_Seq_Pro ' +
                                    ' and orc.I_Lan_Orc = ' + VpaLanOrcamento +
                                    ' and orc.I_emp_fil = ' + IntToStr(Varia.CodigoEmpFil));

  AdicionaSqlAbreTabela(CadServico,'Select * from CadServico Ser, MovServicoOrcamento Orc ' +
                                    ' Where Ser.I_Cod_Emp = ' + IntToStr(Varia.CodigoEmpresa)+
                                    ' and Ser.I_Cod_Ser = Orc.I_Cod_Ser ' +
                                    ' and orc.I_Lan_Orc = ' + VpaLanOrcamento +
                                    ' and orc.I_emp_fil = ' + IntToStr(Varia.CodigoEmpFil));

  Cotacao.LocalizaMovOrcamento(MovOrcamentos,intToStr(Varia.CodigoEmpFil),VpaLanOrcamento);
  Cotacao.LocalizaMovServicoOrcamento(MovServicoOrcamento,VpaLanOrcamento);
  AtualizaLocalizas([ECliente,Evendedor,ECondPagamento, ESituacao]); //atualiza os localizas
  CarregaDadosCliente(CadOrcamentoI_Cod_Cli.Asstring);
  ECondPagamento.Atualiza;
  DataMovOrcamento.AutoEdit := false;
  DataCadOrcamento.AutoEdit := false;
  DataMovServicoOrcamento.AutoEdit := False;
  GOrcamento.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
  GServico.Options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit];
  BGravar.Enabled := false;
  BCadastrar.Enabled := false;
  BFechar.Enabled := true;
  BCancelar.Enabled := false;
  BImprimir.Enabled := true;
  BImpCupom.Enabled := true;
  if not self.Visible then
    ShowModal; // mostra o formulario
end;

{***************** atualiza o cliente apos a consulta *************************}
procedure TFNovaCotacao.EClienteRetorno(Retorno1, Retorno2: String);
var
  TrancarVendedor :Boolean;
  NomeUsuario : String;
begin
  if (Retorno1 <> '') and (not BCancelar.Focused) then
  begin
    if not TipoOrcamento then
    begin
      if (config.MostrarDescontoCliPedido) and (not Alterando) then
        if CadOrcamento.State in [ dsEdit, dsInsert ] then
        begin
          CadOrcamentoC_DES_ACR.AsString := 'D';
          AcrDes.ItemIndex := 1;
          CadOrcamentoC_VLR_PER.AsString := 'V';
          cadOrcamentoN_VLR_PER.DisplayFormat := Varia.MascaraMoeda;
          VlrPer.ItemIndex := 0;
          CadOrcamentoN_VLR_PER.AsCurrency := Cotacao.CalculaDescontoCliente(StrToInt(Retorno1));
        end;

       NomeUsuario := '';
      if (Config.MostrarInadimplentePedido) and (not Alterando) then
        if Cotacao.calculaParcelaAbertaCli(StrToInt(Retorno1)) then
          if not SenhaDeLiberacao then
          begin
             if ECliente.Enabled and ECliente.Visible then
               ECliente.SetFocus;
             abort;
           end;  
      end;

      // vendedor

      // verifica se deve trancar vendedor conforme tipo orcamento ou pedido
      if TipoOrcamento then
        TrancarVendedor := config.TrancaVendedorOrcamento
      else
        TrancarVendedor := config.TrancaVendedorPedido;

      CodVenCli := cotacao.VerificaVendedor(StrToInt(retorno1));
      if not alterando then
      begin
         if CodVenCli <> 0 then
          if TrancarVendedor then
            CadOrcamentoI_COD_VEN.AsInteger := CodVenCli  // caso trancar sempre substitui
           else
             if CadOrcamentoI_COD_VEN.AsInteger = 0 then  // caso naau trancar, somente se vazio
                CadOrcamentoI_COD_VEN.AsInteger := CodVenCli
        else
          if not EVendedor.Enabled then
            CadOrcamentoI_COD_VEN.Clear;
        EVendedor.Atualiza;
      end;


      if TrancarVendedor then  // verifica se deve trancar o vendedor
      begin
        EVendedor.Enabled := CodVenCli = 0;
        SpeedButton2.Enabled := CodVenCli = 0;
      end;
  end;
  CarregaDadosCliente(ECliente.text);
  BHistorico.Enabled := CadOrcamentoI_COD_CLI.AsInteger <> 0;
  if self.visible then
    if (config.MostraHisClienteAut) and (BHistorico.Enabled) and (not TipoOrcamento) then
     BHistorico.Click;

end;

{************************* fecha o formulario *********************************}
procedure TFNovaCotacao.BFecharClick(Sender: TObject);
begin
  if VprInsercao then
    Cotacao.ExcluiOrcamento(CadOrcamentoI_LAN_ORC.AsString, varia.CodigoEmpFil)
  else
    if CadOrcamento.State = dsedit then
    begin
      MovOrcamentos.CancelUpdates;
      Cotacao.ReservaProdutoOrcamento(MovOrcamentos);
    end;
   AlteraBotoes(false);
   DesmarcaTransacao(5);
   BImprimir.Enabled := false;
   BImpCupom.Enabled := false;
//  if (sender as TComponent).Tag <> 1 then
     self.close;
end;

{*********************** cadastra um novo cliente *****************************}
procedure TFNovaCotacao.EClienteCadastrar(Sender: TObject);
begin
  FNovoCliente := TFNovoCliente.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovoCliente'));
  FNovoCliente.CadClientes.Insert;
  FNovoCliente.ShowModal;
  Localiza.AtualizaConsulta;
  FNovoCliente.free;
end;

{********************* cadastra uma nova situacao *****************************}
procedure TFNovaCotacao.ESituacaoCadastrar(Sender: TObject);
begin
  FSituacoes := TFSituacoes.criarSDI(Application,'',FPrincipal.VerificaPermisao('FSituacoes'));
  FSituacoes.CadSituacoes.insert;
  FSituacoes.ShowModal;
  Localiza.AtualizaConsulta;
end;

{******************** cadastra um novo vendedor *******************************}
procedure TFNovaCotacao.EVendedorCadastrar(Sender: TObject);
begin
  FNovoVendedor := TFNovoVendedor.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovoVendedor'));
  FNovoVendedor.CadVendedores.Insert;
  FNovoVendedor.ShowModal;
  Localiza.AtualizaConsulta;
end;

{***************** cadastra uma nova condição de pagamento ********************}
procedure TFNovaCotacao.ECondPagamentoCadastrar(Sender: TObject);
begin
  FCondicoesPagamentos := TFCondicoesPagamentos.criarSDI(Application,'',FPrincipal.VerificaPermisao('FCondicoesPagamentos'));
  FCondicoesPagamentos.ShowModal;
  Localiza.AtualizaConsulta;
end;

{******************** calcula o valor total ***********************************}
procedure TFNovaCotacao.CalculaValorTotal;
var
  VpfValor : Double;
begin
  if CadOrcamento.State in [ dsEdit, dsInsert ] then
  begin
    VpfValor := Cotacao.SomaValor(MovOrcamentos, MovServicoOrcamento);
    if ECondPagamento.Text <> '' then
    begin
      CriaParcelas.Parcelas(VpfValor,StrToInt(EcondPagamento.Text),false,date);
      CadOrcamentoN_VLR_TOT.AsFloat := CriaParcelas.valorTotal;
    end
    else
      CadOrcamentoN_VLR_TOT.AsFloat := VpfValor;

    // calcula desconto ou acrescimos
    if CadOrcamentoN_VLR_PER.AsCurrency <> 0 then
    begin
      if VlrPer.ItemIndex = 0 then
        Vpfvalor := CadOrcamentoN_VLR_PER.AsCurrency
      else
        Vpfvalor := CadOrcamentoN_VLR_TOT.AsCurrency *(CadOrcamentoN_VLR_PER.AsCurrency / 100);

      if AcrDes.ItemIndex = 0 then
        CadOrcamentoN_VLR_TOT.AsCurrency := CadOrcamentoN_VLR_TOT.AsCurrency + Vpfvalor
      else
        CadOrcamentoN_VLR_TOT.AsCurrency := CadOrcamentoN_VLR_TOT.AsCurrency - Vpfvalor;
    end;
  end;
end;

{************************* grava o orcamento **********************************}
procedure TFNovaCotacao.GravaCotacao;
begin
  try

    if CadOrcamento.State = dsinsert then
      while Cotacao.ExisteOrcamento(CadOrcamentoI_LAN_ORC.AsString) do  // verifica se o nro do orcamento ja foi utilizado
        ProximoCodigo.execute('CadOrcamentos','I_Emp_Fil',Varia.CodigoEmpFil);

     // adiciona vendedor
    cotacao.AdicionaVendedor(CadOrcamentoI_COD_VEN.AsInteger, CadOrcamentoI_COD_CLI.AsInteger);

    if (CadOrcamentoI_LAN_ORC.AsInteger <> MovOrcamentosI_LAN_ORC.AsInteger) or
       (CadOrcamentoI_LAN_ORC.AsInteger <> MovServicoOrcamentoI_LAN_ORC.AsInteger)  then // se o lancamento do pai foi alterado altera o do filho tambem
    begin
      VprKit := true;
      if MovOrcamentos.Active then
        Cotacao.AlteraLanOrcMovOrcamento(MovOrcamentos,CadOrcamentoI_LAN_ORC.AsInteger);
      if MovServicoOrcamento.Active Then
        Cotacao.AlteraLanServicoOrc(MovServicoOrcamento,CadOrcamentoI_LAN_ORC.AsInteger);
      VprKit := false;
    end;
    if MovOrcamentos.Active then
      Cotacao.ReservaProdutoOrcamento(MovOrcamentos);
    CadOrcamento.post;
    if CadOrcamento.CachedUpdates Then
    CadOrcamento.CommitUpdates;
    if MovOrcamentos.Active then
      MovOrcamentos.CommitUpdates;
    if MovServicoOrcamento.Active then
      MovServicoOrcamento.CommitUpdates;

    DesmarcaTransacao(5);

  except
    on E : EDataBaseError do
    begin
      Erro('ERRO GRAVAÇÃO!!! Ocorreu o seguinte erro durante a gravação do orcamento : ' + #13 +
                             E.Message);
    end;
  end;
end;

{************************** valida a gravacao *********************************}
procedure TFNovaCotacao.ESituacaoChange(Sender: TObject);
begin
  ValidaGravacao1.execute;
end;

{**************** chama a rotina para gravar o orcamento **********************}
procedure TFNovaCotacao.BGravarClick(Sender: TObject);
var
   VprCotacao : string;
begin
  if MovOrcamentos.State in [dsInsert, dsEdit] then
    if MovOrcamentosC_COD_PRO.IsNull then
      MovOrcamentos.cancel;
  Vprcotacao := CadOrcamentoI_LAN_ORC.AsString;
  GravaCotacao;
  VprInsercao := false;
  ConsultaCotacao(VprCotacao, TipoOrcamento);
  AlteraBotoes(false);
end;

procedure  TFNovaCotacao.AlteraBotoes( acao : Boolean);
begin
  BGravar.Enabled := acao;
  BCancelar.Enabled := acao;
  BImprimir.Enabled := not acao;
  BImpCupom.Enabled := not acao;
  BCadastrar.Enabled := not acao;
  BFechar.Enabled := not acao;
end;

{******************* grava a cotacao e depois imprime *************************}
procedure TFNovaCotacao.BImprimirClick(Sender: TObject);
var
  VpfOrcamento, VpfNroOrcamento : String;
begin
  if TipoOrcamento then
  begin
    case varia.TipoRelatorioOrcamento of
      0 : Cotacao.ImprimePedidoMatricial_1(CadOrcamentoI_LAN_ORC.AsInteger, CadOrcamentoI_NRO_ORC.AsInteger,true, CriaParcelas) ;
      1 : begin
            VpfOrcamento := CadOrcamentoI_LAN_ORC.AsString;
            VpfNroOrcamento := CadOrcamentoI_NRO_ORC.AsString;
            FImpOrcamento := TFImpOrcamento.criarSDI(Application,'',FPrincipal.VerificaPermisao('FImpOrcamento'));
            FImpOrcamento.VisualizaImpressao(VpfOrcamento,VpfNroOrcamento);
            FImpOrcamento.free;
          end;
      2 : Begin
            if rel <> nil then
              rel.free;

            rel := TCrpe.Create(self);
            rel.ReportName := varia.PathRel + 'Diverso\OrcamentoVenda.rpt';
            rel.Connect.Retrieve;
            rel.Connect.DatabaseName := varia.AliasBAseDados;
            rel.Connect.ServerName := varia.AliasRelatorio;
            rel.WindowState := wsMaximized;

            rel.ParamFields.Retrieve;
            rel.ParamFields[0].Value := CadOrcamentoI_NRO_ORC.AsString;
            rel.ParamFields[1].Value := CadOrcamentoI_EMP_FIL.AsString;
            rel.execute;
         end;
    end;
  end
  else
  begin
    case varia.TipoRelatorioPedido of
      0 : Cotacao.ImprimePedidoMatricial_1(CadOrcamentoI_LAN_ORC.AsInteger, CadOrcamentoI_NRO_PED.AsInteger,false, CriaParcelas) ;
      1 : begin end;
    end;
  end;
  cotacao.IncrementaImpressao(CadOrcamentoI_LAN_ORC.AsInteger);
end;

{**************** imprime cupom vinculado de orcamento ou pedido ************* }
procedure TFNovaCotacao.BImpCupomClick(Sender: TObject);
begin
  if TipoOrcamento then
    cotacao.ImprimeCupomNaoVinculado(CadOrcamentoI_Lan_Orc.AsInteger, CadOrcamentoi_nro_orc.AsInteger, false)
  else
    cotacao.ImprimeCupomNaoVinculado(CadOrcamentoI_Lan_Orc.AsInteger, CadOrcamentoi_nro_ped.AsInteger, true);
end;

{*************** consulta as parcelas da condicao de pagamento ****************}
procedure TFNovaCotacao.SpeedButton5Click(Sender: TObject);
var
  VpfCondicao : Integer;
begin
  if (ECondPagamento.text <> '') and ((MovOrcamentos.Active) or (MovServicoOrcamento.Active)) then
  begin
    GServicoExit(GServico);
    GOrcamentoExit(Gorcamento);
    VpfCondicao :=StrToInt(EcondPagamento.Text);
    FConsultaCondicaoPgto := TFConsultaCondicaoPgto.criarSDI(Application,'',FPrincipal.VerificaPermisao('FConsultaCondicaoPgto'));
    FConsultaCondicaoPgto.VisualizaParcelas(Cotacao.SomaValor(MovOrcamentos,MovServicoOrcamento),VpfCondicao, false);
    FConsultaCondicaoPgto.free;
    if (StrToInt(EcondPagamento.Text) <> VpfCondicao) and
       (VpfCondicao <> 0) then
    begin
      EcondPagamento.text := IntToStr(VpfCondicao);
      CalculaValorTotal;
    end;
  end;
end;

{********** carrega a select da localiza da condicao de pagamento *************}
procedure TFNovaCotacao.ECondPagamentoSelect(Sender: TObject);
begin
  ECondPagamento.ASelectValida.Text := 'select * from cadcondicoespagto '+
                                       ' where I_Cod_pag = @ ' +
                                       ' and D_VAl_Con >= ' + SQLTextoDataAAAAMMMDD(Date);
  ECondPagamento.ASelectLocaliza.Text := 'select * from cadcondicoespagto '+
                                         ' where c_nom_pag like ''@%''' +
                                         ' and D_VAl_Con >= ' + SQLTextoDataAAAAMMMDD(Date) +
                                         ' order by c_nom_pag ';
end;

{******************** direciona o foco do cursor ******************************}
procedure TFNovaCotacao.DirecionaFoco;
begin
  if GOrcamento.Focused then
    if GServico.Visible then
      GServico.SetFocus
    else
      if DBEditcolor5.Enabled and DBEditcolor5.Visible then
         DBEditcolor5.SetFocus
  else
    if GServico.Focused then
      DBEditcolor5.SetFocus
    else
      if GOrcamento.Enabled and GOrcamento.Visible then
       GOrcamento.SetFocus;
end;

{**************** trata as teclas pressionadas da grade ***********************}
procedure TFNovaCotacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    Vk_F4 : DirecionaFoco;
    33 : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position  - ScrollBox1.VertScrollBar.Range;
    34 : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position  + ScrollBox1.VertScrollBar.Range;
    117 : if BGravar.Enabled then BGravar.Click;
    118 : if BHistorico.Enabled then BHistorico.Click;
    119 : if BImprimir.Enabled then BImprimir.Click;
  end;
end;

{************************ quando retorna da consulta **************************}
procedure TFNovaCotacao.ECondPagamentoRetorno(Retorno1, Retorno2: String);
begin
  CalculaValorTotal;
end;


procedure TFNovaCotacao.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FNovaCotacao.HelpContext);
end;

{**************** configura a tela pra pedido *********************************}
procedure TFNovaCotacao.AlteraParaPedido;
var
  i : integer;
begin
  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
   if (ScrollBox1.Controls[i] is TPanel) then
     (ScrollBox1.Controls[i] as TPanel).color := $00C1DCB6;
    if (ScrollBox1.Controls[i] is TShape) then
    begin
       (ScrollBox1.Controls[i] as TShape).Brush.Color := $00C1DCB6;
       (ScrollBox1.Controls[i] as TShape).Pen.Style :=  psSolid;
       (ScrollBox1.Controls[i] as TShape).Pen.Color := clTeal;
    end;
  end;
   if  varia.TipoRelatorioPedido  = 0 then // matricial
      DBMemoColor1.AQdadeCaracter := 70;
  DBEditColor3.Color := $00C1DCB6;
  DBEditColor4.Color := $00C1DCB6;
  DBEditNumerico1.Color := $00C1DCB6;
  DBEditNumerico2.Color := $00C1DCB6;
  EDescAcr.Color := $00C1DCB6;
  EDescAcr.Color := $00C1DCB6;

  GServico.Color := $00B9D7AC;
  GOrcamento.Color := $00B9D7AC;
  GServico.FixedColor :=$00D9E9D1;
  GOrcamento.FixedColor :=$00D9E9D1;
  ScrollBox1.Color := $00D9E9D1;
  LNomeFantasia.Caption := Varia.NomeFilial +  ' - Pedidos ';
  LNomeFantasia.Font.Name := 'Arial';
  Label11.Caption := 'Pedido Nº :';
  self.Caption := 'Novo Pedido';
  DBEditColor2.DataField := 'I_NRO_PED';
  lprazo.Visible := true;
  DBEditNumerico1.Visible := true;
end;

{**************** escondo a grade de servico ********************************* }
procedure TFNovaCotacao.EscondeServico;
begin
  GServico.Visible := false;
  info.Visible := false;
  Shape6.Visible := false;
  Shape5.Top := Shape5.Top - 132;
  label13.Top := label13.Top - 132;
  obs.Top := obs.Top - 132;
  Caption15.Top := Caption15.Top - 132;
  DBEditColor5.Top := DBEditColor5.Top - 132;
  EValidade.Top := EValidade.Top - 132;
  DBMemoColor1.Top := DBMemoColor1.Top - 132;
  label36.Top := label36.Top - 132;
  EDescAcr.Top := EDescAcr.Top - 132;
  VlrPer.Top := VlrPer.Top - 132;
  AcrDes.Top := AcrDes.Top - 132;
  Label14.Top := Label14.Top - 132;
  Labeltotal.top := Labeltotal.top -132;
  DBEditNumerico2.top := DBEditNumerico2.top - 132;
end;

procedure TFNovaCotacao.DBEditNumerico1Exit(Sender: TObject);
begin
  CadOrcamentod_dat_pre.AsDateTime :=  date + CadOrcamentoI_PRA_ENT.AsInteger;
end;

procedure TFNovaCotacao.BCadastrarClick(Sender: TObject);
var
  SeqExcluir, FilialExcluir : integer;
begin
 if VerificaTransacao(5,SeqExcluir, FilialExcluir) then
 begin
   Cotacao.ExcluiOrcamento(IntToStr(SeqExcluir), FilialExcluir);
   DesmarcaTransacao(5);
 end;

  CadOrcamento.close;
  MovOrcamentos.close;
  if TipoOrcamento then
    NovaCotacao
  else
    NovoPedido;
  AlteraBotoes(true);
  BGravar.Enabled := false;
  GOrcamento.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
  GServico.Options := [dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
  DataMovOrcamento.AutoEdit := true;
  DataMovServicoOrcamento.AutoEdit := true;
  LimpaLabel( [ label12, label2, LEnderecoCliente, Label4,Label10]);
  if (ESituacao.Enabled) and (ESituacao.Visible) then
    ESituacao.SetFocus;
end;

procedure TFNovaCotacao.VlrPerClick(Sender: TObject);
begin
  if VlrPer.ItemIndex = 0 then
    cadOrcamentoN_VLR_PER.DisplayFormat := Varia.MascaraMoeda
  else
   cadOrcamentoN_VLR_PER.DisplayFormat := '##0.00 %';
  CalculaValorTotal;
end;

procedure TFNovaCotacao.EDescAcrExit(Sender: TObject);
begin
  CalculaValorTotal;
end;

procedure TFNovaCotacao.BHistoricoClick(Sender: TObject);
begin
  FConsultaHistorico := TFConsultaHistorico.CriarSDI(application , '', FPrincipal.VerificaPermisao('FConsultaHistorico'));
  FConsultaHistorico.ConsultaHisCliente(CadOrcamentoI_COD_CLI.AsInteger);
  DBEditColor1.SetFocus;
end;

procedure TFNovaCotacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose := BFechar.Enabled;
end;

procedure TFNovaCotacao.CadOrcamentoBeforeEdit(DataSet: TDataSet);
begin
  BFechar.Enabled := false;
end;

procedure TFNovaCotacao.MovOrcamentosBeforeCancel(DataSet: TDataSet);
begin
  FPrincipal.CodProduto := '';
end;

procedure TFNovaCotacao.ECondPagamentoExit(Sender: TObject);
begin
  if (GOrcamento.Enabled) and (GOrcamento.visible) and (self.visible) then
  begin
    GOrcamento.SetFocus;
    GOrcamento.SelectedIndex := 0;
  end;
end;

initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFNovaCotacao]);
end.
