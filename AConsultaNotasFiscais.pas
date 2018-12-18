unit AConsultaNotasFiscais;
{
    Data Criação: 19/05/1999;
          Função: Consultar as notas fiscais

Motivo alteração:
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Componentes1, ExtCtrls, PainelGradiente, Localizacao, Buttons,
  Db, DBTables, ComCtrls, ConfigImpressora, Grids, DBGrids, printers, Mask,
  numericos, Tabela, DBCtrls, DBKeyViolation, Geradores, UnNotaFiscal;

type
  TFConsultaNotasFiscais = class(TFormularioPermissao)
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
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Data1: TCalendario;
    data2: TCalendario;
    ENotas: TEditLocaliza;
    EClientes: TEditLocaliza;
    NOTASc_not_can: TStringField;
    NOTASL_OBS_NOT: TMemoField;
    NOTASN_TOT_PRO: TFloatField;
    NOTASN_TOT_NOT: TFloatField;
    NOTASI_NRO_LOJ: TIntegerField;
    NOTASI_NRO_CAI: TIntegerField;
    MObs: TDBMemoColor;
    NotaGrid: TGridIndice;
    NOTASC_NOT_IMP: TStringField;
    Detalhes: TComponenteMove;
    Label50: TLabel;
    PanelColor5: TPanelColor;
    Label49: TLabel;
    DBText27: TDBText;
    Label28: TLabel;
    DBText8: TDBText;
    Label29: TLabel;
    DBText1: TDBText;
    Label30: TLabel;
    DBText7: TDBText;
    Label31: TLabel;
    DBText9: TDBText;
    Label32: TLabel;
    DBText10: TDBText;
    Label34: TLabel;
    DBText12: TDBText;
    Label35: TLabel;
    DBText13: TDBText;
    Label36: TLabel;
    DBText14: TDBText;
    Label40: TLabel;
    DBText18: TDBText;
    Label41: TLabel;
    DBText19: TDBText;
    Label42: TLabel;
    DBText20: TDBText;
    Label47: TLabel;
    DBText25: TDBText;
    Label14: TLabel;
    DBText4: TDBText;
    Label12: TLabel;
    DBText5: TDBText;
    BOk: TBitBtn;
    NOTASD_DAT_CAD: TDateField;
    NOTASD_DAT_ALT: TDateField;
    NOTASC_END_CLI: TStringField;
    NOTASC_BAI_CLI: TStringField;
    NOTASC_CEP_CLI: TStringField;
    NOTASC_EST_CLI: TStringField;
    NOTASC_CPF_CLI: TStringField;
    NOTASC_CGC_CLI: TStringField;
    NOTASC_FON_FAX: TStringField;
    NOTASD_DAT_SAI: TDateField;
    NOTAST_HOR_SAI: TTimeField;
    NOTASI_QTD_VOL: TIntegerField;
    NOTASN_VLR_ICM: TFloatField;
    NOTASN_BAS_SUB: TFloatField;
    NOTASN_VLR_SUB: TFloatField;
    NOTASN_VLR_FRE: TFloatField;
    NOTASN_VLR_SEG: TFloatField;
    NOTASN_OUT_DES: TFloatField;
    NOTASN_TOT_IPI: TFloatField;
    NOTASN_PES_BRU: TFloatField;
    NOTASN_PES_LIQ: TFloatField;
    NOTASN_TOT_SER: TFloatField;
    NOTASN_VLR_ISQ: TFloatField;
    BitBtn1: TBitBtn;
    SitNota: TRadioGroup;
    CupomNota: TRadioGroup;
    Label2: TLabel;
    DBText2: TDBText;
    NOTASI_SEQ_NOT: TIntegerField;
    ENatureza: TEditLocaliza;
    Label4: TLabel;
    SpeedButton2: TSpeedButton;
    Label27: TLabel;
    NOTASC_COD_NAT: TStringField;
    Label5: TLabel;
    ESerie: TEditColor;
    NOTASC_SER_NOT: TStringField;
    BBAjuda: TBitBtn;
    NOTASC_INF_NOT: TStringField;
    DBMemoColor1: TDBMemoColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EClientesSelect(Sender: TObject);
    procedure ENotasSelect(Sender: TObject);
    procedure ENotasRetorno(Retorno1, Retorno2: String);
    procedure Data1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure NotaGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SitNotaClick(Sender: TObject);
    procedure ENaturezaRetorno(Retorno1, Retorno2: String);
    procedure FormShow(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
  private
     NF : TFuncoesNotaFiscal;
     procedure PosicionaNota;
  public
    { Public declarations }
  end;

var
  FConsultaNotasFiscais: TFConsultaNotasFiscais;

implementation

uses APrincipal, constantes, fundata, constMsg,
  funstring, funNumeros, ANovaNotaFiscal, FunSql, 
  AVisualizaCupom;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFConsultaNotasFiscais.FormCreate(Sender: TObject);
begin
  ESerie.text := varia.SerieNota;
  NF := TFuncoesNotaFiscal.Criar(self, FPrincipal.BaseDados);
  SitNota.ItemIndex := 0;
  CupomNota.ItemIndex := 1;
  Data1.DateTime := PrimeiroDiaMes(date);
  Data2.DateTime := UltimoDiaMes(Date);
  PosicionaNota;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConsultaNotasFiscais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NF.Free;
  FechaTabela(Notas);
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Ações dos Localizas da nota de Saida
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************* posiciona Consulta da Nota *********************** }
procedure TFConsultaNotasFiscais.PosicionaNota;
begin
  LimpaSQLTabela(Notas);
  InseriLinhaSQL(Notas, 0,
    ' select ' +
    ' NF.I_NRO_NOT, CLI.C_NOM_CLI, CLI.C_CID_CLI, CLI.C_TIP_CAD, NF.C_FLA_ECF, NF.c_not_can, ' +
    ' NF.L_OBS_NOT, NF.N_TOT_PRO, NF.N_TOT_NOT, NF.I_NRO_LOJ, NF.I_NRO_CAI, CLI.D_DAT_CAD, ' +
    ' CLI.D_DAT_ALT, CLI.C_END_CLI, CLI.C_BAI_CLI, CLI.C_CEP_CLI, CLI.C_EST_CLI, CLI.C_CPF_CLI, ' +
    ' CLI.C_CGC_CLI, CLI.C_FON_FAX, NF.D_DAT_SAI, NF.T_HOR_SAI, NF.I_QTD_VOL, NF.N_VLR_ICM, ' +
    ' NF.N_BAS_SUB, NF.N_VLR_SUB, NF.N_VLR_FRE, NF.N_VLR_SEG, NF.N_OUT_DES, NF.N_TOT_IPI, ' +
    ' NF.N_PES_BRU, NF.N_PES_LIQ, NF.N_TOT_SER, NF.N_VLR_ISQ, NF.I_SEQ_NOT, NF.C_COD_NAT, NF.C_NOT_IMP, NF.C_SER_NOT, NF.C_INF_NOT  ' +
    ' from ' +
    ' CadNotaFiscais as NF, CadClientes as CLI ' +
    ' where ' );

  InseriLinhaSQL( Notas, 1, SQLTextoDataEntreAAAAMMDD( ' NF.D_DAT_EMI ', Data1.Date, Data2.Date, False) +
                 ' and NF.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                 ' and NF.I_COD_CLI *= CLI.I_COD_CLI ' +
                 ' and NF.I_NRO_NOT is not null ' );

  if (EClientes.Text <> '') then
    InseriLinhaSQL(Notas, 2, ' and NF.I_COD_CLI = ' + EClientes.Text)
  else
    InseriLinhaSQL(Notas, 2, ' ');

  if (ENotas.Text <> '') then
    InseriLinhaSQL(Notas, 3, ' and NF.I_NRO_NOT = ' + ENotas.Text)
  else
    InseriLinhaSQL(Notas, 3, ' ');

  if ENatureza.Text <> '' then
    InseriLinhaSQL(Notas, 4, ' and NF.C_COD_NAT = ''' + ENatureza.Text + '''' )
  else
    InseriLinhaSQL(Notas, 4, ' ');


  case SitNota.ItemIndex of
    0 : InseriLinhaSQL(Notas, 5, ' and isnull(NF.C_NOT_CAN, ''N'') = ''N''' );
    1 : InseriLinhaSQL(Notas, 5, ' and NF.C_NOT_CAN = ''S''' );
  else
    InseriLinhaSQL(Notas, 5,' ' );
  end;

  case CupomNota.ItemIndex of
    0 : InseriLinhaSQL(Notas, 6, ' and NF.C_FLA_ECF = ''S''' );
    1 : InseriLinhaSQL(Notas, 6, ' and isnull(NF.C_FLA_ECF, ''N'') = ''N''' );
  else
    InseriLinhaSQL(Notas, 6,' ' );
  end;

  if (ESerie.Text <> '') and (CupomNota.ItemIndex = 1) then
    InseriLinhaSQL(Notas, 7, ' and NF.C_SER_NOT = ''' + ESerie.Text + '''' )
  else
    InseriLinhaSQL(Notas, 7, ' ');

  InseriLinhaSQL(Notas, 8,' order by NF.I_NRO_NOT ');
  AbreTabela(Notas);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Ações das Notas de Entrada
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************Procura pelo Cliente**********************************}
procedure TFConsultaNotasFiscais.EClientesSelect(Sender: TObject);
begin
  EClientes.ASelectValida.Clear;
  EClientes.ASelectValida.Add(' select i_cod_cli, c_nom_cli from CadClientes as Cli ' +
                              ' where  CLI.I_COD_CLI = @ ' +
                              ' and CLI.C_TIP_CAD <> ''F''' );
  EClientes.ASelectLocaliza.Clear;
  EClientes.ASelectLocaliza.Add(' select i_cod_cli, c_nom_cli from CadClientes as Cli ' +
                                ' where CLI.C_NOM_CLI like ''@%'' ' +
                                ' and CLI.C_TIP_CAD <> ''F''' +
                                ' order by c_nom_cli' );
end;

{***************** select da consulta da nota fiscal *********************** }
procedure TFConsultaNotasFiscais.ENotasSelect(Sender: TObject);
begin
  ENotas.ASelectValida.Clear;
  ENotas.ASelectValida.Add(' select NF.I_NRO_NOT, D_DAT_EMI, Cli.C_NOM_CLI from CadNotaFiscais as NF, CadClientes as Cli ' +
                           ' where NF.I_NRO_NOT = @ ' +
                           ' and I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                           ' and NF.I_COD_CLI = CLI.I_COD_CLI ' );
  ENotas.ASelectLocaliza.Clear;
  ENotas.ASelectLocaliza.Add(' select NF.I_NRO_NOT, D_DAT_EMI, Cli.C_NOM_CLI from CadNotaFiscais as NF, CadClientes as Cli ' +
                             ' where ' +
                             ' NF.I_NRO_NOT like ''@%'' ' +
                             ' and NF.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                             ' and NF.I_COD_CLI = CLI.I_COD_CLI ' );
  case CupomNota.ItemIndex of
     0 : begin
           ENotas.ASelectLocaliza.Add(' and NF.C_FLA_ECF = ''S'' ');
           ENotas.ASelectValida.Add(' and NF.C_FLA_ECF = ''S'' ');
          end;
     1 : begin
           ENotas.ASelectLocaliza.Add(' and NF.C_FLA_ECF = ''N'' ');
           ENotas.ASelectValida.Add(' and NF.C_FLA_ECF = ''N'' ');
          end;
  end;
end;

{************* consulta no retorno do edit localiza ************************** }
procedure TFConsultaNotasFiscais.ENotasRetorno(Retorno1, Retorno2: String);
begin
  PosicionaNota;
end;

{*************** retorno da natureza *************************************** }
procedure TFConsultaNotasFiscais.ENaturezaRetorno(Retorno1,
  Retorno2: String);
begin
  PosicionaNota;
end;

{************** consulta no exit das data ************************************ }
procedure TFConsultaNotasFiscais.Data1Exit(Sender: TObject);
begin
   PosicionaNota;
end;

{****************** fecha o formulario ************************************** }
procedure TFConsultaNotasFiscais.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

{********************* visualiza a nota fiscal ***************************** }
procedure TFConsultaNotasFiscais.BitBtn4Click(Sender: TObject);
begin
  if not notas.eof then
  begin
    if NOTASC_FLA_ECF.AsString = 'S' then
    begin
      FVisualizaCupom := TFVisualizaCupom.CriarSDI(self, '', true);
      FVisualizaCupom.VisualizaCupom(NOTASI_SEQ_NOT.AsInteger);
    end
    else
    begin
      FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(self,'',true);
      FNovaNotaFiscal.ConsultaNotafiscal(NOTASI_SEQ_NOT.AsInteger)
    end;
  end;
end;

{************* mostra os detalhes da nota fiscal *************************** }
procedure TFConsultaNotasFiscais.BitBtn1Click(Sender: TObject);
begin
  Detalhes.Visible := True;
  Detalhes.Top := 0;
  BOk.SetFocus;
end;

{************* esconde detalhes da nota ************************************* }
procedure TFConsultaNotasFiscais.BOkClick(Sender: TObject);
begin
  Detalhes.Visible := False;
  NotaGrid.SetFocus;
end;

{************ caso enter na nota mostra detalhes ************************** }
procedure TFConsultaNotasFiscais.NotaGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    Detalhes.Visible := True;
    BOk.SetFocus;
  end;
end;

{************* pocisiona a nota conforme filtro *************************** }
procedure TFConsultaNotasFiscais.SitNotaClick(Sender: TObject);
begin
  ENotasSelect(nil);
  ENotas.Clear;
  PosicionaNota;
end;


procedure TFConsultaNotasFiscais.FormShow(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MFATURAMENTO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

procedure TFConsultaNotasFiscais.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FConsultaNotasFiscais.HelpContext);
end;

Initialization
 RegisterClasses([TFConsultaNotasFiscais]);
end.
