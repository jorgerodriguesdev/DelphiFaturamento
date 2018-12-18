unit AImprimeNFEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Componentes1, ExtCtrls, PainelGradiente, Db, DBTables, Grids, DBGrids,
  Tabela, StdCtrls, Mask, numericos, Buttons, UCrpe32;

type
  TFImprimeNFEntrega = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    Label20: TLabel;
    numerico1: Tnumerico;
    Label17: TLabel;
    numerico2: Tnumerico;
    Label19: TLabel;
    ESerie: TEditColor;
    PanelColor3: TPanelColor;
    DBGridColor1: TDBGridColor;
    Notas: TQuery;
    DataNotas: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BFechar: TBitBtn;
    Aux: TQuery;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GradeNF: TListBoxColor;
    Label1: TLabel;
    Rel: TCrpe;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure numerico1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure CarregaNotas;
  public
    { Public declarations }
  end;

  type
    TDadoNF = class
      SeqNota : integer;
    end;

var
  FImprimeNFEntrega: TFImprimeNFEntrega;

implementation

uses APrincipal, funsql, constantes, unNotafiscal, constmsg;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFImprimeNFEntrega.FormCreate(Sender: TObject);
begin
  rel.ReportName := varia.PathRel + 'diverso\NotasFiscaisParaEntrega.rpt';
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFImprimeNFEntrega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Notas.close;
 Action := CaFree;
end;


procedure TFImprimeNFEntrega.CarregaNotas;
begin
  LimpaSQLTabela(Notas);
  AdicionaSQLTabela(Notas, ' Select * from cadNotaFiscais Cad, CadClientes cli ' +
                           ' where cad.i_nro_not >= ' + Inttostr(trunc(numerico1.avalor))+
                           ' and cad.i_nro_not <= ' + Inttostr(trunc(numerico2.avalor)) +
                           ' and cad.c_ser_not = ''' + ESerie.text + '''' +
                           ' and cad.c_fla_ecf = ''N''' +
                           ' and cad.i_emp_fil = ' + Inttostr(varia.CodigoEmpFil) +
                           ' and cad.i_cod_cli = cli.i_cod_cli ' +
                           ' order by cad.i_nro_not ' );
  AbreTabela(notas);
end;


procedure TFImprimeNFEntrega.BitBtn1Click(Sender: TObject);
begin
  CarregaNotas;
end;

procedure TFImprimeNFEntrega.numerico1Change(Sender: TObject);
begin
   BitBtn1.Enabled := (numerico1.AValor <> 0) and (numerico2.AValor <> 0) and (ESerie.Text <> '');
end;

procedure TFImprimeNFEntrega.BitBtn2Click(Sender: TObject);
var
  NF : TFuncoesNotaFiscal;
begin
  if not notas.eof then
  begin
    nf := TFuncoesNotaFiscal.criar(self,FPrincipal.BaseDados);
    notas.First;
    while not Notas.Eof do
    begin
      nf.ImprimeRomaneio(notas.fieldByName('i_seq_not').AsInteger,
                         notas.fieldByName('i_emp_fil').AsInteger,1 );
      notas.Next;
    end;
    nf.Free;
  end;
end;

procedure TFImprimeNFEntrega.BFecharClick(Sender: TObject);
begin
  self.close;
end;

procedure TFImprimeNFEntrega.SpeedButton1Click(Sender: TObject);
var
  Dados : TDadoNF;
begin
  if not notas.Eof then
  begin
    Dados := TDadoNF.Create;
    Dados.SeqNota := notas.fieldbyname('i_seq_not').AsInteger;
    GradeNF.Items.AddObject(notas.fieldbyname('i_nro_not').AsString +
                            ' - ' + notas.fieldbyname('c_nom_cli').AsString,dados);
  end;
end;

procedure TFImprimeNFEntrega.SpeedButton2Click(Sender: TObject);
begin
  if GradeNF.Items.Count <> 0 then
    GradeNF.Items.Delete(GradeNF.ItemIndex);
end;

procedure TFImprimeNFEntrega.BitBtn3Click(Sender: TObject);
var
  laco :integer;
  Inicio, fim : String;
begin
 rel.ParamFields.Retrieve;
 rel.ParamFields[0].Value := IntToStr(Varia.CodigoEmpFil);
 rel.ParamFields[1].Value := ESerie.text;
 rel.SQL.Query.Clear;
 rel.SQL.Retrieve;
 for laco := 0 to GradeNF.Items.Count - 1 do
 begin
   if laco = 0 then
     inicio := ' where ( '
   else
     inicio := ' or ';
   fim := '';
   if laco = GradeNF.Items.Count - 1 then
     fim := ' ) ';

   rel.SQL.Query.Insert(15 + laco,inicio + ' CADNOTAFISCAIS."I_SEQ_NOT" = ' +
                           Inttostr(TDadoNF(GradeNF.Items.Objects[Laco]).SeqNota) + fim);
 end;
 rel.execute;
end;

Initialization
 RegisterClasses([TFImprimeNFEntrega]);
end.
