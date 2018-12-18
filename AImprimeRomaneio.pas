unit AImprimeRomaneio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Componentes1, ExtCtrls, PainelGradiente, Db, DBTables, Grids, DBGrids,
  Tabela, StdCtrls, Mask, numericos, Buttons;

type
  TFImprimeRomaneio = class(TFormularioPermissao)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure numerico1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
  private
    procedure CarregaNotas;
  public
    { Public declarations }
  end;

var
  FImprimeRomaneio: TFImprimeRomaneio;

implementation

uses APrincipal, funsql, constantes, unNotafiscal;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFImprimeRomaneio.FormCreate(Sender: TObject);
begin
  {  abre tabelas }
  { chamar a rotina de atualização de menus }
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFImprimeRomaneio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Notas.close;
 Action := CaFree;
end;


procedure TFImprimeRomaneio.CarregaNotas;
begin
  LimpaSQLTabela(Notas);
  AdicionaSQLTabela(Notas, ' Select * from cadNotaFiscais Cad, CadClientes cli ' +
                           ' where cad.i_nro_not >= ' + Inttostr(trunc(numerico1.avalor))+
                           ' and cad.i_nro_not <= ' + Inttostr(trunc(numerico2.avalor)) +
                           ' and cad.c_ser_not = ''' + ESerie.text + '''' +
                           ' and cad.i_emp_fil = ' + Inttostr(varia.CodigoEmpFil) +
                           ' and cad.i_cod_cli = cli.i_cod_cli ' +
                           ' order by cad.i_nro_not ' );
  AbreTabela(notas);
end;


procedure TFImprimeRomaneio.BitBtn1Click(Sender: TObject);
begin
  CarregaNotas;
end;

procedure TFImprimeRomaneio.numerico1Change(Sender: TObject);
begin
   BitBtn1.Enabled := (numerico1.AValor <> 0) and (numerico2.AValor <> 0) and (ESerie.Text <> '');
end;

procedure TFImprimeRomaneio.BitBtn2Click(Sender: TObject);
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

procedure TFImprimeRomaneio.BFecharClick(Sender: TObject);
begin
  self.close;
end;

Initialization
 RegisterClasses([TFImprimeRomaneio]);
end.
