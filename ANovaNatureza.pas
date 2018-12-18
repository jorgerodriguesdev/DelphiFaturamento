unit ANovaNatureza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Db, BotaoCadastro, StdCtrls, Buttons, DBTables, Tabela,
  Componentes1, ExtCtrls, PainelGradiente, DBKeyViolation, Grids, DBGrids,
  Mask, DBCtrls, Localizacao, UnImpressao, ComCtrls;

type
  TFNovaNatureza = class(TFormularioPermissao)
    Localiza: TConsultaPadrao;
    CadNaturezas: TSQL;
    DataMovNatureza: TDataSource;
    PainelGradiente1: TPainelGradiente;
    PanelColor3: TPanelColor;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    Label13: TLabel;
    Label15: TLabel;
    SpeedButton2: TSpeedButton;
    Label14: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DelOperacaoEstoque: TDBEditLocaliza;
    EPlano: TDBEditNumerico;
    DBEditColor3: TDBEditChar;
    DBEditColor4: TDBEditChar;
    DBEditColor6: TDBEditChar;
    DBEditColor7: TDBEditChar;
    DBEditColor1: TDBEditChar;
    DBEditColor8: TDBEditChar;
    MObs: TDBMemoColorLimite;
    EditColor1: TEditColor;
    PanelColor5: TPanelColor;
    BotaoGravar2: TBotaoGravar;
    BotaoCancelar2: TBotaoCancelar;
    BFechar: TBitBtn;
    Aux: TQuery;
    CadNaturezasC_COD_NAT: TStringField;
    CadNaturezasC_GER_FIN: TStringField;
    CadNaturezasC_ENT_SAI: TStringField;
    CadNaturezasC_BAI_EST: TStringField;
    CadNaturezasL_TEX_FIS: TMemoField;
    CadNaturezasC_CAL_ICM: TStringField;
    CadNaturezasC_GER_COM: TStringField;
    CadNaturezasC_IMP_AUT: TStringField;
    CadNaturezasI_COD_OPE: TIntegerField;
    CadNaturezasC_CLA_PLA: TStringField;
    CadNaturezasI_COD_EMP: TIntegerField;
    CadNaturezasC_INS_SER: TStringField;
    CadNaturezasC_NAT_LOC: TStringField;
    CadNaturezasC_INS_PRO: TStringField;
    Label1: TLabel;
    DBEditChar1: TDBEditChar;
    Label2: TLabel;
    DBEditChar2: TDBEditChar;
    DBEditColor2: TDBEditColor;
    Label3: TLabel;
    CadNaturezasC_MOS_NOT: TStringField;
    Label8: TLabel;
    DBEditChar3: TDBEditChar;
    CadNaturezasD_ULT_ALT: TDateField;
    BBAjuda: TBitBtn;
    CadNaturezasC_MOS_FAT: TStringField;
    Label17: TLabel;
    DBEditChar4: TDBEditChar;
    Label18: TLabel;
    DBEditColor5: TDBEditColor;
    CadNaturezasC_DES_NOT: TStringField;
    DBEditColor9: TDBEditColor;
    CadNaturezasC_ATI_NAT: TStringField;
    CadNaturezasC_NAT_IMP: TStringField;
    CadNaturezasC_CLI_FOR: TStringField;
    CadNaturezasC_TIP_NAT: TStringField;
    Label19: TLabel;
    Label20: TLabel;
    DBKeyViolation1: TDBKeyViolation;
    Label21: TLabel;
    DBEditChar5: TDBEditChar;
    DBRadioGroup2: TDBRadioGroup;
    CadNaturezasC_NOM_NAT: TStringField;
    ValidaGravacao1: TValidaGravacao;
    DBRadioGroup3: TDBRadioGroup;
    Label11: TLabel;
    DBEditChar6: TDBEditChar;
    CadNaturezasC_GER_IMP: TStringField;
    Label22: TLabel;
    DBEditChar7: TDBEditChar;
    CadNaturezasC_NOT_CUP: TStringField;
    Label23: TLabel;
    DBEditColor10: TDBEditColor;
    CadNaturezasC_FIL_PER: TStringField;
    CadNaturezasC_CST_PAD: TStringField;
    Label24: TLabel;
    DBEditColor11: TDBEditColor;
    CadNaturezasC_SOM_IPI: TStringField;
    Label25: TLabel;
    DBEditChar8: TDBEditChar;
    CadNaturezasC_ICM_EST: TStringField;
    Label26: TLabel;
    DBEditChar9: TDBEditChar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure DelOperacaoEstoqueSelect(Sender: TObject);
    procedure DelOperacaoEstoqueCadastrar(Sender: TObject);
    procedure EPlanoExit(Sender: TObject);
    procedure EPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadNaturezasAfterInsert(DataSet: TDataSet);
    procedure CadNaturezasBeforePost(DataSet: TDataSet);
    procedure DelOperacaoEstoqueRetorno(Retorno1, Retorno2: String);
    procedure CadNaturezasAfterPost(DataSet: TDataSet);
    procedure CadNaturezasAfterScroll(DataSet: TDataSet);
    procedure BBAjudaClick(Sender: TObject);
    procedure DelOperacaoEstoqueExit(Sender: TObject);
    procedure CadNaturezasAfterEdit(DataSet: TDataSet);
    procedure DBKeyViolation1Change(Sender: TObject);
    procedure DBRadioGroup3Change(Sender: TObject);
  private
    unImp : TFuncoesImpressao;
    procedure FechaProSer( acao : Boolean );
  public
    procedure PosicionaNatureza( Codigo : String);
  end;

var
  FNovaNatureza: TFNovaNatureza;

implementation

uses APrincipal, FunSql,AOperacoesEstoques, APlanoConta, constantes,
  ANaturezas;

{$R *.DFM}

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                           cad naturezas
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) }

{ ****************** Na criação do Formulário ******************************** }
procedure TFNovaNatureza.FormCreate(Sender: TObject);
begin
   CadNaturezas.open;
   unImp := TFuncoesImpressao.Criar(self, FPrincipal.BaseDados);
   Self.HelpFile := Varia.PathHelp + 'MPONTOLOJA.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
   unImp.LocalizaUmItem(aux, varia.NotaFiscalPadrao, 74);
   MObs.AQdadeCaracter := aux.FieldByname('i_tam_cam').AsInteger;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFNovaNatureza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   unImp.Free;
   Aux.close;
   CAdNaturezas.close;
   Action := CaFree;
end;

{************Posiciona a tabela passada conforme o codigo passado**************}
procedure TFNovaNatureza.PosicionaNatureza( Codigo : String );
begin
  CadNaturezas.close;
  AdicionaSQLAbreTabela(CadNaturezas,' Select * from CadNatureza ' +
                                     ' Where C_Cod_Nat = ''' + Codigo + '''');
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************************Fecha o Formulario corrente***********************}
procedure TFNovaNatureza.BFecharClick(Sender: TObject);
begin
   close;
end;

{******************Carrega a Select da operacao de estoque*********************}
procedure TFNovaNatureza.DelOperacaoEstoqueSelect(Sender: TObject);
begin
   DelOperacaoEstoque.ASelectValida.text := 'Select * from CadOperacaoEstoque '  +
                                            ' Where I_Cod_Ope = @ ';
   DelOperacaoEstoque.ASelectLocaliza.text := 'Select * from CadOperacaoEstoque '+
                                              ' Where C_Nom_Ope like ''@%''';
end;


{********************Cadastra uma nova operação de Estoque*********************}
procedure TFNovaNatureza.DelOperacaoEstoqueCadastrar(Sender: TObject);
begin
   FOperacoesEstoques := TFOperacoesEstoques.CriarSDI(Application,'',FPrincipal.VerificaPermisao('FOperacoesEstoques'));
   FOperacoesEstoques.BotaoCadastrar1.Click;
   FOperacoesEstoques.ShowModal;
   Localiza.AtualizaConsulta;
end;

{************ localiza plano de contas ************************************** }
procedure TFNovaNatureza.EPlanoExit(Sender: TObject);
var
  VpfCodigo : string;
begin
  FPlanoConta := TFPlanoConta.criarSDI(Self, '', True);
  VpfCodigo := EPlano.Field.AsString;
  if not FPlanoConta.verificaCodigo( VpfCodigo, '', Label14, false,(Sender is TSpeedButton) ) then
    EPlano.SetFocus;
  if CadNaturezas.State in [ dsEdit, dsInsert] then
  begin
    EPlano.Field.AsString := VpfCodigo;
    if EPlano.Text = '' then
      CadNaturezasC_CLA_PLA.Clear;
  end;
  FPlanoConta.free;
end;

procedure TFNovaNatureza.EPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 114 then
  EPlanoExit(SpeedButton2);
end;


procedure TFNovaNatureza.CadNaturezasAfterInsert(DataSet: TDataSet);
begin
   CadNaturezasC_ENT_SAI.AsString := 'S';
   CadNaturezasC_CLI_FOR.AsString := 'S';
   CadNaturezasC_BAI_EST.AsString := 'S';
   CadNaturezasC_CAL_ICM.AsString := 'S';
   CadNaturezasC_GER_COM.AsString := 'S';
   CadNaturezasC_IMP_AUT.AsString := 'N';
   CadNaturezasC_INS_PRO.AsString := 'S';
   CadNaturezasC_INS_SER.AsString := 'N';
   CadNaturezasC_NAT_LOC.AsString := 'S';
   CadNaturezasC_GER_FIN.AsString := 'S';
   CadNaturezasC_MOS_NOT.AsString := 'S';
   CadNaturezasC_MOS_FAT.AsString := 'S';
   CadNaturezasC_ATI_NAT.AsString := 'S';
   CadNaturezasC_TIP_NAT.AsString := 'V';
   CadNaturezasC_NOT_CUP.AsString := 'N';
   CadNaturezasC_GER_IMP.AsString := 'S';
   CadNaturezasC_SOM_IPI.AsString := 'N';
   CadNaturezasC_ICM_EST.AsString := 'N';
end;

{******************* antes de gravar o registro *******************************}
procedure TFNovaNatureza.CadNaturezasBeforePost(DataSet: TDataSet);
begin
  //atualiza a data de alteracao para poder exportar
  CadNaturezasD_ULT_ALT.AsDateTime := Date;
end;

procedure TFNovaNatureza.DelOperacaoEstoqueRetorno(Retorno1,
  Retorno2: String);
begin
  EditColor1.Text := Retorno1;
end;

procedure TFNovaNatureza.CadNaturezasAfterPost(DataSet: TDataSet);
begin
  AtualizaSQLTabela(CadNaturezas);
end;

procedure TFNovaNatureza.CadNaturezasAfterScroll(DataSet: TDataSet);
begin
  DelOperacaoEstoque.Atualiza;
  EPlanoExit(EPlano);
end;

procedure TFNovaNatureza.BBAjudaClick(Sender: TObject);
begin
   Application.HelpCommand(HELP_CONTEXT,FNovaNatureza.HelpContext);
end;

procedure TFNovaNatureza.DelOperacaoEstoqueExit(Sender: TObject);
begin
  if CadNaturezas.State in [ dsEdit, dsInsert ] then
    if DelOperacaoEstoque.text = '' then
      CadNaturezasI_COD_OPE.Clear;
end;

procedure TFNovaNatureza.CadNaturezasAfterEdit(DataSet: TDataSet);
begin
//   DBFilialColor1.ReadOnly := true;
end;

procedure TFNovaNatureza.DBKeyViolation1Change(Sender: TObject);
begin
  if CadNaturezas.State in [ dsEdit, dsInsert ] then
    ValidaGravacao1.execute;
end;

procedure  TFNovaNatureza.FechaProSer( acao : Boolean );
begin
  Label16.Enabled := acao;
  DBEditColor8.Enabled := acao;
  label1.Enabled := acao;
  DBEditChar1.Enabled := acao;
  Label17.Enabled := acao;
  DBEditChar4.Enabled := acao;
end;

procedure TFNovaNatureza.DBRadioGroup3Change(Sender: TObject);
begin
  if CadNaturezas.State in [ dsEdit, dsInsert ] then
    ValidaGravacao1.execute;
  if CadNaturezas.State in [ dsEdit, dsInsert ] then
  begin
    case DBRadioGroup3.ItemIndex of
      0 : begin CadNaturezasC_INS_SER.AsString := 'N';
                CadNaturezasC_INS_PRO.AsString := 'S';
                FechaProSer(false);
          end;
      1 : begin CadNaturezasC_INS_SER.AsString := 'S';
                CadNaturezasC_INS_PRO.AsString := 'N';
                FechaProSer(false);
          end;
      2 : begin CadNaturezasC_INS_SER.AsString := 'S';
                CadNaturezasC_INS_PRO.AsString := 'S';
                FechaProSer(false);
          end;
          else
          begin
            CadNaturezasC_MOS_NOT.AsString := 'N';
            FechaProSer(true);
          end;
     end;
   end;
end;

Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFNovaNatureza]);
end.
