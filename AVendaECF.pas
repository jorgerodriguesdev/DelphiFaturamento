unit AVendaECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Localizacao, StdCtrls, Componentes1, ExtCtrls, PainelGradiente, Buttons,
  Mask, numericos, LabelCorMove, UnECF, Db, DBTables, DBCtrls, Tabela, UnProdutos,
  DBKeyViolation, ConvUnidade, Parcela, Grids, DBGrids, UnNotaFiscal, UnComandosECF, UnContasAReceber, UnCaixa, UnTEF,
  ComCtrls, UnCotacao;

type
  TFVendaECF = class(TFormularioPermissao)
    Painel: TPanelColor;
    Localiza: TConsultaPadrao;
    PanelColor3: TPanelColor;
    PanelColor4: TPanelColor;
    BFechar: TBitBtn;
    BCancelaCupom: TBitBtn;
    Label20: TLabel;
    SpeedButton6: TSpeedButton;
    EditLocaliza4: TEditLocaliza;
    Label18: TLabel;
    CadClientes: TQuery;
    DataCadClientes: TDataSource;
    CadClientesI_COD_CLI: TIntegerField;
    CadClientesC_NOM_CLI: TStringField;
    CadClientesC_END_CLI: TStringField;
    CadClientesC_BAI_CLI: TStringField;
    CadClientesC_EST_CLI: TStringField;
    CadClientesC_CID_CLI: TStringField;
    CadClientesC_CPF_CLI: TStringField;
    CadClientesC_CGC_CLI: TStringField;
    CadClientesI_NUM_END: TIntegerField;
    MovNotasFiscais: TQuery;
    CadNotasFiscais: TQuery;
    DataMovNotasFiscais: TDataSource;
    DataCadNotasFiscais: TDataSource;
    MovNotasFiscaisI_EMP_FIL: TIntegerField;
    MovNotasFiscaisI_SEQ_NOT: TIntegerField;
    MovNotasFiscaisC_COD_UNI: TStringField;
    MovNotasFiscaisN_QTD_PRO: TFloatField;
    MovNotasFiscaisN_VLR_PRO: TFloatField;
    MovNotasFiscaisN_PER_ICM: TFloatField;
    MovNotasFiscaisN_PER_IPI: TFloatField;
    MovNotasFiscaisN_TOT_PRO: TFloatField;
    MovNotasFiscaisC_COD_CST: TStringField;
    MovNotasFiscaisI_ORD_FIS: TIntegerField;
    MovNotasFiscaisC_CLA_FIS: TStringField;
    CadNotasFiscaisI_EMP_FIL: TIntegerField;
    CadNotasFiscaisI_SEQ_NOT: TIntegerField;
    CadNotasFiscaisI_COD_PAG: TIntegerField;
    CadNotasFiscaisI_NRO_NOT: TIntegerField;
    CadNotasFiscaisI_COD_CLI: TIntegerField;
    CadNotasFiscaisI_COD_VEN: TIntegerField;
    CadNotasFiscaisI_COD_PED: TIntegerField;
    CadNotasFiscaisC_TIP_NOT: TStringField;
    CadNotasFiscaisD_DAT_EMI: TDateField;
    CadNotasFiscaisD_DAT_SAI: TDateField;
    CadNotasFiscaisT_HOR_SAI: TTimeField;
    CadNotasFiscaisN_BAS_CAL: TFloatField;
    CadNotasFiscaisN_VLR_ICM: TFloatField;
    CadNotasFiscaisN_TOT_PRO: TFloatField;
    CadNotasFiscaisN_TOT_NOT: TFloatField;
    CadNotasFiscaisI_NRO_LOJ: TIntegerField;
    CadNotasFiscaisI_NRO_CAI: TIntegerField;
    CadNotasFiscaisI_NRO_TEC: TIntegerField;
    CadNotasFiscaisC_FLA_ECF: TStringField;
    ICMS1: TICMS;
    cadProdutos: TQuery;
    DetalheCli: TPanelColor;
    DBText6: TDBText;
    DBText4: TDBText;
    Label17: TLabel;
    Label19: TLabel;
    DBText8: TDBText;
    Label21: TLabel;
    Label14: TLabel;
    DBText2: TDBText;
    DBText7: TDBText;
    Label22: TLabel;
    Label15: TLabel;
    DBText3: TDBText;
    Label16: TLabel;
    DBText5: TDBText;
    DBText1: TDBText;
    Label13: TLabel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label26: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label24: TLabel;
    NroCupom: TLabel;
    Grade: TDBGridColor;
    Label11: TLabel;
    Label29: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label12: TLabel;
    Label34: TLabel;
    Label6: TLabel;
    DBEditColor5: TDBEditColor;
    Label8: TLabel;
    DBEditColor7: TDBEditColor;
    MostraItens: TQuery;
    DataMostraItens: TDataSource;
    MovNotasFiscaisI_SEQ_MOV: TIntegerField;
    MostraItensI_EMP_FIL: TIntegerField;
    MostraItensI_SEQ_NOT: TIntegerField;
    MostraItensC_COD_PRO: TStringField;
    MostraItensC_COD_UNI: TStringField;
    MostraItensN_QTD_PRO: TFloatField;
    MostraItensN_VLR_PRO: TFloatField;
    MostraItensN_PER_ICM: TFloatField;
    MostraItensN_TOT_PRO: TFloatField;
    MostraItensC_NOM_PRO: TStringField;
    Aux: TQuery;
    DBEditColor1: TDBEditColor;
    Label23: TLabel;
    FrmPagto: TEditLocaliza;
    Label31: TLabel;
    MovNotasFiscaisI_NUM_ITE: TIntegerField;
    BCancelaItem: TBitBtn;
    MostraItensI_NUM_ITE: TIntegerField;
    Tempo: TPainelTempo;
    EDescAcr: TDBEditNumerico;
    CadClientesC_CEP_CLI: TStringField;
    CadClientesC_FO1_CLI: TStringField;
    CadClientesC_TIP_PES: TStringField;
    Label30: TLabel;
    ECoDVendedor: TDBEditLocaliza;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    MovNotasFiscaisI_SEQ_PRO: TIntegerField;
    MovNotasFiscaisC_COD_PRO: TStringField;
    CadNotasFiscaisC_DES_ACR: TStringField;
    CadNotasFiscaisC_VLR_PER: TStringField;
    CadNotasFiscaisN_DES_ACR: TFloatField;
    CadNotasFiscaisN_VLR_PER: TFloatField;
    Econdicoes: TDBEditColor;
    EPercPro: Tnumerico;
    AcrDes: TDBRadioGroup;
    VlrPer: TDBRadioGroup;
    CadNotasFiscaisN_TOT_IPI: TFloatField;
    Label32: TLabel;
    DBEditColor2: TDBEditColor;
    PainelGradiente1: TPainelGradiente;
    BitBtn3: TBitBtn;
    MostraItensI_SEQ_PRO: TIntegerField;
    CadNotasFiscaisC_NOT_IMP: TStringField;
    CadNotasFiscaisC_NOT_CAN: TStringField;
    CadNotasFiscaisC_NOT_DEV: TStringField;
    BFechaCupom: TBitBtn;
    Label73: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    PainelPro: TPanelColor;
    Label37: TLabel;
    DBText9: TDBText;
    Total: TDBText;
    Label36: TLabel;
    foto: TImage;
    PainelFoto: TPanel;
    BIniciaCupom: TBitBtn;
    CadNotasFiscaisC_COD_NAT: TStringField;
    LRetorno: TLabel;
    CadNotasFiscaisD_ULT_ALT: TDateField;
    MovNotasFiscaisD_ULT_ALT: TDateField;
    BBAjuda: TBitBtn;
    BConsultaCheque: TBitBtn;
    Paginas: TPageControl;
    TabSheet1: TTabSheet;
    PanelColor1: TPanelColor;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    CUnidade: TDBComboBoxColor;
    EQuantidade: TDBEditNumerico;
    DBEditColor3: TDBEditNumerico;
    DBEditColor4: TDBEditColor;
    EProduto: TDBEditColor;
    TabSheet2: TTabSheet;
    PanelColor2: TPanelColor;
    Label38: TLabel;
    SpeedButton2: TSpeedButton;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EqtdServico: TDBEditNumerico;
    DBEditNumerico2: TDBEditNumerico;
    DBEditColor6: TDBEditColor;
    EServico: TEditLocaliza;
    MovServicoNota: TQuery;
    MovServicoNotaI_EMP_FIL: TIntegerField;
    MovServicoNotaI_COD_SER: TIntegerField;
    MovServicoNotaI_SEQ_NOT: TIntegerField;
    MovServicoNotaN_VLR_SER: TFloatField;
    MovServicoNotaI_COD_EMP: TIntegerField;
    MovServicoNotaN_QTD_SER: TFloatField;
    MovServicoNotaN_TOT_SER: TFloatField;
    MovServicoNotaD_ULT_ALT: TDateField;
    DataMovServicoNota: TDataSource;
    MovServicoNotaN_ALI_SER: TFloatField;
    MovServicoNotaI_NUM_ITE: TIntegerField;
    CadNotasFiscaisN_TOT_SER: TFloatField;
    CadNotasFiscaisN_VLR_ISQ: TFloatField;
    MostraItensTIPO: TStringField;
    EPercServ: Tnumerico;
    Label39: TLabel;
    Label45: TLabel;
    CadNotasFiscaisC_NRO_PED: TStringField;
    TabSheet3: TTabSheet;
    CadNotasFiscaisC_NRO_ORC: TStringField;
    PanelColor5: TPanelColor;
    Label53: TLabel;
    Label46: TLabel;
    DBEditColor8: TDBEditNumerico;
    Label47: TLabel;
    DBEditColor9: TDBEditNumerico;
    CadNotasFiscaisI_COD_USU: TIntegerField;
    CadNotasFiscaisI_LAN_ORC: TIntegerField;
    CadClientesI_COD_FRM: TIntegerField;
    CadClientesI_COD_PAG: TIntegerField;
    CadClientesN_DES_BOL: TFloatField;
    Label48: TLabel;
    CadNotasFiscaisC_SER_NOT: TStringField;
    CadNatureza: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure EditLocaliza4Cadastrar(Sender: TObject);
    procedure EditLocaliza4Retorno(Retorno1, Retorno2: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure CadNotasFiscaisAfterInsert(DataSet: TDataSet);
    procedure BCancelaCupomClick(Sender: TObject);
    procedure DBEditColor4Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BCancelaItemClick(Sender: TObject);
    procedure EProdutoExit(Sender: TObject);
    procedure EProdutoEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MovNotasFiscaisN_QTD_PROChange(Sender: TField);
    procedure CUnidadeChange(Sender: TObject);
    procedure EcondicoesExit(Sender: TObject);
    procedure EcondicoesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MovNotasFiscaisAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VlrPerClick(Sender: TObject);
    procedure AcrDesExit(Sender: TObject);
    procedure AcrDesClick(Sender: TObject);
    procedure EDescAcrChange(Sender: TObject);
    procedure DBEditColor1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EditLocaliza4Exit(Sender: TObject);
    procedure DBEditColor3Exit(Sender: TObject);
    procedure DBEditColor3Enter(Sender: TObject);
    procedure FrmPagtoRetorno(Retorno1, Retorno2: String);
    procedure BFechaCupomClick(Sender: TObject);
    procedure FrmPagtoSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BIniciaCupomClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBAjudaClick(Sender: TObject);
    procedure BConsultaChequeClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EServicoSelect(Sender: TObject);
    procedure EServicoCadastrar(Sender: TObject);
    procedure EServicoEnter(Sender: TObject);
    procedure MovServicoNotaN_VLR_SERChange(Sender: TField);
    procedure DBEditColor6Exit(Sender: TObject);
    procedure MovServicoNotaAfterPost(DataSet: TDataSet);
    procedure EServicoRetorno(Retorno1, Retorno2: String);
    procedure PaginasChange(Sender: TObject);
    procedure EditLocaliza4Enter(Sender: TObject);
    procedure ECoDVendedorRetorno(Retorno1, Retorno2: String);
    procedure Button1Click(Sender: TObject);
    procedure DBEditColor8Exit(Sender: TObject);
    procedure DBEditColor9Exit(Sender: TObject);
    procedure DBEditColor8Change(Sender: TObject);
    procedure DBEditColor9Change(Sender: TObject);
  private
    VersaoSistema : Integer;
    PermiteFechar : Boolean;
    CodVenCli : integer;  // vendedor do cliente
    NF : TFuncoesNotaFiscal;
    ECF : TECF;
    UnTEF : TFuncoesTEF;
    UnCaixa :  TFuncoesCaixa;
    UnProdutos : TFuncoesProduto;
    UnCR : TFuncoesContasAReceber;
    UnCotacao : TFuncoesCotacao;
    ICMSPadrao : Double;
    NumeroLoja, NumeroCaixa, NumeroCupom, NumeroIntTec, NroSerie : string;
    EstoqueAtual : Double;  // guarda o estoque atual, quando kit para verificar, trancar , etc
    Kit : Boolean; // se for kit true
    ContaItem, CondicaoPagto : integer;  // conta os item de uma nota fiscal
    CalcularNota : Boolean; // verifica se deve ou naum calcular a nota fiscal
    GerarCupomNaoFiscal : Boolean;     // se deve ou nao gerar um cupom nao fiscal de acordo com a condicao de pagto.
    codigoerro : integer; // codigo de erro da impressora fiscal

    ValorUnitario, ValorCalcularComissao, QdadeProduto : Double;
    DescontoValido : string;
    TipoFrmPagamento, Gaveta : string;
    Troco : Double;  // retorno da criacao das parcelas para adiciona no ecf o troco
    CodCliLiberdo : string;

    procedure VerificaDataEcf;
    procedure CarregaLojaCaixa;
    procedure TrancaForm;
    function ValidaProduto : Boolean;
    function AbreLocalizacaoProduto : Boolean;
    procedure AbreCadMovNotas;
    procedure AdicionaItemsProduto( SeqPro : Integer );
    procedure AdicionaItemsServico( CodSer : Integer );
    procedure CalculaNota;
    Procedure RecalculaImposto;
    procedure CalculaServico;
    procedure FechaCupom;
    function CalculaValorDescAcr : Double;

    function RetornaNroCupom : string;
    procedure InicializaCupom;
    procedure ImprimeItem(CodigoPro, NomePro : string; QtdPro, ValorPro : double; Produto : Boolean);        // imprime um item na imprssora de icf
    procedure AdicionaKit( QtdKit : double  ) ;
    function LocalizaCondicaoPagto : Boolean;
    procedure LimpaVenda;
    procedure GravaCadNotasFiscais;  // grava os detalhes do cad da nota fiscal
    procedure deletaItemNota( NumeroItem : integer; sequencial : Integer; Produto : boolean  );

    function ImpressaoCupomNaoFiscal : integer;
    function BaixaNota : Boolean;

    procedure EstornaCupon;
    procedure ConfiguraLayout( layout : Integer );
    procedure ConfiguraEdit( PosxEditInicial, PosyEditInicial, tamanhoFonte : Integer;  texto : array of Tlabel; Edit : array of TWincontrol; botao : array of TSpeedButton; texto2 : array of Tlabel);
    procedure AlteraVisible( comp : array of  Tcontrol; Acao : Boolean);
  public
    procedure AbreCupom;
    procedure CancelaCupomProblema;
  end;

var
  FVendaECF: TFVendaECF;

implementation

uses APrincipal, constantes, ANovoCliente, fundata, constMsg, funstring,
     funvalida, FunSql, ALocalizaProdutos, AConsultaCondicaoPgto, funnumeros, funobjeto,
     AItensCaixa, Registry, FTefDiscado, funsistema, ANovoServico,
  ATotalPago, AMostraParReceber;

{$R *.DFM}

{)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                 Inicializacao e fechamento do formulario
(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((}


{ ****************** Na criação do Formulário ******************************** }
procedure TFVendaECF.FormCreate(Sender: TObject);
begin
  CodCliLiberdo := '';
  QdadeProduto := 0;
  TabSheet2.TabVisible := ConfigModulos.OrdemServico;
  TabSheet3.TabVisible := ( ConfigModulos.PedidoVenda or ConfigModulos.OrcamentoVenda);
  label48.Visible := config.GeraItemAutCupom;
  VersaoSistema := FPrincipal.VersaoSistema;
  MovNotasFiscaisN_QTD_PRO.DisplayFormat := Varia.MascaraQtd;
  MovNotasFiscaisN_VLR_PRO.DisplayFormat := Varia.MascaraValorUnitario;
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  PermiteFechar := false;
  NF := TFuncoesNotaFiscal.criar(self, FPrincipal.BaseDados);
  ECF := TECF.criar(self, FPrincipal.BaseDados);
  UnProdutos := TFuncoesProduto.criar(self, FPrincipal.BaseDados);
  UnCR := TFuncoesContasAReceber.criar(self,FPrincipal.BaseDados);
  UnCaixa :=  TFuncoesCaixa.criar(self,FPrincipal.BaseDados);
  UnTEF := TFuncoesTEF.criar(self,FPrincipal.BaseDados);
  UnCotacao := TFuncoesCotacao.Cria(FPrincipal.BaseDados);

  if VersaoSistema = 1 then
  begin
    if ECF.AbrePorta then
    begin
      VerificaDataEcf;
      CarregaLojaCaixa;
      CancelaCupomProblema;
      LRetorno.Caption := ECF.Analisa_retorno(codigoerro);
    end
    else
      TrancaForm;
  end
  else
  begin
    NumeroLoja := '15';
    NumeroCaixa := '1';
    NumeroIntTec := '1';
    NumeroCupom := '999';
  end;

  CalcularNota := true;
  cadNotasFiscaisN_VLR_PER.DisplayFormat := Varia.MascaraMoeda;
  cadNotasFiscaisN_VLR_PER.EditFormat := Varia.MascaraValor;

   if not config.AlterarValorUnitarioNota then
     DBEditColor3.Enabled := false;

   if not config.DescontoNota then
      EDescAcr.ReadOnly := true;

   if not ConfigModulos.Servico then
     TabSheet2.TabVisible := false;

   if ConfigModulos.OrcamentoVenda or ConfigModulos.PedidoVenda then
      TabSheet3.TabVisible := true;

   BConsultaCheque.Visible := ConfigModulos.TEF;

   if not ConfigModulos.Servico then
   begin
     DBEditColor2.DataField := 'N_VLR_ICM';
     label32.Caption := 'ICMS :';
   end;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFVendaECF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  varia.TabelaPreco := varia.TabelaPrecoPadrao;
  if VersaoSistema = 1 then
   ECF.FecharPorta;
   CadNotasFiscais.close;
   MovNotasFiscais.close;
   CadClientes.close;
   MostraItens.close;
   cadProdutos.close;
   MovServicoNota.close;
   CadNatureza.close;
  NF.Free;
  ECF.Free;
  UnCaixa.Free;
  UnProdutos.Free;
  UnCR.Free;
  UnTEF.free;
  Uncotacao.free;
  CadClientes.close;
  Action := CaFree;
end;

{******************* abre cupom e verifica caixa **************************** }
procedure TFVendaECF.AbreCupom;
begin
  if UnCR.VerificaCaixaAtivo( true ) then
    self.ShowModal
  else
  begin
    PermiteFechar := true;
    self.Close;
  end;
end;

{************************* tranca formulario ******************************** }
procedure TFVendaECF.TrancaForm;
begin
  PanelColor4.Enabled := false;
  PanelColor1.Enabled := false;
  PanelColor2.Enabled := false;
  Grade.Enabled := false;
  painel.Enabled := false;
  BCancelaCupom.Enabled := false;
  BCancelaItem.Enabled := false;
  BIniciaCupom.Enabled := false;
end;

{*************** cancela um cupom fiscal ************************************ }
procedure TFVendaECF.CancelaCupomProblema;
var
  seqNota, SeqTef : string;
  Filial, FilAtual : Integer;
  Ini : TRegIniFile;
begin
  Ini := TRegIniFile.Create('Software\Systec\Sistema');
  seqNota := Ini.ReadString('NOTA_ECF_TEF','ECF', '0');
  Filial := strToint(Ini.ReadString('NOTA_ECF_TEF','FILIAL_ECF', '11'));
  seqTef := Ini.ReadString('NOTA_ECF_TEF','TEF', '0');

  if  (SeqTef <> '0') or (SeqNota <> '0') then
  begin
    FilAtual := Varia.CodigoEmpFil;
    Varia.CodigoEmpFil := Filial;

    if VersaoSistema = 1 then
    begin
      // ecf
      if (ecf.RetornaVariaveis(17)[8] = '1')  then
      begin
        ICMSPadrao := 17;
        ImprimeItem('000','Cancelamento cupom',1,1, true);
        ECF.CancelaCupomAnterior;
        NF.CancelaCupomFiscal(StrToInt(seqNota));
      end
      else
        aviso(CT_CupomVinculado);
      LRetorno.Caption := ECF.Analisa_retorno(codigoerro);
    end;

    // TEF
    if config.UsaTEF then
      if seqTef <> '0' then
        if not untef.CancelaTEFProblema then
           TrancaForm;

    ECF.MarcaECFFechado;
    varia.CodigoEmpFil := FilAtual;
  end;
end;


{)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                            Localizacao dos cliente
(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((}

{***************** permite o cadastro de um novo cliente ******************* }
procedure TFVendaECF.EditLocaliza4Cadastrar(Sender: TObject);
begin
  FNovoCliente := TFNovoCliente.CriarSDI(application,'', true);
  FNovoCliente.CadClientes.Insert;
  FNovoCliente.ShowModal;
  Localiza.AtualizaConsulta;
end;

{*************** no exit do localiza produtos ******************************** }
procedure TFVendaECF.EditLocaliza4Exit(Sender: TObject);
begin
  if EditLocaliza4.Text = '' then
    if (not BFechar.Focused) and (not BIniciaCupom.Focused) then
      EditLocaliza4.SetFocus;
end;

{********** No retorno do localiza clientes posiciona tabel de clientes ******}
procedure TFVendaECF.EditLocaliza4Retorno(Retorno1, Retorno2: String);
var
  ValorIna : Double;
begin
  CondicaoPagto := 0;
  Paginas.Enabled := Retorno1 <> '';
  if retorno1 <> '' then
  begin
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
          if Self.Visible then
          begin
            EditLocaliza4.Text := '';
            EditLocaliza4.SetFocus;
            abort;
          end;
        end
        else
          CodCliLiberdo := Retorno1;
      end
      else
        CodCliLiberdo := '';
    end;


    NF.LocalizaCliente(cadClientes, StrToInt(retorno1));

    CodigoTabelaPreco(StrtoInt(retorno1), FPrincipal.BaseDados);

   Econdicoes.Text := '';
   if cadClientes.fieldByName('i_cod_pag').AsInteger <>  0 then
   begin
     CondicaoPagto := cadClientes.fieldByName('i_cod_pag').AsInteger;
     Label12.Caption := nf.RetornaCondPagamento(cadClientes.fieldByName('i_cod_pag').AsInteger);
   end
   else
     Label12.Caption := '';
   FrmPagto.Text := '';
   if cadClientes.fieldByName('i_cod_frm').AsInteger <>  0 then
     FrmPagto.Text := cadClientes.fieldByName('i_cod_frm').AsString;
   FrmPagto.Atualiza;

    if cadClientes.FieldByName('C_TIP_Pes').AsString[1] = 'F' then
    begin
      label22.Caption := 'CPF :';
      DBText7.DataField := 'C_CPF_CLI';
      ICMSPAdrao := ICMS1.ICMS(CadClientesC_EST_CLI.AsString,Varia.EstadoPadrao,false);
    end
    else
    begin
      label22.Caption := 'CGC :';
      DBText7.DataField := 'C_CGC_CLI';
      ICMSPAdrao := ICMS1.ICMS(CadClientesC_EST_CLI.AsString,Varia.EstadoPadrao,true);
    end;

    if Config.MostraDadosClienteCupom then
    begin
       DetalheCli.Visible := true;
       BitBtn2.SetFocus;
    end
    else
      if Paginas.ActivePage = TabSheet1 then    // caso servico ou produto
        EProduto.SetFocus
      else
      if Paginas.ActivePage = TabSheet2 then
          EServico.SetFocus;

  end;
end;

{********************Permite alterar um cliente********************************}
procedure TFVendaECF.BitBtn1Click(Sender: TObject);
begin
  if EditLocaliza4.Text <> '' then
  begin
     FNovoCliente := TFNovoCliente.CriarSDI(application,'', true);
     FNovoCliente.CadClientes.FindKey([StrToInt(EditLocaliza4.text)]);
     FNovoCliente.CadClientes.Edit;
     FNovoCliente.ShowModal;
  end;
end;

{***************Esconde o panel com as informacoes do cliente******************}
procedure TFVendaECF.BitBtn2Click(Sender: TObject);
begin
   DetalheCli.Visible := false;
   if Paginas.ActivePage = TabSheet1 then    // caso servico ou produto
      EProduto.SetFocus
   else
   if Paginas.ActivePage = TabSheet2 then
      EServico.SetFocus;
end;

{*********** esconde e cancela as informacoes do cliente ********************* }
procedure TFVendaECF.BitBtn3Click(Sender: TObject);
begin
   DetalheCli.Visible := false;
   EditLocaliza4.SetFocus;
   EditLocaliza4.Text := '';
   label20.Caption := '';
end;

{)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                 servicos da impressora fiscal de ECF
(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((}

{ ********************** Verifica a data do sistema em relacao ao ecf ********}
procedure TFVendaECF.VerificaDataEcf;
begin
  if MontaDataTexto( copy(ECF.RetornaVariaveis( 23 ),1,6),true ) <> date then
  begin
    aviso(CT_DataDifECF);
    PanelColor4.Enabled := false;
    PanelColor1.Enabled := false;
    PanelColor2.Enabled := false;
    Grade.Enabled := false;
    painel.Enabled := false;
    BCancelaCupom.Enabled := false;
    BCancelaItem.Enabled := false;
  end;
end;

{ ******************** busca o numero do cupom **************************** }
function TFVendaECF.RetornaNroCupom : string;
begin
  numeroCupom := ECF.NumeroCupom;
  result := NumeroCupom;
end;

{************* busca o numero do caixa e loja da impressora ecf ************* }
procedure TFVendaECF.CarregaLojaCaixa;
begin
  NumeroLoja := ECF.RetornaVariaveis( 15 );
  NumeroCaixa := ECF.RetornaVariaveis( 14 );
  NumeroIntTec := ECF.RetornaVariaveis( 10 );
  Label25.Caption := NumeroLoja;
  Label27.Caption := NumeroCaixa;
  NroSerie := ECF.RetornaVariaveis( 0 );
end;

{******************* inicializa o cupom fiscal ****************************** }
procedure TFVendaECF.InicializaCupom;
begin
   if VersaoSistema = 1 then
   begin
     if CadClientesC_TIP_PES.AsString = 'J' then
       ECF.AbreCupom(CadClientesC_CGC_CLI.AsString)
     else
       ECF.AbreCupom(CadClientesC_CPF_CLI.AsString);
     NroCupom.Caption := RetornaNroCupom;
     LRetorno.Caption := ECF.Analisa_retorno(codigoerro);
   end;
   ContaItem := 0;
   BFechar.Enabled := false;
   BCancelaCupom.Enabled := true;
   BIniciaCupom.Enabled := false;
   BFechaCupom.Enabled := false;
   BCancelaItem.Enabled := false;
end;

{*********************imprime um item na imp. ecf******************************}
procedure TFVendaECF.ImprimeItem(CodigoPro, NomePro : string; QtdPro, ValorPro : double; Produto : Boolean);
  var
   dados : TVendaItens;
   TipoTributo : integer;
   Icms : Double;
begin
  TipoTributo := 0;
  if VersaoSistema = 1 then
  begin
    dados := TVendaItens.Create;
    dados.CodigoPro := CodigoPro;
    dados.NomePro := NomePro;

    if Produto then
      icms := ICMSPadrao
    else
      icms := varia.ISSQN;

    if (cadProdutos.Active) and (produto) then
    begin
      TipoTributo := CadProdutos.FieldByname('i_tip_tri').AsInteger;
      if CadProdutos.FieldByname('n_red_icm').AsFloat <> 0 then  // caso haja reducao de icms
      begin
        Icms := CadProdutos.FieldByname('n_red_icm').AsFloat;
        dados.Tributo := FloatToStr(NF.LocalizaICMSEcf( icms, Produto, NroSerie ))
      end
      else
        dados.Tributo := FloatToStr(NF.LocalizaICMSEcf(ICMS, Produto, NroSerie )); // localiza o icms conforme impressora
      MovNotasFiscaisN_PER_ICM.AsCurrency := Icms;
    end
    else
      dados.Tributo := FloatToStr(NF.LocalizaICMSEcf(ICMS, produto, NroSerie )); // localiza o icms conforme impressora

    if dados.Tributo = '0' then
       abort;

    dados.Quantidade := QtdPro;
    dados.Valor := valorPro;
    dados.DescReal := 0;
    dados.DescPercet := 0;
    if varia.Decimais = 2 then
      ECF.VendaItem( dados, true,  TipoTributo)
    else
      ECF.VendaItem( dados, false, TipoTributo );
    dados.Free;
  end;
end;

{ ************** deleta um item da nota ********************************** }
procedure TFVendaECF.deletaItemNota( NumeroItem : integer; sequencial : Integer; Produto : boolean );
begin
  if VersaoSistema = 1 then
    ECF.CancelamentoItemGenerico(NumeroItem);
  Aux.RequestLive := true;
  if Produto then
    AdicionaSQLAbreTabela(Aux, ' select * from MovNotasFiscais where i_emp_fil = ' +
                                 IntTostr(varia.CodigoEmpFil) +
                               ' and i_seq_not = ' + IntToStr(sequencial) +
                               ' and i_num_ite = ' + IntTostr(NumeroItem))
  else
    AdicionaSQLAbreTabela(Aux, ' select * from MovServicoNota where i_emp_fil = ' +
                                 IntTostr(varia.CodigoEmpFil) +
                               ' and i_seq_not = ' + IntToStr(sequencial) +
                               ' and i_num_ite = ' + IntTostr(NumeroItem));

  if not Aux.Eof then
  begin
     Aux.Delete;
     Aux.close;
     Aux.RequestLive := false;
     AtualizaSQLTabela(MostraItens);
     BFechaCupom.Enabled := not MostraItens.IsEmpty;
     BCancelaItem.Enabled := not MostraItens.IsEmpty;
  end;
  CalculaNota;
end;

{ ******************* Fecha o cupom fiscal ********************************** }
procedure TFVendaECF.FechaCupom;
var
  fechamentoOk : Boolean;
  TextoProm : TstringList;
begin
  if not MostraItens.IsEmpty then
  begin
    if (Econdicoes.Text <> '') or (FrmPagto.Text <> '') then
    begin
      Label10.Caption := '';
      if ConfigModulos.Servico then
        if cadNotasFiscaisN_VLR_PER.AsFloat <> 0 then
          RecalculaImposto; // rateio de imposto
      GravaCadNotasFiscais;

     if config.MostraTelaTroco then
       if (TipoFrmPagamento = 'D') or (TipoFrmPagamento = 'C') then
       begin
         FTotalPago  := TFTotalPago.CriarSDI(application, '', true);
         FTotalPago.ValorTroco(CadNotasFiscaisN_TOT_NOT.AsCurrency);
         FtotalPago.Free;
      end;


     if BaixaNota then
     begin

       if VersaoSistema = 1 then
       begin
          // verifica aciona gaveta
         if (varia.UsarGaveta = 'S') and (gaveta = 'S') then
           ECF.AcionaGaveta;

         try
           fechamentoOk := false;
           if ECF.IniciaFechamentoCupom( CadNotasFiscaisN_VLR_PER.AsCurrency, VlrPer.ItemIndex = 1, AcrDes.ItemIndex = 1) then
              if ECF.FormaPagamento( ECF.VerificaFrmPag( Label34.Caption), CadNotasFiscaisN_TOT_NOT.AsCurrency + troco) then
              begin
                 TextoProm := TStringList.create;
                 TextoProm.Text := varia.TextoPromocional.Text;
                 TextoProm.insert(0,'   ');
                 if CadNotasFiscaisC_NRO_PED.AsString <> '' then
                   TextoProm.insert(0,'Referente Pedido Nro : ' + CadNotasFiscaisC_NRO_PED.AsString)
                 else
                   if CadNotasFiscaisC_NRO_ORC.AsString <> '' then
                     TextoProm.insert(0,'Referente Orçamento Nro : ' + CadNotasFiscaisC_NRO_ORC.AsString);

                 TextoProm.insert(0,'Vendedor : ' + label1.Caption);
                 TextoProm.insert(0,'Cliente: ' + CadClientesC_NOM_CLI.AsString);
                 if ECF.fechacupom(TextoProm) then
                   fechamentoOk := true;
                 TextoProm.free;
              end;

            if fechamentoOk then
              fechamentoOk := ImpressaoCupomNaoFiscal = 0
            else     // caso algum erro no fechamento do cupom cancela tef
              if (config.UsaTEF) and ((TipoFrmPagamento = 'E') or (TipoFrmPagamento = 'T')) then // cartao e cheque eletronico
                UnTEF.CancelaECF;

            // marca ecf
            if fechamentoOk then
              ecf.MarcaECFFechado;

          except
            NF.CancelaCupomFiscal(CadNotasFiscaisI_SEQ_NOT.AsInteger);
            if (config.UsaTEF) and ((TipoFrmPagamento = 'E') or (TipoFrmPagamento = 'T')) then // cartao e cheque eletronico
                UnTEF.CancelaECF;   // cancela cartao
          end;
          end;

        LimpaVenda;
        LRetorno.Caption := ECF.Analisa_retorno(codigoErro);
        BFechar.Enabled := true;
        BIniciaCupom.Enabled := true;
        BCancelaCupom.Enabled := false;
        Paginas.ActivePage := TabSheet1;

     end;
   end
   else
      if LocalizaCondicaoPagto then
        FechaCupom;
  end
  else
  if Paginas.ActivePage = TabSheet1 then
    EProduto.SetFocus
  else
  if Paginas.ActivePage = TabSheet2 then
    EServico.SetFocus
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
               Tratamentos das tabelas cad e mov da nota
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ *************** abre uma nova nota fiscal ******************************** }
procedure TFVendaECF.AbreCadMovNotas;
begin
   AdicionaSQLAbreTabela(CadNotasFiscais,'Select * from CadNotaFiscais');
   cadNotasFiscais.Insert;
   CadNotasFiscaisI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
   CadNotasFiscaisI_NRO_LOJ.AsInteger := StrToInt(NumeroLoja);
   CadNotasFiscaisI_NRO_CAI.AsInteger := StrToInt(NumeroCaixa);
   CadNotasFiscaisI_NRO_TEC.AsInteger := StrToInt(NumeroIntTec);
   CadNotasFiscaisI_COD_CLI.AsInteger := strToInt(EditLocaliza4.Text);
   if CondicaoPagto <> 0 then
     CadNotasFiscaisI_COD_PAG.AsInteger := CondicaoPagto;
   CadNotasFiscaisC_FLA_ECF.AsString := 'S';
   CadNotasFiscaisD_DAT_EMI.AsDateTime := date;
   CadNotasFiscaisT_HOR_SAI.AsDateTime := time;
   CadNotasFiscaisC_TIP_NOT.AsString := 'S';
   cadNotasFiscaisC_DES_ACR.AsString := 'A';
   cadNotasFiscaisC_VLR_PER.AsString := 'V';
   CadNotasFiscaisD_DAT_SAI.AsDateTime := date;
   CadNotasFiscaisC_NOT_IMP.AsString := 'S';
   CadNotasFiscaisC_NOT_CAN.AsString := 'N';
   CadNotasFiscaisC_NOT_DEV.AsString := 'N';
   CadNotasFiscaisD_ULT_ALT.AsDateTime := date;
   CadNotasFiscaisI_COD_USU.AsInteger := varia.CodigoUsuario;
   CadNotasFiscaisC_SER_NOT.AsString := varia.SerieNota;
   CadNotasFiscaisC_COD_NAT.AsString := 'ECF';

   if config.FechaCupomAut  then
   begin
     CadNotasFiscaisI_COD_PAG.AsInteger := Varia.CondPagtoVista;
     FrmPagto.text := inttostr(Varia.FormaPagamentoPadrao);
     FrmPagto.Atualiza;
   end;  


   if CadNotasFiscais.State = dsInsert then
   begin
     // fecha e gera proximo sequencial da nota
     if not FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.StartTransaction;
     cadNotasFiscaisI_SEQ_NOT.AsInteger := ProximoCodigoFilial('CadNotaFiscais','I_SEQ_NOT','i_emp_fil',varia.CodigoEmpFil,FPrincipal.BaseDados);
     ecf.MarcaECFAberto(cadNotasFiscaisI_SEQ_NOT.AsInteger);
     CadNotasFiscais.Post;
     if FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.Commit;
     NF.LocalizaCadNotaFiscal(cadNotasFiscais, CadNotasFiscaisI_SEQ_NOT.AsInteger, varia.CodigoEmpFil );
     CadNotasFiscais.Edit;
   end;

   NF.LocalizaMovNotaFiscal(MovNotasFiscais, cadNotasFiscaisI_SEQ_NOT.AsInteger);
   NF.LocalizaItensNotaservico( MostraItens, CadNotasFiscaisI_SEQ_NOT.AsInteger );
   if ConfigModulos.Servico then
     NF.LocalizaMovServicoNota(MovServicoNota,CadNotasFiscaisI_SEQ_NOT.AsInteger);

  // atualiza vendedores
  CodVenCli := NF.VerificaVendedor(StrToInt(EditLocaliza4.text));
  if CodVenCli <> 0 then
    ECoDVendedor.Text := IntTostr(CodVenCli)
  else
    ECoDVendedor.Clear;
  ECoDVendedor.Atualiza;
  if config.TrancaVendedorNotaCupom then  // verifica se deve trancar o vendedor
  begin
    ECoDVendedor.Enabled := ECoDVendedor.Text = '';
    SpeedButton7.Enabled := ECoDVendedor.Text = '';
  end;

end;

{********************depois de inserir nova nota*******************************}
procedure TFVendaECF.CadNotasFiscaisAfterInsert(DataSet: TDataSet);
begin
   DescontoValido := '';
end;

{********************** apos gravar o mov notas fiscais ********************* }
procedure TFVendaECF.MovNotasFiscaisAfterPost(DataSet: TDataSet);
begin
  CalculaNota;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                   Tratamentos dos campos da nota fiscal
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************Coloca o MovnotasFiscais em Inserção************************}
procedure TFVendaECF.EProdutoEnter(Sender: TObject);
begin
  if not CadNotasFiscais.Active then
  begin
    AbreCadMovNotas;
    InicializaCupom;
  end;

  if CadNotasFiscais.Active Then
     if not(MovNotasFiscais.State in [dsedit,dsinsert]) then
        MovNotasFiscais.insert;
  Label10.Caption := '';
  label37.Caption := ''
end;

{*********************** Valida o  Produto ********************************** }
function TFVendaECF.ValidaProduto : Boolean;
var
  SeqPro : integer;
begin
  result := true;
  if MovNotasFiscais.State in [ dsedit, dsinsert ] then
  begin
    if NF.VerificaExisteProduto(MovNotasFiscaisC_COD_PRO.AsString, SeqPro) then // valida o campo codigo caso esteja vazio
      MovNotasFiscaisI_SEQ_PRO.AsInteger := SeqPro
    else
      result := AbreLocalizacaoProduto;
  end;
end;

{******************** localiza um produto *********************************** }
function TFVendaECF.AbreLocalizacaoProduto : Boolean;
var
  SeqPro :integer;
  codPro : string;
  cadastrou : boolean;
begin
   cadastrou := true;
   FLocalizaProduto := TFLocalizaProduto.CriarSDI(application,'',true);
   result := FLocalizaProduto.LocalizaProduto( cadastrou, seqpro, CodPro, EstoqueAtual, cadNotasFiscaisI_COD_CLI.Asinteger);
   if result then
   begin
     if not (MovNotasFiscais.State in [ dsEdit, dsInsert ]) then
       MovNotasFiscais.Insert;
     MovNotasFiscaisI_SEQ_PRO.AsInteger := SeqPro;
     MovNotasFiscaisC_COD_PRO.AsString := codPro;
   end;
end;

{*********** no exit do codigo do produto *********************************** }
procedure TFVendaECF.EProdutoExit(Sender: TObject);
begin
  if not TabSheet1.Focused then
    if (EProduto.Text <> '') and (MovNotasFiscais.State in [ dsEdit, dsInsert]) then
      if ValidaProduto then
      begin
        AdicionaItemsProduto(MovNotasFiscaisI_SEQ_PRO.AsInteger);
        if Config.GeraItemAutCupom then
         DBEditColor4Exit(nil)
        else
          if CUnidade.Enabled then
            CUnidade.SetFocus
          else
            EQuantidade.SetFocus;
      end;
end;

{*********** aciona o F3 do localiza produto ******************************** }
procedure TFVendaECF.EProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    Qdade : string;
begin
  if Key = 114 then
    AbreLocalizacaoProduto;
  if config.GeraItemAutCupom and (key = 120) then
    if EntradaNumero('Quantidade','Digite Quantidade', qdade,false,fprincipal.CorFoco.AFundoComponentes, FPrincipal.CorForm.ACorFormulario,false, varia.Decimais) then
      QdadeProduto := strtofloat(qdade);
end;

{*************** click do botao de localizar produto *********************** }
procedure TFVendaECF.SpeedButton1Click(Sender: TObject);
begin
  if CadNotasFiscais.State in [ dsEdit, dsInsert ] then
  begin
    EProduto.SetFocus;
    AbreLocalizacaoProduto;
  end;
end;

{********* adiciona os itens do produto localizado *************************** }
procedure TFVendaECF.AdicionaItemsProduto( SeqPro : Integer );
begin
  NF.LocalizaProdutoQdadeTabelaSeqPro(CadProdutos, SeqPro);
  label10.Caption := CadProdutos.FieldByName('C_NOM_PRO').AsString;
  label37.Caption := CadProdutos.FieldByName('C_NOM_PRO').AsString;
  try
    if varia.LayoutECF = 2 then
      if CadProdutos.FieldByName('C_PAT_FOT').AsString <> '' then
        foto.Picture.LoadFromFile(varia.DriveFoto + CadProdutos.FieldByName('C_PAT_FOT').AsString);
  except
  end;
  if CadProdutos.FieldByName('C_KIT_PRO').AsString = 'P' then
  begin
    Kit := false;
    MovNotasFiscaisI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
    MovNotasFiscaisI_SEQ_NOT.AsInteger := cadNotasFiscaisI_SEQ_NOT.AsInteger;
    MovNotasFiscaisC_COD_UNI.AsString := CadProdutos.FieldByname('c_cod_uni').AsString;
    MovNotasFiscaisN_VLR_PRO.AsFloat := CadProdutos.FieldByname('n_vlr_ven').AsFloat;
    MovNotasFiscaisN_PER_ICM.AsFloat := ICMSPAdrao;
    if  QdadeProduto <> 0 then
        MovNotasFiscaisN_QTD_PRO.AsFloat := QdadeProduto
    else
      MovNotasFiscaisN_QTD_PRO.AsFloat := 1;
    QdadeProduto := 0;
    MovNotasFiscaisD_ULT_ALT.AsDateTime := date;

    // icms
    if CadProdutos.FieldByname('n_red_icm').AsFloat <> 0 then  // caso haja reducao de icms
        MovNotasFiscaisN_PER_ICM.AsFloat := CadProdutos.FieldByname('n_red_icm').AsFloat;

    CUnidade.Enabled := true;
    CUnidade.Items := NF.UnidadesParentes(CadProdutos.FieldByname('c_cod_uni').AsString);
 end
 else
 begin
   if UnProdutos.TextoPossuiEstoque(1, EstoqueAtual,' kit ') then
   begin
     Kit := true;
     UnProdutos.TextoQdadeMinimaPedido( cadprodutos.fieldByName('n_qtd_ped').AsFloat,
                                        cadprodutos.fieldByName('n_qtd_min').AsFloat,
                                        1);
     CUnidade.Enabled := false;
     CUnidade.Text := 'Kit';
     MovNotasFiscaisN_VLR_PRO.AsFloat := CadProdutos.FieldByname('n_vlr_ven').AsFloat;
     MovNotasFiscaisN_QTD_PRO.AsFloat := 1;
   end
   else
   begin
     MovNotasFiscais.Cancel;
     EProduto.SetFocus;
     abort;
   end;
 end;
end;

{********* adiciona os itens do Servico localizado *************************** }
procedure TFVendaECF.AdicionaItemsServico( CodSer : Integer );
begin
  MovServicoNotaI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
  MovServicoNotaI_SEQ_NOT.AsInteger := cadNotasFiscaisI_SEQ_NOT.AsInteger;
  MovServicoNotaI_COD_SER.AsInteger := CodSer;
  MovServicoNotaI_COD_EMP.AsInteger := Varia.CodigoEmpresa;
  MovServicoNotaN_VLR_SER.AsFloat := nf.RetornaValorServico(CodSer);
  MovServicoNotaN_ALI_SER.AsFloat := Varia.ISSQN;
  MovServicoNotaN_QTD_SER.AsFloat := 1;
  MovServicoNotaD_ULT_ALT.AsDateTime := date;
end;

{************* calcula o valor total dos produtos *************************** }
procedure TFVendaECF.MovNotasFiscaisN_QTD_PROChange(Sender: TField);
begin
  if MovNotasFiscais.State in [ dsInsert, dsEdit ] then
      DBeditColor4.Field.AsFloat := MovNotasFiscaisN_VLR_PRO.AsFloat  * MovNotasFiscaisN_QTD_PRO.AsFloat;
end;


{ ************* grava novo item da nota e imprime novo item no ecf *********** }
procedure TFVendaECF.DBEditColor4Exit(Sender: TObject);
var
  ignorar : Boolean;
begin
  ignorar := true;
  if (MovNotasFiscaisN_VLR_PRO.AsCurrency <= 0) or (MovNotasFiscaisN_QTD_PRO.AsCurrency = 0 ) then
  begin
    ignorar := false;
    aviso('Não pode haver valores zerados, ou menor que zero!');
    EQuantidade.SetFocus;
  end;


  if (EProduto.Text <> '') and (ignorar) then
  begin
    if CadProdutos.FieldByName('C_KIT_PRO').AsString = 'P' then
    begin
       if not UnProdutos.VerificaEstoque( MovNotasFiscaisC_COD_UNI.AsString, cadProdutos.fieldByName('c_cod_uni').AsString, MovNotasFiscaisN_QTD_PRO.AsFloat,MovNotasFiscaisI_SEQ_PRO.AsString) then
       begin
           EProduto.SetFocus;
           abort;
       end
       else
       begin
         UnProdutos.TextoQdadeMinimaPedido( cadprodutos.fieldByName('n_qtd_ped').AsFloat,
                                            cadprodutos.fieldByName('n_qtd_min').AsFloat,
                                            MovNotasFiscaisN_QTD_PRO.AsFloat);

        ImprimeItem( MovNotasFiscaisC_COD_PRO.AsString ,cadProdutos.fieldByName('C_NOM_PRO').AsString,
                     MovNotasFiscaisN_QTD_PRO.AsCurrency, MovNotasFiscaisN_VLR_PRO.AsCurrency, true );
        inc(ContaItem);
        MovNotasFiscaisI_NUM_ITE.AsInteger := ContaItem;

        if not FPrincipal.BaseDados.InTransaction then
          FPrincipal.BaseDados.StartTransaction;
        MovNotasFiscaisI_SEQ_MOV.AsInteger := ProximoCodigoFilial('movnotasfiscais','i_seq_mov','i_emp_fil',varia.CodigoEmpFil,FPrincipal.BaseDados);
        MovNotasFiscais.Post;
        if FPrincipal.BaseDados.InTransaction then
          FPrincipal.BaseDados.Commit;
      end;
    end
    else
       AdicionaKit( MovNotasFiscaisN_QTD_PRO.AsFloat );

    EProduto.SetFocus;
    AtualizaSQLTabela(MostraItens);
    MostraItens.last;
    BFechaCupom.Enabled := not MostraItens.IsEmpty;
    BCancelaItem.Enabled := not MostraItens.IsEmpty;
  end;
end;

{*************** adiciona os produtos de um Kit *************************** }
procedure TFVendaECF.AdicionaKit( QtdKit : double );
begin
   NF.LocalizaKit(Aux, MovNotasFiscaisi_seq_pro.AsInteger );

  if MovNotasFiscais.State in [ dsInsert, dsEdit] then
    MovNotasFiscais.cancel;
  CalcularNota := false;
  MovNotasFiscais.DisableControls;
  while not Aux.Eof do
  begin
       MovNotasFiscais.Insert;
       MovNotasFiscaisI_EMP_FIL.AsInteger := varia.CodigoEmpFil;
       MovNotasFiscaisI_SEQ_MOV.AsInteger := ProximoCodigoFilial('movnotasfiscais','i_seq_mov','i_emp_fil',varia.CodigoEmpFil,FPrincipal.BaseDados);
       MovNotasFiscaisI_SEQ_NOT.AsInteger := CadNotasFiscaisI_SEQ_NOT.AsInteger;
       MovNotasFiscaisC_COD_PRO.AsString := Aux.fieldbyname(Varia.CodigoProduto).AsString;
       MovNotasFiscaisI_SEQ_PRO.AsInteger :=  Aux.fieldByname('i_seq_pro').AsInteger;
       MovNotasFiscaisC_COD_UNI.AsString := Aux.fieldByname('c_cod_uni').AsString;
       MovNotasFiscaisN_QTD_PRO.AsFloat := Aux.fieldByname('n_qtd_pro').AsFloat *  QtdKit;
       MovNotasFiscaisN_VLR_PRO.Ascurrency := ( Aux.fieldByName('VlrReal').AsCurrency * ( 1 - (Aux.FieldbyName('N_Per_Kit').AsFloat /100)));
       MovNotasFiscaisN_TOT_PRO.AsCurrency := (Aux.fieldByname('n_qtd_pro').AsFloat * QtdKit) * MovNotasFiscaisN_VLR_PRO.Ascurrency;
       MovNotasFiscaisD_ULT_ALT.AsDateTime := date;

       if Aux.FieldByName('N_RED_ICM').AsFloat <> 0 then  // verifiaca icms
          MovNotasFiscaisN_PER_ICM.AsFloat := Aux.fieldByName('N_RED_ICM').AsFloat
       else
          MovNotasFiscaisN_PER_ICM.AsFloat := ICMSPadrao;

       inc(ContaItem);
       MovNotasFiscaisI_NUM_ITE.AsInteger := ContaItem;

      ImprimeItem( MovNotasFiscaisC_COD_PRO.AsString, Aux.fieldbyname('c_nom_pro').AsString,
                  MovNotasFiscaisN_QTD_PRO.AsCurrency, MovNotasFiscaisN_VLR_PRO.AsCurrency, true );

       MovNotasFiscais.Post;

       Aux.Next;
  end;
  CalcularNota := true;
  CalculaNota;
  MovNotasFiscais.EnableControls;
end;


{***************** calcula o  valor conforme unidade *********************** }
procedure TFVendaECF.CUnidadeChange(Sender: TObject);
begin
  MovNotasFiscaisN_VLR_PRO.AsFloat := NF.CalculaValorPadrao( CUnidade.text,
                                                             CadProdutos.FieldByname('c_cod_uni').AsString,
                                                             CadProdutos.FieldByname('n_vlr_ven').AsFloat,
                                                             MovNotasFiscaisI_SEQ_PRO.AsInteger );
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
             Chamadas das funcoes dos componentes inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************ no exit da condicao localiza ********************************* }
procedure TFVendaECF.EcondicoesExit(Sender: TObject);
begin
  if (not LocalizaCondicaoPagto) and (BCancelaCupom.Focused) then
    Econdicoes.SetFocus;
end;

{************* F3 localiza condicao de pagamento ***************************** }
procedure TFVendaECF.EcondicoesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 114 then
  begin
    Econdicoes.SetFocus;
    ECoDVendedor.SetFocus;
  end;
end;

{************** Localiza Condicao de pagto ********************************** }
function TFVendaECF.LocalizaCondicaoPagto : Boolean;
var
  VpfValor, VpfValorNota, VpfDiferencaValor, VpfPercComPro, VpfPercComServ : Double;
  VpfcodPag, VpfCodVen, CodFrmPgto : Integer;
  VpfNomeCond : string;
  PercExistente : double;
begin
  // naum tenha gravado o mov nota
  if MovNotasFiscais.State in [ dsEdit, dsInsert ] then
    MovNotasFiscais.cancel;

  if not(CadNotasFiscais.State in [ dsEdit, dsInsert ]) then
    cadNotasFiscais.edit;

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
    VpfPercComServ := EPercServ.AValor;

    if ECoDVendedor.text <> '' then
      VpfCodVen := StrToInt(ECoDVendedor.text)
    else
      VpfCodVen := 0;

    CodFrmPgto := 0;
    if FrmPagto.Text <> '' then
      CodFrmPgto := StrToInt(FrmPagto.Text);

    // verifica o valor a calcular, - frete, seguro, outras ace...
    VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency ;

    ValorCalcularComissao := nf.ValorComissaoCFGProduto( cadNotasFiscaisN_TOT_NOT.AsCurrency,
                                                         cadNotasFiscaisN_TOT_PRO.AsCurrency,
                                                         cadNotasFiscaisN_VLR_ICM.AsCurrency, 0,0 );

    FConsultaCondicaoPgto := TFConsultaCondicaoPgto.CriarSDI(Application,'',true);
    Vpfvalor := FConsultaCondicaoPgto.VisualizaParcelasFrmVendedor( VpfValorNota,
                                                                    VpfcodPag, CodFrmPgto, VpfCodVen,
                                                                    VpfPercComPro,VpfPercComServ, ValorCalcularComissao, VpfNomeCond, true );

    if VpfcodPag <> 0 then
    begin
      cadNotasFiscaisI_COD_PAG.AsInteger := VpfcodPag;
      label12.Caption := VpfNomeCond;

      if  VpfCodVen <> 0 then
      begin
        cadNotasFiscaisI_COD_VEN.AsInteger := VpfCodVen;
        ECoDVendedor.Atualiza;
        EPercPro.AValor := VpfPercComPro;
        EPercServ.AValor := VpfPercComServ;
      end;

       if CodFrmPgto <> 0 then
       begin
          FrmPagto.Text := IntToStr(CodFrmPgto);
          FrmPagto.Atualiza;
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

{*************** click no botao localiza condicao de pagamento ************** }
procedure TFVendaECF.SpeedButton5Click(Sender: TObject);
begin
  Econdicoes.SetFocus;
  if ECoDVendedor.Enabled then
    ECoDVendedor.SetFocus
  else
    FrmPagto.SetFocus;
end;

{**************** calcula o valor da nota *********************************** }
procedure TFVendaECF.CalculaNota;
var
  icms, ipi, TotalProduto, TotalNota, ISSQN, ValorServico, ICMSProdutos : double;
  Emitente : Boolean;
begin


  if CalcularNota then
  begin
     NF.CalculaServico(ISSQN, ValorServico, cadNotasFiscaisI_SEQ_NOT.AsInteger);
     cadNotasFiscaisN_VLR_ISQ.AsCurrency := ISSQN;
     cadNotasFiscaisN_TOT_SER.AsCurrency := ValorServico;

    Emitente := false;

    icms := 0;
    TotalProduto := 0;
    TotalNota := 0;
    Ipi := 0;

      NF.CalculaNota( cadNotasFiscaisN_VLR_PER.AsFloat, 0, 0, 0,
                      ICMSPadrao, CadNotasFiscaisN_TOT_SER.AsCurrency, cadNotasFiscaisI_SEQ_NOT.AsInteger, Emitente,false,
                      icms,ICMSProdutos, ipi,totalProduto,TotalNota,cadNotasFiscaisC_DES_ACR.AsString,
                      cadNotasFiscaisC_VLR_PER.AsString );

      CadNotasFiscaisN_VLR_ICM.Value := icms;

      CadNotasFiscaisN_TOT_PRO.Value := TotalProduto;

      CadNotasFiscaisN_TOT_NOT.Value := TotalNota;

      CadNotasFiscaisN_BAS_CAL.Value := TotalNota;

      CadNotasFiscaisN_TOT_IPI.Value := 0;
  end;
end;

{******************* rateia o imposto dos servico e produtos *****************}
Procedure TFVendaECF.RecalculaImposto;
var
  PercentualPro,PercentualSer, Desco_Acres : Double;
  icms, ipi, TotalProduto, TotalNota, ISSQN, ValorServico, ICMSProdutos : double;
  Emitente : Boolean;
begin

  if cadNotasFiscaisC_VLR_PER.AsString = 'V' then  // caso valor
  begin
    if cadNotasFiscaisN_TOT_SER.AsCurrency > CadNotasFiscaisN_TOT_PRO.AsCurrency then
    begin
      PercentualSer := (CadNotasFiscaisN_TOT_PRO.AsCurrency / cadNotasFiscaisN_TOT_SER.AsCurrency) * 100;
      PercentualPro :=  100 - PercentualSer;
    end
    else
      if cadNotasFiscaisN_TOT_SER.AsCurrency = CadNotasFiscaisN_TOT_PRO.AsCurrency then
      begin
        PercentualPro := 50;
        PercentualSer := 50;
      end
      else
        if  CadNotasFiscaisN_TOT_PRO.AsCurrency > cadNotasFiscaisN_TOT_SER.AsCurrency then
        begin
          PercentualPro := (cadNotasFiscaisN_TOT_SER.AsCurrency / CadNotasFiscaisN_TOT_PRO.AsCurrency) * 100;
          PercentualSer := 100 -  PercentualPro;
        end;
  end;

  if CalcularNota then
  begin
     if cadNotasFiscaisC_VLR_PER.AsString = 'V' then  // caso valor
       Desco_Acres := ((cadNotasFiscaisN_VLR_PER.AsFloat * (PercentualSer/100))*
                      (varia.ISSQN / 100))
     else
       Desco_Acres := (cadNotasFiscaisN_VLR_ISQ.AsCurrency * (cadNotasFiscaisN_VLR_PER.AsFloat/100));

   if CadNotasFiscaisC_DES_ACR.AsString = 'A' then
     cadNotasFiscaisN_VLR_ISQ.AsCurrency := cadNotasFiscaisN_VLR_ISQ.AsCurrency + Desco_Acres
   else
     cadNotasFiscaisN_VLR_ISQ.AsCurrency := cadNotasFiscaisN_VLR_ISQ.AsCurrency - Desco_Acres;

    Emitente := false;
    icms := 0;
    TotalProduto := 0;
    TotalNota := 0;
    Ipi := 0;
    if cadNotasFiscaisC_VLR_PER.AsString = 'V' then  // caso valor
      Desco_Acres := cadNotasFiscaisN_VLR_PER.AsFloat * (PercentualPro / 100)
    else
      Desco_Acres := cadNotasFiscaisN_VLR_PER.AsFloat;

      NF.CalculaNota( Desco_Acres, 0, 0, 0,
                      ICMSPadrao, CadNotasFiscaisN_TOT_SER.AsCurrency, cadNotasFiscaisI_SEQ_NOT.AsInteger, Emitente,false,
                      icms,ICMSProdutos, ipi,totalProduto,TotalNota,cadNotasFiscaisC_DES_ACR.AsString,
                      cadNotasFiscaisC_VLR_PER.AsString );

      CadNotasFiscaisN_VLR_ICM.Value := icms;
      CadNotasFiscaisN_BAS_CAL.Value := TotalNota;
  end;
end;

{**************** calcula o valor de desconto ou acrescimos ***************** }
function TFVendaECF.CalculaValorDescAcr : Double;
begin
  if CadNotasFiscaisN_VLR_PER.AsCurrency <> 0 then
  begin
    if VlrPer.ItemIndex =  0 then
      result := CadNotasFiscaisN_VLR_PER.AsCurrency
    else
      result := CadNotasFiscaisN_TOT_PRO.AsCurrency * ( CadNotasFiscaisN_VLR_PER.AsCurrency / 100 );
  end;
end;

{************** calcula o valor de desconto ou acrescimo da nota ************ }
procedure TFVendaECF.EDescAcrChange(Sender: TObject);
begin
  if CadNotasFiscais.State in [ dsEdit, dsInsert ] then
    CadNotasFiscaisN_DES_ACR.AsCurrency := CalculaValorDescAcr;
end;

{**************** muda o picture do valor conforme tipo VlR ou Perc ********** }
procedure TFVendaECF.VlrPerClick(Sender: TObject);
begin
  if VlrPer.ItemIndex = 0 then
    cadNotasFiscaisN_VLR_PER.DisplayFormat := Varia.MascaraMoeda
  else
   cadNotasFiscaisN_VLR_PER.DisplayFormat := '##0.00 %';
end;

{******************** no exite dos RadioGroup ****************************** }
procedure TFVendaECF.AcrDesExit(Sender: TObject);
begin
  if DescontoValido <> (EPercPro.Text + IntToStr(VlrPer.ItemIndex) + IntToStr(AcrDes.ItemIndex)) then
    if not UnProdutos.ValidaDesconto( cadNotasFiscaisN_TOT_NOT.AsCurrency, cadNotasFiscaisN_VLR_PER.AsCurrency,
                                      VlrPer.ItemIndex = 1, FPrincipal.CorForm.ACorPainel, FPrincipal.CorFoco.AFundoComponentes ) then
    begin
      EDescAcr.SetFocus;
      abort;
    end
    else
      DescontoValido := EPercPro.Text + IntToStr(VlrPer.ItemIndex) + IntToStr(AcrDes.ItemIndex);

  // desconto maior que o valor da nota
  if CadNotasFiscaisN_VLR_PER.AsCurrency <> 0 then
  begin
    if (CadNotasFiscaisN_VLR_PER.AsCurrency >= CadNotasFiscaisN_TOT_NOT.AsCurrency)
       and (VlrPer.ItemIndex = 0) then
    begin
      aviso(CT_DescontoMaiorNota);
      EDescAcr.SetFocus;
    end
    else
      calculaNota;
  end;
end;

{************* muda o texto conforme Acr ou desconto ************************ }
procedure TFVendaECF.AcrDesClick(Sender: TObject);
begin
  if AcrDes.ItemIndex  = 0 then
    label6.Caption := 'Acrescimo : '
  else
    label6.Caption := 'Desconto : '
end;

{***************  fecha o cupom fiscal *************************************** }
procedure TFVendaECF.DBEditColor1Exit(Sender: TObject);
begin
  FechaCupom;
end;

{******************** select da forma de pagamento ************************* }
procedure TFVendaECF.FrmPagtoSelect(Sender: TObject);
begin
  FrmPagto.ASelectLocaliza.clear;
  FrmPagto.ASelectLocaliza.Add(' Select * from CadFormasPagamento ' +
                               ' Where C_Nom_frm like ''@%'' ' );
  FrmPagto.ASelectValida.clear;
  FrmPagto.ASelectValida.Add(' Select * from CadFormasPagamento ' +
                             ' Where I_cod_frm = @ ' );

  if not config.UsaTEF then
  begin
    FrmPagto.ASelectLocaliza.Add( ' and c_fla_tip <> ''T'' ' +
                                  ' and c_fla_tip <> ''E'' ' );
    FrmPagto.ASelectValida.Add( ' and c_fla_tip <> ''T'' ' +
                                  ' and c_fla_tip <> ''E'' ' );
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                Chamadas das funcoes dos botoes Inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*************** cancela um cuponm fiscal ********************************** }
procedure TFVendaECF.BCancelaCupomClick(Sender: TObject);
begin
  GravaCadNotasFiscais;
  if VersaoSistema = 1 then
  begin
    if MostraItens.IsEmpty then
    begin
      ICMSPadrao := 17;
      ImprimeItem('000','Cancelamento cupom',1,1, true);
    end;
    ECF.CancelaCupomAnterior;
    LRetorno.Caption := ECF.Analisa_retorno(codigoerro);
  end;
  EstornaCupon;
  BFechar.Enabled := true;
  BIniciaCupom.Enabled := true;
  BCancelaCupom.Enabled := false;
  BCancelaItem.Enabled := false;
  BFechaCupom.Enabled := false;
  ECF.MarcaECFFechado;
  LimpaVenda;
  Paginas.ActivePage := TabSheet1;
end;

{************* deleta um item do cupom ************************************* }
procedure TFVendaECF.BCancelaItemClick(Sender: TObject);
begin
  DeletaItemNota(MostraItensI_NUM_ITE.AsInteger, MostraItensI_SEQ_NOT.AsInteger, MostraItensTIPO.AsString = 'P' );
end;

{***********************  abre cupom de ECF ********************************* }
procedure TFVendaECF.BFecharClick(Sender: TObject);
begin
  PermiteFechar := true;
  self.close;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         gerar cupom nao fiscal
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

function TFVendaECF.ImpressaoCupomNaoFiscal : integer;
var
  Vencimentos, Valores, TextoECF : TStringList;
  laco : integer;
begin
   if VersaoSistema = 1 then
   begin
     if (nf.ImprimirCuponNaoFiscal(strToint(Econdicoes.Text)) = 'S') and
        (TipoFrmPagamento <> 'E') and  (TipoFrmPagamento <> 'T') then // cartao e cheque eletronico
     begin
        Vencimentos := UnCR.VencimentosGeradas;
        Valores := UnCR.ParcelasGeradas;
        result := ECF.AbreComprovanteNaoFiscal(Label34.Caption);
        try
          ECF.MensagemComprovanteNaoFiscal('Nome : ' + CadClientesC_NOM_CLI.AsString );
          ECF.MensagemComprovanteNaoFiscal('Rua : ' + CadClientesC_END_CLI.AsString + ' - ' + CadClientesI_NUM_END.AsString );
          ECF.MensagemComprovanteNaoFiscal('Bairro : ' + CadClientesC_BAI_CLI.AsString );
          ECF.MensagemComprovanteNaoFiscal('Municipio : ' + CadClientesC_CID_CLI.AsString + ' - CEP : ' + CadClientesC_CEP_CLI.AsString);
          ECF.MensagemComprovanteNaoFiscal('Fone : ' + CadClientesC_FO1_CLI.AsString);
          ECF.MensagemComprovanteNaoFiscal('Con.Pgto : ' + label12.Caption );
          ECF.MensagemComprovanteNaoFiscal('Parcelas ');
          for laco := 0 to Valores.Count - 1 do
              ECF.MensagemComprovanteNaoFiscal(IntToStr(laco + 1) + ': Venc. : ' + Vencimentos.Strings[laco] +
                                               ' - ' + AdicionaBrancoE(FormatFloat(varia.MascaraMoeda, StrToFloat(Valores.Strings[laco])),13)+ #13 + #10);
          ECF.MensagemComprovanteNaoFiscal(#13 + #10);
          ECF.MensagemComprovanteNaoFiscal('Recebi os Produtos constantes neste ');
          ECF.MensagemComprovanteNaoFiscal('cupom fiscal no qual o reconheco e  ');
          ECF.MensagemComprovanteNaoFiscal('pagarei a divida para ');
          ECF.MensagemComprovanteNaoFiscal(varia.NomeFilial + #13 + #10);
          ECF.MensagemComprovanteNaoFiscal('Ass. Cliente : ________________________________');
          ECF.MensagemComprovanteNaoFiscal(#13 + #10);
          ECF.MensagemComprovanteNaoFiscal('Data Recebimento : _____/_____/_____');
          ECF.FechaCupomSemICMS;
        except
          result := 2;
        end;
     end;

     if (config.UsaTEF) then
       if (TipoFrmPagamento = 'E') or (TipoFrmPagamento = 'T') then // cartao e cheque eletronico
       begin
          result := UnTEF.ImprimeTextoECFSemLeitura(label34.Caption,2);
          if result = 1 then  // erro e reimpresao
          begin
            ECF.CancelaCupomAnterior; // cancela o cupom vinculado
            result := Untef.ImprimeTextoECFComLeitura;
          end;
       end;
  end;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Eventos Diversos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************ estorna o cupom fiscal ***************************************** }
procedure TFVendaECF.EstornaCupon;
begin
  NF.CancelaCupomFiscal(CadNotasFiscaisI_SEQ_NOT.AsInteger);
end;

{ ******************* grava o cab da nota fiscal ***************************** }
procedure TFVendaECF.GravaCadNotasFiscais;
begin
  if CadNotasFiscais.State in [ dsInsert, dsEdit ] then
  begin
    CadNotasFiscaisI_NRO_NOT.AsInteger := StrToInt(NumeroCupom);
    CadNotasFiscais.post;
  end;
end;

{************** quando precionar um tecla *********************************** }
procedure TFVendaECF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // F4
  if key = 115 then
  begin
    if (EProduto.Focused) or (Grade.Focused) or (EServico.Focused) or (DBEditColor8.Focused) or (DBEditColor9.Focused) then
    begin
      if (MovNotasFiscaisC_COD_Pro.IsNull) then
        MovNotasFiscais.Cancel;
      if Varia.LayoutECF <> 0 then
        EDescAcr.SetFocus
      else
        Econdicoes.SetFocus;
    end
    else
      if PossuiFoco(Painel) then
        if Paginas.ActivePage = TabSheet1 then
           EProduto.SetFocus
        else
        if Paginas.ActivePage = TabSheet2 then
           EServico.SetFocus;
  end;

    // F5 inicia cupom
  if key = 116 then
    if BIniciaCupom.Enabled then
      BIniciaCupom.Click;

  // F6 fecha cupom
  if key = 117 then
    if BFechaCupom.Enabled then
    begin
      BFechaCupom.SetFocus;
      FechaCupom;
    end;

  // F7 Muda Produto Servico
  if key = 118 then
    if (TabSheet2.TabVisible) and (Paginas.Enabled) then
    begin
      if Paginas.ActivePage = TabSheet1 then
        Paginas.ActivePage := TabSheet2
      else
      if Paginas.ActivePage = TabSheet2 then
        Paginas.ActivePage := TabSheet1
        else
        if Paginas.ActivePage = TabSheet3 then
          Paginas.ActivePage := TabSheet1;
      PaginasChange(paginas);
    end
    else
      if Paginas.Enabled then
        EProduto.SetFocus;

  // F8 adiciona Pedido / Orcamento
  if key = 119 then
    if (TabSheet3.TabVisible) and (Paginas.Enabled) then
    begin
       Paginas.ActivePage := TabSheet3;
       if  DBEditColor8.Visible then
         DBEditColor8.SetFocus
       else
         DBEditColor9.SetFocus;
    end;

end;

{***********************Limpa a venda do cupom fiscal**************************}
procedure TFVendaECF.LimpaVenda;
begin
   EditLocaliza4.Clear;
   if self.Visible then
     EditLocaliza4.Atualiza;

   FrmPagto.Clear;
   if self.Visible then
     FrmPagto.Atualiza;
   NroCupom.Caption := '0';
   EPercPro.AValor := 0;

   if self.Visible then
     EditLocaliza4.SetFocus;

   foto.Picture := nil;

   CadNotasFiscais.close;
   MovNotasFiscais.close;
   CadClientes.close;
   MostraItens.close;
end;

{************** atualiza contas a receber, comissoes e estoque ************** }
function TFVendaECF.BaixaNota : Boolean;
var
  VpfValorNota, ValorTotal : Double;
  unidade : string;
  Dado : TDadosNovaContaCR;
  ValorPro : TstringList;
  PercPro : TstringList;
  LancamentoCR, FormaPgto : Integer;
begin

  result := true;
  Troco := 0;

    Tempo.execute('Atualizando informações ... ');
  //localiza natureza de cupom  
  NF.LocalizaNatureza(CadNatureza,'ECF');

  if CodVenCli <> cadNotasFiscaisI_COD_VEN.AsInteger then
    nf.AdicionaVendedor(cadNotasFiscaisI_COD_VEN.AsInteger, cadNotasFiscaisI_COD_CLI.AsInteger);

    // verifica se o desconto esta na condicao de pagto, par naum duplicar os desc ou acre
    // se  EDescAcr.Enabled = true descontlo na nota false na condicao
    if EDescAcr.Enabled then
      VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency
    else
      VpfValorNota := cadNotasFiscaisN_TOT_NOT.AsCurrency - EDescAcr.Field.AsCurrency;

     if CadNatureza.FieldByName('C_GER_FIN').AsString = 'S' then
     begin
        Dado := TDadosNovaContaCR.Create;
        Dado.CodEmpFil := Varia.CodigoEmpFil;
        Dado.NroNota := cadNotasFiscais.FieldByName('I_NRO_NOT').AsInteger;
        Dado.SeqNota := cadNotasFiscais.FieldByName('I_SEQ_NOT').AsInteger;
        Dado.CodCondicaoPgto := cadNotasFiscais.FieldByName('I_COD_PAG').AsInteger;
        Dado.CodCliente := cadNotasFiscais.FieldByName('I_COD_CLI').AsInteger;
        Dado.CodFrmPagto := StrToInt(FrmPagto.text);

        Dado.CodMoeda :=  varia.MoedaBase;
        Dado.CodUsuario := varia.CodigoUsuario;
        Dado.DataMov := date;
        Dado.DataEmissao := date;
        Dado.PlanoConta := varia.PlanoContaEcf;
        Dado.ValorTotal := VpfValorNota;
        Dado.PercentualDescAcr := 0;
        Dado.VerificarCaixa := true;
        Dado.BaixaConta := true;
        dado.DataBaixa := date;
        Dado.MostrarParcelas := false;
        Dado.MostrarTelaCaixa := true;
        Dado.TipoFrmPAgto :=  TipoFrmPagamento;
        Dado.perDescontoDoCliente := cadClientes.fieldByName('N_DES_BOL').ascurrency;
        Dado.GerarComissao := true;
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
             Dado.ValorComPro := ValorCalcularComissao;
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
        LancamentoCR := UnCR.CriaContaReceber( dado, ValorTotal,  troco, FormaPgto, true );
        if FrmPagto.Text <> IntToStr(FormaPgto) then  // caso  mude de forma
        begin
          FrmPagto.Text := IntToStr(FormaPgto);
          FrmPagto.Atualiza;
          Label34.Refresh;
        end;
        Dado.free;
        if LancamentoCR = 0 then
          result := false;
     end;

  // baixa em estoque
  if result then
  begin
    if ConfigModulos.Estoque then
    begin
      if CadNatureza.FieldByName('C_BAI_EST').AsString = 'S' then
      begin
        Tempo.execute('Atualizando Estoque Produto...');
        MostraItens.DisableControls;
        MostraItens.First;
        while not MostraItens.Eof do
        begin
          if MostraItensTIPO.AsString = 'P' then // produto
          begin
            Unidade := UnProdutos.UnidadePadrao(MostraItensI_SEQ_PRO.AsInteger);
            UnProdutos.BaixaProdutoEstoque( MostraItensI_SEQ_PRO.AsInteger,
                                            varia.CodigoOpeEstEcf,
                                            MostraItensI_SEQ_NOT.AsInteger,
                                            cadNotasFiscaisI_NRO_NOT.AsInteger,
                                            varia.MoedaBase, 0, cadNotasFiscaisD_DAT_EMI.AsDateTime,
                                            MostraItensN_QTD_PRO.AsFloat,
                                            MostraItensN_TOT_PRO.AsFloat,
                                            MostraItensC_COD_UNI.AsString,
                                            unidade);
           end;
           MostraItens.Next;
         end;
         MostraItens.EnableControls;
      end;
    end;
  end;

  if CadNotasFiscaisI_LAN_ORC.AsInteger <> 0 then
  begin
    UnCotacao.BaixaOrcamento(CadNotasFiscaisI_LAN_ORC.AsString, CadNotasFiscaisC_NRO_PED.AsString <> '');
    UnCotacao.NotasDoOrcamento(CadNotasFiscaisI_LAN_ORC.AsString);
  end;

  Tempo.fecha;
end;


procedure TFVendaECF.DBEditColor3Exit(Sender: TObject);
begin
  if ValorUnitario <> MovNotasFiscaisN_VLR_PRO.AsCurrency then
    if not UnProdutos.ValidaAlterarValorUnitario( FPrincipal.CorForm.ACorPainel, FPrincipal.CorFoco.AFundoComponentes ) then
    begin
      MovNotasFiscaisN_VLR_PRO.AsCurrency := ValorUnitario;
      DBEditColor3.SetFocus;
      abort;
    end;
end;

procedure TFVendaECF.DBEditColor3Enter(Sender: TObject);
begin
  ValorUnitario := MovNotasFiscaisN_VLR_PRO.AsCurrency;
end;

procedure TFVendaECF.FrmPagtoRetorno(Retorno1, Retorno2: String);
begin
  if Retorno1 <> '' then
  begin
    TipoFrmPagamento := Retorno1;
    gaveta := retorno2;
    BConsultaCheque.Enabled := TipoFrmPagamento = 'C';
  end
  else
    BConsultaCheque.Enabled := false;
end;

procedure TFVendaECF.BFechaCupomClick(Sender: TObject);
begin
   FechaCupom;
end;

{)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
                 Layout de ecf
((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((}

procedure  TFVendaECF.ConfiguraLayout( layout : Integer );
begin
 case layout of  //0 nao faz nada, usa o padrao
   1,2 : begin
         Label73.visible := false;
         Config.MostraDadosClienteCupom := false;
         grade.Columns[0].Visible := false;
         grade.Columns[1].Visible := false;
         grade.Columns[6].Visible := false;
         grade.Columns[2].Width := 276;
         grade.Columns[3].Width := 50;
         grade.Columns[4].Width := 80;
         grade.Columns[5].Width := 170;
         grade.Columns[7].Width := 170;
         grade.Font.Size := varia.TamanhoFonteECF;
         painelpro.Height := 96;
         PainelPro.Visible := true;
         label7.Visible := false;
         label10.Visible := false;
         paginas.Height := 96;
         AlteraVisible( [label8,Label6,label32,label23, DBEditColor7, DBEditColor5, DBEditColor2,
                         DBEditColor1,Label11,Label30,Label29,Econdicoes,ECoDVendedor,
                         FrmPagto,SpeedButton5,SpeedButton7,SpeedButton8,label12,label1,label34,
                         EPercPro], false);
         label31.Top := 12;
         EDescAcr.top := 12;
         AcrDes.Top := 1;
         VlrPer.Top := 1;
         painel.Height := 48;
       end;
 end;

 if layout = 2 then
 begin
   Label43.Visible := false;
   label44.Visible := false;
   PainelFoto.Visible := true;
   PainelFoto.top := 150;
   EProduto.Width := 270;
   grade.Visible := false;
   paginas.Align := alClient;
   ConfiguraEdit( 328,10,varia.TamanhoFonteECF,[label2,label4,label9,label3,label5],
                  [eproduto,cunidade,Equantidade, dbeditcolor3, dbeditcolor4],
                  [speedButton1,nil,nil,nil,nil],[nil,nil,nil,nil,nil]);
   ConfiguraEdit( 328,10,varia.TamanhoFonteECF,[label38,label40,label41,label42],
                  [eservico,EqtdServico, DBEditNumerico2, DBEditColor6],
                  [speedButton2,nil,nil,nil,nil],[nil,nil,nil,nil,nil]);

 end;
end;

procedure TFVendaECF.AlteraVisible( comp : array of Tcontrol; Acao : Boolean);
var
  laco : Integer;
begin
  for laco := low(comp) to high(comp) do
   comp[laco].Visible := acao;
end;


procedure TFVendaECF.ConfiguraEdit( PosxEditInicial,PosyEditInicial, tamanhoFonte : Integer;  texto : array of Tlabel; Edit : array of TWincontrol; botao : array of TSpeedButton; texto2 : array of Tlabel );
var
  laco : integer;
begin
  for laco := low(edit) to high(edit) do
  begin
    if (edit[laco] is TDBEditColor) then
     (edit[laco] as TDBEditColor).Font.Size := tamanhoFonte;
    if (edit[laco] is TEditLocaliza) then
     (edit[laco] as TEditLocaliza).Font.Size := tamanhoFonte;
    if (edit[laco] is TDBComboBoxColor) then
     (edit[laco] as TDBComboBoxColor).Font.Size := tamanhoFonte;

    edit[laco].Top := PosyEditInicial;
    edit[laco].Left := PosxEditInicial;
    edit[laco].Width := 200;
    texto[laco].Font.Size := tamanhoFonte;
    texto[laco].Left := PosxEditInicial - texto[laco].Width - 3;
    texto[laco].Top := ( edit[laco].Top + (Edit[laco].Height div 2)) - (texto[laco].Height div 2 );
    PosyEditInicial := PosyEditInicial + edit[laco].Height + trunc(( edit[laco].Height * 0.2));
    if botao[laco] <> nil then
    begin
      botao[laco].Height := edit[laco].Height;
      botao[laco].top := edit[laco].top;
      botao[laco].left := edit[laco].Width + edit[laco].Left + 2 ;
    end;
    if texto2[laco] <> nil then
    begin
      texto2[laco].Font.Size := tamanhoFonte - 4;
      texto2[laco].top := edit[laco].top;
      texto2[laco].left := botao[laco].Width + botao[laco].Left + 2 ;
    end;
  end;
end;


procedure TFVendaECF.FormShow(Sender: TObject);
var
  erroVariavel : integer;
begin
  erroVariavel := 0;

  if ConfigModulos.Estoque then
    if varia.CodigoOpeEstEcf = 0 then
      erroVariavel := 1;

  if ConfigModulos.Caixa then
    if varia.OperacaoReceber = 0 then
      erroVariavel := 2;

  // verifica se naum falta dados cfg...
  if (varia.CodigoEmpresa = 0) or (varia.CodigoEmpFil = 0) or (varia.FormaPagamentoPadrao = 0 ) or (varia.PlanoContaEcf = '') then
    erroVariavel := 3;

  if ConfigModulos.ContasAReceber then
    if Varia.SituacaoPadraoCR = 0 then
      erroVariavel := 4;

  if erroVariavel <> 0 then
  begin
    case erroVariavel of
     1 : erro(CT_FaltaCFGOpeEstoqueECF);
     2 : erro(CT_FaltaCFGOpeCaixaRC);
     3 : erro(CT_FaltaCFGFiscalECF);
     4 : erro(CT_FaltaCFGFinanceiro);
    end;

    PermiteFechar := true;
    self.close;
  end
  else
     ConfiguraLayout(varia.LayoutECF);
end;

procedure TFVendaECF.BIniciaCupomClick(Sender: TObject);
begin
  EditLocaliza4.Text := IntToStr(varia.ClientePadraoECF);
  EditLocaliza4.SetFocus;
  perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFVendaECF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := PermiteFechar;
end;

procedure TFVendaECF.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FVendaECF.HelpContext);
end;

procedure TFVendaECF.BConsultaChequeClick(Sender: TObject);
begin
  if not VerificaFormCriado('TFTEF') then
    FTEF := TFTEF.CriarSDI(application, '', true);
  FTEF.ConsultaCheque(CadNotasFiscaisI_SEQ_NOT.AsInteger, CadNotasFiscaisI_NRO_NOT.AsInteger, CadNotasFiscaisN_TOT_NOT.AsCurrency);
end;

procedure TFVendaECF.Button3Click(Sender: TObject);
begin
UnTEF.ImprimeTextoECFSemLeitura('1',2);
end;

procedure TFVendaECF.EServicoSelect(Sender: TObject);
begin
  EServico.ASelectValida.Clear;
  EServico.ASelectValida.Add( ' Select * from CadServico ' +
                                 ' Where i_cod_ser = @ ' +
                                 ' and I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) );
  EServico.ASelectLocaliza.Clear;
  EServico.ASelectLocaliza.Add( ' Select * from CadServico ' +
                                   ' Where c_nom_ser like ''@%'' ' +
                                   ' and I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) +
                                   ' order by c_nom_ser' );
end;

procedure TFVendaECF.EServicoCadastrar(Sender: TObject);
var
  CodCla, DescCal, CodSequencia : string;
begin
  FNovoServico := TFNovoServico.CriarSDI(application, '', true);
  FNovoServico.InsereNovoServico( CodCla, DescCal, CodSequencia, true );
  Localiza.AtualizaConsulta;
//  AtualizaSQLTabela(CadServico);
end;

procedure TFVendaECF.EServicoEnter(Sender: TObject);
begin
  if not CadNotasFiscais.Active then
  begin
    AbreCadMovNotas;
    InicializaCupom;
  end;

  if CadNotasFiscais.Active Then
     if not(MovServicoNota.State in [dsedit,dsinsert]) then
        MovServicoNota.insert;
  Label44.Caption := '';
  label37.Caption := ''
end;

procedure TFVendaECF.MovServicoNotaN_VLR_SERChange(Sender: TField);
begin
  if MovServicoNota.State in [ dsInsert, dsEdit ] then
    MovServicoNotaN_TOT_SER.AsCurrency := MovServicoNotaN_VLR_SER.AsFloat * HoraParaDecimal(MovServicoNotaN_QTD_SER.AsFloat);
end;

procedure TFVendaECF.DBEditColor6Exit(Sender: TObject);
var
  ignorar : Boolean;
begin
  ignorar := true;
  if (MovServicoNotaN_VLR_SER.AsCurrency = 0) or (MovServicoNotaN_QTD_SER.AsCurrency = 0 ) then
  begin
    ignorar := false;
    aviso('Não pode haver valores zerados');
    EqtdServico.SetFocus;
  end;


  if (EServico.Text <> '') and (ignorar) then
  begin
    ImprimeItem( MovServicoNotaI_COD_SER.AsString ,
                 Label44.Caption,
                 MovServicoNotaN_QTD_SER.AsCurrency,
                 MovServicoNotaN_VLR_SER.AsCurrency, false );
    inc(ContaItem);
    MovServicoNotaI_NUM_ITE.AsInteger := ContaItem;
    MovServicoNota.Post;
    EServico.SetFocus;
    EServico.Text := '';
    AtualizaSQLTabela(MostraItens);
    BFechaCupom.Enabled := not MostraItens.IsEmpty;
    BCancelaItem.Enabled := not MostraItens.IsEmpty;
  end;
end;

procedure TFVendaECF.CalculaServico;
var
  ISSQN, ValorServico : Double;
begin
  NF.CalculaServico(ISSQN, ValorServico, cadNotasFiscaisI_SEQ_NOT.AsInteger);
  cadNotasFiscaisN_VLR_ISQ.AsCurrency := ISSQN;
  cadNotasFiscaisN_TOT_SER.AsCurrency := ValorServico;
end;

procedure TFVendaECF.MovServicoNotaAfterPost(DataSet: TDataSet);
begin
  CalculaServico;
  CalculaNota;
end;

procedure TFVendaECF.EServicoRetorno(Retorno1, Retorno2: String);
begin
  if not TabSheet2.Focused then
    if (EServico.Text <> '') and (MovServicoNota.State in [ dsEdit, dsInsert]) then
    begin
      if not NF.VerificaExisteServico(CadNotasFiscaisI_SEQ_NOT.AsInteger,StrToInt(EServico.text)) then
      begin
        AdicionaItemsServico(StrToInt(EServico.text));
        label37.Caption := retorno2;
        EqtdServico.SetFocus;
      end
      else
      begin
        aviso(CT_ServicoRepetido);
        EServico.SetFocus;
      end;
    end;
end;

procedure TFVendaECF.PaginasChange(Sender: TObject);
begin
  if Paginas.ActivePage = TabSheet1 then
  begin
    DBText9.DataField := '';
    DBText9.DataSource := DataMovNotasFiscais;
    DBText9.DataField := 'N_VLR_PRO';
    EServico.Text := '';
    MovServicoNota.cancel;
    EProduto.SetFocus;
  end
  else
    if Paginas.ActivePage = TabSheet2 then
    begin
      DBText9.DataField := '';
      DBText9.DataSource := DataMovServicoNota;
      DBText9.DataField := 'N_VLR_SER';
      EProduto.Text := '';
      MovNotasFiscais.cancel;
      EServico.SetFocus;
    end
end;

procedure TFVendaECF.EditLocaliza4Enter(Sender: TObject);
begin
  if EditLocaliza4.Text = '' then
    Paginas.Enabled := false;
end;

procedure TFVendaECF.ECoDVendedorRetorno(Retorno1, Retorno2: String);
begin
  if Retorno1 <> '' then
    EPercPro.AValor := StrToFloat(retorno1);
  if Retorno2 <> '' then
    EPercServ.AValor := StrToFloat( retorno2);
end;

procedure TFVendaECF.Button1Click(Sender: TObject);
begin
  aviso('sergio');
end;

procedure TFVendaECF.DBEditColor8Exit(Sender: TObject);
begin
  if CadNotasFiscaisC_NRO_PED.AsString <> '' then
  begin
    CadNotasFiscaisI_LAN_ORC.AsInteger := Uncotacao.RetornaSeqOrc_Ped_Nao_Entregue(0, strToint(CadNotasFiscaisC_NRO_PED.AsString));
    If CadNotasFiscaisI_LAN_ORC.AsInteger = 0 then
    begin
      aviso('Este número de pedido não existe');
      DBEditColor8.SetFocus;
    end;

    if CadNotasFiscaisI_LAN_ORC.AsInteger = -1 then
    begin
      aviso(' Este Pedido está cancelado ou ja entregue ');
      DBEditColor8.SetFocus;
    end;

  end
  else
    CadNotasFiscaisI_LAN_ORC.clear;
end;

procedure TFVendaECF.DBEditColor9Exit(Sender: TObject);
begin
  if CadNotasFiscaisC_NRO_ORC.AsString <> '' then
  begin
    CadNotasFiscaisI_LAN_ORC.AsInteger := Uncotacao.RetornaSeqOrc_Ped_Nao_Entregue(strToint(CadNotasFiscaisC_NRO_ORC.AsString), 0);
    If CadNotasFiscaisI_LAN_ORC.AsInteger = 0 then
    begin
      aviso('Este número de orcamento não existe');
      DBEditColor9.SetFocus;
    end;

    if CadNotasFiscaisI_LAN_ORC.AsInteger = -1 then
    begin
      aviso(' Este Orçamento está cancelado ou ja entregue ');
      DBEditColor8.SetFocus;
    end;

  end
  else
    CadNotasFiscaisI_LAN_ORC.clear;
end;

procedure TFVendaECF.DBEditColor8Change(Sender: TObject);
begin
  if CadNotasFiscais.State in [ dsInsert, DsEdit ] then
    if DBEditColor8.Text <> '' then
      CadNotasFiscaisC_NRO_ORC.Clear;
  DBEditColor9.Enabled := DBEditColor8.Text = '';
  Label47.Enabled := DBEditColor8.Text = '';
end;

procedure TFVendaECF.DBEditColor9Change(Sender: TObject);
begin
  if DBEditColor9.Text <> '' then
    CadNotasFiscaisC_NRO_PED.Clear;
  DBEditColor8.Enabled := DBEditColor9.Text = '';
  Label46.Enabled := DBEditColor9.Text = '';
end;

Initialization
 RegisterClasses([TFVendaECF]);
end.
 