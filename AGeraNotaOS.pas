unit AGeraNotaOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Componentes1, ExtCtrls, PainelGradiente, StdCtrls, Buttons, Db, DBTables,
  Mask, numericos, ComCtrls, Grids, DBGrids, Tabela, DBKeyViolation,
  Localizacao, UnOrdemServico;

Type
  TDadosOS = class
    NroOs : integer;
    Valor : Double;
    CodCliente : integer;
  end;

type
  TFGeraNotaOS = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    BotaoFechar1: TBitBtn;
    GradeOS: TListBoxColor;
    GridIndice1: TGridIndice;
    PanelColor3: TPanelColor;
    Label3: TLabel;
    Data1: TCalendario;
    data2: TCalendario;
    Label1: TLabel;
    ENroOs: Tnumerico;
    Os: TQuery;
    DataOS: TDataSource;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    OsI_EMP_FIL: TIntegerField;
    OsI_COD_ORS: TIntegerField;
    OsI_COD_SIT: TIntegerField;
    OsI_COD_CLI: TIntegerField;
    OsD_DAT_CAD: TDateField;
    OsD_DAT_FEC: TDateField;
    OsC_NOM_CLI: TStringField;
    OsN_TOT_ORS: TFloatField;
    numerico1: Tnumerico;
    Label2: TLabel;
    Label18: TLabel;
    Ecliente: TEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label20: TLabel;
    Localiza: TConsultaPadrao;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label24: TLabel;
    EditLocaliza5: TEditLocaliza;
    SpeedButton5: TSpeedButton;
    Label25: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BotaoFechar1Click(Sender: TObject);
    procedure Data1CloseUp(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EclienteRetorno(Retorno1, Retorno2: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditLocaliza5Select(Sender: TObject);
  private
    ValorTotal : double;
    NrosOS : string;
    UnOS : TFuncoesOrdemServico;
    procedure AbreConsulta;
    procedure SomaGrade;
    function ValidaCliente( CodCliente : integer) : Boolean;
  public
    { Public declarations }
  end;

var
  FGeraNotaOS: TFGeraNotaOS;

implementation

uses APrincipal, funsql, constantes, constmsg, fundata, ANovaNotaFiscal;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFGeraNotaOS.FormCreate(Sender: TObject);
begin
  UnOS := TFuncoesOrdemServico.Criar(self,FPrincipal.BaseDados);
  Data1.Date := PrimeiroDiaMes(Date);
  Data2.Date := UltimoDiaMes(Date);
  NrosOS := '';
  EditLocaliza5.Text := IntToStr(varia.CodigoEmpFil);
  EditLocaliza5.Atualiza;
  AbreConsulta;
  GradeOS.Color := GridIndice1.Color;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFGeraNotaOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnOS.free;
  os.close;
  Action := CaFree;
end;

procedure TFGeraNotaOS.AbreConsulta;
begin
  LimpaSQLTabela(OS);
  AdicionaSQLTabela(OS, ' Select * from cadOrdemServico os, CadClientes cli' );
  AdicionaSQLTabela(OS, ' Where os.C_Sit_Ors = ''F''' );

  if EditLocaliza5.text <> '' then
    AdicionaSQLTabela(OS,' and os.I_Emp_fil =  ' + EditLocaliza5.text );
  AdicionaSQLTabela(OS,SQLTextoDataEntreAAAAMMDD('os.D_DAT_FEC',Data1.DateTime, data2.DateTime, true));
  if ENroOs.AValor <> 0 then
    AdicionaSQLTabela(OS, ' and os.i_cod_ors = ' + Inttostr(trunc(ENroOs.AValor)) );
  AdicionaSQLTabela(os, ' and os.i_cod_cli = cli.i_cod_cli');
  if NrosOS <> '' then
    AdicionaSQLTabela(os, ' and os.i_cod_ors not in ( ' + NrosOS + ')' );
  if Ecliente.Text <> '' then
    AdicionaSQLTabela(OS, ' and os.i_cod_cli = ' + Ecliente.text );
 if CheckBox1.Checked then
    AdicionaSQLTabela(OS, ' and os.i_seq_not is null ' );
  AdicionaSQLTabela(OS,' order by os.i_cod_ors  ');
  AbreTabela(OS);
end;

procedure  TFGeraNotaOS.SomaGrade;
var
  laco : integer;
begin
  ValorTotal := 0;
  NrosOS := '';
  for laco := 0 to  GradeOS.Items.Count - 1 do
  begin
    ValorTotal := ValorTotal + TDadosOS(GradeOS.Items.Objects[Laco]).Valor;
    if NrosOS <> '' then
      NrosOS := NrosOS + ',';
    NrosOS := NrosOS + inttostr(TDadosOS(GradeOS.Items.Objects[Laco]).NroOs);
  end;
  numerico1.AValor := ValorTotal;
end;

function TFGeraNotaOS.ValidaCliente( CodCliente : integer) : Boolean;
var
  laco : integer;
begin
  result := true;
  if GradeOS.items.Count > 0 then
    for laco := 0 to GradeOS.Items.Count - 1 do
    begin
      if TDadosOS(GradeOS.Items.Objects[Laco]).CodCliente <> CodCliente then
       Result := false;
   end;
end;

{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFGeraNotaOS.BotaoFechar1Click(Sender: TObject);
begin
  self.close;
end;

procedure TFGeraNotaOS.Data1CloseUp(Sender: TObject);
begin
  AbreConsulta;
end;

procedure TFGeraNotaOS.SpeedButton1Click(Sender: TObject);
var
  Dados : TDadosOS;
begin
  if not os.IsEmpty then
    if ValidaCliente(OsI_COD_CLI.AsInteger) then
    begin
      Dados := TDadosOS.Create;
      Dados.NroOs := OsI_COD_ORS.AsInteger;
      Dados.Valor := OsN_TOT_ORS.AsCurrency;
      Dados.CodCliente := OsI_COD_CLI.AsInteger;
      GradeOS.Items.AddObject(OsI_COD_ORS.AsString + ' - ' +
                             FormatFloat(varia.MascaraMoeda, OsN_TOT_ORS.AsFloat) +
                             ' - ' + OsC_NOM_CLI.AsString ,dados);
      SomaGrade;
      AbreConsulta;
    end
    else
      Aviso('Não cliente inválido, não pode misturar clientes para gerar uma nota de varias ordem de serviços');
end;

procedure TFGeraNotaOS.SpeedButton2Click(Sender: TObject);
begin
  if GradeOS.Items.Count > 0 then
  begin
    GradeOS.Items.Delete(GradeOS.ItemIndex);
    SomaGrade;
    AbreConsulta;
  end;
end;

procedure TFGeraNotaOS.EclienteRetorno(Retorno1, Retorno2: String);
begin
  AbreConsulta;
end;


procedure TFGeraNotaOS.BitBtn1Click(Sender: TObject);
  var
    NroNota, SeqNota, laco : Integer;
begin
  if GradeOS.Items.Count <> 0 then
  begin
    FNovaNotaFiscal := TFNovaNotaFiscal.CriarSDI(application,'', fprincipal.VerificaPermisao('FNovaNotaFiscal'));
    SeqNota := FNovaNotaFiscal.GeraNotaOS(NrosOS, EditLocaliza5.Text, CheckBox2.Checked,NroNota);
    if NroNota <> 0 then
    begin
      for laco := 0 to  GradeOS.Items.Count - 1 do
      begin

//        UnOS.AdicionaNroNotaOS(TDadosOS(GradeOS.Items.Objects[Laco]).NroOs,NroNota, SeqNota);
//        if not config.BaixaOSFechamento then
//           UnOS.BaixaProdutoOS(TDadosOS(GradeOS.Items.Objects[Laco]).NroOs);
//        UnOS.BaixaEmprestimoOS(TDadosOS(GradeOS.Items.Objects[Laco]).NroOs);
          GradeOs.Clear;
      end;
    end;
    FNovaNotaFiscal.free;
  end
  else
    aviso('Não foi selecionada nenhuma nota fiscal');
end;


procedure TFGeraNotaOS.EditLocaliza5Select(Sender: TObject);
begin
   EditLocaliza5.ASelectLocaliza.Text := ' Select * from CadFiliais as fil ' +
                                         ' where c_nom_fan like ''@%'' ' +
                                         ' and i_cod_emp = ' + IntTostr(varia.CodigoEmpresa);
   EditLocaliza5.ASelectValida.Text := ' Select * from CadFiliais where I_EMP_FIL = @% ' +
                                       ' and i_cod_emp = ' + IntTostr(varia.CodigoEmpresa);
   if Varia.FilialUsuario <> '' then
   begin
     EditLocaliza5.ASelectValida.add(' and i_emp_fil not in ( ' + Varia.FilialUsuario + ')');
     EditLocaliza5.ASelectLocaliza.add(' and i_emp_fil not in ( ' + Varia.FilialUsuario + ')');
   end;
end;

Initialization
  RegisterClasses([TFGeraNotaOS]);
end.
