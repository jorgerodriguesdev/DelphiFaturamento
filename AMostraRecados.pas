unit AMostraRecados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Db, DBTables, PainelGradiente, StdCtrls, Mask, DBCtrls, Tabela, Buttons,
  Grids, DBGrids, ExtCtrls, Componentes1, numericos,  Spin,
  ComCtrls, ToolWin, ImgList;

type
  TFMostraRecados = class(TFormularioPermissao)
    Painel: TPanelColor;
    Dataligacoes: TDataSource;
    PanelColor1: TPanelColor;
    Grade: TDBGridColor;
    Cadligacoes: TQuery;
    CadligacoesI_EMP_FIL: TIntegerField;
    CadligacoesI_SEQ_LIG: TIntegerField;
    CadligacoesD_DAT_LIG: TDateField;
    CadligacoesI_COD_USU: TIntegerField;
    CadligacoesI_COD_CLI: TIntegerField;
    CadligacoesC_NOM_CLI: TStringField;
    CadligacoesC_TEX_LIG: TMemoField;
    CadligacoesT_HOR_LIG: TDateTimeField;
    CadligacoesC_RET_LIG: TStringField;
    CadligacoesC_RET_REC: TStringField;
    CadligacoesC_NOM_REC: TStringField;
    CadligacoesC_FEZ_RET: TStringField;
    CadligacoesC_FEZ_REC: TStringField;
    DBMemoColor1: TDBMemoColor;
    BitBtn3: TBitBtn;
    BFechar: TBitBtn;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ExZoom: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure ExZoomClick(Sender: TObject);
  private

  public
     procedure CarregaConsulta;
  end;

var
  FMostraRecados: TFMostraRecados;

implementation

uses APrincipal, constantes, ConstMsg, funsql, fundata;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFMostraRecados.FormCreate(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'FINANCEIRO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  CarregaConsulta;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFMostraRecados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Cadligacoes.close;
 Action := CaFree;
end;

{ ************************** mostra as disciplinas**************************** }
procedure TFMostraRecados.CarregaConsulta;
begin
   AdicionaSQLAbreTabela(Cadligacoes, ' select * from cadligacoes'+
                                      ' where i_emp_fil = '+ inttostr(varia.codigoempfil)+
                                      ' and c_ret_rec = ''S'''+
                                      ' and c_fez_rec = ''N'''+
                                      ' order by c_nom_rec');
end;

procedure TFMostraRecados.BitBtn3Click(Sender: TObject);
begin
if not cadligacoes.IsEmpty then
  ExecutaComandoSql(cadligacoes, ' Update cadligacoes ' +
                                 ' set c_fez_rec = ''S''' +
                                 ' where i_emp_fil = ' + inttostr(varia.codigoempfil)+
                                 ' and i_seq_lig  = ' + inttostr(cadligacoes.fieldbyname('i_seq_lig').asinteger)+
                                 ' and d_dat_lig = ' + SQLTEXTODATAAAAAMMMDD(Cadligacoes.fieldbyname('d_dat_lig').asdatetime));
  CarregaConsulta;
end;


procedure TFMostraRecados.FormResize(Sender: TObject);
begin
  carregaConsulta;
end;

procedure TFMostraRecados.BFecharClick(Sender: TObject);
begin
  close;
end;


procedure TFMostraRecados.ExZoomClick(Sender: TObject);
begin
   if ExZoom.Down then
   begin
     ExZoom.ImageIndex := 1;
     Painel.Visible := false;
     self.ClientHeight := 25;
   end
   else
   begin
      ExZoom.ImageIndex := 0;
      Painel.Visible :=  true;
      self.ClientHeight := 220;
      CarregaConsulta;
   end;
end;

Initialization
 RegisterClasses([TFMostraRecados]);
end.
