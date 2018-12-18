unit AImprimeNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Componentes1, ExtCtrls, PainelGradiente, Localizacao, Buttons,
  Db, DBTables, ComCtrls, ConfigImpressora, Grids, DBGrids, printers, Mask,
  numericos, Tabela, DBCtrls, DBKeyViolation, Geradores, UnNotaFiscal;

type
  TFImprimeNotas = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    Localiza: TConsultaPadrao;
    NOTAS: TQuery;
    DATANOTAS: TDataSource;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    NOTASI_NRO_NOT: TIntegerField;
    NOTASC_NOM_CLI: TStringField;
    NOTASC_CID_CLI: TStringField;
    NOTASC_TIP_CAD: TStringField;
    NOTASC_FLA_ECF: TStringField;
    PanelColor3: TPanelColor;
    Label8: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Data1: TCalendario;
    data2: TCalendario;
    EClientes: TEditLocaliza;
    NOTASc_not_can: TStringField;
    NOTASL_OBS_NOT: TMemoField;
    NOTASN_TOT_PRO: TFloatField;
    NOTASN_TOT_NOT: TFloatField;
    NotaGrid: TGridIndice;
    NOTASC_NOT_IMP: TStringField;
    NOTASD_DAT_CAD: TDateField;
    NOTASD_DAT_ALT: TDateField;
    NOTASN_TOT_SER: TFloatField;
    BImprime: TBitBtn;
    BitBtn1: TBitBtn;
    PanelColor4: TPanelColor;
    PTempo: TPainelTempo;
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
    MovNotasFiscaisI_SEQ_PRO: TIntegerField;
    MovServicoNota: TQuery;
    MovServicoNotaI_EMP_FIL: TIntegerField;
    MovServicoNotaI_COD_SER: TIntegerField;
    MovServicoNotaI_SEQ_NOT: TIntegerField;
    MovServicoNotaN_VLR_SER: TFloatField;
    MovServicoNotaI_COD_EMP: TIntegerField;
    MovServicoNotaN_QTD_SER: TFloatField;
    MovServicoNotaN_TOT_SER: TFloatField;
    NOTASC_TIP_NOT: TStringField;
    NOTASI_COD_CLI: TIntegerField;
    NOTASI_SEQ_NOT: TIntegerField;
    NOTASC_SER_NOT: TStringField;
    NOTASD_DAT_EMI: TDateField;
    MovServicoNotaC_NOM_SER: TStringField;
    MovNotasFiscaisC_NOM_PRO: TStringField;
    FATURAS: TQuery;
    FATURASI_LAN_REC: TIntegerField;
    FATURASC_NRO_DUP: TStringField;
    FATURASN_VLR_PAR: TFloatField;
    FATURASD_DAT_VEN: TDateField;
    AUX: TQuery;
    NOTASC_COD_NAT: TStringField;
    BBAjuda: TBitBtn;
    NOTASI_EMP_FIL: TIntegerField;
    Label4: TLabel;
    ENatureza: TEditLocaliza;
    SpeedButton2: TSpeedButton;
    Label27: TLabel;
    Label12: TLabel;
    ESerie: TEditColor;
    Label2: TLabel;
    NroNota: Tnumerico;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EClientesSelect(Sender: TObject);
    procedure ENotasRetorno(Retorno1, Retorno2: String);
    procedure Data1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
  private
     NroLinhaFatura,
     NroCaracterServ : Integer;
     NF : TFuncoesNotaFiscal;
     procedure PosicionaNota;
     procedure ImprimeMarcados;
  public
    { Public declarations }
  end;

var
  FImprimeNotas: TFImprimeNotas;

implementation

uses APrincipal, constantes, fundata, constMsg,
  funstring, funNumeros, ANovaNotaFiscal, FunSql;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFImprimeNotas.FormCreate(Sender: TObject);
begin
  NF := TFuncoesNotaFiscal.criar(self, FPrincipal.BaseDados);
  Data1.DateTime := PrimeiroDiaMes(date);
  Data2.DateTime := UltimoDiaMes(Date);
  ESerie.Text := Varia.SerieNota;
  PosicionaNota;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFImprimeNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NF.Destroy;
  FechaTabela(Notas);
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Ações dos Localizas da nota de Saida
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFImprimeNotas.PosicionaNota;
begin
  LimpaSQLTabela(Notas);
  InseriLinhaSQL(Notas, 0,
    ' select * from ' +
    ' CadNotaFiscais NF, CadClientes CLI,  ' +
    ' CADNATUREZA NAT ' +
    ' where NF.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
    ' and NF.C_COD_NAT = NAT.C_COD_NAT ' +
    ' and NF.I_COD_CLI = CLI.I_COD_CLI ' +
    ' and NF.C_FLA_ECF = ''N'' ' +
    ' and NF.C_NOT_CAN = ''N''' +
    ' and NF.C_NOT_DEV = ''N''' );

  InseriLinhaSQL(Notas, 1, SQLTextoDataEntreAAAAMMDD( ' and NF.D_DAT_EMI ', Data1.Date, Data2.Date, False));
  if (EClientes.Text <> '') then
    InseriLinhaSQL(Notas, 2, ' and NF.I_COD_CLI = ' + EClientes.Text)
  else
    InseriLinhaSQL(Notas, 2, '');
  if (NroNota.AValor <> 0) then
    InseriLinhaSQL(Notas, 3, ' and NF.I_NRO_NOT = ' + inttostr(trunc(Nronota.avalor)))
  else
    InseriLinhaSQL(Notas, 3, '');

  if ESerie.Text <> '' then
    InseriLinhaSQL(Notas, 4, ' and NF.C_SER_NOT = ''' + ESerie.Text + '''')
  else
    InseriLinhaSQL(Notas, 4,'  ');

  if ENatureza.Text <> '' then
    InseriLinhaSQL(Notas, 5, ' and NF.C_COD_NAT = ''' + ENatureza.Text + '''')
  else
    InseriLinhaSQL(Notas, 5,'  ');

  InseriLinhaSQL(Notas, 6, ' order by NF.I_NRO_NOT ');
  AbreTabela(Notas);
end;
{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Ações das Notas de Entrada
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************Procura pelo Cliente**********************************}
procedure TFImprimeNotas.EClientesSelect(Sender: TObject);
begin
  EClientes.ASelectValida.Clear;
  EClientes.ASelectValida.Add(' select * from CadClientes as Cli ' +
                              ' where CLI.C_TIP_CAD <> ''F''' +
                              ' and CLI.C_NOM_CLI = ''@'' ' );
  EClientes.ASelectLocaliza.Clear;
  EClientes.ASelectLocaliza.Add(' select * from CadClientes as Cli ' +
                                ' where CLI.C_TIP_CAD <> ''F''' +
                                ' and CLI.C_NOM_CLI like ''@%'' order by c_nom_cli' );
end;

procedure TFImprimeNotas.ENotasRetorno(Retorno1, Retorno2: String);
begin
   PosicionaNota;
end;

procedure TFImprimeNotas.Data1Exit(Sender: TObject);
begin
   PosicionaNota;
end;

procedure TFImprimeNotas.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFImprimeNotas.BitBtn4Click(Sender: TObject);
begin
  FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(self,'',true);
  FNovaNotaFiscal.ConsultaNotafiscal(NOTASI_SEQ_NOT.AsInteger)
end;

procedure TFImprimeNotas.BitBtn1Click(Sender: TObject);
begin
  ImprimeMarcados;
end;

procedure TFImprimeNotas.ImprimeMarcados;
begin
  with NOTAS do
  begin
    PTempo.Execute('Imprimindo ...');
    DisableControls;
    First;
    while not EOF do
    begin
      if NotaGrid.SelectedRows.CurrentRowSelected then
      begin
         // Imprime a nota Fiscal.
          NF.ImprimeNotaFiscal(NOTASI_EMP_FIL.AsInteger,NotasI_SEQ_NOT.AsInteger);
          NotaGrid.SelectedRows.CurrentRowSelected := False;
      end;
      Next;
    end;
    EnableControls;
  end;
  PTempo.Fecha;
end;


procedure TFImprimeNotas.BImprimeClick(Sender: TObject);
begin
  with NOTAS do
  begin
    PTempo.Execute('Imprimindo ...');
    DisableControls;
    First;
    while not EOF do
    begin
      NF.ImprimeNotaFiscal(NOTASI_EMP_FIL.AsInteger,NotasI_SEQ_NOT.AsInteger);
      Next;
    end;
    EnableControls;
  end;
  PTempo.Fecha;
end;

procedure TFImprimeNotas.FormShow(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MFATURAMENTO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

procedure TFImprimeNotas.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FImprimeNotas.HelpContext);
end;

Initialization
 RegisterClasses([TFImprimeNotas]);
end.
