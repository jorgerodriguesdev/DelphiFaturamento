unit AVisualizaCupom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Db, DBTables, Grids, DBGrids, Tabela, Componentes1, ExtCtrls,
  PainelGradiente, StdCtrls, Mask, DBCtrls, Buttons, UnNotaFiscal, UnECF;

type
  TFVisualizaCupom = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    DBGridColor1: TDBGridColor;
    CadNotas: TQuery;
    MovNotas: TQuery;
    DatacadNotas: TDataSource;
    DataMovNotas: TDataSource;
    CadNotasI_NRO_NOT: TIntegerField;
    CadNotasD_DAT_EMI: TDateField;
    CadNotasD_DAT_SAI: TDateField;
    CadNotasN_VLR_ICM: TFloatField;
    CadNotasN_TOT_NOT: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEditColor;
    Label2: TLabel;
    DBEdit2: TDBEditColor;
    Label4: TLabel;
    DBEdit4: TDBEditColor;
    Label5: TLabel;
    DBEdit5: TDBEditColor;
    CadNotasC_NOM_CLI: TStringField;
    Label6: TLabel;
    DBEdit6: TDBEditColor;
    CadNotasI_SEQ_NOT: TIntegerField;
    CadNotasC_NOT_CAN: TStringField;
    MovNotasI_SEQ_NOT: TIntegerField;
    MovNotasC_COD_UNI: TStringField;
    MovNotasI_SEQ_PRO: TIntegerField;
    MovNotasN_QTD_PRO: TFloatField;
    MovNotasN_VLR_PRO: TFloatField;
    MovNotasN_TOT_PRO: TFloatField;
    MovNotasC_NOM_PRO: TStringField;
    FVisualizaCupom: TLabel;
    BFechar: TBitBtn;
    BCancelaCupom: TBitBtn;
    T: TPainelTempo;
    BBAjuda: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CadNotasAfterOpen(DataSet: TDataSet);
    procedure BFecharClick(Sender: TObject);
    procedure BCancelaCupomClick(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
  private
    ECF : TECF;
    NF : TFuncoesNotaFiscal;
    procedure AbreUltimoCupom;
    procedure AbreMovNotas( SeqNota : Integer);
    procedure MostraCupom( seqNota : integer );
  public
    procedure CancelaUltimoCupom;
    procedure VisualizaCupom( seqNota : Integer );
  end;

var
  FVisualizaCupom: TFVisualizaCupom;

implementation

uses APrincipal, funsql, funstring, constantes, constmsg;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFVisualizaCupom.FormCreate(Sender: TObject);
begin
  ECF := TECF.criar(self, FPrincipal.BaseDados);
  Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
  NF := TFuncoesNotaFiscal.Criar(self, FPrincipal.BaseDados);
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFVisualizaCupom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ECF.Free;
 NF.free;
 Action := CaFree;
end;

procedure TFVisualizaCupom.AbreUltimoCupom;
begin
  LimpaSQLTabela(CadNotas);
  AdicionaSQLAbreTabela(CadNotas, ' select * from cadnotafiscais cad, CadClientes as cli '+
                                  ' where i_emp_fil = ' + IntTostr(varia.CodigoEmpFil) +
                                  ' and cad.i_cod_cli = cli.i_cod_cli ' +
                                  ' and cad.i_seq_not = ' +
                                  ' ( select max(i_seq_not)from cadnotafiscais '+
                                  '   where c_fla_ecf = ''S''' +
                                  '   and i_emp_fil = ' + IntTostr(varia.CodigoEmpFil)+ ')');
  AbreMovNotas(CadNotasI_SEQ_NOT.AsInteger);
end;

procedure TFVisualizaCupom.AbreMovNotas( SeqNota : Integer);
begin
  AdicionaSQLAbreTabela(MovNotas, ' select * from movnotasfiscais mov, cadprodutos pro' +
                                  ' where i_emp_fil = ' + IntTostr(varia.CodigoEmpFil) +
                                  ' and mov.i_seq_not = ' + IntTostr(SeqNota)  +
                                  ' and mov.i_seq_pro = pro.i_seq_pro ' +
                                  ' and pro.i_cod_emp = ' + IntTostr(varia.CodigoEmpresa) );
end;

procedure TFVisualizaCupom.MostraCupom( seqNota : integer );
begin
  LimpaSQLTabela(CadNotas);
  AdicionaSQLAbreTabela(CadNotas, ' select * from cadnotafiscais cad, CadClientes as cli '+
                                  ' where i_emp_fil = ' + IntTostr(varia.CodigoEmpFil) +
                                  ' and cad.i_cod_cli = cli.i_cod_cli ' +
                                  ' and cad.i_seq_not = ' + IntTostr(seqNota) );
  AbreMovNotas(CadNotasI_SEQ_NOT.AsInteger);
end;

procedure TFVisualizaCupom.CancelaUltimoCupom;
begin
  AbreUltimoCupom;
  self.ShowModal;
end;

procedure TFVisualizaCupom.VisualizaCupom( seqNota : Integer );
begin
  MostraCupom(seqNota);
  PainelGradiente1.Caption := '  Visualiza Cupom   ';
  BCancelaCupom.Visible := false;
  self.ShowModal;
end;

{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFVisualizaCupom.CadNotasAfterOpen(DataSet: TDataSet);
begin
  if CadNotasC_NOT_CAN.AsString = 'S' then
  begin
    FVisualizaCupom.Visible := true;
    BCancelaCupom.Enabled := false;
  end;
end;

procedure TFVisualizaCupom.BFecharClick(Sender: TObject);
begin
  self.close;
end;

procedure TFVisualizaCupom.BCancelaCupomClick(Sender: TObject);
begin
  T.Execute('Cancelando cupom fiscal...');
  if not FPrincipal.BaseDados.InTransaction then
    FPrincipal.BaseDados.StartTransaction;
  try
  if ecf.AbrePorta then
     if (ecf.RetornaVariaveis(17)[3] = '1') then
     begin
        if NF.CancelaNotaFiscal(CadNotasI_SEQ_NOT.AsInteger) then
        begin
          ecf.CancelaCupomAnterior;
          AtualizaSQLTabela(CadNotas);
        end
        else
          aviso('Não foi possivel cancelar a cupom fiscal, fatura paga ou outro tipo de configuração');
     end
     else
       aviso('O Cupom Anterior não pode ser cancelado, por esta contido em uma redução Z ou outra situação que impede esta operação.');

  except
     if FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.Rollback;
     aviso('O Cupom Anterior não pode ser cancelado, por esta contido em uma redução Z ou outra situação que impede esta operação.');
  end;

     if FPrincipal.BaseDados.InTransaction then
       FPrincipal.BaseDados.Commit;
  ecf.FecharPorta;
  T.Fecha;
end;

procedure TFVisualizaCupom.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT, self.HelpContext);
end;

Initialization
 RegisterClasses([TFVisualizaCupom]);
end.
