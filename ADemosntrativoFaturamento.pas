unit ADemosntrativoFaturamento;

{          Autor: sergio
    Data Criação: 19/05/1999;
          Função: Consultar as notas fiscais.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Componentes1, ExtCtrls, PainelGradiente, Localizacao, Buttons,
  Db, DBTables, ComCtrls, ConfigImpressora, Grids, DBGrids, printers, Mask,
  numericos, Tabela, DBCtrls, DBKeyViolation, Geradores;

type
  TFDemonstrativoFaturamento = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    Localiza: TConsultaPadrao;
    NOTAS: TQuery;
    DATANOTAS: TDataSource;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    PanelColor3: TPanelColor;
    Label8: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Data1: TCalendario;
    data2: TCalendario;
    EClientes: TEditLocaliza;
    NotaGrid: TGridIndice;
    NOTASNOTAS: TFloatField;
    NOTASSERVICO: TFloatField;
    NOTASISQN: TFloatField;
    NOTASEMISSAO: TStringField;
    NOTASICMS: TFloatField;
    AUX: TQuery;
    ETotalNotas: Tnumerico;
    ETotalServico: Tnumerico;
    EICMS: Tnumerico;
    EISQN: Tnumerico;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CEmpresaFilial: TComboBoxColor;
    Label5: TLabel;
    BBAjuda: TBitBtn;
    BImprimir: TBitBtn;
    RDemonstrativo: TComboBoxColor;
    RTipo: TComboBoxColor;
    Label6: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    ESerie: TEditColor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EClientesSelect(Sender: TObject);
    procedure ENotasRetorno(Retorno1, Retorno2: String);
    procedure Data1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    function FormHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure BImprimirClick(Sender: TObject);
  private
     procedure PosicionaNota;
  public
    { Public declarations }
  end;

var
  FDemonstrativoFaturamento: TFDemonstrativoFaturamento;

implementation

uses APrincipal, constantes, fundata, constMsg,
  funstring, funNumeros, ANovaNotaFiscal, FunSql,
  AImprimeDemonstrativoFaturamento;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFDemonstrativoFaturamento.FormCreate(Sender: TObject);
begin
  ESerie.text := varia.SerieNota;
  RDemonstrativo.ItemIndex := 0;
  RTipo.ItemIndex := 0;
  CEmpresaFilial.ItemIndex := 0;
  Data1.DateTime := PrimeiroDiaMes(date);
  Data2.DateTime := UltimoDiaMes(Date);
  PosicionaNota;
  if not ConfigModulos.Servico then
  begin
    NotaGrid.Columns[3].Visible := false;
    NotaGrid.Columns[4].Visible := false;
  end;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFDemonstrativoFaturamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaTabela(Notas);
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Ações dos Localizas da nota de Saida
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFDemonstrativoFaturamento.PosicionaNota;
var
  Tabelas, Filtro  : string;
begin
  LimpaSQLTabela(Notas);

  case RDemonstrativo.ItemIndex of
    0 : NotaGrid.Columns[0].Title.Caption := 'Ano';
    1 : NotaGrid.Columns[0].Title.Caption := 'Mês';
    2 : NotaGrid.Columns[0].Title.Caption := 'Emissão';
  end;

  Tabelas := ' CadNotaFiscais as NF, CadNatureza Mov ' +
             ' WHERE isnull(NF.C_NOT_CAN, ''N'') = ''N''' +
             ' and isnull(NF.C_NOT_DEV, ''N'') = ''N''' +
             ' and NF.C_COD_NAT = Mov.C_COD_NAT ' +
             ' and mov.c_mos_fat = ''S'' ';


  case RTipo.ItemIndex of
    0 : begin
         if RTipo.ItemIndex = 0 then
          filtro := ' and NF.C_FLA_ECF = ''N''';

        end;
    1 : begin
          filtro :=' and NF.C_FLA_ECF = ''S''';
        end;
    2 : begin
         if ESerie.text <> '' then
           filtro := ' and (nf.c_fla_ecf = ''S'' or nf.c_ser_not = ''' +  ESerie.text + ''' ) ';
        end;
  end;


  InseriLinhaSQL(Notas, 0, ' select ');
  InseriLinhaSQL(Notas, 1, ' ');
  InseriLinhaSQL(Notas, 2,
      ' SUM(ISNULL(N_TOT_NOT, 0)) NOTAS, ' +
      ' SUM(ISNULL(N_VLR_ICM, 0)) ICMS, ' +
      ' SUM(ISNULL(N_TOT_SER, 0)) SERVICO, ' +
      ' SUM(ISNULL(N_VLR_ISQ, 0)) ISQN from ' +
      Tabelas + Filtro );

  InseriLinhaSQL(Notas, 3, SQLTextoDataEntreAAAAMMDD( ' and D_DAT_EMI ', Data1.Date, Data2.Date, False) );

  if CEmpresaFilial.ItemIndex = 0 then
    InseriLinhaSQL(Notas, 4, ' and NF.I_EMP_FIL = ' + IntToStr(varia.CodigoEmpFil) )
  else
    InseriLinhaSQL(Notas, 4, ' and left(NF.I_EMP_FIL,1) = '  + IntToStr(varia.CodigoEmpresa) );



  if (EClientes.Text <> '') then
    InseriLinhaSQL(Notas, 5, ' and I_COD_CLI = ' + EClientes.Text)
  else
    InseriLinhaSQL(Notas, 5, '');

  if (ESerie.text <> '') and (RTipo.ItemIndex = 0) then
    InseriLinhaSQL(Notas, 6, ' and C_SER_NOT = ' + ESerie.Text)
  else
    InseriLinhaSQL(Notas, 6, '');


  AUX.SQL.Clear;
  AUX.SQL := Notas.SQL;
  AbreTabela(AUX);
  // Soma Valores;
  ETotalNotas.AValor := AUX.FieldByName('NOTAS').AsFloat;
  ETotalServico.AValor := AUX.FieldByName('SERVICO').AsFloat;
  EICMS.AValor := AUX.FieldByName('ICMS').AsFloat;
  EISQN.AValor := AUX.FieldByName('ISQN').AsFloat;
  DeletaLinhaSQL(Notas, 1);
  case RDemonstrativo.ItemIndex of
    0 : InseriLinhaSQL(Notas, 1, ' CAST(YEAR(D_DAT_EMI) AS CHAR(10)) EMISSAO, ');
    1 : InseriLinhaSQL(Notas, 1, ' CAST(MONTH(D_DAT_EMI) AS CHAR(10)) EMISSAO, ');
    2 : InseriLinhaSQL(Notas, 1, ' CONVERT( CHAR( 10 ), D_DAT_EMI, 101 ) EMISSAO, ');
  end;
  case RDemonstrativo.ItemIndex of
    0 : InseriLinhaSQL(Notas, 7, ' GROUP BY EMISSAO order by 1');
    1 : InseriLinhaSQL(Notas, 7, ' GROUP BY EMISSAO  order by 1');
    2 : InseriLinhaSQL(Notas, 7, ' GROUP BY D_DAT_EMI ORDER BY D_DAT_EMI ');
  end;

  AbreTabela(Notas);
end;
{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Ações das Notas de Entrada
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************Procura pelo Cliente**********************************}
procedure TFDemonstrativoFaturamento.EClientesSelect(Sender: TObject);
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


procedure TFDemonstrativoFaturamento.ENotasRetorno(Retorno1, Retorno2: String);
begin
   PosicionaNota;
end;

procedure TFDemonstrativoFaturamento.Data1Exit(Sender: TObject);
begin
   PosicionaNota;
end;

procedure TFDemonstrativoFaturamento.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFDemonstrativoFaturamento.BitBtn4Click(Sender: TObject);
begin
  // CARREGA A NOTA FISCAL.
end;

procedure TFDemonstrativoFaturamento.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FDemonstrativoFaturamento.HelpContext);
end;

function TFDemonstrativoFaturamento.FormHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
   Self.HelpFile := Varia.PathHelp + 'MFATURAMENTO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

procedure TFDemonstrativoFaturamento.BImprimirClick(Sender: TObject);
begin
  FImprimeDemonstrativoFaturamento := TFImprimeDemonstrativoFaturamento.CriarSDI(application, '', true);
  FImprimeDemonstrativoFaturamento.carregaImpressao( NOTAS.sql.Text, varia.NomeEmpresa,Varia.NomeFilial,
                                                     FormatFloat(varia.MascaraMoeda, ETotalNotas.AValor),
                                                     FormatFloat(varia.MascaraMoeda, EICMS.AValor),
                                                     FormatFloat(varia.MascaraMoeda, ETotalServico.AValor),
                                                     FormatFloat(varia.MascaraMoeda, EISQN.AValor),
                                                     DeletaEspacoDE(Label7.Caption), NotaGrid.Columns[0].Title.Caption);

end;

Initialization
 RegisterClasses([TFDemonstrativoFaturamento]);
end.
