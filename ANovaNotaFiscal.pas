unit ANovaNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  DBTables, ConfigImpressora, ConvUnidade, DBKeyViolation, Localizacao, Db,
  Tabela, BotaoCadastro, StdCtrls, Buttons, Componentes1, ExtCtrls,
  PainelGradiente, Grids, DBCtrls, Mask, DBGrids, UnNotaFiscal, Spin,
  numericos, UnImpressao, ShellApi, UnProdutos, UnCotacao,  UnContasAReceber;

type
  TFNovaNotaFiscal = class(TFormularioPermissao)
    FundoNota: TScrollBox;
    Shape4: TShape;
    Shape5: TShape;
    Shape3: TShape;
    Shape2: TShape;
    Shape20: TShape;
    Shape12: TShape;
    Label21: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    cv: TLabel;
    Shape10: TShape;
    Label18: TLabel;
    Label17: TLabel;
    Shape11: TShape;
    Label19: TLabel;
    Label20: TLabel;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Label22: TLabel;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Label24: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Label39: TLabel;
    Label40: TLabel;
    Label13: TLabel;
    DBText9: TDBText;
    Label2: TLabel;
    DBText10: TDBText;
    Label15: TLabel;
    Label16: TLabel;
    DBText16: TDBText;
    Label25: TLabel;
    DBText17: TDBText;
    DBText20: TDBText;
    Label26: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    Label78: TLabel;
    Label75: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    MObservacoes: TDBMemoColor;
    Grade: TDBGridColor;
    DBEditColor11: TDBEditColor;
    DBEditColor12: TDBEditColor;
    DBEditColor13: TDBEditColor;
    DelCliente: TDBEditLocaliza;
    DelNatureza: TDBEditLocaliza;
    DBEditColor7: TDBEditColor;
    AutoCalculo: TCheckBox;
    RTipoNota: TDBRadioGroup;
    DBEditColor5: TDBEditColor;
    Panel1: TPanelColor;
    BtbImprimeBoleto: TBitBtn;
    BotaoCadastrar1: TBitBtn;
    BotaoGravar1: TBitBtn;
    BImprimir: TBitBtn;
    BFechar: TBitBtn;
    BotaoCancelar1: TBitBtn;
    BObservacao: TBitBtn;
    DataMovNotasFiscais: TDataSource;
    MovNotasFiscais: TQuery;
    MovNotasFiscaisI_EMP_FIL: TIntegerField;
    MovNotasFiscaisI_SEQ_NOT: TIntegerField;
    MovNotasFiscaisN_QTD_PRO: TFloatField;
    MovNotasFiscaisN_VLR_PRO: TFloatField;
    MovNotasFiscaisN_PER_ICM: TFloatField;
    MovNotasFiscaisN_PER_IPI: TFloatField;
    MovNotasFiscaisN_TOT_PRO: TFloatField;
    MovNotasFiscaisC_COD_UNI: TStringField;
    MovNotasFiscaisC_COD_CST: TStringField;
    MovNotasFiscaisI_ORD_FIS: TIntegerField;
    MovNotasFiscaisC_CLA_FIS: TStringField;
    MovNotasFiscaisI_SEQ_MOV: TIntegerField;
    MovNotasFiscaisI_NUM_ITE: TIntegerField;
    MovNotasFiscaisC_COD_PRO: TStringField;
    DataCadNotasFiscais: TDataSource;
    cadNotasFiscais: TQuery;
    cadNotasFiscaisI_EMP_FIL: TIntegerField;
    cadNotasFiscaisI_SEQ_NOT: TIntegerField;
    cadNotasFiscaisI_COD_CLI: TIntegerField;
    cadNotasFiscaisI_COD_TRA: TIntegerField;
    cadNotasFiscaisI_COD_PAG: TIntegerField;
    cadNotasFiscaisI_COD_PED: TIntegerField;
    cadNotasFiscaisC_TIP_NOT: TStringField;
    cadNotasFiscaisD_DAT_EMI: TDateField;
    cadNotasFiscaisD_DAT_SAI: TDateField;
    cadNotasFiscaisC_MAR_PRO: TStringField;
    cadNotasFiscaisC_END_DES: TStringField;
    cadNotasFiscaisC_NRO_PLA: TStringField;
    cadNotasFiscaisC_TIP_EMB: TStringField;
    cadNotasFiscaisL_OBS_NOT: TMemoField;
    cadNotasFiscaisI_TIP_FRE: TIntegerField;
    cadNotasFiscaisC_INS_EST: TStringField;
    cadNotasFiscaisN_BAS_CAL: TFloatField;
    cadNotasFiscaisN_VLR_ICM: TFloatField;
    cadNotasFiscaisN_BAS_SUB: TFloatField;
    cadNotasFiscaisN_VLR_SUB: TFloatField;
    cadNotasFiscaisN_TOT_PRO: TFloatField;
    cadNotasFiscaisN_VLR_FRE: TFloatField;
    cadNotasFiscaisN_VLR_SEG: TFloatField;
    cadNotasFiscaisN_OUT_DES: TFloatField;
    cadNotasFiscaisN_TOT_IPI: TFloatField;
    cadNotasFiscaisN_TOT_NOT: TFloatField;
    cadNotasFiscaisN_PES_BRU: TFloatField;
    cadNotasFiscaisN_PES_LIQ: TFloatField;
    cadNotasFiscaisC_EST_PLA: TStringField;
    cadNotasFiscaisI_NRO_NOT: TIntegerField;
    cadNotasFiscaisI_COD_VEN: TIntegerField;
    cadNotasFiscaisI_QTD_VOL: TIntegerField;
    cadNotasFiscaisT_HOR_SAI: TTimeField;
    cadNotasFiscaisC_NOT_IMP: TStringField;
    cadNotasFiscaisC_SER_NOT: TStringField;
    cadNotasFiscaisL_OB1_NOT: TMemoField;
    cadNotasFiscaisC_NOT_CAN: TStringField;
    cadNotasFiscaisN_TOT_SER: TFloatField;
    cadNotasFiscaisN_VLR_ISQ: TFloatField;
    Localiza: TConsultaPadrao;
    Aux: TQuery;
    cadClientes: TQuery;
    DataClientes: TDataSource;
    CadTransportadora: TQuery;
    DataTransportadora: TDataSource;
    ICMS1: TICMS;
    CadProdutos: TQuery;
    CadNatureza: TQuery;
    MovServicoNota: TQuery;
    MovServicoNotaI_EMP_FIL: TIntegerField;
    MovServicoNotaI_COD_SER: TIntegerField;
    MovServicoNotaI_SEQ_NOT: TIntegerField;
    MovServicoNotaN_VLR_SER: TFloatField;
    MovServicoNotaNomeServico: TStringField;
    DataMovServicoNota: TDataSource;
    CadServico: TQuery;
    Anterior: TBitBtn;
    Proximo: TBitBtn;
    Label52: TLabel;
    DBEditColor10: TDBEditColor;
    MovNotasFiscaisI_SEQ_PRO: TIntegerField;
    cadNotasFiscaisC_DES_ACR: TStringField;
    cadNotasFiscaisC_VLR_PER: TStringField;
    cadNotasFiscaisN_DES_ACR: TFloatField;
    cadNotasFiscaisN_VLR_PER: TFloatField;
    Panel2: TPanel;
    GRADEPAR: TStringGrid;
    Label30: TLabel;
    Pservico: TPanel;
    Shape1: TShape;
    GServicos: TDBGridColor;
    Shape24: TShape;
    Label77: TLabel;
    Label79: TLabel;
    DBEditColor22: TDBEditColor;
    DBEditColor2: TDBEditColor;
    Label80: TLabel;
    Panel4: TPanel;
    Shape6: TShape;
    Shape37: TShape;
    Label41: TLabel;
    Shape32: TShape;
    Label42: TLabel;
    Shape33: TShape;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Shape34: TShape;
    Shape35: TShape;
    Shape36: TShape;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Shape38: TShape;
    Shape39: TShape;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Shape43: TShape;
    Label62: TLabel;
    Shape44: TShape;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Shape49: TShape;
    DBText1: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Shape50: TShape;
    DBText15: TDBText;
    Shape51: TShape;
    Label4: TLabel;
    Shape52: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label23: TLabel;
    Label71: TLabel;
    SpeedButton2: TSpeedButton;
    Label72: TLabel;
    SpeedButton3: TSpeedButton;
    DBText8: TDBText;
    SpeedButton4: TSpeedButton;
    Label74: TLabel;
    Label36: TLabel;
    DBEditColor6: TDBEditColor;
    DBEditColor1: TDBEditColor;
    DBEditColor8: TDBEditNumerico;
    DBEditColor9: TDBEditNumerico;
    DBEditColor14: TDBEditNumerico;
    DBEditColor15: TDBEditNumerico;
    DBEditColor16: TDBEditNumerico;
    DBEditColor17: TDBEditNumerico;
    DBEditColor18: TDBEditNumerico;
    DBEditColor19: TDBEditNumerico;
    DBEditColor21: TDBEditNumerico;
    DBEditColor23: TDBEditColor;
    DBEditColor24: TDBEditColor;
    DBEditColor3: TDBEditColor;
    ECoDVendedor: TDBEditLocaliza;
    DBEditLocaliza4: TDBEditLocaliza;
    Econdicoes: TDBEditColor;
    MAdicional: TDBMemoColor;
    EClaFiscal: TDBEditColor;
    DBEditNumerico1: TDBEditNumerico;
    DBEditNumerico2: TDBEditNumerico;
    DBEditNumerico3: TDBEditNumerico;
    EDescAcr: TDBEditNumerico;
    DBEditColor4: TDBEditNumerico;
    AcrDes: TDBRadioGroup;
    VlrPer: TDBRadioGroup;
    EPercPro: Tnumerico;
    Label31: TLabel;
    DBEditColor25: TDBEditColor;
    cadNotasFiscaisC_NRO_PAC: TStringField;
    Produtos: TQuery;
    MovNotasFiscaisNomeProduto: TStringField;
    MovServicoNotaI_COD_EMP: TIntegerField;
    ECodServico: TDBEditLocaliza;
    MovServicoNotaN_QTD_SER: TFloatField;
    MovServicoNotaN_TOT_SER: TFloatField;
    BParcelas: TBitBtn;
    EPercServ: Tnumerico;
    Label32: TLabel;
    cadNotasFiscaisC_TEX_CLA: TStringField;
    cadNotasFiscaisC_FLA_ECF: TStringField;
    cadNotasFiscaisC_NOT_DEV: TStringField;
    Tempo: TPainelTempo;
    CADBOLETO: TQuery;
    MovOrcamento: TQuery;
    CadOrcamentos: TQuery;
    cadNotasFiscaisI_LAN_ORC: TIntegerField;
    BAlterarNumero: TBitBtn;
    MovNotasFiscaisN_VLR_IPI: TFloatField;
    cadNotasFiscaisC_COD_NAT: TStringField;
    cadNotasFiscaisD_ULT_ALT: TDateField;
    MovNotasFiscaisD_ULT_ALT: TDateField;
    MovServicoNotaD_ULT_ALT: TDateField;
    BBAjuda: TBitBtn;
    Label33: TLabel;
    DBEditColor20: TDBEditColor;
    cadNotasFiscaisC_NRO_PED: TStringField;
    Label34: TLabel;
    DBEditColor26: TDBEditColor;
    cadNotasFiscaisC_NRO_ORC: TStringField;
    cadNotasFiscaisI_COD_USU: TIntegerField;
    DBMemoColor1: TDBMemoColor;
    Label35: TLabel;
    cadNotasFiscaisC_INF_NOT: TStringField;
    BImprimirRomanrio: TBitBtn;
    DBEditColor27: TDBEditColor;
    DBEditColor28: TDBEditColor;
    cadNotasFiscaisC_PRA_PAG: TStringField;
    cadNotasFiscaisC_END_COB: TStringField;
    Label37: TLabel;
    Label38: TLabel;
    BitBtn1: TBitBtn;
    MovNotasFiscaisI_QTD_CAI: TIntegerField;
    MovNotasFiscaisN_LIQ_CAI: TFloatField;
    MovNotasFiscaisC_UNI_VEN: TStringField;
    Button1: TButton;
    procedure BFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProximoClick(Sender: TObject);
    procedure AnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelNaturezaRetorno(Retorno1, Retorno2: String);
    procedure DelClienteRetorno(Retorno1, Retorno2: String);
    procedure cadNotasFiscaisAfterInsert(DataSet: TDataSet);
    procedure DBEditColor5Exit(Sender: TObject);
    procedure GradeEnter(Sender: TObject);
    procedure DelClienteCadastrar(Sender: TObject);
    procedure DelNaturezaCadastrar(Sender: TObject);
    procedure GradeColExit(Sender: TObject);
    procedure MovNotasFiscaisAfterInsert(DataSet: TDataSet);
    procedure GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MovNotasFiscaisAfterPost(DataSet: TDataSet);
    procedure MovNotasFiscaisN_QTD_PROChange(Sender: TField);
    procedure GradeKeyPress(Sender: TObject; var Key: Char);
    procedure MovNotasFiscaisC_COD_UNIChange(Sender: TField);
    procedure MovNotasFiscaisN_PER_IPIChange(Sender: TField);
    procedure GradeColEnter(Sender: TObject);
    procedure DBEditColor9Exit(Sender: TObject);
    procedure EcondicoesExit(Sender: TObject);
    procedure DBEditLocaliza4Retorno(Retorno1, Retorno2: String);
    procedure ECoDVendedorEnter(Sender: TObject);
    procedure ECoDVendedorRetorno(Retorno1, Retorno2: String);
    procedure SpeedButton4Click(Sender: TObject);
    procedure GradeEditButtonClick(Sender: TObject);
    procedure MovNotasFiscaisAfterEdit(DataSet: TDataSet);
    procedure GradeCellClick(Column: TColumn);
    procedure GradeExit(Sender: TObject);
    procedure MovNotasFiscaisBeforeInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cadNotasFiscaisAfterEdit(DataSet: TDataSet);
    procedure BotaoCancelar1Click(Sender: TObject);
    procedure VlrPerClick(Sender: TObject);
    procedure BotaoGravar1Click(Sender: TObject);
    procedure EcondicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MovNotasFiscaisBeforePost(DataSet: TDataSet);
    procedure BotaoCadastrar1Click(Sender: TObject);
    procedure BObservacaoClick(Sender: TObject);
    procedure EDescAcrExit(Sender: TObject);
    procedure GServicosEnter(Sender: TObject);
    procedure ECodServicoSelect(Sender: TObject);
    procedure GServicosColExit(Sender: TObject);
    procedure ECodServicoRetorno(Retorno1, Retorno2: String);
    procedure ECodServicoCadastrar(Sender: TObject);
    procedure MovServicoNotaAfterInsert(DataSet: TDataSet);
    procedure GServicosKeyPress(Sender: TObject; var Key: Char);
    procedure GServicosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MovServicoNotaAfterPost(DataSet: TDataSet);
    procedure MovServicoNotaN_QTD_SERChange(Sender: TField);
    procedure GServicosExit(Sender: TObject);
    procedure MovServicoNotaBeforePost(DataSet: TDataSet);
    procedure MovServicoNotaBeforeInsert(DataSet: TDataSet);
    procedure GServicosEditButtonClick(Sender: TObject);
    procedure DBEditColor1KeyPress(Sender: TObject; var Key: Char);
    procedure BParcelasClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure EDescAcrChange(Sender: TObject);
    procedure BtbImprimeBoletoClick(Sender: TObject);
    procedure BAlterarNumeroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cadNotasFiscaisBeforePost(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure DelNaturezaSelect(Sender: TObject);
    procedure DBEditLocaliza4Cadastrar(Sender: TObject);
    procedure DBEditColor10Exit(Sender: TObject);
    procedure MovNotasFiscaisBeforeDelete(DataSet: TDataSet);
    procedure BImprimirRomanrioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MovNotasFiscaisBeforeCancel(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
     NovaNF : TFNovaNotaFiscal;
     NF : TFuncoesNotaFiscal;
     UnImp : TFuncoesImpressao;
     UnProdutos : TFuncoesProduto;
     UnCR : TFuncoesContasAReceber;
     CodVenCli : integer;
     ICMSPAdrao : double;
     ICMSLocal : Boolean; // se a natureza permitir apenas cliente local
     CodigoProdutoAtual : string; // utilizado para guardar o codigo do produto quando entra na calula cod pro quando sair se igual naum localizar novamente
     TextosCodigoProduto, TextoCupom : string;
     Kit,mostrarTodasNotas : Boolean; // se for kit true
     CalcularNota, CancelaGerandoNota : Boolean;
     OrganizandoClaFis : Boolean; // utilizado para organizar a classificacao fiscal
     ValorCalcularComissao : Double;   // comissao
     CodFrmPgto : Integer;      // Forma Pagto
     CodVendedor, TipoNotas : string; // guarda o codigo do vendedor na entrada da edit para verificar se foi alterarado no onretorno, para naumn alterar o perc. de comissao
     EstoqueAtual : Double;  // guarda o estoque atual, quando kit para verificar, trancar , etc
     LinhaObsDesAcr : integer; // guarda a linha na qual esta a obs de des e acr
     LancamentoReceber, TamanhoClaFis : Integer;
     ConsultandoNota,
     VprOrcamento : Boolean; // para quando consulta naum executar servicos;
     PermiteFechar : boolean; //
     GerandoOrcamento : Boolean; // gerando orcamento ou pedido
     ImpVen, ImpPag, ImpPed : integer;  // config itens para impressao

     NroLinhaProdutos,
     NroLinhaServico,
     NroLinhaFatura,
     NroConjuntoFatura,
     NroCaracterObs,
     NroCaracterServ,
     Tipo_HOR_VER_Fat : Integer;

     ComReducao, CalculoReducao, NotaVenda : Boolean; // caso haja produtos com reducao
     TextoObsUsuario : TStringList;
     TextoReducao, TextoAdicional, TextoCabecalho : string;
     ValorUnitario : Double;
     DescontoValido, TipFrm : string; // quando entra no campo desconto false, quando sai true, para os demais campos saberem que o desconto foi validado
     Cotacoes : TFuncoesCotacao;
     CodCliLiberdo : string;
     procedure CriaNovaNota;
     function ValidaNroNota : Boolean;
     function VerificaVariaveis : Boolean;
     procedure InicializaCadNota;
     procedure InicializaMovNota;
     procedure CarregaDadosFilial;

     function ValidaProduto : Boolean;
     function AbreLocalizacaoProduto : Boolean;
     procedure AdicionaItemsProduto( SeqPro : Integer );

     procedure CalculaNota;
     procedure CalculaServico;
     procedure ConfiguraItemNota( NroDoc : Integer);
     function LocalizaCondicaoPagto : Boolean;
     function ValidaEntradaGride : Boolean;

     Procedure EstadoBotoes(Estado : Boolean);
     procedure LimpaStringGrid;
     procedure LimpaNota;

     procedure MontaObsDesAcr;
     procedure MontaObservacao(TextoUsuario : String);
     function CalculaValorDescAcr : Double;

     procedure MontaPArcelasCR( SeqNota : Integer );
     function BaixaNota : Boolean;
     procedure ImprimeNotaFical;

     procedure GeraMovNotasFiscaisOrcamento(VpaLanOrcamento : String);
     procedure GeraMovNotasFiscaisOS(VpaNroOS : String);

     Function CarregaNotaConsulta( SeqNota : integer) :Boolean;
  public
     procedure NovaNotaFiscal(tipoNota : String; NotaVenda : boolean);
     function ConsultaNotafiscal( SeqNota : integer) : boolean;
     procedure ConsultaNotafiscalComCancelar( SeqNota, SeqNotCupom : integer; TextoCupom : string);
     procedure ConsultaNotafiscalAlteraNumero(SeqNota : integer);
     function GeraNotaOrcamento(VpaLanOrcamento, NroOrc_Ped : String; Pedido : Boolean) : Boolean;
     procedure GeraNotaOS(VpaNroOS : String; MostraReferente : Boolean );
  end;

var
  FNovaNotaFiscal: TFNovaNotaFiscal;

implementation

uses APrincipal, constantes, constmsg, ANovaNatureza, ANovoCliente, funsql,
     ALocalizaProdutos, AConsultaCondicaoPgto, funnumeros, FunObjeto,
     AObservacoesNota, ANovoServico, funstring,
     UnClassesImprimir, AMostraParReceber, UnECF, funprinter,
     ANovaTransportadora;

{$R *.DFM}

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                     Rotinas Gerais do formulario
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************* quando cria o formulario ************************************ }
procedure TFNovaNotaFiscal.FormCreate(Sender: TObject);
begin
  TipoNotas := '';
  CodCliLiberdo := '';
  CalculoReducao := false;
  GerandoOrcamento := false;
  mostrarTodasNotas := false;
  TextoCupom := '';
  CadNotasFiscaisN_PES_BRU.DisplayFormat := '###,###,##0.000';
  MudaMacaraEdicaoDisplay([MovNotasFiscaisN_QTD_PRO], varia.mascaraQTD);
  MudaMacaraEdicao([MovNotasFiscaisN_VLR_PRO], varia.MascaraValorUnitario);
  MudaMacaraDisplay([MovNotasFiscaisN_VLR_PRO], varia.MascaraValorUnitario);

  if config.MostraCasaDecimalQTD then
    MovNotasFiscaisN_QTD_PRO.DisplayFormat := Varia.MascaraQtd;

  VprOrcamento := false;
  PermiteFechar := false;
  TextosCodigoProduto := '1';
  if (self.Owner is TFNovaNotaFiscal) then
   Anterior.Enabled := true;
  UnCR := TFuncoesContasAReceber.criar(self, FPrincipal.BaseDados);
  NF := TFuncoesNotaFiscal.criar(self, FPrincipal.BaseDados);
  UnImp := TFuncoesImpressao.criar(self, FPrincipal.BaseDados);
  UnProdutos := TFuncoesProduto. criar(self,FPrincipal.BaseDados);
  CarregaDadosFilial;  // carrega o cgc e incricao da filial
  CalcularNota := true;
  cadNotasFiscaisD_DAT_SAI.EditMask := FPrincipal.CorFoco.AMascaraData;
  if not Config.PermiteAlterarPercComissao then    // caso naum possa alterar o perc de comissao do vendedor
  begin
    EPercPro.ReadOnly := true;
    EPercServ.ReadOnly := true;
  end;
  // permite ou naum alterar o numero da nota fiscal
  DBEditColor5.ReadOnly := not config.AlterarNroNF;

  cadNotasFiscaisN_VLR_PER.DisplayFormat := Varia.MascaraMoeda;
  CodFrmPgto := 0;
  LinhaObsDesAcr := 999;
  ComReducao := false; // caso haja produtos com reducao
  TextoObsUsuario := TStringList.Create;
  ECodServicoSelect(ECodServico); // atualiza a select caso utilzar F3 direto na consulta de serviço
  OrganizandoClaFis := false;
  if not Config.MostraParcelas then
    BParcelas.Visible := false;

  if not config.AlterarValorUnitarioNota then
    Grade.Columns[6].ReadOnly := true;

  if config.PermiteAlteraTotalProdutoNF then
    Grade.Columns[7].ReadOnly := false;

  if not config.DescontoNota then
    EDescAcr.ReadOnly := true;

  ConsultandoNota := false;
  if config.UsarModoCaixa theN
    BImprimirRomanrio.Visible := true;
  Grade.Columns[11].Visible := config.UsarModoCaixa;
end;

{************ no close da nota fiscal *************************************** }
procedure TFNovaNotaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  varia.TabelaPreco := varia.TabelaPrecoPadrao;
  cadNotasFiscais.close;
  MovNotasFiscais.close;
  MovServicoNota.close;
  CADBOLETO.close;
  Aux.close;
  CadNatureza.close;
  cadClientes.close;
  CadTransportadora.close;
  CadProdutos.close;
  Produtos.close;
  MovOrcamento.close;
  CadOrcamentos.close;
  CadServico.close;
  TextoObsUsuario.Free;
  UnProdutos.Free;
  UnImp.Free;
  NF.Free;
  UnCR.Free;
  action := cafree;
end;

{**************** quando inicializa o formulario **************************** }
procedure TFNovaNotaFiscal.FormShow(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  if not Config.NaoGerarNroNota then
  begin
    if config.DigitarSerie then
    begin
      if DBEditColor10.Enabled then
        DBEditColor10.SetFocus;
    end
    else
      if DelNatureza.Enabled then
        DelNatureza.SetFocus;
  end
  else
  begin
    if DBEditColor5.Enabled then
      DBEditColor5.SetFocus
    else
      if config.DigitarSerie then
      begin
        if DBEditColor10.Enabled then
            DBEditColor10.SetFocus
      end
      else
        Grade.SetFocus;
  end;
end;


{****************** fechamento da nota fiscal ****************************** }
procedure TFNovaNotaFiscal.BFecharClick(Sender: TObject);
begin
  PermiteFechar := true;
  self.close;
end;

{************************ verifica se pode realemente fechar **************** }
procedure TFNovaNotaFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := PermiteFechar;
end;

{ ************** cria uma nova nota ****************************************** }
procedure TFNovaNotaFiscal.CriaNovaNota;
begin
  NovaNF := TFNovaNotaFiscal.Create(self);
  NovaNF.Show;
  Proximo.Enabled := true;
end;

{***************** verifica se as variaveis necessarias esta iniciadas *******}
function TFNovaNotaFiscal.VerificaVariaveis : Boolean;
var
  erroVariavel : integer;
begin
  erroVariavel := 0;

  if Varia.NotaFiscalPadrao = 0 then
    erroVariavel := 1;

  if ConfigModulos.Caixa then
    if varia.OperacaoReceber = 0 then
      erroVariavel := 2;

  // verifica se naum falta dados cfg...
  if (varia.CodigoEmpresa = 0) or (varia.CodigoEmpFil = 0) or (varia.EstadoPadrao = '')   then
    erroVariavel := 3;

  if ConfigModulos.ContasAReceber then
    if Varia.SituacaoPadraoCR = 0 then
      erroVariavel := 4;

  result := erroVariavel = 0;

    case erroVariavel of
     1 : erro(CT_NotaFaltante);
     2 : erro(CT_FaltaCFGOpeCaixaRC);
     3 : erro(CT_FaltaCFGFiscalECF);
     4 : erro(CT_FaltaCFGFinanceiro);
    end;
end;

{************ monta nova nota, chamada externa ******************************* }
procedure TFNovaNotaFiscal.NovaNotaFiscal(tipoNota : String; NotaVenda : boolean);
begin
  PermiteFechar := true;
  if UnCr.VerificaCaixaAtivo( true ) then
  begin
     if VerificaVariaveis then
     begin
       TipoNotas := tipoNota;
       self.NotaVenda := NotaVenda;
       ConfiguraItemNota(Varia.NotaFiscalPadrao);
       InicializaCadNota;
       PermiteFechar := false;
       self.ShowModal;
     end
     else
       self.close;
  end
  else
    self.close;
end;

procedure TFNovaNotaFiscal.InicializaCadNota;
begin
  Grade.ReadOnly := false;
  GServicos.ReadOnly := false;
  if not cadNotasFiscais.Active then
    cadNotasFiscais.open;
  cadNotasFiscais.insert;
end;

procedure TFNovaNotaFiscal.InicializaMovNota;
begin
  NF.LocalizaMovNotaFiscal(MovNotasFiscais, cadNotasFiscaisI_SEQ_NOT.AsInteger);
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Funcoes dos componentes superiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{****************Carrega o cgc e o cpf da filial da nota fiscal****************}
procedure TFNovaNotaFiscal.CarregaDadosFilial;
begin
   NF.LocalizaFilial(Aux,Varia.CodigoEmpFil);
   label52.Caption := aux.fieldByName('C_CGC_FIL').AsString;
   label70.Caption := aux.fieldByName('C_INS_FIL').AsString;
   Label75.Caption := aux.fieldByName('C_NOM_FAN').AsString;
   TextoReducao := aux.fieldByName('C_TEX_RED').AsString;
   TextoAdicional := aux.fieldByName('C_DAD_ADI').AsString;
   TextoCabecalho := aux.fieldByName('L_TEX_CAB').AsString;
   Aux.Close;
end;

{**************** verifica se o nro da nota naum e duplicato ou nulo ******* }
procedure TFNovaNotaFiscal.DBEditColor5Exit(Sender: TObject);
begin
  if not DBEditColor5.ReadOnly then
    ValidaNroNota;
end;

{************* valida nro da nota fiscal ************************************* }
function TFNovaNotaFiscal.ValidaNroNota : Boolean;
var
  NovoNroNF : integer;
begin
  result := true;
  if (cadNotasFiscais.State in [dsedit, dsInsert ]) and (not BotaoCancelar1.Focused) then
  begin
    if NF.Notaduplicada(cadNotasFiscaisI_NRO_NOT.AsString,cadNotasFiscaisC_SER_NOT.AsString, NovoNroNF) then
    begin
      result := false;
      if not config.NaoGerarNroNota then  // caso nro manual
      begin
        if not (cadNotasFiscais.State in [ dsEdit, dsInsert ]) then
          cadNotasFiscais.edit;
        cadNotasFiscaisI_NRO_NOT.AsInteger := NovoNroNF;
      end;
      if config.NaoGerarNroNota then
        DBEditColor5.SetFocus;
    end;
  end;
end;

{********************** select da natureza de operacao ********************* }
procedure TFNovaNotaFiscal.DelNaturezaSelect(Sender: TObject);
begin
  DelNatureza.ASelectLocaliza.Clear;
  DelNatureza.ASelectLocaliza.add(' Select * from CadNatureza where c_nom_nat like ''@%'' ' +
                                  ' and c_cli_for = ''S'' ' );
  DelNatureza.ASelectValida.clear;
  DelNatureza.ASelectValida.Add(' select * from CadNatureza where C_COD_NAT = ''@'' ' +
                                ' and c_cli_for = ''S'' ' );

  if not mostrarTodasNotas then
  begin
    DelNatureza.ASelectLocaliza.add(' and c_mos_not = ''S'' and c_ati_nat = ''S'' ' +
                                    ' and isnull(c_fil_per,''' + inttostr(varia.CodigoEmpFil) +
                                    ''') like ''%' + inttostr(varia.CodigoEmpFil) + '%''');

    DelNatureza.ASelectValida.Add(' and c_mos_not = ''S'' and c_ati_nat = ''S'' ' +
                                  ' and isnull(c_fil_per, ''' + inttostr(varia.CodigoEmpFil) +
                                  ''') like ''%' + inttostr(varia.CodigoEmpFil) + '%''');


    if ConfigModulos.Estoque then
    begin
      DelNatureza.ASelectLocaliza.add(' and i_cod_ope is not null');
      DelNatureza.ASelectValida.Add(' and i_cod_ope is not null');
    end;

    if ConfigModulos.ContasAReceber then
    begin
      DelNatureza.ASelectLocaliza.add(' and C_CLA_PLA is not null');
      DelNatureza.ASelectValida.Add(' and C_CLA_PLA is not null');
    end;
  end;

  if TipoNotas <> '' then
  begin
    DelNatureza.ASelectLocaliza.add(' and C_TIP_NAT in (' + TipoNotas + ')' );
    DelNatureza.ASelectValida.Add(' and C_TIP_NAT in (' + TipoNotas + ')');
  end;

end;

{*************** retorno da localizacao da natureza ************************ }
procedure TFNovaNotaFiscal.DelNaturezaRetorno(Retorno1, Retorno2: String);
begin
  if (retorno1 <> '') then
  begin

    NF.LocalizaCadNatureza(CadNatureza, retorno1);

    label26.Caption := CadNatureza.fieldbyName('C_DES_NOT').AsString;

    if retorno2  = 'S' then
      cadNotasFiscaisC_TIP_NOT.AsString := 'S'
    else
      cadNotasFiscaisC_TIP_NOT.AsString := 'E';
    // caso a natureza naum permita insercao de produtos.
    if CadNatureza.FieldByname('c_ins_pro').AsString  = 'N' then
      grade.ReadOnly := true
    else
      grade.ReadOnly := false;

    // caso a natureza naum permita insercao de Servicos.
    if CadNatureza.FieldByname('c_ins_ser').AsString  = 'N' then
      GServicos.ReadOnly := true
    else
      GServicos.ReadOnly := false;

    // caso naum gere contas a receber
    if CadNatureza.FieldByName('c_ger_fin').AsString <> 'S' then
    begin
      Econdicoes.Enabled := false;
      SpeedButton4.Enabled := false;
    end
    else
    begin
      Econdicoes.Enabled := true;
      SpeedButton4.Enabled := true;
    end;

    ICMSLocal := false;
    if CadNatureza.FieldByName('C_NAT_LOC').AsString = 'S' then
      ICMSLocal := true;

    MontaObservacao(TextoObsUsuario.text);
  end;
end;


{*************** cadastro de nova natureza *********************************** }
procedure TFNovaNotaFiscal.DelNaturezaCadastrar(Sender: TObject);
begin
   FNovaNatureza := TFNovaNatureza.CriarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaNatureza'));
   FNovaNatureza.CadNaturezas.Insert;
   FNovaNatureza.ShowModal;
   Localiza.AtualizaConsulta;
   AtualizaSQLTabela(CadNatureza);
end;

{*************** retorno da localizacao do cliente ************************* }
procedure TFNovaNotaFiscal.DelClienteRetorno(Retorno1, Retorno2: String);
var
  clienteErrado : boolean;
  ValorIna : Double;
begin
  if Retorno2 <> '' then
    if strToInt(Retorno2) <> 0 then
    begin
      cadNotasFiscaisN_VLR_PER.AsCurrency := strToInt(Retorno2);
      cadNotasFiscaisC_DES_ACR.AsString := 'D';//      AcrDes.ItemIndex := 1
      cadNotasFiscaisC_VLR_PER.AsString := 'P';  //VlrPer.ItemIndex := 0;
      AcrDes.ItemIndex := 1;
      VlrPer.ItemIndex := 1;
    end;

  if retorno1 <> '' then
  begin
    NF.LocalizaCliente(cadClientes, StrToInt(retorno1));

    if cadNotasFiscaisC_END_COB.AsString = '' then
      cadNotasFiscaisC_END_COB.AsString := cadClientes.fieldByName('c_end_cob').AsString;
    if cadNotasFiscaisC_PRA_PAG.AsString = '' then
      cadNotasFiscaisC_PRA_PAG.AsString := cadClientes.fieldByName('c_pra_cli').AsString;
    Econdicoes.Text := '';
    if cadClientes.fieldByName('i_cod_pag').AsInteger <>  0 then
    begin
      Econdicoes.Text := cadClientes.fieldByName('i_cod_pag').AsString;
      Label74.Caption := nf.RetornaCondPagamento(cadClientes.fieldByName('i_cod_pag').AsInteger);
    end;
    CodFrmPgto := varia.FormaPagamentoPadrao;
    if cadClientes.fieldByName('i_cod_frm').AsInteger <>  0 then
      CodFrmPgto := cadClientes.fieldByName('i_cod_frm').AsInteger;

    CodigoTabelaPreco( StrtoInt(retorno1), FPrincipal.BaseDados);

    CodVenCli := NF.VerificaVendedor(StrToInt(retorno1));
    if CodVenCli <> 0 then
      ECoDVendedor.Text := IntTostr(CodVenCli)
    else
      ECoDVendedor.Clear;
    ECoDVendedor.Atualiza;
    if config.TrancaVendedorNotaCupom then  // verifica se deve trancar o vendedor
    begin
      ECoDVendedor.Enabled := ECoDVendedor.Text = '';
      SpeedButton2.Enabled := ECoDVendedor.Text = '';
    end;

    clienteErrado := false;
    if ICMSLocal then
    begin
      if UpperCase(cadClientes.FieldByName('c_est_cli').AsString) <> UpperCase(Varia.EstadoPadrao) then
       clienteErrado := true;
    end
    else
      if cadClientes.FieldByName('c_est_cli').AsString = Varia.EstadoPadrao then
        clienteErrado := true;

    if clienteErrado then
    begin
      aviso(CT_NaturezaErrada);
      if Self.Visible then
      begin
        DelCliente.Text := '';
        DelCliente.SetFocus;
        abort;
      end
      else
        cadNotasFiscaisC_COD_NAT.Clear;
    end;

   // mostra inadimplentes
   ValorIna := 0;
   if config.MostraInaNF then
    if CodCliLiberdo <> Retorno1 then
    begin
      ValorIna := NF.calculaParcelaAbertaCli(StrToInt(Retorno1));
      if valorIna <> 0 then
      begin
        FMostraParReceber := TFMostraParReceber.CriarSDI(application, '');
        FMostraParReceber.MostraInadimplentes(StrToInt(Retorno1), ValorIna);
        FMostraParReceber.ShowModal;
        if not SenhaDeLiberacao then
        begin
          CancelaGerandoNota := true;
          if Self.Visible then
          begin
            DelCliente.Text := '';
            DelCliente.SetFocus;
            abort;
          end;
        end
        else
          CodCliLiberdo := Retorno1;
      end
      else
        CodCliLiberdo := '';
    end;

    if not(cadClientes.Eof) Then
    begin
      if (cadClientes.FieldByName('C_TIP_PES').AsString[1] = 'J') and (CadNatureza.FieldByName('C_ICM_EST').AsString = 'N' ) Then
      begin
         DBText17.DataField := 'C_Cgc_Cli';
         DBText20.DataField := 'C_Ins_Cli';
         ICMSPAdrao := ICMS1.ICMS(cadClientes.FieldByName('C_Est_Cli').AsString,Varia.EstadoPadrao,true);
      end
      else
        begin
           DBText17.DataField := 'C_Cpf_Cli';
           DBText20.DataField := 'C_REG_Cli';
           ICMSPAdrao := ICMS1.ICMS(cadClientes.FieldByName('C_Est_Cli').AsString,Varia.EstadoPadrao,false);
        end;
    end;
  end;
end;

{************* cadastro de novo cliente ************************************* }
procedure TFNovaNotaFiscal.DelClienteCadastrar(Sender: TObject);
begin
   FNovoCliente := TFNovoCliente.CriarSDI(application,'', true);
   FNovoCliente.CadClientes.Insert;
   FNovoCliente.ShowModal;
   Localiza.AtualizaConsulta;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Funcoes das tabelas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** quando inseri uma nova nota, Cabecalho ******************** }
procedure TFNovaNotaFiscal.cadNotasFiscaisAfterInsert(DataSet: TDataSet);
begin
   CodCliLiberdo := '';
   cadNotasFiscaisI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
   cadNotasFiscaisI_TIP_FRE.AsInteger := 2;
   CadNotasFiscaisC_NOT_CAN.Value := 'N';
   cadNotasFiscaisD_DAT_EMI.AsDateTime := date;
   cadNotasFiscaisD_DAT_SAI.AsDateTime := date;
   cadNotasFiscaisT_HOR_SAI.AsDateTime := time;
   cadNotasFiscaisC_SER_NOT.AsString := varia.SerieNota;
//   if NotaVenda then // venda  retirado para nao gerar mais erro
//   cadNotasFiscaisC_COD_NAT.AsString := Varia.NaturezaNota;
   cadNotasFiscaisC_DES_ACR.AsString := 'A';
   cadNotasFiscaisC_VLR_PER.AsString := 'V';
   cadNotasFiscaisC_FLA_ECF.AsString := 'N';
   cadNotasFiscaisC_NOT_IMP.AsString := 'N';
   cadNotasFiscaisC_NOT_DEV.AsString := 'N';
   cadNotasFiscaisI_COD_USU.AsInteger := varia.CodigoUsuario;
   cadNotasFiscaisI_TIP_FRE.AsInteger := varia.FretePadraoNF;
   if cadNotasFiscaisI_TIP_FRE.AsInteger = 0 then
     cadNotasFiscaisI_TIP_FRE.AsInteger :=  2;
   DelNatureza.Atualiza;
   EstadoBotoes(true);
   LinhaObsDesAcr := 999;
   ComReducao := false;
   DescontoValido := '';
end;

{**************** na edicao do cad notas ************************************* }
procedure TFNovaNotaFiscal.cadNotasFiscaisAfterEdit(DataSet: TDataSet);
begin
  EstadoBotoes(true);
end;

{******************* antes de gravar o registro *******************************}
procedure TFNovaNotaFiscal.cadNotasFiscaisBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  cadNotasFiscaisD_ULT_ALT.AsDateTime := Date;
end;

{************* na insercao de um movimento ********************************** }
procedure TFNovaNotaFiscal.MovNotasFiscaisAfterInsert(DataSet: TDataSet);
begin
  if ((MovNotasFiscais.RecordCount + 1) > (NroLinhaProdutos - MObservacoes.Lines.Count)) and (not VprOrcamento) then
  begin
    aviso(CT_ExcessoProduto);
    MovNotasFiscais.Cancel;
  end
  else
  begin
    MovNotasFiscaisI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
    MovNotasFiscaisI_SEQ_NOT.AsInteger := cadNotasFiscaisI_SEQ_NOT.AsInteger;
    MovNotasFiscaisN_PER_ICM.AsFloat := ICMSPAdrao;
    CodigoProdutoAtual := '0';
    if ConsultandoNota then
      MovNotasFiscais.cancel;
  end;
end;

{*************** depois do edit do mov notas fiscais ************************ }
procedure TFNovaNotaFiscal.MovNotasFiscaisAfterEdit(DataSet: TDataSet);
begin
 if not OrganizandoClaFis  then
 begin
    NF.LocalizaProdutoQdadeTabelaSeqPro(CadProdutos, MovNotasFiscaisI_SEQ_PRO.AsInteger);
    grade.Columns[4].PickList := NF.UnidadesParentes(CadProdutos.FieldByname('c_cod_uni').AsString);
 end;
end;

{*************** antes do insert ********************************************* }
procedure TFNovaNotaFiscal.MovNotasFiscaisBeforeInsert(DataSet: TDataSet);
begin
  if self.visible then
    ActiveControl := grade;
  grade.SelectedIndex := 0;
end;

{************** apos gravar o movimento da nota ***************************** }
procedure TFNovaNotaFiscal.MovNotasFiscaisAfterPost(DataSet: TDataSet);
begin
  if not OrganizandoClaFis then
  begin
    // verifica se o produto ja existe na nota fiscal e adiciona no existe
    if not config.PermiteDuplicarProNF then
       NF.VerificaExisteItemNotaAdiciona( MovNotasFiscaisI_SEQ_NOT.AsInteger,
                                          MovNotasFiscaisI_SEQ_PRO.AsInteger,
                                          MovNotasFiscaisI_SEQ_MOV.AsInteger,
                                          MovNotasFiscaisN_QTD_PRO.AsFloat,
                                          MovNotasFiscaisC_COD_UNI.AsString );
    AtualizaSQLTabela(MovNotasFiscais);
    CalculaNota;
    MovNotasFiscais.last;
  end;
end;

{*************** antes de gravar o mov notas fiscais ************************* }
procedure TFNovaNotaFiscal.MovNotasFiscaisBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  MovNotasFiscaisD_ULT_ALT.AsDateTime := Date;

  if not OrganizandoClaFis then
  begin
    if MovNotasFiscaisC_COD_PRO.IsNull or MovNotasFiscaisC_COD_UNI.IsNull or
       MovNotasFiscaisN_QTD_PRO.IsNull or MovNotasFiscaisN_VLR_PRO.IsNull then
      if grade.Focused then
        abort
      else
      begin
        movnotasfiscais.Cancel;
        abort;
      end;

      if MovNotasFiscaisN_VLR_PRO.AsCurrency < 0 then
      begin
        aviso('O valor unitario não pode ser negativo !');
        Grade.SetFocus;
        abort;
      end;

      if (not Kit) and (CadNatureza.FieldByName('C_BAI_EST').AsString = 'S') then
      begin
        if not UnProdutos.VerificaEstoque( MovNotasFiscaisC_COD_UNI.AsString, cadProdutos.fieldByName('c_cod_uni').AsString, MovNotasFiscaisN_QTD_PRO.AsFloat,MovNotasFiscaisI_SEQ_PRO.AsString) then
         abort;
        UnProdutos.TextoQdadeMinimaPedido( cadprodutos.fieldByName('n_qtd_ped').AsFloat,
                                           cadprodutos.fieldByName('n_qtd_min').AsFloat,
                                           MovNotasFiscaisN_QTD_PRO.AsFloat);

      end;

      if not FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.StartTransaction;
      MovNotasFiscaisI_SEQ_MOV.AsInteger := ProximoCodigoFilial('movnotasfiscais','i_seq_mov','i_emp_fil',varia.CodigoEmpFil,FPrincipal.BaseDados);
      if FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.Commit;
  end;

  if MovNotasFiscaisN_VLR_PRO.AsCurrency = 0 then
    aviso('ATENÇÃO - O valor do produto está zerado ');
end;

{************* quando o campo qdade recebe um valor ************************* }
procedure TFNovaNotaFiscal.MovNotasFiscaisN_QTD_PROChange(Sender: TField);
begin
   if not OrganizandoClaFis then
   begin
     if config.TruncarTotalProduto then
       MovNotasFiscaisN_TOT_PRO.AsCurrency := TruncaValorDecimal(MovNotasFiscaisN_QTD_PRO.AsCurrency * MovNotasFiscaisN_VLR_PRO.AsCurrency,varia.Decimais)
     else
       MovNotasFiscaisN_TOT_PRO.AsCurrency := MovNotasFiscaisN_QTD_PRO.AsCurrency * MovNotasFiscaisN_VLR_PRO.AsCurrency;
     if MovNotasFiscaisN_PER_IPI.AsCurrency <> 0 then
      MovNotasFiscaisN_PER_IPIChange(nil);
   end;
end;

{****************** calcula o valor do ipi ********************************** }
procedure TFNovaNotaFiscal.MovNotasFiscaisN_PER_IPIChange(Sender: TField);
begin
  MovNotasFiscaisn_vlr_ipi.AsFloat := MovNotasFiscaisN_TOT_PRO.AsFloat * MovNotasFiscaisN_PER_IPI.AsFloat / 100;
end;


{**************** calcula novo valor conforme unidade ***********************}
procedure TFNovaNotaFiscal.MovNotasFiscaisC_COD_UNIChange(Sender: TField);
begin
 if Grade.SelectedIndex = 4 then
   MovNotasFiscaisN_VLR_PRO.AsCurrency := NF.CalculaValorPadrao( MovNotasFiscaisC_COD_UNI.AsString,
                                                                 CadProdutos.FieldByname('c_cod_uni').AsString,
                                                                 CadProdutos.FieldByname('n_vlr_ven').AsFloat,
                                                                 MovNotasFiscaisI_SEQ_PRO.AsInteger );
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                        Tratamentos dos produtos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{*********************** Valida o  Produto ********************************** }
function TFNovaNotaFiscal.ValidaProduto : Boolean;
var
  Qdade : string;
  SeqPro :integer;
begin
  result := true;
  if MovNotasFiscais.State in [ dsedit, dsinsert ] then
  begin
    if NF.VerificaExisteProduto(MovNotasFiscaisC_COD_PRO.AsString, SeqPro) then // valida o campo codigo caso esteja vazio
    begin
      TextosCodigoProduto := TextosCodigoProduto + ', ' + IntToStr(SeqPro);
      NF.LocalizaProdutoCodigos(Produtos, TextosCodigoProduto );
      MovNotasFiscaisI_SEQ_PRO.AsInteger := SeqPro;
    end
    else
      result := AbreLocalizacaoProduto;
    if Result then
      AdicionaItemsProduto(MovNotasFiscaisI_SEQ_PRO.AsInteger);

    if (config.UsarModoCaixa) and (MovNotasFiscaisN_QTD_PRO.AsFloat = 0) then
    begin
      qdade := '';
      if EntradaNumero('Caixa','Digite Quantidades de caixas', qdade,false,fprincipal.CorFoco.AFundoComponentes, FPrincipal.CorForm.ACorFormulario,false, varia.Decimais) then
      begin
         MovNotasFiscaisN_QTD_PRO.AsFloat :=  nf.PesoProximasCaixas(strToInt(qdade), cadNotasFiscaisI_SEQ_NOT.AsInteger, MovNotasFiscaisI_SEQ_PRO.AsInteger, cadNotasFiscaisI_NRO_NOT.AsInteger, cadNotasFiscaisC_SER_NOT.AsString );
         if qdade <> '' then
           MovNotasFiscaisI_QTD_CAI.AsInteger := strtoint(qdade);
      end;
     end;

  end;
end;

{*********************** Abre a localizacao dos produto ********************** }
function TFNovaNotaFiscal.AbreLocalizacaoProduto : Boolean;
var
  SeqPro :integer;
  codPro : string;
  cadastrou, Abrir : boolean;
begin
   abrir := true;
   if (config.UsarModoCaixa) then
     abrir := (MovNotasFiscaisN_QTD_PRO.IsNull);

  if abrir then
  begin
     cadastrou := true;
     FLocalizaProduto := TFLocalizaProduto.CriarSDI(application,'',true);
     result := FLocalizaProduto.LocalizaProduto( cadastrou, seqpro, CodPro, EstoqueAtual, cadnotasfiscaisi_cod_cli.asinteger);
     if cadastrou then  // caso tenha cadastrado um produto na consulta
       AtualizaSQLTabela(Produtos);
     if result then
     begin
       if not (MovNotasFiscais.State in [ dsEdit, dsInsert ]) then
         MovNotasFiscais.Insert;
       MovNotasFiscaisI_SEQ_PRO.AsInteger := SeqPro;
       MovNotasFiscaisC_COD_PRO.AsString := codPro;
     end;
   end;
end;

{********* adiciona os itens do produto localizado *************************** }
procedure TFNovaNotaFiscal.AdicionaItemsProduto( SeqPro : Integer );
var
  CodProKit : integer;
  Reducao, AdicionarKit : Boolean;
  CodCST : string;
begin
  NF.LocalizaProdutoQdadeTabelaSeqPro(CadProdutos, SeqPro);
  if CadProdutos.FieldByName('C_KIT_PRO').AsString = 'P' then
  begin
    Kit := false;
    if not GerandoOrcamento then
    begin
      MovNotasFiscaisC_COD_UNI.AsString := CadProdutos.FieldByname('c_cod_uni').AsString;
      MovNotasFiscaisN_VLR_PRO.AsFloat := CadProdutos.FieldByname('n_vlr_ven').AsFloat;
      MovNotasFiscaisN_LIQ_CAI.AsFloat := CadProdutos.FieldByname('n_liq_cai').AsFloat;
      MovNotasFiscaisC_UNI_VEN.AsString:= CadProdutos.FieldByname('c_uni_ven').AsString;
    end;
    MovNotasFiscaisC_CLA_FIS.AsString := CadProdutos.FieldByname('c_cla_fis').AsString;

    // Origem da mercadoria e tributacao
    if CadProdutos.fieldByName('I_ORI_MER').AsString <> '' then
      CodCST := CadProdutos.fieldByName('I_ORI_MER').AsString
    else
      CodCST := '0';

    if CadNatureza.FieldByName('C_CST_PAD').AsString = '' then
    begin
      if CadProdutos.fieldByName('I_COD_RED').AsInteger <> 0 then
         CodCST := CodCST + '20'
      else
        case CadProdutos.fieldByName('I_TIP_TRI').AsInteger of
          0 : CodCST := CodCST + '00';    // 00 Sujeito a ICMS ( tributação integral)
          1 : CodCST := CodCST + '10';    // 10 Tributada e com cobrança do ICMS por substituição tributária
          2 : CodCST := CodCST + '20';    // 20 Com redução na base de cálculo
          3 : CodCST := CodCST + '40';    // 30 Isenta ou não tributada e cobranca do ICMS por substituição tributária
                                          // 40 Isenta
          4 : CodCST := CodCST + '41';    // 41 Não tributada
                                          // 50 Suspensão
                                          // 51 Diferimento
                                          // 60 ICMS cobrado anteriormente por substituição
                                          // 70  Com redução de base de cálculo e cobranca do ICMS por substituição tributária
                                          // 90  Outras
        end;
     end
     else
       CodCST := CodCST + CadNatureza.FieldByName('C_CST_PAD').AsString;

    MovNotasFiscaisC_COD_CST.AsString := CodCST;

    // icms, ipi
    if CadNatureza.FieldByname('c_cal_icm').AsString  = 'S' then
    begin
      if CadProdutos.FieldByname('n_per_ipi').AsFloat <> 0 then  // caso haja ipi
        MovNotasFiscaisN_PER_IPI.AsFloat := CadProdutos.FieldByname('n_per_ipi').AsFloat;
      if (CadProdutos.FieldByname('n_red_icm').AsFloat <> 0) and (CadProdutos.FieldByname('I_COD_RED').AsInteger = 0) then  // caso haja reducao de icms
      begin
        MovNotasFiscaisN_PER_ICM.AsFloat := CadProdutos.FieldByname('n_red_icm').AsFloat;
        ComReducao := true;
      end;
    end
    else
    begin   // caso a natureza naum gere icms, ipi
      MovNotasFiscaisN_PER_IPI.AsFloat := 0;
      MovNotasFiscaisN_PER_ICM.AsFloat := 0;
    end;
    grade.Columns[4].PickList := NF.UnidadesParentes(CadProdutos.FieldByname('c_cod_uni').AsString);
 end
 else
 begin
   AdicionarKit := true;

   if (CadNatureza.FieldByName('C_BAI_EST').AsString = 'S') then
     if UnProdutos.TextoPossuiEstoque(1, EstoqueAtual,' kit ') then
       UnProdutos.TextoQdadeMinimaPedido( cadprodutos.fieldByName('n_qtd_ped').AsFloat,
                                          cadprodutos.fieldByName('n_qtd_min').AsFloat, 1)
     else
       AdicionarKit := false;

   if AdicionarKit then
   begin
     Kit := true;
     Tempo.execute('Adicionando Kit à Nota Fiscal ....');
     CalcularNota := false;
     CodProKit := CadProdutos.FieldByName('I_SEQ_PRO').AsInteger;
     MovNotasFiscais.Cancel;

     if not FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.StartTransaction;
     Reducao := NF.AdicionaProdutoKit(MovNotasFiscais, Produtos, cadNotasFiscaisI_SEQ_NOT.AsInteger,CodProKit,CadNatureza.FieldByname('c_cal_icm').AsString, TextosCodigoProduto);
     if FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.commit;

     if not ComReducao then
       ComReducao := Reducao;
     CalcularNota := true;
     CalculaNota;
     Tempo.fecha;
   end
   else
     MovNotasFiscais.Cancel;
 end;
end;


{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          funcoes do grid
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

function TFNovaNotaFiscal.ValidaEntradaGride : Boolean;
var
 NroNota : integer;
begin
  result := true;

  if CadNotasFiscais.State = dsInsert then
   begin
        if config.NaoGerarNroNota then // caso manual para naum gravar o nro da nota
        begin
          NroNota := cadNotasFiscaisI_NRO_NOT.AsInteger;
          cadNotasFiscaisI_NRO_NOT.Clear;
        end;

        // gera codigo sequencial da nota
      if not FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.StartTransaction;
      cadNotasFiscaisI_SEQ_NOT.AsInteger := ProximoCodigoFilial('CadNotaFiscais','I_SEQ_NOT','i_emp_fil',varia.CodigoEmpFil,FPrincipal.BaseDados);
      CadNotasFiscais.Post;
      if FPrincipal.BaseDados.InTransaction then
        FPrincipal.BaseDados.Commit;

      NF.LocalizaCadNotaFiscal(cadNotasFiscais, CadNotasFiscaisI_SEQ_NOT.AsInteger, varia.CodigoEmpFil);
      CadNotasFiscais.Edit;

      MarcaTransacao(1,cadNotasFiscaisI_SEQ_NOT.AsInteger,varia.CodigoEmpFil);

      // mudanca de serie
      if not config.NaoGerarNroNota then
         cadNotasFiscaisI_NRO_NOT.AsInteger :=  NF.RetornaProximoCodigoNota(cadNotasFiscaisC_SER_NOT.AsString)
      else
         cadNotasFiscaisI_NRO_NOT.AsInteger := NroNota;
      if not GerandoOrcamento then
        DBEditColor10.Enabled := false;
    end;
end;


{********** qundo entra no grid ********************************************* }
procedure TFNovaNotaFiscal.GradeEnter(Sender: TObject);
begin
  if ValidaEntradaGride then
  begin
    if not MovNotasFiscais.Active then
      InicializaMovNota;
    grade.SelectedIndex := 0;
    if self.visible then
      ActiveControl := grade;
  end;
end;

{***************** quando entra em uma coluna da grade ********************** }
procedure TFNovaNotaFiscal.GradeColEnter(Sender: TObject);
begin
  CodigoProdutoAtual := MovNotasFiscaisC_COD_PRO.AsString;
  if Grade.SelectedIndex = 6 then
    ValorUnitario := MovNotasFiscaisN_VLR_PRO.AsCurrency;
end;

{********** no exit de uma coluna da grade ********************************** }
procedure TFNovaNotaFiscal.GradeColExit(Sender: TObject);
var
  codPro : string;
begin
    if not ConsultandoNota then
      case grade.SelectedIndex of
        0 : begin
             if (CodigoProdutoAtual <> MovNotasFiscaisC_COD_PRO.AsString) or ( MovNotasFiscaisC_COD_PRO.AsString = '') then
                if not ValidaProduto then
                  abort;
            end;
        4 : begin
              if MovNotasFiscais.State in [ dsInsert, dsEdit] then
                if not  NF.ValidaUnidade(MovNotasFiscaisC_COD_UNI.AsString, CadProdutos.FieldByname('c_cod_uni').AsString) then
                   abort;
            end;
        6 : begin
              if ValorUnitario <> MovNotasFiscaisN_VLR_PRO.AsCurrency then
                if not UnProdutos.ValidaAlterarValorUnitario( FPrincipal.CorForm.ACorPainel, FPrincipal.CorFoco.AFundoComponentes ) then
                begin
                  MovNotasFiscaisN_VLR_PRO.AsCurrency := ValorUnitario;
                  abort;
                end;
            end;
      end;
end;

{************** quando pressiona uma tecla na grade ************************* }
procedure TFNovaNotaFiscal.GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Grade.ReadOnly then
  begin
    if not ConsultandoNota then
    begin
       if ( not MovNotasFiscais.IsEmpty) and (key = 46)and
          (MovNotasFiscais.State = dsBrowse) then // para deletar um item
         if Confirmacao(CT_DeletarItem) Then
         begin
            MovNotasFiscais.Delete;
            calculaNota;
            key := 0;
         end;

      if (Key = 114)  and (grade.SelectedIndex = 0) then  // localiza produtos
         AbreLocalizacaoProduto;

      if grade.SelectedIndex = 4 then
        if (key = 113) or (key = 13) then
          MovNotasFiscais.edit;
    end;

    if key = 45 then
    begin
      MovNotasFiscais.Append;
      key := 0;
    end;
  end;
end;

{************* altera ponto para virgula ************************************* }
procedure TFNovaNotaFiscal.GradeKeyPress(Sender: TObject; var Key: Char);
begin
  // caso use modo caixa, nao permitir digitar novo produto
  if (config.UsarModoCaixa) and (not MovNotasFiscaisN_QTD_PRO.IsNull)  and (grade.SelectedIndex = 0) then
    if ( ord(key) in [33..126])  then
    begin
      key := #;
      abort;
    end;

  if key = '.' then  //se for pressinado ponto substitui por vírgula
     if Grade.SelectedIndex in [5,6,8,9] Then
        key := ',';
end;

{************** localiza produto quando clica no botao no grid *************** }
procedure TFNovaNotaFiscal.GradeEditButtonClick(Sender: TObject);
begin
 if not grade.ReadOnly then
   AbreLocalizacaoProduto; // localiza produto pelas reticencias
end;

{************* no click do da grade ***************************************** }
procedure TFNovaNotaFiscal.GradeCellClick(Column: TColumn);
begin
  if grade.SelectedIndex = 4 then
      MovNotasFiscais.edit;
end;

{********************* quando sair da grade ********************************** }
procedure TFNovaNotaFiscal.GradeExit(Sender: TObject);
var
  PesoBruto : double;
begin
  if not ConsultandoNota then
  begin
    if MovNotasFiscais.State in [ dsinsert, dsEdit ] then
      MovNotasFiscais.post;
    if CadNatureza.FieldByname('c_ins_pro').AsString = 'S' then
      BotaoGravar1.Enabled := (not MovNotasFiscais.IsEmpty);
    if CadNatureza.FieldByname('c_ins_ser').AsString = 'S' then
      BotaoGravar1.Enabled := (not MovServicoNota.IsEmpty);
    if (CadNatureza.FieldByname('c_ins_pro').AsString = 'S') and (CadNatureza.FieldByname('c_ins_ser').AsString = 'S') then
      BotaoGravar1.Enabled := (not MovServicoNota.IsEmpty) and (not MovNotasFiscais.IsEmpty);
    MontaObservacao(TextoObsUsuario.text);
    if cadNotasFiscais.state in [ dsEdit, dsInsert ] then
      if config.CalculaPesoLiquido then
      begin
        PesoBruto := 0;
        cadNotasFiscaisN_PES_LIQ.AsFloat := nf.PesoLiquidoBruto( cadNotasFiscaisI_SEQ_NOT.AsInteger, PesoBruto );
        cadNotasFiscaisN_PES_BRU.AsFloat := pesobruto;
      end;
  end;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Funcoes do Corpo da Nota - inferior
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** chamada para calcular a nota fiscal ************************* }
procedure TFNovaNotaFiscal.DBEditColor9Exit(Sender: TObject);
begin
 CalculaNota;
end;

{************************ no exit da condicao de pagamento ****************** }
procedure TFNovaNotaFiscal.EcondicoesExit(Sender: TObject);
begin
  if not LocalizaCondicaoPagto then
    Econdicoes.SetFocus;
end;

{************** Localiza Condicao de pagto ********************************** }
function  TFNovaNotaFiscal.LocalizaCondicaoPagto : Boolean;
var
  VpfValor, VpfValorNota, VpfDiferencaValor, VpfPercComPro, VpfPercComServ : Double;
  VpfcodPag, VpfCodVen : Integer;
  VpfNomeCond : string;
  PercExistente : double;
begin
  // naum tenha gravado o mov nota
  if MovNotasFiscais.State in [ dsEdit, dsInsert ] then
    MovNotasFiscais.post;

  result := true;

    VpfcodPag := 0;
    if Econdicoes.Text <> '' then
      VpfcodPag := StrToInt(Econdicoes.Text);

    if NF.VerificaExisteCondicaoPgto(VpfcodPag) then
      VpfcodPag := StrToInt(Econdicoes.Text)
    else
      VpfcodPag := varia.CondPagtoVista;  // condicao de pagamento default

    if cadNotasFiscaisN_VLR_PER.AsCurrency <> 0 then     // caso ja exista um perc de desconto
    begin
      PercExistente := cadNotasFiscaisN_VLR_PER.AsCurrency;
      cadNotasFiscaisN_VLR_PER.Clear;
      CalculaNota;
    end;
    // carrega dados caso exista
    VpfPercComPro := EPercPro.AValor;
    if GServicos.Visible then  // usa servico na nota
      VpfPercComServ := EPercServ.AValor
    else
      VpfPercComServ := 999; // naum usa servico

    if ECoDVendedor.text <> '' then
      VpfCodVen := StrToInt(ECoDVendedor.text)
    else
      VpfCodVen := 0;

    // verifica o valor a calcular, - frete, seguro, outras ace...
    VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency - CadNotasFiscaisN_OUT_DES.AsCurrency;
    if cadNotasFiscaisI_TIP_FRE.AsInteger = 1 then // frete pago na nota
      VpfValorNota := VpfValorNota - (cadNotasFiscaisN_VLR_FRE.AsCurrency + cadNotasFiscaisN_VLR_SEG.AsCurrency);

    ValorCalcularComissao := nf.ValorComissaoCFGProduto( cadNotasFiscaisN_TOT_NOT.AsCurrency,
                                                         cadNotasFiscaisN_TOT_PRO.AsCurrency,
                                                         cadNotasFiscaisN_VLR_ICM.AsCurrency, 0,0 );

    FConsultaCondicaoPgto := TFConsultaCondicaoPgto.CriarSDI(Application,'',true);
    Vpfvalor := FConsultaCondicaoPgto.VisualizaParcelasFrmVendedor( VpfValorNota,
                                                                    VpfcodPag, CodFrmPgto, VpfCodVen,
                                                                    VpfPercComPro,VpfPercComServ, ValorCalcularComissao, VpfNomeCond, false );
    FConsultaCondicaoPgto.free;

    if VpfcodPag <> 0 then
    begin
      cadNotasFiscaisI_COD_PAG.AsInteger := VpfcodPag;
      label74.Caption := VpfNomeCond;

      NF.LocalizaFormaPagamento(Aux,CodFrmPgto);
      TipFrm := aux.fieldByName('C_FLA_TIP').AsString;
      aux.close;

      if  VpfCodVen <> 0 then
      begin
        cadNotasFiscaisI_COD_VEN.AsInteger := VpfCodVen;
        ECoDVendedor.Atualiza;
        EPercPro.AValor := VpfPercComPro;
        EPercServ.AValor := VpfPercComServ;
      end;

      // caso tenha desconto ou acrescimos na condicao
      if ArredondaDecimais(Vpfvalor,2) <> ArredondaDecimais(VpfValorNota, 2) then
      begin
        VpfDiferencaValor := VpfValor - VpfValorNota; // neg desconto, positivo acrescimo

        if VpfDiferencaValor < 0 then
          cadNotasFiscaisC_DES_ACR.AsString := 'D'//      AcrDes.ItemIndex := 1
        else
          cadNotasFiscaisC_DES_ACR.AsString := 'A';//AcrDes.ItemIndex := 0;

        cadNotasFiscaisC_VLR_PER.AsString := 'V';  //VlrPer.ItemIndex := 0;

        cadNotasFiscaisN_VLR_PER.AsCurrency := VpfDiferencaValor;

        VlrPer.Enabled := false;
        AcrDes.Enabled := false;
        EDescAcr.Enabled := false;
      end
      else
      begin
        if not EDescAcr.Enabled then
          cadNotasFiscaisN_DES_ACR.Clear
        else
          cadNotasFiscaisN_VLR_PER.AsCurrency := PercExistente;
        VlrPer.Enabled := true;
        AcrDes.Enabled := true;
        EDescAcr.Enabled := true;
      end;
   end
   else
     Result := false;
   CalculaNota;
end;

{***************** cadastra nova transportadora ******************************}
procedure TFNovaNotaFiscal.DBEditLocaliza4Cadastrar(Sender: TObject);
begin
  FNovaTransportadora := TFNovaTransportadora.CriarSDI(self,'', FPrincipal.VerificaPermisao('FNovaTransportadora'));
  FNovaTransportadora.CadTransportadoras.Insert;
  FNovaTransportadora.showmodal;
  Localiza.AtualizaConsulta;
end;

{********************* No retorno da transportadora ************************* }
procedure TFNovaNotaFiscal.DBEditLocaliza4Retorno(Retorno1,
  Retorno2: String);
begin
  if Retorno1 <> '' then
    NF.LocalizaTransportadora(CadTransportadora, StrToint(Retorno1));
  if (Retorno2 <> '') and (cadNotasFiscais.State in [dsEdit, dsInsert ]) then
    cadNotasFiscaisC_NRO_PLA.AsString := Retorno2;
end;

{*************** no enter do cod vendedor *********************************** }
procedure TFNovaNotaFiscal.ECoDVendedorEnter(Sender: TObject);
begin
  CodVendedor := ECoDVendedor.text;
end;

{************ no retorno do vendedor ***************************************** }
procedure TFNovaNotaFiscal.ECoDVendedorRetorno(Retorno1,
  Retorno2: String);
begin
  if ECoDVendedor.Text <> CodVendedor then
  begin
    if Retorno1 <> '' then
      EPercPro.AValor := StrToFloat(retorno1);
    if Retorno2 <> '' then
      EPercServ.AValor := StrToFloat( retorno2);
  end;
end;

{************ no click do botao localiza condicao pagamento ***************** }
procedure TFNovaNotaFiscal.SpeedButton4Click(Sender: TObject);
begin
  Econdicoes.SetFocus;
  DBEditLocaliza4.SetFocus;
end;

{************** localiza condicoes de pagamento F3 ************************** }
procedure TFNovaNotaFiscal.EcondicoesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 114 then
  begin
    Econdicoes.SetFocus;
    ECoDVendedor.SetFocus;
  end;  
end;

{*********** muda a picture do desconto/acrescimo R$ % ********************** }
procedure TFNovaNotaFiscal.VlrPerClick(Sender: TObject);
begin
if VlrPer.ItemIndex = 0 then
  cadNotasFiscaisN_VLR_PER.DisplayFormat := Varia.MascaraMoeda
else
 cadNotasFiscaisN_VLR_PER.DisplayFormat := '##0.00 %';
end;

{**************** calcula o valor de desconto ou acrescimos ***************** }
function TFNovaNotaFiscal.CalculaValorDescAcr : Double;
begin
  result := 0;
  if CadNotasFiscaisN_VLR_PER.AsCurrency <> 0 then
  begin
    if VlrPer.ItemIndex =  0 then
      result := CadNotasFiscaisN_VLR_PER.AsCurrency
    else
      result := CadNotasFiscaisN_TOT_PRO.AsCurrency * ( CadNotasFiscaisN_VLR_PER.AsCurrency / 100 );
  end;
end;

{***************** no exit dos desconto/acrescimos *************************** }
procedure TFNovaNotaFiscal.EDescAcrExit(Sender: TObject);
begin
  if Not ConsultandoNota then
  begin
    if DescontoValido <> (EPercPro.Text + IntToStr(VlrPer.ItemIndex) + IntToStr(AcrDes.ItemIndex)) then
      if not UnProdutos.ValidaDesconto( cadNotasFiscaisN_TOT_PRO.AsCurrency + cadNotasFiscaisN_TOT_SER.AsCurrency, cadNotasFiscaisN_VLR_PER.AsCurrency,
                                        VlrPer.ItemIndex = 1, FPrincipal.CorForm.ACorPainel, FPrincipal.CorFoco.AFundoComponentes ) then
      begin
        EDescAcr.SetFocus;
        abort;
      end
      else
        DescontoValido := EPercPro.Text + IntToStr(VlrPer.ItemIndex) + IntToStr(AcrDes.ItemIndex);

    // desconto maior que o valor da nota
    if (CadNotasFiscaisN_VLR_PER.AsCurrency >= CadNotasFiscaisN_TOT_PRO.AsCurrency + cadNotasFiscaisN_TOT_SER.AsCurrency)
       and (VlrPer.ItemIndex = 0) then
    begin
      aviso(CT_DescontoMaiorNota);
      EDescAcr.SetFocus;
    end
    else
    begin
      CalculaNota;
      MontaObsDesAcr;
    end;
  end;
end;

{*************** calcula o valor de desconto quando altera o valor ********** }
procedure TFNovaNotaFiscal.EDescAcrChange(Sender: TObject);
begin
  if CadNotasFiscais.State in [ dsEdit, dsInsert ] then
    CadNotasFiscaisN_DES_ACR.AsCurrency := CalculaValorDescAcr;
end;

{************************ Monta texto de desconto e acrescimos ************** }
procedure TFNovaNotaFiscal.MontaObsDesAcr;
var
  texto : string;
begin
  if LinhaObsDesAcr <> 999 then // 999 naum existe obs de des ou acr
   MObservacoes.Lines.Delete(LinhaObsDesAcr);

  texto := '';
  if CadNotasFiscaisN_VLR_PER.AsCurrency <> 0 then
  begin
    if AcrDes.ItemIndex = 0 then
      texto := texto + 'Acréscimo de '
    else
      texto := texto + 'Desconto de ';

    texto := texto +  EDescAcr.text;
  end
  else
    LinhaObsDesAcr := 999;

  if texto <> '' then
    LinhaObsDesAcr := MObservacoes.Lines.add(texto);
end;

{********** verifica se 0 usuario digita somente 1 ou 2 ********************** }
procedure TFNovaNotaFiscal.DBEditColor1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in [ '1','2', #8, #46]) then
     Key := #;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                  Funcoes dos Botoes inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{************** Proximo Nota criada ******************************************}
procedure TFNovaNotaFiscal.ProximoClick(Sender: TObject);
begin
  NovaNF.Show;
end;

{************ nota anterior ************************************************* }
procedure TFNovaNotaFiscal.AnteriorClick(Sender: TObject);
begin
  if (self.Owner is TFNovaNotaFiscal) then
   (self.Owner as TFNovaNotaFiscal).Show;
end;

{***************** quando cancela uma nota fiscal *************************** }
procedure TFNovaNotaFiscal.BotaoCancelar1Click(Sender: TObject);
var
  SeqNota : integer;
begin
  SeqNota := cadNotasFiscaisI_SEQ_NOT.AsInteger;

  if MovNotasFiscais.State in [ dsInsert, dsEdit ] then
    MovNotasFiscais.Cancel;

  if CadNotasFiscais.State in [ dsInsert, dsEdit ] then
    CadNotasFiscais.Cancel;

  // caso utilize estoque de caixa faz estorno  
  if config.UsarModoCaixa then
    nf.EstornaCaixasNF(SeqNota, varia.CodigoEmpFil);

  NF.DeletaNota(SeqNota, varia.CodigoEmpFil);

   cadNotasFiscais.Close;
   MovNotasFiscais.close;
   LimpaNota;
   EstadoBotoes(False);
   BotaoGravar1.Enabled := false;
   DesmarcaTransacao(1);
   if VprOrcamento then
   begin
     PermiteFechar := true;
     self.close;
   end;
end;

{***************** grava uma nova nota fiscal ******************************** }
procedure TFNovaNotaFiscal.BotaoGravar1Click(Sender: TObject);
var
  qdadeLinhas : integer;
  GravarOk : Boolean;
begin

  if (DelNatureza.Text = '') or (DelCliente.Field.IsNull) then
  begin
    aviso(CT_FaltaDadosNroNota);
    if DelNatureza.Enabled then
      DelNatureza.SetFocus;
    abort;
  end;

  if (Econdicoes.text = '') and (Econdicoes.Enabled) then
  begin
    if LocalizaCondicaoPagto then
      BotaoGravar1.Click;
  end
  else
  begin
    if cadNotasFiscaisN_TOT_NOT.AsCurrency <> 0 then
    begin

      // caso tenha que dividir a nota
{      qdadeLinhas := nf.ContaLinhasTabela(MovNotasFiscais);
      if (qdadeLinhas +  MObservacoes.Lines.Count) > NroLinhaProdutos then
      begin
        Confirmacao( IntToStr((qdadeLinhas +  MObservacoes.Lines.Count) - NroLinhaProdutos) + ' Serão adicionado a uma nova nota ');
        nf.DuplicaNota( cadNotasFiscaisI_SEQ_NOT.AsInteger, (qdadeLinhas +  MObservacoes.Lines.Count) - NroLinhaProdutos);
        AtualizaSQLTabela(MovNotasFiscais);
        CalculaNota;
      end;}

      // organiza as classificacao fiscal, sumarizando
      if not MovNotasFiscais.IsEmpty then
      begin
        OrganizandoClaFis := true;
        MAdicional.Lines.add(NF.AcertaClaFiscal(MovNotasFiscais, TamanhoClaFis).Text);
//        cadNotasFiscaisC_TEX_CLA.AsString := NF.AcertaClaFiscal(MovNotasFiscais, TamanhoClaFis);  // acerta a classificacao fiscal
        OrganizandoClaFis := false;
      end;

      GravarOk := true;
      if cadNotasFiscais.State in [ dsInsert, dsEdit ] then
      begin
        if ValidaNroNota then
          cadNotasFiscais.post
        else                         { ver nro de nopta }
          GravarOk := false;
      end;

      // caso naum duplique o numero da nota
      if GravarOk then
      begin
        if cadNotasFiscais.State in [ dsInsert, dsEdit ] then
          cadNotasFiscais.Post;
        EstadoBotoes(false);
        BotaoGravar1.Enabled := false;
        Grade.ReadOnly := true;
        GServicos.ReadOnly := true;
        TextosCodigoProduto := '1';
        BaixaNota;
        if VprOrcamento Then
          BotaoCadastrar1.Enabled := false;
      end;
    end
    else
      aviso(CT_ValorNotaNulo);
  end;
end;

{*********** cadastra uma nova nota fiscal *********************************** }
procedure TFNovaNotaFiscal.BotaoCadastrar1Click(Sender: TObject);
var
  SeqExcluir, FilialExcluir : integer;
begin
 if VerificaTransacao(1,SeqExcluir, FilialExcluir) then
 begin
   NF.Exclui_cancelaNotaFiscalDireto(SeqExcluir, FilialExcluir, true);
   DesmarcaTransacao(1);
 end;

 if FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.Rollback;

  MovNotasFiscais.close;
  LimpaNota;
  InicializaCadNota;
  OrganizandoClaFis := false;
  if not Config.NaoGerarNroNota then
  begin
    if DelNatureza.Enabled then
      DelNatureza.SetFocus;
  end
  else
    if DBEditColor5.Enabled then
      DBEditColor5.SetFocus;
end;

{************* gera a tela de digitacao de observacao ************************ }
procedure TFNovaNotaFiscal.BObservacaoClick(Sender: TObject);
begin
   MontaObservacao('');
   FObservacoesNota := TFObservacoesNota.CriarSDI(Application,'',FPrincipal.VerificaPermisao('FObservacoesNota'));
   FObservacoesNota.ObservacoesNota(MObservacoes.lines.text, TextoObsUsuario, NroCaracterObs, NroLinhaProdutos - (MovNotasFiscais.RecordCount + MObservacoes.Lines.Count) );
   MontaObservacao(TextoObsUsuario.text);
end;

{******** mostra as parcelas do contas a receber **************************** }
procedure TFNovaNotaFiscal.BParcelasClick(Sender: TObject);
begin
  FMostraParReceber := TFMostraParReceber.CriarSDI(application,'');
  FMostraParReceber.VisualizaParcelas(LancamentoReceber);
  MontaPArcelasCR(cadNotasFiscaisI_SEQ_NOT.AsInteger);
end;

{************ imprime a nota fiscal ***************************************** }
procedure TFNovaNotaFiscal.BImprimirClick(Sender: TObject);
var
   Imprimir : Boolean;
begin
  imprimir := true;
  if cadNotasFiscaisC_SER_NOT.AsString <> varia.SerieNota then
    imprimir := Confirmacao('NOTA FISCAL COM SÉRIE DIFERENTE DA PADRÃO CONTINUAR');
  if imprimir then
  begin
    ImprimeNotaFical;
    EstadoBotoes(false);
    BParcelas.Enabled := false;
    BAlterarNumero.visible := false;
    if ConsultandoNota then
      BotaoCadastrar1.Enabled := false;
  end;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Serviços
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{******************* na entrada da grade de serviços *********************** }
procedure TFNovaNotaFiscal.GServicosEnter(Sender: TObject);
begin
  if not MovNotasFiscais.Active then
    InicializaMovNota;

  if ValidaEntradaGride then
  begin
    if not MovServicoNota.Active then
    begin
      nf.LocalizaCadServico(CadServico);
      NF.LocalizaMovServicoNota(MovServicoNota, cadNotasFiscaisI_SEQ_NOT.AsInteger);
    end;
    if self.visible then
      ActiveControl := GServicos;
    GServicos.SelectedIndex := 0;
  end;
end;

{********** click do botao da coluna 0 do grid de servico ******************* }
procedure TFNovaNotaFiscal.GServicosEditButtonClick(Sender: TObject);
begin
 if not GServicos.ReadOnly then
 begin
   if not (MovServicoNota.State in [ dsEdit, dsInsert ]) then   // caso entre na grade sen insercao, evita erra de localizacao sem insercao com f3
      MovServicoNota.insert;
    ECodServico.AAbreLocalizacao;
 end;
end;

{***************** select do localiza servico ******************************* }
procedure TFNovaNotaFiscal.ECodServicoSelect(Sender: TObject);
begin
  ECodServico.ASelectValida.Clear;
  ECodServico.ASelectValida.Add( ' Select * from CadServico ' +
                                 ' Where i_cod_ser = @ ' +
                                 ' and I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) );
  ECodServico.ASelectLocaliza.Clear;
  ECodServico.ASelectLocaliza.Add( ' Select * from CadServico ' +
                                   ' Where c_nom_ser like ''@%'' ' +
                                   ' and I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) +
                                   ' order by c_nom_ser' );
end;

{************** no exit da grade de servico ********************************* }
procedure TFNovaNotaFiscal.GServicosColExit(Sender: TObject);
begin
  if not ConsultandoNota then
    case GServicos.SelectedIndex of
      0 : begin
            ECodServico.Atualiza;
            if MovServicoNota.State in [ dsEdit, dsInsert ] then
              if nf.VerificaExisteServico(cadNotasFiscaisi_seq_not.AsInteger,MovServicoNotaI_COD_SER.AsInteger ) then
            begin
              aviso(CT_ServicoRepetido);
              abort;
            end
            else
              MovServicoNotaN_VLR_SER.AsCurrency := nf.RetornaValorServico(MovServicoNotaI_COD_SER.AsInteger);
          end;
    end;
end;

{************** retorno do localiza servico ******************************** }
procedure TFNovaNotaFiscal.ECodServicoRetorno(Retorno1, Retorno2: String);
begin
  if Retorno1 = '' then
  begin
    ECodServico.Field.Clear;
    GServicos.SelectedIndex := 0;
  end;
  GServicos.SetFocus;
end;

{************** permite cadastrar um novo servico ************************* }
procedure TFNovaNotaFiscal.ECodServicoCadastrar(Sender: TObject);
var
  CodCla, DescCal, CodSequencia : string;
begin
  FNovoServico := TFNovoServico.CriarSDI(application, '', true);
  FNovoServico.InsereNovoServico( CodCla, DescCal, CodSequencia, true );
  Localiza.AtualizaConsulta;
  AtualizaSQLTabela(CadServico);
end;

{************** antes do insert de um novo servico *************************** }
procedure TFNovaNotaFiscal.MovServicoNotaAfterInsert(DataSet: TDataSet);
begin
  MovServicoNotaI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
  MovServicoNotaI_COD_EMP.AsInteger := Varia.CodigoEmpresa;
  MovServicoNotaI_SEQ_NOT.AsInteger := cadNotasFiscaisI_SEQ_NOT.AsInteger;
  if ConsultandoNota then
     MovServicoNota.cancel;
end;

{************** key press da grade de servico ******************************** }
procedure TFNovaNotaFiscal.GServicosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '.' then  //se for pressinado ponto substitui por vírgula
     if GServicos.SelectedIndex in [2,3] Then
        key := ',';
end;

{*************** no key down da grade de servicos *************************** }
procedure TFNovaNotaFiscal.GServicosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not GServicos.ReadOnly then
  begin
    if not ConsultandoNota then
    begin
       if ( not MovServicoNota.IsEmpty) and (key = 46)and
          (MovServicoNota.State = dsBrowse) then // para deletar um item
         if Confirmacao(CT_DeletarItem) Then
         begin
            MovServicoNota.Delete;
            CalculaServico;
            key := 0;
         end;

      if (Key = 114)  and (GServicos.SelectedIndex = 0) then  // localiza produtos
      begin
            // caso entre na grade sen insercao, evita erra de localizacao sem insercao com f3
        if not (MovServicoNota.State in [ dsEdit, dsInsert ]) then
          MovServicoNota.insert;
         ECodServico.AAbreLocalizacao;
      end;

      if key = 45 then
      begin
        MovServicoNota.Append;
        key := 0;
      end;
    end;
  end;
end;

{****************** depois de post do mov servico *************************** }
procedure TFNovaNotaFiscal.MovServicoNotaAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(MovServicoNota);
  CalculaServico;
  MovServicoNota.last;
end;

{********* calcula o valor total dos servico em relacao a qtd e valor uni **** }
procedure TFNovaNotaFiscal.MovServicoNotaN_QTD_SERChange(Sender: TField);
begin
  MovServicoNotaN_TOT_SER.AsCurrency := MovServicoNotaN_VLR_SER.AsCurrency * HoraParaDecimal(MovServicoNotaN_QTD_SER.AsCurrency);
end;

{************** no exit da grade de servicos ********************************* }
procedure TFNovaNotaFiscal.GServicosExit(Sender: TObject);
begin
  if not ConsultandoNota then
  begin
    if MovServicoNota.State in [ dsinsert, dsEdit ] then
      MovServicoNota.post;
    if CadNatureza.FieldByname('c_ins_pro').AsString = 'S' then
      BotaoGravar1.Enabled := (not MovNotasFiscais.IsEmpty);
    if CadNatureza.FieldByname('c_ins_ser').AsString = 'S' then
      BotaoGravar1.Enabled := (not MovServicoNota.IsEmpty);
    if (CadNatureza.FieldByname('c_ins_pro').AsString = 'S') and (CadNatureza.FieldByname('c_ins_ser').AsString = 'S') then
      BotaoGravar1.Enabled := (not MovServicoNota.IsEmpty) and (not MovNotasFiscais.IsEmpty);
    if cadNotasFiscais.State in [ dsEdit, dsInsert ] then
    begin
      MontaObservacao(TextoObsUsuario.text);
      CalculaNota;
    end;
  end;
end;

{******************** depois do post dos servicos *************************** }
procedure TFNovaNotaFiscal.MovServicoNotaBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  MovServicoNotaD_ULT_ALT.AsDateTime := Date;

  if MovServicoNotaI_COD_SER.IsNull or MovServicoNotaN_QTD_SER.IsNull or
     MovServicoNotaN_VLR_SER.IsNull then
    if GServicos.Focused then
      abort
    else
    begin
      MovServicoNota.Cancel;
      abort;
    end;
end;

{*************** depois do insert ******************************************* }
procedure TFNovaNotaFiscal.MovServicoNotaBeforeInsert(DataSet: TDataSet);
begin
  // verifica se o nro de linha ja cadastrada naum superam o detereminado
  if (NroLinhaServico <= nf.ContaLinhasTabela(MovServicoNota)) and (not VprOrcamento) then
   abort;
  if self.visible then
    ActiveControl := GServicos;
  GServicos.SelectedIndex := 0;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                             Diveros
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{**************************Calcula o valor da nota*****************************}
procedure TFNovaNotaFiscal.CalculaNota;
var
  icms, ipi, TotalProduto, TotalNota, ICMSProdutos, ReducaoBase : double;
  Emitente : Boolean;
begin

  if cadNotasFiscais.State in [ dsEdit, dsInsert ] then
  begin

    if CalcularNota then
    begin
      Emitente := false;
      if cadNotasFiscaisI_TIP_FRE.AsInteger = 1 then
        Emitente := true;

      icms := 0;
      TotalProduto := 0;
      TotalNota := 0;
      Ipi := 0;

        NF.CalculaNota( cadNotasFiscaisN_VLR_PER.AsFloat, cadNotasFiscaisN_VLR_FRE.AsFloat,
                        cadNotasFiscaisN_VLR_SEG.AsFloat, cadNotasFiscaisN_OUT_DES.AsFloat,
                        ICMSPadrao, cadNotasFiscaisN_TOT_SER.AsCurrency,
                        cadNotasFiscaisI_SEQ_NOT.AsInteger, Emitente, CadNatureza.fieldByname('C_SOM_IPI').AsString = 'S',
                        icms,ICMSProdutos, ipi,totalProduto,TotalNota,cadNotasFiscaisC_DES_ACR.AsString,
                        cadNotasFiscaisC_VLR_PER.AsString );

        CadNotasFiscaisN_VLR_ICM.Value := icms;

        CadNotasFiscaisN_TOT_PRO.Value := TotalProduto;

        CadNotasFiscaisN_TOT_NOT.Value := TotalNota;

        if cadNotasFiscaisN_TOT_PRO.AsCurrency <> 0 then
        begin
          if CadNatureza.FieldByName('c_som_ipi').AsString = 'N' then
            CadNotasFiscaisN_BAS_CAL.Value := TotalNota - ipi - cadNotasFiscaisN_TOT_SER.AsCurrency
          else
            CadNotasFiscaisN_BAS_CAL.Value := TotalNota - cadNotasFiscaisN_TOT_SER.AsCurrency;
        end
        else
          if cadNotasFiscaisI_TIP_FRE.AsInteger = 1 then
            CadNotasFiscaisN_BAS_CAL.Value := cadNotasFiscaisN_VLR_FRE.AsCurrency
          else
            CadNotasFiscaisN_BAS_CAL.Value := 0;

        if  (ICMSProdutos = 0) then
          CadNotasFiscaisN_BAS_CAL.Value := CadNotasFiscaisN_BAS_CAL.Value - CadNotasFiscaisN_TOT_PRO.Value;

         // caso reenbolso
         if (TipFrm = 'S') and (cadNotasFiscaisI_TIP_FRE.AsInteger = 2) then
           CadNotasFiscaisN_TOT_NOT.Value := CadNotasFiscaisN_TOT_NOT.Value + cadNotasFiscaisN_VLR_FRE.AsCurrency;

        CadNotasFiscaisN_TOT_IPI.Value := ipi;

        // reducao da base de calculo
        if CadProdutos.Active then
        begin
          if (CadProdutos.FieldByname('I_COD_RED').AsInteger <> 0)  then
             CalculoReducao := true;

          if (CalculoReducao) and (cadNotasFiscaisN_BAS_CAL.AsCurrency <> 0) then
          begin
             ReducaoBase := 0;
             if (CadClientes.FieldByname('C_TIP_PES').AsString = 'F') or (CadNatureza.FieldByName('C_ICM_EST').AsString = 'S') then
                cadNotasFiscaisN_BAS_CAL.AsCurrency := cadNotasFiscaisN_BAS_CAL.AsCurrency - nf.BuscaReducao(varia.EstadoPadrao,CadProdutos.FieldByname('I_COD_RED').AsInteger,cadNotasFiscaisI_SEQ_NOT.AsInteger,ReducaoBase, CadNatureza.fieldByname('C_SOM_IPI').AsString = 'S')
             else
                cadNotasFiscaisN_BAS_CAL.AsCurrency := cadNotasFiscaisN_BAS_CAL.AsCurrency - nf.BuscaReducao(cadClientes.FieldByName('c_est_cli').AsString,CadProdutos.FieldByname('I_COD_RED').AsInteger,cadNotasFiscaisI_SEQ_NOT.AsInteger,ReducaoBase, CadNatureza.fieldByname('C_SOM_IPI').AsString = 'S');
             cadNotasFiscaisn_vlr_icm.AsCurrency := cadNotasFiscaisn_vlr_icm.AsCurrency - ReducaoBase;
          end;
        end;
     end;
  end;
end;

procedure TFNovaNotaFiscal.CalculaServico;
var
  ISSQN, ValorServico : Double;
begin
  NF.CalculaServico(ISSQN, ValorServico, cadNotasFiscaisI_SEQ_NOT.AsInteger);
  cadNotasFiscaisN_VLR_ISQ.AsCurrency := ISSQN;
  cadNotasFiscaisN_TOT_SER.AsCurrency := ValorServico;
end;

{************ configura a fatura e campos tipo, ipi, valor ipi, servico ****** }
procedure TFNovaNotaFiscal.ConfiguraItemNota( NroDoc : Integer);
begin
  UnImp.LocalizaCab(aux, NroDoc);  // abre cabecalho do documento
  if not aux.eof then
  begin
    grade.Columns[9].Visible := true;
    grade.Columns[10].Visible := true;
    grade.Columns[0].Width := 81;
    grade.Columns[1].Width := 197;
    grade.Columns[5].Width := 56;
    grade.Columns[7].Width := 98;
    ImpVen := Aux.FieldByName('n_mar_esq').AsInteger;
    ImpPag := Aux.FieldByName('n_mar_sup').AsInteger;
    ImpPed := Aux.FieldByName('n_mar_inf').AsInteger;

    // configura serviços
    if Aux.FieldByName('c_tip_doc').AsString = 'NFP' then
    begin
      PServico.Visible := false;
      EPercServ.Visible := false;
    end
    else
    begin
      PServico.Visible := true;
      EPercServ.Visible := true;
    end;

    nf.ConfiguraFatura(GRADEPAR, Aux.FieldByName('i_qtd_col').AsInteger, Aux.FieldByName('i_tam_bar').AsInteger, label30);
    NroLinhaProdutos := Aux.FieldByName('i_qtd_lin').AsInteger;
    NroLinhaServico := Aux.FieldByName('i_qtd_ser').AsInteger;
    NroLinhaFatura := Aux.FieldByName('i_qtd_fat').AsInteger;
    NroConjuntoFatura := Aux.FieldByName('i_qtd_col').AsInteger;
    Tipo_HOR_VER_Fat := Aux.FieldByName('i_tam_bar').AsInteger;

    GRADEPAR.RowCount := NroLinhaFatura;

    // caso faturas vertical
    if Tipo_HOR_VER_Fat = 1 then
    begin
      Label30.Visible := false;
      Shape23.Height := 1;
      Panel2.Top := Panel2.Top - 11;
      Panel2.Height := Panel2.Height + 11;
    end;

    if NroLinhaFatura > 1 then   // configura a rolagem da grade de parcelas
      GRADEPAR.ScrollBars := ssVertical
    else
      GRADEPAR.ScrollBars := ssNone;

    UnImp.LocalizaUmItem(aux, Nrodoc, 48);  // Tamanho de Linha
    TamanhoClaFis := Aux.FieldByName('i_tam_cam').AsInteger;

    UnImp.LocalizaUmItem(aux, Nrodoc, 74);  // Tamanho de Linha
    NroCaracterObs := Aux.FieldByName('i_tam_cam').AsInteger;

    UnImp.LocalizaUmItem(aux, Nrodoc, 75);  // Quantidade de caracteres da descrição dos serviços.
    NroCaracterServ := Aux.FieldByName('i_tam_cam').AsInteger;

    UnImp.LocalizaUmItem(aux, Nrodoc, 59);  // valor do ipi
    if aux.FieldByName('c_fla_imp').AsString = 'N' then
      grade.Columns[10].Visible := false;  // caso o campo valor do ipi esteja invisivel

    UnImp.LocalizaUmItem(aux, Nrodoc, 58);  // percentual de ipi
    if aux.FieldByName('c_fla_imp').AsString = 'N' then
      grade.Columns[9].Visible := false;

    if not grade.Columns[10].Visible then  // caso o campo valor do ipi esteja invisivel
    begin
      grade.Columns[0].Width := grade.Columns[0].Width + 15;
      grade.Columns[1].Width := grade.Columns[1].Width + 21;
      grade.Columns[7].Width := grade.Columns[7].Width + 15;
    end;

    if not grade.Columns[9].Visible then // caso o ipi esteja invisivel
    begin
      grade.Columns[0].Width := grade.Columns[0].Width + 4;
      grade.Columns[5].Width := grade.Columns[5].Width + 15;
      grade.Columns[7].Width := grade.Columns[7].Width + 15;
    end;
   end
   else
     aviso('A Configuração de sistema não possui uma nota fiscal válida para este equipamento');

end;

{*********** muda o foco ***************************************************** }
procedure TFNovaNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    115 : begin
          if Grade.Focused then
          begin
            if (MovNotasFiscaisC_COD_Pro.IsNull) then
              MovNotasFiscais.Cancel;
            if Pservico.Visible then
            begin
              GServicos.SetFocus;
               FundoNota.VertScrollBar.Position := 165;
            end
            else
            begin
              FundoNota.VertScrollBar.Position := 380;
              DBEditColor8.SetFocus;
            end
          end
          else
            if PossuiFoco(Panel4) then
            begin
              DelCliente.SetFocus;
              FundoNota.VertScrollBar.Position := 0;
            end
            else
            if GServicos.Focused then
            begin
              DBEditColor8.SetFocus;
              FundoNota.VertScrollBar.Position := 380;
            end
            else
            begin
              Grade.SetFocus;
              FundoNota.VertScrollBar.Position := 0;
            end;
          end;
    117 : if BotaoGravar1.Enabled then BotaoGravar1.Click;
  end;
end;

{*************** modifica os botoes conforme acao da nota fiscal ************* }
Procedure TFNovaNotaFiscal.EstadoBotoes(Estado : Boolean);
begin
   BObservacao.Enabled := Estado;
   BImprimir.Enabled := not Estado;
   BImprimirRomanrio.Enabled := not Estado;
   BtbImprimeBoleto.Enabled := Not Estado;
   BParcelas.Enabled := not Estado;
   BotaoCancelar1.Enabled := Estado;
   BFechar.Enabled := not Estado;
   BotaoCadastrar1.Enabled := not estado;
   DataMovNotasFiscais.AutoEdit := Estado;
   DataCadNotasFiscais.AutoEdit := Estado;
   DataMovServicoNota.AutoEdit := Estado;
   BtbImprimeBoleto.Enabled := not Estado;
end;

{***************************Limpa o StringGrig*********************************}
procedure TFNovaNotaFiscal.LimpaStringGrid;
var
   x,y : Integer;
begin
// zera o stringGrid
for y := 0 to 5 do
  for x := 0 to 20 do
     gradepar.Cells[x,y] := '';
end;

{***************** limpa campos da nota fiscal ***************************** }
procedure TFNovaNotaFiscal.LimpaNota;
begin
  CalculoReducao := false;
  DelCliente.Atualiza;
  DelNatureza.Atualiza;
  ECoDVendedor.Atualiza;
  DBEditLocaliza4.Atualiza;
  CadClientes.close;
  CadTransportadora.close;
  LimpaStringGrid;
  label74.Caption := '';
  EPercPro.AValor := 0;
  EPercServ.AValor := 0;
  DBEditColor10.Enabled := true;
  EClaFiscal.Clear;
  MovServicoNota.close;
end;

procedure TFNovaNotaFiscal.MontaObservacao(TextoUsuario : String);
begin
  MObservacoes.clear;
  MAdicional.clear;
  LinhaObsDesAcr := 999;

  // descontos e acrescimos
  MontaObsDesAcr;

  // caso seja de cupom fiacal
  if TextoCupom <> '' then
    MObservacoes.Lines.add(TextoCupom);

   // caso tenha reducao
  if ComReducao then
    MObservacoes.Lines.add(TextoReducao);

  // texto fiscal conforme naturesas
  if CadNatureza.fieldByName('L_TEX_FIS').AsString <> '' then
    MObservacoes.Lines.add(CadNatureza.fieldByName('L_TEX_FIS').AsString);

  // daddos adionais
  if TextoAdicional <> '' then
    MAdicional.Lines.add(TextoAdicional);

  // observacao digitada pelo usuario
  if TextoUsuario <> '' then
   MObservacoes.Lines.add(TextoUsuario);

  aux.close;

    if MObservacoes.Lines.Strings[MObservacoes.Lines.Count - 1] = '' then
      MObservacoes.Lines.Delete(MObservacoes.Lines.Count - 1);
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          baixas da nota
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{********************Carrega o Titulos do grid de Parcelas*********************}
procedure TFNovaNotaFiscal.MontaPArcelasCR( SeqNota : Integer );
var
   laco,x,y : Integer;
begin
  LimpaStringGrid;

  x := 0;
  y := 0;

  aux.close;
  Aux.RequestLive := False;
  nf.LocalizaCRNotaFiscal(aux,SeqNota,Varia.CodigoEMpFil);
  LancamentoReceber := aux.fieldByName('I_LAN_REC').AsInteger;

  aux.First;
  for laco := 0 to  aux.RecordCount - 1 do
  begin
    if Tipo_HOR_VER_Fat <> 1 then
    begin
      gradepar.Cells[x,y] := aux.fieldByName('C_NRO_DUP').AsString;
      if aux.fieldByName('C_FLA_TIP').AsString = 'S' then
        gradepar.Cells[x+1,y] := 'Reembolso'
      else
        gradepar.Cells[x+1,y] := aux.fieldByName('D_DAT_VEN').AsString;
      gradepar.Cells[x+2,y] := FormatFloat(Varia.MascaraMoeda, aux.fieldByName('N_VLR_PAR').AsFloat);
      inc(y);
      aux.Next;
      if y >= NroLinhaFatura  then
      begin
        y := 0;
        inc(x,3);
        if (x  + 1) > (NroConjuntoFatura * 3) then
         Break;
      end;
    end
    else
    begin
      gradepar.Cells[x+1,y] := aux.fieldByName('C_NRO_DUP').AsString;
      gradepar.Cells[x+1,y+1] := aux.fieldByName('D_DAT_VEN').AsString;
      gradepar.Cells[x+1,y+2] := FormatFloat(Varia.MascaraMoeda, aux.fieldByName('N_VLR_PAR').AsFloat);
      inc(x);
      aux.Next;
    end;
  end;

  // faturas vertical
  if Tipo_HOR_VER_Fat = 1 then
  begin
    gradepar.Cells[0,0] := 'Duplicata';
    gradepar.Cells[0,1] := 'Vencimento';
    gradepar.Cells[0,2] := 'Valor';
  end;
  aux.close;
end;

function TFNovaNotaFiscal.BaixaNota : Boolean;
var
  Dado : TDadosNovaContaCR;
  VpfValorNota, ValorTotal, Troco : Double;
  unidade : string;
  ValorPro : TstringList;
  PercPro : TstringList;
  LancamentoCR, FormaPgto, laco : integer;
  ECF : TECF;
begin

  result := true;

  try

    NF.LocalizaFormaPagamento(Aux,CodFrmPgto);

    if CodVenCli <> cadNotasFiscaisI_COD_VEN.AsInteger then
      nf.AdicionaVendedor(cadNotasFiscaisI_COD_VEN.AsInteger, cadNotasFiscaisI_COD_CLI.AsInteger);

     // verifica aciona gaveta
    if (varia.UsarGaveta = 'S') and (aux.fieldByname('C_ACI_GAV').AsString = 'S') then
    begin
      ECF := TECF.criar(nil, FPrincipal.BaseDados);
      if ecf.AbrePorta then
      begin
        ECF.AcionaGaveta;
        ECF.FecharPorta;
      end
      else
         aviso(CT_ImpressoraFiscalFechada);
         MAdicional.SetFocus; // para voltar
      Ecf.Free;
    end;

    if (ConfigModulos.ContasAReceber) or (ConfigModulos.Comissao) or (ConfigModulos.caixa) then
    begin
      Tempo.execute('Criando parcelas do contas a receber ... ');

      // verifica se o desconto esta na condicao de pagto, par naum duplicar os desc ou acre
      // se  EDescAcr.Enabled = true descontlo na nota false na condicao
      if EDescAcr.Enabled then
        VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency
      else
        VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency - EDescAcr.Field.AsCurrency;

      // baixa o contas a receber
      if CadNatureza.FieldByName('C_GER_FIN').AsString = 'S' then
      begin
          Dado := TDadosNovaContaCR.Create;
          Dado.CodEmpFil := Varia.CodigoEmpFil;
          Dado.NroNota := cadNotasFiscais.FieldByName('I_NRO_NOT').AsInteger;
          Dado.SeqNota := cadNotasFiscais.FieldByName('I_SEQ_NOT').AsInteger;
          Dado.CodCondicaoPgto := cadNotasFiscais.FieldByName('I_COD_PAG').AsInteger;
          Dado.CodCliente := cadNotasFiscais.FieldByName('I_COD_CLI').AsInteger;
          Dado.CodFrmPagto := CodFrmPgto;
          Dado.CodMoeda :=  varia.MoedaBase;
          Dado.CodUsuario := varia.CodigoUsuario;
          Dado.DataMov := date;
          Dado.DataEmissao := date;
          Dado.PlanoConta := CadNatureza.FieldByName('C_CLA_PLA').AsString;
          Dado.ValorTotal := VpfValorNota;
          Dado.PercentualDescAcr := 0;
          Dado.VerificarCaixa := true;
          Dado.BaixaConta := true;
          Dado.DataBaixa := date;
          Dado.MostrarParcelas := false;
          Dado.MostrarTelaCaixa := true;
          Dado.perDescontoDoCliente := cadClientes.fieldByName('N_DES_BOL').ascurrency;
          Dado.TipoFrmPAgto :=  aux.fieldByname('C_FLA_TIP').AsString;
          Dado.GerarComissao := CadNatureza.FieldByName('C_GER_COM').AsString = 'S';

          // comissao
          if ECoDVendedor.Text <> '' then
          begin
            Dado.CodVendedor := StrToInt(ECoDVendedor.Text);
            Dado.TipoComissao := nf.TipoComissao(Dado.CodVendedor); // somente direta
            Dado.PercComissaoPro := EPercPro.AValor;
            if Dado.TipoComissao = 0 then // direta
            begin
               Dado.ValorPro :=  nil;
               Dado.PercPro :=  nil;
               Dado.ValorComPro := ValorCalcularComissao;// nf.ValorComissaoCFGProduto( cadNotasFiscaisN_TOT_NOT.AsCurrency,
                                                         //      cadNotasFiscaisN_TOT_PRO.AsCurrency,
                                                         //      cadNotasFiscaisN_VLR_ICM.AsCurrency, 0,0 );
               Dado.PercComissaoServ := EPercServ.AValor;
               Dado.ValorComServ := nf.ValorComissaoCFGServico( cadNotasFiscaisN_TOT_SER.AsCurrency,
                                                                cadNotasFiscaisN_VLR_ISQ.AsCurrency);
            end
            else
            begin  // caso produtos
               ValorPro := TstringList.create;
               PercPro := TstringList.create;
               NF.ListaDeValorPercProduto(ValorPro, PercPro, cadNotasFiscais.FieldByName('I_SEQ_NOT').AsInteger );
               Dado.ValorPro := ValorPro;
               Dado.PercPro := PercPro;
            end;
          end
          else
          begin
            Dado.CodVendedor := 0;
            Dado.PercComissaoPro := 0;
            Dado.ValorComPro := 0;
            Dado.ValorPro :=  nil;
            Dado.PercPro :=  nil;
          end;
          LancamentoCR := UnCR.CriaContaReceber( dado, ValorTotal,  Troco, FormaPgto, false );
          Dado.free;
          if LancamentoCR = 0 then
            result := false;
          MontaPArcelasCR(cadNotasFiscaisI_SEQ_NOT.AsInteger);
      end;
    end;


      // baixa em estoque
      if ConfigModulos.Estoque then
      begin
        if CadNatureza.FieldByName('C_BAI_EST').AsString = 'S' then
        begin
          Tempo.execute('Atualizando Estoque Produto...');
          MovNotasFiscais.DisableControls;
          MovNotasFiscais.First;
          while not MovNotasFiscais.Eof do
          begin
            Unidade := UnProdutos.UnidadePadrao( MovNotasFiscaisI_SEQ_PRO.AsInteger);
            UnProdutos.BaixaProdutoEstoque( MovNotasFiscaisI_SEQ_PRO.AsInteger,
                                            CadNatureza.fieldByName('I_COD_OPE').AsInteger,
                                            MovNotasFiscaisI_SEQ_NOT.AsInteger,
                                            cadNotasFiscaisI_NRO_NOT.AsInteger,
                                            varia.MoedaBase, 0, cadNotasFiscaisD_DAT_EMI.AsDateTime,
                                            MovNotasFiscaisN_QTD_PRO.AsFloat,
                                            MovNotasFiscaisN_TOT_PRO.AsFloat,
                                            MovNotasFiscaisC_COD_UNI.AsString,
                                            unidade);
             MovNotasFiscais.Next;
          end;
          MovNotasFiscais.EnableControls;
        end;
      end;
      Tempo.fecha;
      DesmarcaTransacao(1);
    except
      on E : Exception do
      begin
        erro('A Nota não foi gerada.'+ ' '+E.Message);
        BotaoCancelar1Click(BotaoCancelar1);
      end;
    end;

  // imprime a nota fiscal automaticamente
  if CadNatureza.FieldByName('C_IMP_AUT').AsString = 'S' then
     BImprimir.Click;
end;


{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          IMPRESSÃO DA NOTA FISCAL.
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

procedure TFNovaNotaFiscal.ImprimeNotaFical;
var
  DadosFiscal: TDadosFiscal;
  I: Integer;
  Desc, DescValores: string;
  Imprimir : Boolean;
begin
  Imprimir := true;
  if cadNotasFiscaisC_NOT_IMP.AsString = 'S' then
    if not ConfirmacaoFormato(CT_NotaJaImpressa, [ cadNotasFiscaisI_NRO_NOT.Asinteger])  then
      Imprimir := false;

  if Imprimir then
  begin
    UnIMP.InicializaImpressao(Varia.NotaFiscalPadrao, UnIMP.RetornaImpressoraPadrao(Varia.NotaFiscalPadrao));
    DadosFiscal := TDadosFiscal.Create;
    with DadosFiscal do
    begin
      // COLUNAS DE PRODUTOS //
      MovNotasFiscais.DisableControls;
      MovNotasFiscais.First;
      Produto_Codigo := TStringList.Create;
      Produto_Descricao := TStringList.Create;
      Produto_CL_Fisc := TStringList.Create;
      Produto_Sit_Tributaria := TStringList.Create;
      Produto_Unidade := TStringList.Create;
      Produto_Quantidade := TStringList.Create;
      Produto_Valor_Unitario := TStringList.Create;
      Produto_Valor_Total := TStringList.Create;
      Produto_ICMS := TStringList.Create;
      Produto_IPI := TStringList.Create;
      Produto_Valor_IPI := TStringList.Create;
      Cabecalho_Nota := TStringList.Create;
      while not MovNotasFiscais.EOF do
      begin
        // Adicionas os registros nos strings.
        if config.UsarModoCaixa then
          if MovNotasFiscaisI_QTD_CAI.AsString <> '' then
            Produto_Codigo.Add(MovNotasFiscaisI_QTD_CAI.AsString + ' ' + MovNotasFiscaisC_UNI_VEN.AsString)
          else
            Produto_Codigo.Add('')
        else
          Produto_Codigo.Add(MovNotasFiscaisC_COD_PRO.AsString);
        Produto_Descricao.Add(MovNotasFiscaisNomeProduto.AsString);
        Produto_CL_Fisc.Add(MovNotasFiscaisI_ORD_FIS.AsString);
        Produto_Sit_Tributaria.Add(MovNotasFiscaisC_COD_CST.AsString);
        Produto_Unidade.Add(MovNotasFiscaisC_COD_UNI.AsString);
        if config.MostraCasaDecimalQTD then
           Produto_Quantidade.Add(FormatFloat(Varia.MascaraQtd, MovNotasFiscaisN_QTD_PRO.AsFloat))
        else
           Produto_Quantidade.Add(FloatToStr(MovNotasFiscaisN_QTD_PRO.AsFloat));
        Produto_Valor_Unitario.Add(FormatFloat(varia.MascaraValorUnitario, MovNotasFiscaisN_VLR_PRO.AsFloat));
        Produto_Valor_Total.Add(FormatFloat(varia.MascaraValor, MovNotasFiscaisN_TOT_PRO.AsFloat));
        Produto_ICMS.Add(MovNotasFiscaisN_PER_ICM.AsString);
        Produto_IPI.Add(MovNotasFiscaisN_PER_IPI.AsString);
        Produto_Valor_IPI.Add(FormatFloat(varia.MascaraValor,MovNotasFiscaisn_vlr_ipi.AsFloat));
        MovNotasFiscais.Next;
      end;

      MovNotasFiscais.DisableControls;

      // COLUNAS DE FATURAS //
      Fatura_Numero1 := TStringList.Create;
      Fatura_Vencimento1 := TStringList.Create;
      Fatura_Valor1 := TStringList.Create;
      Fatura_Numero2 := TStringList.Create;
      Fatura_Vencimento2 := TStringList.Create;
      Fatura_Valor2 := TStringList.Create;
      Fatura_Numero3 := TStringList.Create;
      Fatura_Vencimento3 := TStringList.Create;
      Fatura_Valor3 := TStringList.Create;
      Fatura_Numero4 := TStringList.Create;
      Fatura_Vencimento4 := TStringList.Create;
      Fatura_Valor4 := TStringList.Create;
      Fatura_Numero5 := TStringList.Create;
      Fatura_Vencimento5 := TStringList.Create;
      Fatura_Valor5 := TStringList.Create;
      Fatura_Numero6 := TStringList.Create;
      Fatura_Vencimento6 := TStringList.Create;
      Fatura_Valor6 := TStringList.Create;

      if Tipo_HOR_VER_Fat <> 1 then
      begin
        for I := 0 to  Gradepar.RowCount do
        begin
           // Coluna, Linha.
          Fatura_Numero1.Add(gradepar.Cells[0,I]);
          Fatura_Vencimento1.Add(gradepar.Cells[1,I]);
          Fatura_Valor1.Add(gradepar.Cells[2,I]);
          Fatura_Numero2.Add(gradepar.Cells[3,I]);
          Fatura_Vencimento2.Add(gradepar.Cells[4,I]);
          Fatura_Valor2.Add(gradepar.Cells[5,I]);
          Fatura_Numero3.Add(gradepar.Cells[6,I]);
          Fatura_Vencimento3.Add(gradepar.Cells[7,I]);
          Fatura_Valor3.Add(gradepar.Cells[8,I]);
          Fatura_Numero4.Add(gradepar.Cells[9,I]);
          Fatura_Vencimento4.Add(gradepar.Cells[10,I]);
          Fatura_Valor4.Add(gradepar.Cells[11,I]);
          Fatura_Numero5.Add(gradepar.Cells[12,I]);
          Fatura_Vencimento5.Add(gradepar.Cells[13,I]);
          Fatura_Valor5.Add(gradepar.Cells[14,I]);
          Fatura_Numero6.Add(gradepar.Cells[15,I]);
          Fatura_Vencimento6.Add(gradepar.Cells[16,I]);
          Fatura_Valor6.Add(gradepar.Cells[17,I]);
        end;
      end
      else
      begin
         // Coluna, Linha.
        Fatura_Numero1.Add(gradepar.Cells[1,0]);
        Fatura_Vencimento1.Add(gradepar.Cells[1,1]);
        Fatura_Valor1.Add(gradepar.Cells[1,2]);
        Fatura_Numero2.Add(gradepar.Cells[2,0]);
        Fatura_Vencimento2.Add(gradepar.Cells[2,1]);
        Fatura_Valor2.Add(gradepar.Cells[2,2]);
        Fatura_Numero3.Add(gradepar.Cells[3,0]);
        Fatura_Vencimento3.Add(gradepar.Cells[3,1]);
        Fatura_Valor3.Add(gradepar.Cells[3,2]);
        Fatura_Numero4.Add(gradepar.Cells[4,0]);
        Fatura_Vencimento4.Add(gradepar.Cells[4,1]);
        Fatura_Valor4.Add(gradepar.Cells[4,2]);
        Fatura_Numero5.Add(gradepar.Cells[5,0]);
        Fatura_Vencimento5.Add(gradepar.Cells[5,1]);
        Fatura_Valor5.Add(gradepar.Cells[5,2]);
        Fatura_Numero6.Add(gradepar.Cells[6,0]);
        Fatura_Vencimento6.Add(gradepar.Cells[6,1]);
        Fatura_Valor6.Add(gradepar.Cells[6,2]);
     end;

      // DADOS ADICIONAIS //
      Dados_Adicionais := TStringList.Create;
      Dados_Adicionais.Text := MAdicional.Lines.Text;

      // SERVIÇOS //
      Codigo_Servico := TStringList.Create;
      Servicos_Descricao := TStringList.Create;
      Unidade_servico := TStringList.Create;
      Quantidade_Servico := TStringList.Create;
      Valor_Servico := TStringList.Create;
      Valor_Total_servico := TStringList.Create;
      if MovServicoNota.Active then
      begin
        MovServicoNota.DisableControls;
        MovServicoNota.First;
        while (not MovServicoNota.EOF) do
        begin
          Codigo_Servico.add(MovServicoNotaI_COD_SER.AsString);
          Servicos_Descricao.add(MovServicoNotaNomeServico.AsString);
          Unidade_servico.add(varia.UnidadeUN);
          Quantidade_Servico.add(FormatFloat('###,##0.00 h', MovServicoNotaN_QTD_SER.AsFloat));
          Valor_Servico.add(FormatFloat(varia.MascaraValor, MovServicoNotaN_VLR_SER.AsFloat));
          Valor_Total_servico.add(FormatFloat(varia.MascaraValor, MovServicoNotaN_TOT_SER.AsFloat));
          MovServicoNota.Next;
        end;
        MovServicoNota.EnableControls;
      end;

      // OBSERVAÇÃO //
      Obs_Itens := TStringList.Create;
      Obs_Itens.Text := MObservacoes.Lines.Text;

      // DADOS GERAIS DA NOTA //
      if RTipoNota.ItemIndex = 0 then
      begin
        XEntrada:= ''; // Saída.
        XSaida:= 'X';
      end
      else
      begin
        XEntrada:= 'X'; // Entrada.
        XSaida:= '';
      end;
      Numero_Nota := AdicionaCharE('0',CadNotasFiscaisI_NRO_NOT.AsString, 6);
      Numero_Nota_Rodape := AdicionaCharE('0',CadNotasFiscaisI_NRO_NOT.AsString,6);
      Natureza_Operacao := Label26.Caption;
      CFOP  := CadNatureza.fieldByname('C_NAT_IMP').AsString;
      IE_Tributaria  := '';
      Razao_Social  := CadClientes.FieldByName('C_NOM_CLI').AsString;
      Nome_Valor_rodape := FormatFloat(varia.MascaraValor, CadNotasFiscaisN_TOT_NOT.AsFloat) + ' - ' + CadClientes.FieldByName('C_NOM_CLI').AsString;
      if trim(cadClientes.FieldByName('C_TIP_Pes').AsString) = 'J' then
        CGC_CPF := CadClientes.FieldByName('C_CGC_CLI').AsString
      else
        CGC_CPF := CadClientes.FieldByName('C_CPF_CLI').AsString;
      Data_Emissao := CadNotasFiscaisD_DAT_EMI.AsDateTime;
      Endereco := CadClientes.FieldByName('C_END_CLI').AsString + ', ' + CadClientes.FieldByName('I_NUM_END').AsString + '-' +CadClientes.FieldByName('C_COM_END').AsString;
      Bairro := CadClientes.FieldByName('C_BAI_CLI').AsString;
      CEP := CadClientes.FieldByName('C_CEP_CLI').AsString;
      Data_Saida_Entrada := CadNotasFiscaisD_DAT_SAI.AsDateTime;
      Municipio := CadClientes.FieldByName('C_CID_CLI').AsString;
      Fone_FAX := CadClientes.FieldByName('C_FO1_CLI').AsString + '/' + CadClientes.FieldByName('C_FON_FAX').AsString;
      UF := CadClientes.FieldByName('C_EST_CLI').AsString;
      IE := CadClientes.FieldByName('C_INS_CLI').AsString;
      PracaPagamento := cadNotasFiscaisC_PRA_PAG.AsString;
      Endereco_Pagamento := cadNotasFiscaisC_END_COB.AsString;
      Hora_Saida := CadNotasFiscaisT_HOR_SAI.AsString;
      Base_Calculo_ICMS := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_BAS_CAL.AsFloat);
      Valor_ICMS := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_VLR_ICM.AsFloat);
      Base_Calculo_ICMS_Sub := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_BAS_SUB.AsFloat);
      Valor_ICMS_Sub := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_VLR_SUB.AsFloat);
      Valor_Total_Produtos := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_TOT_PRO.AsFloat);
      Valor_Frete := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_VLR_FRE.AsFloat);
      Valor_Seguro := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_VLR_SEG.AsFloat);
      Outras_Despesas := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_OUT_DES.AsFloat);
      Valor_Total_IPI := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_TOT_IPI.AsFloat);
      Valor_Total_Nota := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_TOT_NOT.AsFloat);
      Valor_ISSQN := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_VLR_ISQ.AsFloat);
      Valor_Total_servicos := FormatFloat(varia.MascaraValor,CadNotasFiscaisN_TOT_SER.AsFloat);
      if CadTransportadora.Active then
      begin
        Nome_Transportadora := CadTransportadora.FieldByName('C_NOM_TRA').AsString;
        CGCCPF_Transportadora := CadTransportadora.FieldByName('C_CGC_TRA').AsString;
        Endereco_Transportadora := CadTransportadora.FieldByName('C_END_TRA').AsString;
        Municipio_Transportadora := CadTransportadora.FieldByName('C_CID_TRA').AsString;
        UF_Endereco_Transportadora := CadTransportadora.FieldByName('C_EST_TRA').AsString;
        IE_Transportadora := CadTransportadora.FieldByName('C_INS_TRA').AsString;
      end
      else
      begin
        Nome_Transportadora := '';
        CGCCPF_Transportadora := '';
        Endereco_Transportadora := '';
        Municipio_Transportadora := '';
        UF_Endereco_Transportadora := '';
        IE_Transportadora := '';
      end;
      Frete_Por_Conta := CadNotasFiscaisI_TIP_FRE.AsString;
      Placa_Veiculo := CadNotasFiscaisC_NRO_PLA.AsString;
      UF_Trasportadora := CadNotasFiscaisC_EST_PLA.AsString;
      Quantidade := CadNotasFiscaisI_QTD_VOL.AsString;
      Especie := CadNotasFiscaisC_TIP_EMB.AsString;
      Marca := CadNotasFiscaisC_MAR_PRO.AsString;
      Numero := CadNotasFiscaisC_NRO_PAC.AsString;
      if CadNotasFiscaisN_PES_BRU.AsFloat <> 0 then
        Peso_Bruto := FloatToStr(CadNotasFiscaisN_PES_BRU.AsFloat)
      else
        Peso_Bruto := '';

      if CadNotasFiscaisN_PES_LIQ.AsFloat <> 0 then
        Peso_Liquido := FloatToStr(CadNotasFiscaisN_PES_LIQ.AsFloat)
      else
        Peso_Liquido := '';

      if ImpPed = 1 then
        NroPedido := ' Nro pedido : ' + cadNotasFiscaisC_NRO_PED.AsString
      else
        NroPedido := cadNotasFiscaisC_NRO_PED.AsString;
      if ImpPag = 1 then
        Condicao_Pagamento := 'Cond. pgto : ' + Label74.Caption
      else
        Condicao_Pagamento := Label74.Caption;
      if ImpVen = 1 then
        Vendedor := 'Vendedor : ' + Label71.Caption
      else
        Vendedor := Label71.Caption;
      Classif_Fiscal := EClaFiscal.Text;
      CGC_Empresa := Label52.Caption;
      Insc_est_Empresa :=  label70.Caption;
      Cabecalho_Nota.Text := TextoCabecalho;

      UnIMP.ImprimeNotaFiscal(DadosFiscal);
      UnIMP.FechaImpressao(Config.ImpPorta, 'C:\IMP.TXT');
      if not (cadNotasFiscais.State in [ dsInsert, dsEdit ]) then
        cadNotasFiscais.Edit;
      cadNotasFiscaisC_NOT_IMP.AsString := 'S';
      cadNotasFiscais.Post;
    end;
  end;
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       Eventos da consulta da nota fiscal
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }
{*********** carreta os dados da consulta da nota fiscal **********************}
function TFNovaNotaFiscal.CarregaNotaConsulta( SeqNota : integer) :Boolean;
begin
  ConfiguraItemNota(Varia.NotaFiscalPadrao);
  nf.LocalizaCadNotaFiscal(cadNotasFiscais, SeqNota, varia.CodigoEmpFil);
  if cadNotasFiscaisC_FLA_ECF.AsString = 'S' then
    result := false
  else
  begin
    AdicionaSqlAbreTabela(Produtos,'Select * from CadProdutos Pro, MovnotasFiscais mov ' +
                                  ' Where Mov.I_Seq_Not = '+ InttoStr(SeqNota) +
                                  ' and Mov.I_Emp_Fil = ' + IntTostr(Varia.CodigoEmpfil) +
                                  ' and mov.i_seq_pro is not null ' +
                                  ' and Mov.I_Seq_Pro = Pro.I_Seq_Pro ');
    nf.LocalizaMovNotaFiscal(MovNotasFiscais, seqNota);
    nf.LocalizaCliente(cadClientes, cadNotasFiscaisI_COD_CLI.AsInteger);
    NF.LocalizaCadNatureza(CadNatureza, cadNotasFiscaisC_COD_NAT.AsString);
    label26.Caption := CadNatureza.fieldbyName('C_DES_NOT').AsString;
    nf.LocalizaTransportadora(CadTransportadora, cadNotasFiscaisI_COD_TRA.AsInteger);
    if GServicos.Visible then
     nf.LocalizaMovServicoNota(MovServicoNota, SeqNota);
    EstadoBotoes(false);
    BotaoCadastrar1.Enabled := false;
    label74.Caption := nf.RetornaCondPagamento(cadNotasFiscaisI_COD_PAG.AsInteger);
    DataMovNotasFiscais.AutoEdit := false;
    DataCadNotasFiscais.AutoEdit := false;
    Grade.ReadOnly := true;
    GServicos.ReadOnly := true;
    ECoDVendedor.Atualiza;
    DelCliente.atualiza;
    DBEditLocaliza4.atualiza;
    Econdicoes.Enabled := false;
    SpeedButton4.Enabled := false;
    MontaPArcelasCR(cadNotasFiscaisI_SEQ_NOT.AsInteger);
    ConsultandoNota := true;
    BParcelas.Enabled := false;
    Result := true;
  end;
end;

{******************* consutla a nota fiscal ***********************************}
function TFNovaNotaFiscal.ConsultaNotafiscal( SeqNota  :integer) : Boolean;
begin
  result := true;
  mostrarTodasNotas := true;
  if CarregaNotaConsulta(SeqNota) then
    Showmodal
  else
    result := false;
end;

{*************** consulta a nota fiscal com a opcao de cancelar ***************}
procedure TFNovaNotaFiscal.ConsultaNotafiscalComCancelar( SeqNota, SeqNotCupom : integer;  TextoCupom : string);
begin
  mostrarTodasNotas := true;
  if CarregaNotaConsulta(SeqNota) then
  begin
    Self.TextoCupom := TextoCupom;
    BotaoCancelar1.Enabled := true;
    BitBtn1.Visible := true;
    DBEditColor5.Enabled := false;
    DelCliente.Enabled := false;
    ECoDVendedor.Enabled := false;
    Econdicoes.Enabled := false;
    EDescAcr.Enabled := false;
    VlrPer.Enabled := false;
    AcrDes.Enabled := false;
    cadNotasFiscais.Edit;
    BAlterarNumero.visible := true;
    BtbImprimeBoleto.Enabled := false;
    MontaPArcelasCR(SeqNotCupom);
    BParcelas.Visible := false;
    DelNatureza.Enabled := false;
    Showmodal;
  end;
end;

{********** consulta a nota fiscal permitindo alterar o numero ****************}
procedure TFNovaNotaFiscal.ConsultaNotafiscalAlteraNumero( SeqNota : integer);
begin
  mostrarTodasNotas := true;
  if CarregaNotaConsulta(SeqNota) then
  begin
    BAlterarNumero.visible := (cadNotasFiscaisC_NOT_IMP.AsString = 'N');
    BtbImprimeBoleto.Enabled := false;
    Showmodal;
  end;
end;

{******************* imprime boletos bancarios **************************** }
procedure TFNovaNotaFiscal.BtbImprimeBoletoClick(Sender: TObject);
var
  Dados : TDadosBoleto;
begin
  if (not (cadNotasFiscais.State in [ dsedit, dsInsert ])) and (cadNotasFiscaisI_SEQ_NOT.AsInteger <> 0 ) then
  begin
    nf.LocalizaParcelasBoleto(Aux, cadNotasFiscaisI_SEQ_NOT.AsInteger);
    UnIMP.InicializaImpressao(varia.BoletoPadraoNota,  UnIMP.RetornaImpressoraPadrao(Varia.BoletoPadraoNota));

    while not aux.Eof do
    begin
      with Dados do
      begin
        Dados := TDadosBoleto.Create;
        Valor := aux.fieldByName('n_vlr_par').AsCurrency;
        Desconto := 0;
        Acrescimos := 0;
        Vencimento := aux.fieldByName('d_dat_ven').AsDateTime;
        UnImp.LocalizaTipoBoleto(CadBoleto, varia.DadoBoletoPadraoNota);

        Instrucoes := TStringList.create;
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN1').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN2').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN3').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN4').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN5').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN6').AsString);
        Instrucoes.Add(CADBOLETO.FieldByName('C_DES_LN7').AsString);

        sacado := TStringList. create;
        Sacado.Add(Aux.fieldByName('C_NOM_CLI').AsString);
        if (Aux.fieldByName('C_BAI_CLI').AsString = '') then
           Sacado.Add(Aux.fieldByName('C_END_CLI').AsString + '' +
           Aux.fieldByName('I_NUM_END').AsString)
        else
          Sacado.Add(Aux.fieldByName('C_END_CLI').AsString  + '' +
          Aux.fieldByName('I_NUM_END').AsString + ',  ' +
          Aux.fieldByName('C_BAI_CLI').AsString);

        if (Aux.fieldByName('C_CEP_CLI').AsString = '') then
          Sacado.Add(AdicionaBrancoD(Aux.fieldByName('C_CID_CLI').AsString, 40) +
          Aux.fieldByName('C_EST_CLI').AsString)
        else
          Sacado.Add(AdicionaBrancoD(Aux.fieldByName('C_CID_CLI').AsString, 40) +
          Aux.fieldByName('C_EST_CLI').AsString + '   CEP: ' +
          Aux.fieldByName('C_CEP_CLI').AsString);

        DataDocumento := Date;
        DataProcessamento := Date;
        Desconto := Aux.fieldByName('N_VLR_DES').AsFloat;
        Acrescimos := Aux.fieldByName('N_VLR_ACR').AsFloat;
        ValorDocumento := Aux.fieldByName('N_VLR_PAR').AsFloat;
        if CADBOLETO.FieldByName('C_DES_LOC').AsString <> '' then
          LocalPagamento := CADBOLETO.FieldByName('C_DES_LOC').AsString
        else
          LocalPagamento := Aux.fieldByName('C_CID_CLI').AsString;
        Cedente := CADBOLETO.FieldByName('C_DES_CED').AsString;
        NumeroDocumento := Aux.fieldByName('C_NRO_DUP').AsString;
        EspecieDocumento := CADBOLETO.FieldByName('C_DES_ESP').AsString;
        Aceite := CADBOLETO.FieldByName('C_DES_ACE').AsString;
        Carteira := CADBOLETO.FieldByName('C_DES_CAR').AsString;
        Especie := CADBOLETO.FieldByName('C_ESP_MOE').AsString;
        Quantidade := '';
        Agencia := '';
        NossoNumero := '';
        Outras := 0;
        MoraMulta := 0;
        ValoCobrado := Aux.fieldByName('N_VLR_PAR').AsFloat - Desconto + Acrescimos;
        UnIMP.ImprimeBoleto(Dados); // Imprime 1 documento.
       end;
       aux.Next;
    end;
    UnIMP.FechaImpressao(Config.ImpPorta, 'C:\IMP.TXT');
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos do orcamento na nota fiscal
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}


{************************** gera o movorcamento *******************************}
procedure TFNovaNotaFiscal.GeraMovNotasFiscaisOrcamento(VpaLanOrcamento : String);
begin
  GerandoOrcamento := true;
  GradeEnter(Grade);
  Cotacoes.LocalizaMovOrcamento(MovOrcamento,IntToStr(VAria.CodigoEmpfil),VpaLanOrcamento);
  While not Movorcamento.Eof do
  begin
    IF MovOrcamento.FieldByName('N_Qtd_Pro').AsFloat - MovOrcamento.FieldByName('N_Qtd_BAI').AsFloat > 0 Then
    begin
      MovNotasFiscais.Insert;
      MovNotasFiscaisI_SEQ_PRO.AsInteger := MovOrcamento.FieldByName('I_Seq_Pro').AsInteger;
      AdicionaItemsProduto(MovNotasFiscaisI_SEQ_PRO.AsInteger);
      TextosCodigoProduto := TextosCodigoProduto + ', ' + MovOrcamento.FieldByName('I_Seq_Pro').AsString;
      MovNotasFiscaisC_COD_PRO.AsString := MovOrcamento.FieldByName('C_Cod_Pro').Asstring;
      MovNotasFiscaisN_QTD_PRO.AsFloat := MovOrcamento.FieldByName('N_Qtd_Pro').AsFloat - MovOrcamento.FieldByName('N_Qtd_BAI').AsFloat;
      MovNotasFiscaisC_COD_UNI.AsString := MovOrcamento.FieldByName('C_Cod_Uni').Asstring;
      MovNotasFiscaisN_VLR_PRO.AsFloat := MovOrcamento.FieldByName('N_Vlr_Pro').AsFloat - (MovOrcamento.FieldByName('N_Vlr_Pro').AsFloat * (MovOrcamento.FieldByName('N_DES_PRO').AsFloat/100) );
      MovNotasFiscais.post;
    end;
    MovOrcamento.Next;
  end;
  NF.LocalizaProdutoCodigos(Produtos, TextosCodigoProduto );

  // organizar o nome dos produtos
  if not MovNotasFiscais.IsEmpty then
  begin
    MovNotasFiscais.Edit;
    MovNotasFiscais.post;
  end;

  // se a nota fiscal possuir servico
  if (GServicos.Visible) and (ConfigModulos.Servico) then
  begin
    GServicosEnter(GServicos);
    Cotacoes.LocalizaMovServicoOrcamento(MovOrcamento,VpaLanOrcamento);
    While not Movorcamento.Eof do
    begin
      if MovOrcamento.FieldByName('N_Qtd_Bai').AsFloat < MovOrcamento.FieldByName('N_Qtd_Ser').AsFloat Then
      begin
        MovServicoNota.Insert;
        MovServicoNotaI_COD_SER.AsInteger := MovOrcamento.FieldByName('I_Cod_Ser').AsInteger;
        MovServicoNotaN_VLR_SER.AsFloat := MovOrcamento.FieldByName('N_Vlr_Ser').AsFloat;
        MovServicoNotaN_QTD_SER.AsFloat := MovOrcamento.FieldByName('N_Qtd_Ser').AsFloat;
        MovServicoNota.post;
      end;
      MovOrcamento.Next;
    end;
    GServicosExit(Gservicos);
  end;

  GradeExit(Grade);
end;


{************************** gera o movorcamento *******************************}
procedure TFNovaNotaFiscal.GeraMovNotasFiscaisOS(VpaNroOS : String);
begin
  GerandoOrcamento := true;
  GradeEnter(Grade);
  AdicionaSQLAbreTabela(MovOrcamento, ' select * from MovOrdemServico ' +
                                      ' where i_cod_ors in (' + vpaNroOs + ')' +
                                      ' and I_SEQ_PRO is not null ' +
                                      ' and i_emp_fil = ' + Inttostr(varia.CodigoEmpFil) );
  While not Movorcamento.Eof do
  begin
    MovNotasFiscais.Insert;
    MovNotasFiscaisI_SEQ_PRO.AsInteger := MovOrcamento.FieldByName('I_Seq_Pro').AsInteger;
    AdicionaItemsProduto(MovNotasFiscaisI_SEQ_PRO.AsInteger);
    TextosCodigoProduto := TextosCodigoProduto + ', ' + MovOrcamento.FieldByName('I_Seq_Pro').AsString;
    MovNotasFiscaisC_COD_PRO.AsString := MovOrcamento.FieldByName('C_Cod_Pro').Asstring;
    MovNotasFiscaisN_QTD_PRO.AsFloat := MovOrcamento.FieldByName('N_Qtd_Mov').AsFloat;
    MovNotasFiscaisC_COD_UNI.AsString := MovOrcamento.FieldByName('C_Cod_Uni').Asstring;
    MovNotasFiscaisN_VLR_PRO.AsFloat := MovOrcamento.FieldByName('N_Vlr_Uni').AsFloat;
    MovNotasFiscais.post;
    MovOrcamento.Next;
  end;
  NF.LocalizaProdutoCodigos(Produtos, TextosCodigoProduto );

  // organizar o nome dos produtos
  if not MovNotasFiscais.IsEmpty then
  begin
    MovNotasFiscais.Edit;
    MovNotasFiscais.post;
  end;

  // se a nota fiscal possuir servico
  if (GServicos.Visible) and (ConfigModulos.Servico) then
  begin
    GServicosEnter(GServicos);
    AdicionaSQLAbreTabela(MovOrcamento, ' select * from MovOrdemServico ' +
                                        ' where i_cod_ors in (' + vpaNroOs + ')' +
                                        ' and I_COD_SER is not null ' +
                                        ' and i_emp_fil = ' + Inttostr(varia.CodigoEmpFil) );
    While not Movorcamento.Eof do
    begin
      MovServicoNota.Insert;
      MovServicoNotaI_COD_SER.AsInteger := MovOrcamento.FieldByName('I_Cod_Ser').AsInteger;
      MovServicoNotaN_VLR_SER.AsFloat := MovOrcamento.FieldByName('N_Vlr_Uni').AsFloat;
      MovServicoNotaN_QTD_SER.AsFloat := MovOrcamento.FieldByName('N_Qtd_mov').AsFloat;
      MovServicoNota.post;
      MovOrcamento.Next;
    end;
    GServicosExit(Gservicos);
  end;
  GradeExit(Grade);
end;

{**************** gera a nota fiscal a partir do orcamento ********************}
function  TFNovaNotaFiscal.GeraNotaOrcamento(VpaLanOrcamento, NroOrc_Ped : String; Pedido : Boolean) : Boolean;
begin
  result := true;
  CancelaGerandoNota := false;
  mostrarTodasNotas := true;
  VerificaVariaveis;
  ConfiguraItemNota(Varia.NotaFiscalPadrao);
  Cotacoes := TFuncoesCotacao.Cria(Fprincipal.BaseDados);
  InicializaCadNota;
  Cotacoes.LocalizaCadOrcamento(CadOrcamentos,VpaLanOrcamento);
  if Varia.naturezaNota  = '' then
    NF.LocalizaCadNatureza(CadNatureza, '0')
  else
  begin
    cadNotasFiscaisC_COD_NAT.AsString := Varia.NaturezaNota;
    DelNatureza.Atualiza;
  end;

  cadNotasFiscaisI_COD_CLI.AsInteger := CadOrcamentos.FieldByName('I_Cod_Cli').AsInteger;
  DelCliente.Atualiza;

  if not CancelaGerandoNota then // caso tenha inadimplente e cancele  nota
  begin
    DelCliente.Enabled := false;
    cadNotasFiscaisI_COD_PAG.AsInteger := CadOrcamentos.FieldByName('I_Cod_Pag').AsInteger;
    cadNotasFiscaisC_SER_NOT.AsString := varia.SerieNota;
    ECoDVendedorEnter(ECodVendedor);
    ECoDVendedor.Atualiza;
    if Pedido then
      cadNotasFiscaisC_NRO_PED.AsString := NroOrc_Ped
    else
      cadNotasFiscaisC_NRO_ORC.AsString := NroOrc_Ped;
    cadNotasFiscaisI_LAN_ORC.Asstring := VpaLanOrcamento;

    VprOrcamento := true;
    GeraMovNotasFiscaisOrcamento(VpaLanOrcamento);

    cadNotasFiscaisN_VLR_PER.AsCurrency := CadOrcamentos.FieldByName('N_VLR_PER').AsCurrency;
    cadNotasFiscaisC_DES_ACR.AsString := CadOrcamentos.FieldByName('C_DES_ACR').AsString;
    cadNotasFiscaisC_VLR_PER.AsString := CadOrcamentos.FieldByName('C_VLR_PER').AsString;

    cadNotasFiscaisI_COD_PAG.AsInteger := CadOrcamentos.FieldByName('I_Cod_Pag').AsInteger;
    Econdicoes.Text := CadOrcamentos.FieldByName('I_Cod_Pag').AsString;
    cadNotasFiscaisI_COD_VEN.AsInteger := CadOrcamentos.FieldByName('I_Cod_Ven').AsInteger;
    LocalizaCondicaoPagto;
    TipoNotas := '''V'', ''P'', ''S''';
    DelNaturezaSelect(DelNatureza);
    ShowModal;
  end
  else
  begin
    result := false;
    cadNotasFiscais.cancel;
    self.close;
  end;
  Cotacoes.free;
end;

{**************** gera a nota fiscal a partir do ordem serviço*****************}
procedure TFNovaNotaFiscal.GeraNotaOS(VpaNroOS : String; MostraReferente : Boolean );
begin
  CancelaGerandoNota := false;
  mostrarTodasNotas := true;
  VerificaVariaveis;
  ConfiguraItemNota(Varia.NotaFiscalPadrao);
  InicializaCadNota;
  DelCliente.Enabled := false;
  AdicionaSQLAbreTabela(CadOrcamentos, ' Select * from cadOrdemServico ' +
                                       ' where i_emp_fil = ' + Inttostr(varia.CodigoEmpFil) +
                                       ' and i_cod_ors in (' + VpaNroOS + ')' );
  if Varia.naturezaNota  = '' then
    NF.LocalizaCadNatureza(CadNatureza, '0')
  else
  begin
    cadNotasFiscaisC_COD_NAT.AsString := Varia.NaturezaNota;
    DelNatureza.Atualiza;
  end;
  cadNotasFiscaisI_COD_CLI.AsInteger := CadOrcamentos.FieldByName('I_Cod_Cli').AsInteger;
  DelCliente.Atualiza;
  DelCliente.Enabled := false;
  cadNotasFiscaisI_COD_PAG.AsInteger := CadOrcamentos.FieldByName('I_Cod_Pag').AsInteger;
  cadNotasFiscaisC_SER_NOT.AsString := varia.SerieNota;
  ECoDVendedorEnter(ECodVendedor);
  ECoDVendedor.Atualiza;
//  if Pedido then
//    cadNotasFiscaisC_NRO_PED.AsString := NroOrc_Ped
//  else
//    cadNotasFiscaisC_NRO_ORC.AsString := NroOrc_Ped;
//  cadNotasFiscaisI_LAN_ORC.Asstring := VpaLanOrcamento;

  VprOrcamento := true;
  GeraMovNotasFiscaisOS(VpaNroOS);

  cadNotasFiscaisN_VLR_PER.AsCurrency := CadOrcamentos.FieldByName('N_VLR_PER').AsCurrency;
  cadNotasFiscaisC_DES_ACR.AsString := CadOrcamentos.FieldByName('C_DES_ACR').AsString;
  cadNotasFiscaisC_VLR_PER.AsString := CadOrcamentos.FieldByName('C_VLR_PER').AsString;

  cadNotasFiscaisI_COD_PAG.AsInteger := CadOrcamentos.FieldByName('I_Cod_Pag').AsInteger;
  Econdicoes.Text := CadOrcamentos.FieldByName('I_Cod_Pag').AsString;
  cadNotasFiscaisI_COD_VEN.AsInteger := CadOrcamentos.FieldByName('I_Cod_Ate').AsInteger;
  LocalizaCondicaoPagto;
  TipoNotas := '''V'', ''P'', ''S''';
  DelNaturezaSelect(DelNatureza);
  ShowModal;
  Cotacoes.free;
end;

{********************* Atlera o numero da nota ********************************}
procedure TFNovaNotaFiscal.BAlterarNumeroClick(Sender: TObject);
var
  VpfNovoNumero : String;
begin
  if EntradaNumero('Novo Número','Digite o Novo numero da Nota : ',VpfNovoNumero,False,DBEditColor11.color,color,false,0) then
  begin
    ExecutaComandoSql(Aux,'Update CadNotaFiscais ' +
                          'Set I_Nro_not = ' + VpfNovoNumero +
                          ' Where I_Emp_Fil = '+ cadNotasFiscaisI_EMP_FIL.AsString +
                          ' and I_Seq_Not = ' + cadNotasFiscaisI_SEQ_NOT.AsString);
    nf.LocalizaCadNotaFiscal(cadNotasFiscais, cadNotasFiscaisI_SEQ_NOT.AsInteger, varia.CodigoEmpFil);
  end;
end;


procedure TFNovaNotaFiscal.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FNovaNotaFiscal.HelpContext);
end;


procedure TFNovaNotaFiscal.DBEditColor10Exit(Sender: TObject);
begin
  if not nf.VerificaNroSerie(DBEditColor10.Field.AsString) then
  begin
    DBEditColor10.SetFocus;
    aviso(CT_SerieInvalida);
  end
  else
    if GerandoOrcamento then
      if cadNotasFiscaisC_SER_NOT.AsString <> varia.SerieNota then
        cadNotasFiscaisI_NRO_NOT.AsInteger := nf.RetornaProximoCodigoNota(cadNotasFiscaisC_SER_NOT.AsString);
end;

procedure TFNovaNotaFiscal.MovNotasFiscaisBeforeDelete(DataSet: TDataSet);
begin
  nf.EstornaItemCaixa(cadNotasFiscaisI_SEQ_NOT.AsInteger, MovNotasFiscaisI_SEQ_PRO.AsInteger, varia.CodigoEmpFil);
end;

procedure TFNovaNotaFiscal.BImprimirRomanrioClick(Sender: TObject);
begin
  nf.ImprimeRomaneio(cadNotasFiscaisI_SEQ_NOT.AsInteger, varia.CodigoEmpFil, varia.QdadeViasRomaneio);
end;

procedure TFNovaNotaFiscal.BitBtn1Click(Sender: TObject);
begin
  if cadNotasFiscais.State in [ dsedit, dsinsert ] then
  begin
    cadNotasFiscais.post;
    BitBtn1.Enabled := false;
    EstadoBotoes(False);
  end;  
end;

procedure TFNovaNotaFiscal.MovNotasFiscaisBeforeCancel(DataSet: TDataSet);
begin
  if (MovNotasFiscais.state = dsInsert) and (config.UsarModoCaixa) then
    nf.EstornaItemCaixa(cadNotasFiscaisI_SEQ_NOT.AsInteger, MovNotasFiscaisI_SEQ_PRO.AsInteger, varia.CodigoEmpFil);
end;

procedure TFNovaNotaFiscal.Button1Click(Sender: TObject);
begin
  nf.ImprimeNotaFiscal(cadNotasFiscaisI_EMP_FIL.AsInteger,cadNotasFiscaisI_SEQ_NOT.AsInteger);
end;

Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFNovaNotaFiscal]);
end.








 