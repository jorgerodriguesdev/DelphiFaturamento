unit AImpAberturaOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, QuickRpt, Db, DBTables, Qrctrls, jpeg, Parcela, Geradores, printers,
  QRExport, DBKeyViolation, Localizacao, Tabela;

type
  TFImpAberturaOS = class(TFormularioPermissao)
    MovOrcamento: TQuery;
    Aux: TQuery;
    CriaParcelas: TCriaParcelasReceber;
    MovOrcamentoCodPro: TStringField;
    MovOrcamentoNomPro: TStringField;
    MovOrcamentoQtdPro: TFloatField;
    MovOrcamentoVlrPro: TFloatField;
    MovOrcamentoTotPro: TFloatField;
    MovOrcamentoC_Cod_Uni: TStringField;
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
    MovOrcamentoC_Imp_fot: TStringField;
    MovOrcamentoL_Des_Tec: TMemoField;
    CadOrcamentoC_CON_ORC: TStringField;
    CadOrcamentoD_DAT_VAL: TDateTimeField;
    MovOrcamentoC_Imp_Des: TStringField;
    MovServicoOrcamento: TQuery;
    MovServicoOrcamentoI_Cod_Ser: TIntegerField;
    MovServicoOrcamentoN_Vlr_Ser: TFloatField;
    MovServicoOrcamentoN_Qtd_Ser: TFloatField;
    MovServicoOrcamentoN_Vlr_Tot: TFloatField;
    MovServicoOrcamentoC_Nom_Ser: TStringField;
    MovOrcamentoI_Seq_Pro: TIntegerField;
    CadOrcamentoN_VLR_TOT: TFloatField;
    CadOrcamentoL_OBS_ORC: TMemoField;
    CadOrcamentoI_COD_VEN: TIntegerField;
    CadOrcamentoC_NOM_VEN: TStringField;
    MovOrcamenton_des_pro: TFloatField;
    CadOrcamentoN_VLR_PER: TFloatField;
    CadOrcamentoC_DES_ACR: TStringField;
    CadOrcamentoC_VLR_PER: TStringField;
    CadOS: TSQL;
    CadOSI_EMP_FIL: TIntegerField;
    CadOSI_COD_ORS: TIntegerField;
    CadOSI_COD_SIT: TIntegerField;
    CadOSI_COD_CLI: TIntegerField;
    CadOSI_SEQ_PRO: TIntegerField;
    CadOSD_DAT_CAD: TDateField;
    CadOSD_DAT_AGE: TDateField;
    CadOSH_HOR_AGE: TTimeField;
    CadOSC_CLI_PRO: TStringField;
    CadOSC_OBS_EQU: TStringField;
    CadOSN_TEM_GAS: TFloatField;
    CadOSN_VLR_HOR: TFloatField;
    CadOSI_COD_FRM: TIntegerField;
    CadOSI_COD_PAG: TIntegerField;
    CadOSD_DAT_FEC: TDateField;
    CadOSC_CLI_REC: TStringField;
    CadOSD_DAT_EMP: TDateField;
    CadOSD_DAT_DEV: TDateField;
    CadOSC_COD_PRO: TStringField;
    CadOSD_ULT_ALT: TDateField;
    CadOSL_OBS_MOV: TMemoField;
    CadOSC_SIT_ORS: TStringField;
    CadOSN_TOT_PRO: TFloatField;
    CadOSN_TOT_SER: TFloatField;
    CadOSN_TOT_TER: TFloatField;
    CadOSN_VLR_PER: TFloatField;
    CadOSC_DES_ACR: TStringField;
    CadOSN_TOT_ORS: TFloatField;
    CadOSN_TOT_HOR: TFloatField;
    CadOSL_OBS_TER: TMemoField;
    CadOSI_COD_USU: TIntegerField;
    CadOSC_OBS_ABE: TStringField;
    CadOSI_COD_ENT: TIntegerField;
    CadOSD_DAT_PRE: TDateField;
    CadOSC_NOM_USU: TStringField;
    CadOSI_COD_ATE: TIntegerField;
    CadOSC_NON_AVI: TStringField;
    CadOSD_DAT_AVI: TDateField;
    CadOSC_CHA_TEC: TStringField;
    CadOSC_TIP_CHA: TStringField;
    CadOSI_NRO_ATE: TIntegerField;
    CadOSC_ACE_EMP: TStringField;
    CadOSI_COD_EQU: TIntegerField;
    CadOSI_COD_MAR: TIntegerField;
    CadOSI_COD_MOD: TIntegerField;
    CadOSC_VOL_ENT: TStringField;
    CadOSC_ORC_EQU: TStringField;
    CadOSC_NRO_NOT: TStringField;
    CadOSC_DEF_APR: TStringField;
    CadOSC_NRO_SER: TStringField;
    CadOSC_ACE_EQU: TStringField;
    CadOST_HOR_PRE: TDateTimeField;
    CadOSH_HOR_ABE: TDateTimeField;
    CadOSC_RES_PRO: TStringField;
    CadOSI_DIA_ENT: TIntegerField;
    ProximoCodigoFilial1: TProximoCodigoFilial;
    DataCadOS: TDataSource;
    cadClientes: TQuery;
    cadClientesc_nom_cli: TStringField;
    cadClientesc_cgc_cli: TStringField;
    cadClientesc_cpf_cli: TStringField;
    cadClientesc_ins_cli: TStringField;
    cadClientesenderco: TStringField;
    cadClientesC_Bai_Cli: TStringField;
    cadClientesC_Cep_Cli: TStringField;
    cadClientesMunicipio: TStringField;
    cadClientesfone: TStringField;
    cadClientesi_cod_cli: TIntegerField;
    cadClientesc_tip_pes: TStringField;
    DataClientes: TDataSource;
    MovOS: TQuery;
    MovOSI_EMP_FIL: TIntegerField;
    MovOSI_COD_ORS: TIntegerField;
    MovOSI_SEQ_MOV: TIntegerField;
    MovOSI_SEQ_PRO: TIntegerField;
    MovOSI_COD_EMP: TIntegerField;
    MovOSI_COD_SER: TIntegerField;
    MovOSI_COD_USU: TIntegerField;
    MovOSN_QTD_MOV: TFloatField;
    MovOSN_VLR_UNI: TFloatField;
    MovOSN_VLR_TOT: TFloatField;
    MovOSC_COD_UNI: TStringField;
    MovOSNomeProduto: TStringField;
    MovOSC_COD_PRO: TStringField;
    MovOSD_ULT_ALT: TDateField;
    MovOSC_RES_PRO: TStringField;
    DataMovOS: TDataSource;
    Produtos: TQuery;
    CadProdutos: TQuery;
    Localiza: TConsultaPadrao;
    MovTerceiros: TSQL;
    MovTerceirosI_EMP_FIL: TIntegerField;
    MovTerceirosI_COD_ORS: TIntegerField;
    MovTerceirosI_SEQ_MOV: TIntegerField;
    MovTerceirosI_COD_CLI: TIntegerField;
    MovTerceirosD_DAT_COM: TDateField;
    MovTerceirosI_NOT_COM: TIntegerField;
    MovTerceirosI_NOT_REM: TIntegerField;
    MovTerceirosI_NOT_FOR: TIntegerField;
    MovTerceirosD_DAT_REM: TDateField;
    MovTerceirosD_DAT_RET: TDateField;
    MovTerceirosN_VLR_SER: TFloatField;
    MovTerceirosN_VLR_COB: TFloatField;
    MovTerceirosD_ULT_ALT: TDateField;
    MovTerceirosC_DES_PRO: TStringField;
    DataMovTerceiros: TDataSource;
    Kit: TQuery;
    ValidaGravacao1: TValidaGravacao;
    CadServico: TQuery;
    DataMovOSServico: TDataSource;
    MovOSServico: TQuery;
    StringField4: TStringField;
    MovOSServicoI_EMP_FIL: TIntegerField;
    MovOSServicoI_COD_ORS: TIntegerField;
    MovOSServicoI_SEQ_MOV: TIntegerField;
    MovOSServicoI_SEQ_PRO: TIntegerField;
    MovOSServicoI_COD_EMP: TIntegerField;
    MovOSServicoI_COD_USU: TIntegerField;
    MovOSServicoN_QTD_MOV: TFloatField;
    MovOSServicoN_VLR_UNI: TFloatField;
    MovOSServicoN_VLR_TOT: TFloatField;
    MovOSServicoC_COD_UNI: TStringField;
    MovOSServicoC_COD_PRO: TStringField;
    MovOSServicoD_ULT_ALT: TDateField;
    MovOSServicoI_COD_SER: TIntegerField;
    Query1: TQuery;
    DataSource1: TDataSource;
    QuickRep1: TQuickRepNovo;
    QRBand1: TQRBand;
    LNomeFilial: TQRLabel;
    LEndereco: TQRLabel;
    QRLabel4: TQRLabel;
    NomCli: TQRLabel;
    Os: TQRLabel;
    LEndCli: TQRLabel;
    LMunCli: TQRLabel;
    LDatOrc: TQRLabel;
    LFone: TQRLabel;
    QrlFonefax: TQRLabel;
    QRLabel7: TQRLabel;
    LBairro: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRBand4: TQRBand;
    QRLabel24: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    LWWW: TQRLabel;
    CorpoProdutos: TQRBand;
    QrlItem: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRLabel2: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape10: TQRShape;
    QRLabel19: TQRLabel;
    QRShape7: TQRShape;
    LabelNomeFilial2: TQRLabel;
    OS2: TQRLabel;
    LDATORC2: TQRLabel;
    QRShape11: TQRShape;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape14: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape16: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape25: TQRShape;
    QRLabel40: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape71: TQRShape;
    Label2Fonefax: TQRLabel;
    NomCli2: TQRLabel;
    ConsultaOrdemServico: TQuery;
    DataOrdemServico: TDataSource;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape45: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel20: TQRLabel;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    ConsultaProdutosServicos: TQuery;
    DataConsultaProdutosServicos: TDataSource;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel57: TQRLabel;
    ConsultaProdutosServicosI_EMP_FIL: TIntegerField;
    ConsultaProdutosServicosI_COD_ORS: TIntegerField;
    ConsultaProdutosServicosI_SEQ_MOV: TIntegerField;
    ConsultaProdutosServicosI_SEQ_PRO: TIntegerField;
    ConsultaProdutosServicosI_COD_EMP: TIntegerField;
    ConsultaProdutosServicosI_COD_SER: TIntegerField;
    ConsultaProdutosServicosI_COD_USU: TIntegerField;
    ConsultaProdutosServicosN_QTD_MOV: TFloatField;
    ConsultaProdutosServicosN_VLR_UNI: TFloatField;
    ConsultaProdutosServicosN_VLR_TOT: TFloatField;
    ConsultaProdutosServicosC_COD_UNI: TStringField;
    ConsultaProdutosServicosC_COD_PRO: TStringField;
    ConsultaProdutosServicosD_ULT_ALT: TDateField;
    ConsultaProdutosServicosC_RES_PRO: TStringField;
    ConsultaProdutosServicosI_EMP_FIL_1: TIntegerField;
    ConsultaProdutosServicosI_COD_ORS_1: TIntegerField;
    ConsultaProdutosServicosI_COD_SIT: TIntegerField;
    ConsultaProdutosServicosI_COD_CLI: TIntegerField;
    ConsultaProdutosServicosI_SEQ_PRO_1: TIntegerField;
    ConsultaProdutosServicosD_DAT_CAD: TDateField;
    ConsultaProdutosServicosD_DAT_AGE: TDateField;
    ConsultaProdutosServicosH_HOR_AGE: TTimeField;
    ConsultaProdutosServicosC_CLI_PRO: TStringField;
    ConsultaProdutosServicosC_OBS_EQU: TStringField;
    ConsultaProdutosServicosN_TEM_GAS: TFloatField;
    ConsultaProdutosServicosN_VLR_HOR: TFloatField;
    ConsultaProdutosServicosI_COD_FRM: TIntegerField;
    ConsultaProdutosServicosI_COD_PAG: TIntegerField;
    ConsultaProdutosServicosD_DAT_FEC: TDateField;
    ConsultaProdutosServicosC_CLI_REC: TStringField;
    ConsultaProdutosServicosD_DAT_EMP: TDateField;
    ConsultaProdutosServicosD_DAT_DEV: TDateField;
    ConsultaProdutosServicosC_COD_PRO_1: TStringField;
    ConsultaProdutosServicosD_ULT_ALT_1: TDateField;
    ConsultaProdutosServicosL_OBS_MOV: TMemoField;
    ConsultaProdutosServicosC_SIT_ORS: TStringField;
    ConsultaProdutosServicosN_TOT_PRO: TFloatField;
    ConsultaProdutosServicosN_TOT_SER: TFloatField;
    ConsultaProdutosServicosN_VLR_PER: TFloatField;
    ConsultaProdutosServicosC_DES_ACR: TStringField;
    ConsultaProdutosServicosN_TOT_ORS: TFloatField;
    ConsultaProdutosServicosN_TOT_HOR: TFloatField;
    ConsultaProdutosServicosL_OBS_TER: TMemoField;
    ConsultaProdutosServicosI_COD_USU_1: TIntegerField;
    ConsultaProdutosServicosC_OBS_ABE: TStringField;
    ConsultaProdutosServicosI_COD_ENT: TIntegerField;
    ConsultaProdutosServicosD_DAT_PRE: TDateField;
    ConsultaProdutosServicosC_NOM_USU: TStringField;
    ConsultaProdutosServicosT_HOR_PRE: TDateTimeField;
    ConsultaProdutosServicosI_COD_ATE: TIntegerField;
    ConsultaProdutosServicosD_DAT_AVI: TDateField;
    ConsultaProdutosServicosC_CHA_TEC: TStringField;
    ConsultaProdutosServicosC_TIP_CHA: TStringField;
    ConsultaProdutosServicosI_NRO_ATE: TIntegerField;
    ConsultaProdutosServicosC_ACE_EMP: TStringField;
    ConsultaProdutosServicosI_COD_EQU: TIntegerField;
    ConsultaProdutosServicosI_COD_MAR: TIntegerField;
    ConsultaProdutosServicosI_COD_MOD: TIntegerField;
    ConsultaProdutosServicosC_VOL_ENT: TStringField;
    ConsultaProdutosServicosC_ORC_EQU: TStringField;
    ConsultaProdutosServicosC_NRO_NOT: TStringField;
    ConsultaProdutosServicosC_DEF_APR: TStringField;
    ConsultaProdutosServicosC_NRO_SER: TStringField;
    ConsultaProdutosServicosC_ACE_EQU: TStringField;
    ConsultaProdutosServicosH_HOR_ABE: TDateTimeField;
    ConsultaProdutosServicosI_SEQ_NOT: TIntegerField;
    ConsultaProdutosServicosI_NRO_NOT: TIntegerField;
    ConsultaProdutosServicosC_RES_PRO_1: TStringField;
    ConsultaProdutosServicosI_DIA_ENT: TIntegerField;
    ConsultaProdutosServicosI_SEQ_PRO_2: TIntegerField;
    ConsultaProdutosServicosC_COD_PRO_2: TStringField;
    ConsultaProdutosServicosC_COD_UNI_1: TStringField;
    ConsultaProdutosServicosC_NOM_PRO: TStringField;
    ConsultaProdutosServicosI_COD_SER_1: TIntegerField;
    ConsultaProdutosServicosC_NOM_SER: TStringField;
    ConsultaProdutosServicosI_COD_EMP_1: TIntegerField;
    QRLabel26: TQRLabel;
    QRDBText30: TQRDBText;
    MServicosExecutados: TQRMemo;
    QRShape13: TQRShape;
    QRShape30: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel3: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    Item, VprUltimoProduto : Integer;
    procedure CarregaRelatorio(NroOS : String);
    procedure CarregaNomeFilial;
    procedure CarregaCabecalho(NroOS : String);
    procedure CarregaCadOrdemServico(NroOS : String);
    procedure CarregaServicosProdutos(NroOS : String);
    procedure PosicionaProdutos(NroOS : String);
    procedure CarregaCliente(Codigo :Integer);
    procedure PosicionaImpressora;
    procedure MudaCabecalho;
  public
    { Public declarations }
    procedure VisualizaImpressao(NroOS : String);
    procedure ImprimeOrdemServico(NroOS : String);
  end;
var
  FImpAberturaOS: TFImpAberturaOS;

implementation

Uses Constantes,FunString,Fundata, FunSQl;

{$R *.DFM}


{ ******************* Quando o formulario e fechado ************************** }
procedure TFImpAberturaOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ConsultaOrdemServico.Close;
   ConsultaProdutosServicos.close;
   QuickRep1.free;
   Action := CaFree;
end;

{**************************Quando o formulario é criado************************}
procedure TFImpAberturaOS.FormCreate(Sender: TObject);
begin
  //ConsultaOrdemServico.Open;
  Item := 0;
  MudaCabecalho;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                           Ações que carregam o relatorio
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** visualiza a impressao do orcamento ************************}
procedure TFImpAberturaOS.VisualizaImpressao (NroOS : String);
begin
  CarregaRelatorio(NroOS);
  CarregaCabecalho(NroOS);
  QuickRep1.Preview;
  close;
end;

{************************** imprime a cotacao *********************************}
procedure TFImpAberturaOS.ImprimeOrdemServico(NroOS : String);
begin
  CarregaRelatorio(NroOS);
  QuickRep1.Print;
  close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         eventos do Cabeçalho do relatório
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************Carrega o  cabeçalho do relatório************************}
procedure TFImpAberturaOS.CarregaCabecalho(NroOS : String);
begin
   CarregaNomeFilial;
   CarregaCliente(CadOSI_COD_CLI.AsInteger);
   CarregaCadOrdemServico(NroOS);
   CarregaServicosProdutos(NroOS);
   PosicionaProdutos(NroOS);
end;

{***********************Retorna o nome do cliente******************************}
procedure TFImpAberturaOS.CarregaCliente(Codigo :Integer);
Var
  VpfCGCCPF : String;
begin
  AdicionaSQLAbreTabela(aux,'Select * from dba.CadClientes '+
                            ' Where I_Cod_Cli = '+ IntToStr(Codigo));
  if Aux.FieldByName('C_Tip_Pes').Asstring = 'J' then
    VpfCGCCPF := 'Insc. Estl : ' + Aux.FieldByName('C_Ins_Cli').Asstring + '     CGC : '+
                 Aux.FieldByName('C_Cgc_Cli').Asstring
  else
    VpfCGCCPF := 'RG : ' + Aux.FieldByName('C_Reg_Cli').Asstring + '     CPF : '+
                 Aux.FieldByName('C_CPF_Cli').Asstring;
  Label2Fonefax.Caption := 'Fone : ' + aux.fieldbyname('C_Fo1_Cli').AsString;
  NomCli2.Caption :=  aux.fieldbyname('C_Nom_Cli').AsString;
  NomCli.Caption :=  aux.fieldbyname('C_Nom_Cli').AsString;
  LEndCli.Caption :=  aux.FieldByName('C_End_Cli').AsString +  ' -  Nr.'+
                      aux.FieldByName('I_Num_end').Asstring + '   -    '+ aux.FieldByName('C_Bai_Cli').Asstring ;
  LMunCli.Caption := aux.fieldbyname('C_Cid_Cli').AsString + ' - ' +
                      aux.fieldbyname('C_Est_Cli').AsString ;
  VpfCGCCPF :=  AdicionaCharE(' ',VpfCgcCPf,115-Length(LMunCli.Caption));
  LMunCli.Caption := LMunCli.Caption + VpfCGCCPF;
  QrlFonefax.Caption := 'Fone : ' + aux.fieldbyname('C_Fo1_Cli').AsString + '              Fax: ' +
                     aux.fieldbyname('C_Fon_Fax').AsString + '              e-mail : ' + aux.fieldbyname('C_END_ELE').AsString;
end;

{*******************Carrega os dados do cadOrcamento***************************}
procedure TFImpAberturaOS.CarregaCadOrdemServico(NroOS : String);
begin
 AdicionaSQLAbreTabela(CadOS,' Select * from CadOrdemServico Cad' +
                                     ' Where cad.I_emp_Fil = '+ InTToStr(Varia.CodigoEmpFil) +
                                     ' and cad.I_Cod_Ors = ' + NroOS);
  LDatOrc.Caption := CadOSD_DAT_PRE.AsString;
//  LHorOrc.Caption := CadOST_HOR_PRE.AsString;
  Self.Os.Caption := 'Ordem de Serviço : ' + NroOS;

  LDatOrc2.Caption := CadOSD_DAT_PRE.AsString;
//  LHorOrc2.Caption := CadOST_HOR_PRE.AsString;
  Self.Os2.Caption := 'Ordem de Serviço : ' + NroOS;
end;

{******************** carrega os nomes das filiais ****************************}
procedure TFImpAberturaOS.CarregaNomeFilial;
begin
  AdicionaSQLAbreTabela(Aux,'Select * from CadFiliais ' +
                            ' Where I_Emp_fil = ' + InttoStr(Varia.CodigoEmpFil));
  LNomeFilial.Caption := Aux.FieldByName('C_Nom_Fan').Asstring;
  LabelNomeFilial2.Caption := Aux.FieldByName('C_Nom_Fan').Asstring;
  LEndereco.Caption := Aux.FieldByName('C_End_Fil').Asstring +', '+
                       Aux.FieldByName('I_Num_Fil').Asstring ;
  LBairro.Caption := Aux.FieldByName('C_Bai_Fil').Asstring +
                    '      CEP : ' + Aux.FieldByName('C_Cep_Fil').Asstring + '         ' +
                       Aux.FieldByName('C_Cid_Fil').Asstring + '/' + Aux.FieldByName('C_Est_Fil').Asstring;
  LFone.Caption  := 'Fone: ' + Aux.FieldByName('C_Fon_Fil').Asstring + '    Fax: ' + Aux.FieldByName('C_Fax_Fil').Asstring;
  LWWW.Caption := Aux.FieldByName('C_end_ele').Asstring;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos dos produtos do Orcamento
{********************Posiciona os produtos do MovOrcamento*********************}
procedure TFImpAberturaOS.PosicionaProdutos(NroOS : String);
begin
     AdicionaSQLTabela(ConsultaOrdemServico,' SELECT CADEQUI.I_COD_EQU,CADEQUI.C_NOM_EQU, CADPRO.I_SEQ_PRO,' +
                                            ' CADPRO.C_NOM_PRO, ' +
                                            ' CADPRO.C_COD_PRO, CADSIT.I_COD_SIT, CADSIT.C_NOM_SIT, CADSIT.C_FLA_SIT, ' +
                                            ' CADMAR.I_COD_MAR,CADMAR.C_NOM_MAR,CADMOD.I_COD_MOD,  CADMOD.C_NOM_MOD, ' +
                                            ' CADOS.I_EMP_FIL,CADOS.I_COD_ORS,CADOS.I_COD_SIT,CADOS.I_COD_CLI,CADOS.I_SEQ_PRO, ' +
                                            ' CADOS.D_DAT_CAD,CADOS.D_DAT_AGE ,CADOS.H_HOR_AGE,CADOS.C_CLI_PRO, ' +
                                            ' CADOS.C_OBS_EQU,CADOS.N_TEM_GAS,CADOS.N_VLR_HOR ,CADOS.I_COD_FRM, ' +
                                            ' CADOS.I_COD_PAG,CADOS.D_DAT_FEC,CADOS.C_CLI_REC,CADOS.D_DAT_EMP,CADOS.D_DAT_DEV, ' +
                                            ' CADOS.C_COD_PRO,CADOS.D_ULT_ALT,CADOS.L_OBS_MOV,CADOS.C_SIT_ORS,CADOS.N_TOT_PRO, ' +
                                            ' CADOS.N_TOT_SER,CADOS.N_VLR_PER,CADOS.C_DES_ACR, ' +
                                            ' CADOS.N_TOT_ORS,CADOS.N_TOT_HOR,CADOS.L_OBS_TER,CADOS.I_COD_USU, ' +
                                            ' CADOS.C_OBS_ABE,CADOS.I_COD_ENT,CADOS.D_DAT_PRE,CADOS.C_NOM_USU,CADOS.T_HOR_PRE, ' +
                                            ' CADOS.I_COD_ATE,CADOS.D_DAT_AVI,CADOS.C_CHA_TEC,CADOS.C_TIP_CHA , ' +
                                            ' CADOS.I_NRO_ATE,CADOS.C_ACE_EMP,CADOS.I_COD_EQU,CADOS.I_COD_MAR,CADOS.I_COD_MOD, ' +
                                            ' CADOS.C_VOL_ENT ,CADOS.C_ORC_EQU,CADOS.C_NRO_NOT,CADOS.C_DEF_APR,CADOS.C_NRO_SER,' +
                                            ' CADOS.C_ACE_EQU ,CADOS.H_HOR_ABE,CADOS.I_SEQ_NOT,CADOS.I_NRO_NOT, ' +
                                            ' CADOS.C_RES_PRO,CADOS.I_DIA_ENT, CADCLI.I_COD_CLI,CADCLI.C_NOM_CLI ' +
                                            ' FROM ' +
                                            ' CADORDEMSERVICO  AS  CADOS,' +
                                            ' CADCLIENTES  AS  CADCLI,' +
                                            ' CADMARCAS AS CADMAR , ' +
                                            ' CADMODELO  AS  CADMOD, ' +
                                            ' CADEQUIPAMENTOS  AS  CADEQUI, ' +
                                            ' CADPRODUTOS  AS CADPRO, ' +
                                            ' CADSITUACOES  AS CADSIT ' +
                                            ' WHERE ' +
                                            ' CADOS.I_COD_ORS = ' + (NroOS) +
                                            ' AND CADOS.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                                            ' AND CADOS.I_COD_CLI = CADCLI.I_COD_CLI ' +
                                            ' AND CADOS.I_COD_MAR = CADMAR.I_COD_MAR '  +
                                            ' AND CADOS.I_COD_EQU = CADEQUI.I_COD_EQU ' +
                                            ' AND CADOS.I_COD_MOD = CADMOD.I_COD_MOD ' +
                                            ' AND CADOS.I_COD_SIT = CADSIT.I_COD_SIT');

  ConsultaOrdemServico.Open;
end;

{********************* carrega o servico do orcamento *************************}
procedure TFImpAberturaOS.CarregaServicosProdutos(NroOS : String);
begin
  AdicionaSQLTabela(ConsultaProdutosServicos,' SELECT  MOVORDEM.I_EMP_FIL ,MOVORDEM.I_COD_ORS , MOVORDEM.I_SEQ_MOV, ' +
                                             ' MOVORDEM.I_SEQ_PRO , MOVORDEM.I_COD_EMP , MOVORDEM.I_COD_SER ,MOVORDEM.I_COD_USU, ' +
                                             ' MOVORDEM.N_QTD_MOV, MOVORDEM.N_VLR_UNI,MOVORDEM.N_VLR_TOT ,MOVORDEM.C_COD_UNI, ' +
                                             ' MOVORDEM.C_COD_PRO ,MOVORDEM.D_ULT_ALT, MOVORDEM.C_RES_PRO, ' +
                                             ' CADOS.I_EMP_FIL,CADOS.I_COD_ORS,CADOS.I_COD_SIT,CADOS.I_COD_CLI,CADOS.I_SEQ_PRO, ' +
                                             ' CADOS.D_DAT_CAD,CADOS.D_DAT_AGE ,CADOS.H_HOR_AGE,CADOS.C_CLI_PRO, ' +
                                             ' CADOS.C_OBS_EQU,CADOS.N_TEM_GAS,CADOS.N_VLR_HOR ,CADOS.I_COD_FRM, ' +
                                             ' CADOS.I_COD_PAG,CADOS.D_DAT_FEC,CADOS.C_CLI_REC,CADOS.D_DAT_EMP,CADOS.D_DAT_DEV, ' +
                                             ' CADOS.C_COD_PRO,CADOS.D_ULT_ALT,CADOS.L_OBS_MOV,CADOS.C_SIT_ORS,CADOS.N_TOT_PRO, ' +
                                             ' CADOS.N_TOT_SER,CADOS.N_VLR_PER,CADOS.C_DES_ACR, ' +
                                             ' CADOS.N_TOT_ORS,CADOS.N_TOT_HOR,CADOS.L_OBS_TER,CADOS.I_COD_USU, ' +
                                             ' CADOS.C_OBS_ABE,CADOS.I_COD_ENT,CADOS.D_DAT_PRE,CADOS.C_NOM_USU,CADOS.T_HOR_PRE, ' +
                                             ' CADOS.I_COD_ATE,CADOS.D_DAT_AVI,CADOS.C_CHA_TEC,CADOS.C_TIP_CHA, ' +
                                             ' CADOS.I_NRO_ATE,CADOS.C_ACE_EMP,CADOS.I_COD_EQU,CADOS.I_COD_MAR,CADOS.I_COD_MOD, ' +
                                             ' CADOS.C_VOL_ENT ,CADOS.C_ORC_EQU,CADOS.C_NRO_NOT,CADOS.C_DEF_APR,CADOS.C_NRO_SER, ' +
                                             ' CADOS.C_ACE_EQU ,CADOS.H_HOR_ABE,CADOS.I_SEQ_NOT,CADOS.I_NRO_NOT, ' +
                                             ' CADOS.C_RES_PRO,CADOS.I_DIA_ENT, ' +
                                             ' CADPRO.I_SEQ_PRO, CADPRO.C_COD_PRO,CADPRO.C_COD_UNI ,CADPRO.C_NOM_PRO, ' +
                                             ' CADSER.I_COD_SER , CADSER.C_NOM_SER, CADSER.I_COD_EMP ' +
                                             ' FROM MOVORDEMSERVICO AS MOVORDEM, CADPRODUTOS AS CADPRO , ' +
                                             ' CADSERVICO AS CADSER , CADORDEMSERVICO AS CADOS ' +
                                             ' WHERE ' +
                                             ' MOVORDEM.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                                             ' AND  CADOS.I_COD_ORS  = ' + (NroOS)  +
                                             ' AND  MOVORDEM.I_SEQ_PRO *=  CADPRO.I_SEQ_PRO ' +
                                             ' AND  CADSER.I_COD_SER  =*   MOVORDEM.I_COD_SER ' +
                                             ' ORDER BY MOVORDEM.I_COD_ORS, ' +
                                             ' MOVORDEM.I_SEQ_MOV');
  MServicosExecutados.Lines.Text := CadOSL_OBS_MOV.AsString;
  ConsultaProdutosServicos.Open;
end;

{******************  Imprime os servicos do orcamento *************************}
procedure TFImpAberturaOS.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := VprUltimoProduto = MovOrcamentoI_Seq_pro.AsInteger;
end;

{****************** imprime o titulo dos servicos *****************************}
procedure TFImpAberturaOS.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (VprUltimoProduto = MovOrcamentoI_Seq_pro.AsInteger) and not(MovServicoOrcamento.IsEmpty);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************** posiciona a impressora do quicreport ************************}
procedure TFImpAberturaOS.PosicionaImpressora;
  var
  VpfLaco : Integer;
begin
  for VpfLaco := 0 to printer.Printers.Count -1 do
    if printer.Printers[VpfLaco] = Varia.ImpressoraRelatorio then
       QuickRep1.PrinterSettings.PrinterIndex := VpfLaco;
end;

{********************Carrega o relatorio do orcamento**************************}
procedure TFImpAberturaOS.CarregaRelatorio( NroOS : String);
begin
   PosicionaImpressora;
   CarregaCabecalho(NroOs);
   QuickRep1.ReportTitle := 'OS Nº : ' + NroOS;
end;

procedure TFImpAberturaOS.MudaCabecalho;

  procedure mudaTamLabel( texto : array of TQRLabel);
  var
    laco : integer;
  begin
    for laco := 0 to high(texto) do
      texto[laco].top := texto[laco].top + varia.AlturaCabImpOrcamento;
  end;

begin
  LNomeFilial.Enabled := not config.MostrarEmpresaImpOrcamento;
  LEndereco.Enabled := not config.MostrarEmpresaImpOrcamento;
  LBairro.Enabled := not config.MostrarEmpresaImpOrcamento;
  LFone.Enabled := not config.MostrarEmpresaImpOrcamento;
  QRShape1.Enabled := not config.MostrarEmpresaImpOrcamento;

  QRBand1.Height := QRBand1.Height + varia.AlturaCabImpOrcamento;
//  QRDBText1.top := QRDBText1.top + varia.AlturaCabImpOrcamento;
  QRShape1.top := QRShape1.top + varia.AlturaCabImpOrcamento;

  mudaTamLabel([ QRLabel16, QRLabel17,
                 qrlfoneFax, lMunCli, lendCli,
                 NomCli, QRLabel4, lendereco, lbairro, lfone]);//QRLabel3
end;


Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFImpAberturaOS]);
end.
