unit AControleLigacoes;

//                Autor: Leonardo Emanuel Pretti
//      Data da Criação: 07/11/2001
//               Função: Cadastrar Ligações Recebidas
//         Alterado por:
//    Data da Alteração:
//  Motivo da Alteração:

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  StdCtrls, Mask, DBCtrls, Tabela, Db, DBTables, Grids, DBGrids,
  BotaoCadastro, Buttons, Componentes1, ExtCtrls, PainelGradiente,
  DBKeyViolation, Localizacao;

type
  TFControleLigacoes = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    BotaoCadastrar1: TBotaoCadastrar;
    BotaoGravar1: TBotaoGravar;
    BotaoCancelar1: TBotaoCancelar;
    PanelColor1: TPanelColor;
    DataCadLigacoes: TDataSource;
    BFechar: TBitBtn;
    BBAjuda: TBitBtn;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    Label12: TLabel;
    DBEditLocaliza2: TDBEditLocaliza;
    DBMemoColor2: TDBMemoColor;
    CadLigacoes: TSQL;
    CadLigacoesI_EMP_FIL: TIntegerField;
    CadLigacoesI_SEQ_LIG: TIntegerField;
    CadLigacoesD_DAT_LIG: TDateField;
    CadLigacoesI_COD_USU: TIntegerField;
    CadLigacoesI_COD_CLI: TIntegerField;
    CadLigacoesC_NOM_CLI: TStringField;
    CadLigacoesC_TEX_LIG: TMemoField;
    Localiza: TConsultaPadrao;
    CadLigacoesT_HOR_LIG: TDateTimeField;
    Nome: TDBEditColor;
    Aux: TQuery;
    AuxMaximo: TIntegerField;
    BitBtn1: TBitBtn;
    CadLigacoesC_RET_LIG: TStringField;
    DBCheckBox1: TDBCheckBox;
    CadLigacoesC_RET_REC: TStringField;
    CadLigacoesC_NOM_REC: TStringField;
    DBCheckBox2: TDBCheckBox;
    DBEditColor1: TDBEditColor;
    CadLigacoesC_FEZ_RET: TStringField;
    CadLigacoesC_FEZ_REC: TStringField;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    CadLigacoesC_FON_CLI: TStringField;
    solicitante: TDBEditColor;
    Label2: TLabel;
    fone: TDBEditColor;
    CadLigacoesC_NOM_SOL: TStringField;
    esol: TEditLocaliza;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BFecharClick(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEditLocaliza2Retorno(Retorno1, Retorno2: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEditLocaliza2Change(Sender: TObject);
    procedure CadLigacoesAfterInsert(DataSet: TDataSet);
    procedure SpeedButton2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBEditLocaliza1Retorno(Retorno1, Retorno2: String);
    procedure esolRetorno(Retorno1, Retorno2: String);
    procedure BotaoGravar1DepoisAtividade(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AbreNovaLigacao(codCli : Integer; fone : string);
    procedure NovaLigacao;
    procedure AlteraLigacao(EmpFil, SeqLig : Integer; DataLigacao : TDateTime );
  end;

var
  FControleLigacoes: TFControleLigacoes;

implementation

uses APrincipal, Constantes, fundata, funstring, constmsg, funObjeto, FunSql, funnumeros,
  AMostraRecados, funsistema;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFControleLigacoes.FormCreate(Sender: TObject);
begin
  Self.HelpFile := Varia.PathHelp + 'Mageral.hlp>janela';  // Indica o Paph e o nome do arquivo de Help
  AbreTabela(CadLigacoes);//Abre a tabela para poder inserir
  IniciallizaCheckBox([DBCheckBox1 , DBCheckBox2],'S','N');
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFControleLigacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CadLigacoes.Close;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações da Tabela
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}
{ **********************  Depois do Insert da Tabela ************************* }
procedure TFControleLigacoes.CadLigacoesAfterInsert(DataSet: TDataSet);
begin
//Gera o Próximo código sequencial da ligação. Comeca em 1 (UM) sempre que mudar de data
  AdicionaSQLAbreTabela(Aux,'select (isnull(max(i_seq_lig),0)+1) Maximo from cadligacoes '+
                            ' where i_emp_fil = '+ IntToStr(Varia.CodigoEmpFil) +
                            ' and d_dat_lig = '+ SQLTextoDataAAAAMMMDD(Date));
  CadLigacoesI_COD_USU.AsInteger := Varia.CodigoUsuario;
  CadLigacoesI_EMP_FIL.AsInteger := Varia.CodigoEmpFil;
  CadLigacoesI_SEQ_LIG.AsInteger := AuxMaximo.AsInteger;
  CadLigacoesD_DAT_LIG.AsDateTime := Date;
  CadLigacoesT_HOR_LIG.AsDateTime := Time;
  CadLigacoesC_RET_LIG.AsString := 'N';
  CadLigacoesC_RET_REC.AsString := 'N';
  CadLigacoesC_FEZ_RET.AsString := 'N';
  CadLigacoesC_FEZ_REC.AsString := 'N';
  BotaoGravar1.Enabled := False; //Desabilita Botão Gravar
end;



{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações Dos Botões
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}
{**************************Fecha o formulario corrente*************************}
procedure TFControleLigacoes.BFecharClick(Sender: TObject);
begin
  Self.Close;
end;

{***************  Pacth do help do sistema  ******************************}
procedure TFControleLigacoes.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FControleLigacoes.HelpContext);
end;

{ ***************** Aborta Localização se não Estiver Cadastrando ************ }
procedure TFControleLigacoes.SpeedButton2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if BotaoCadastrar1.Enabled then //Se não estiver cadastrando
    Abort;//Aborta a operação de localizar cliente
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                            Ações Diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}
{ ***************** Validação Para Poder Fechar o Formulário ***************** }
procedure TFControleLigacoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := BFechar.Enabled;//Nao pode fechar se estiver cadastrando
end;

{ ************** Passa o Nome do Cliente Para o Campo da Tabela ************** }
procedure TFControleLigacoes.DBEditLocaliza2Retorno(Retorno1, Retorno2: String);
begin
  if Retorno1 <> '' then //Passa nome do cliente para o campo
  begin
    CadLigacoesC_NOM_CLI.AsString := Retorno1;
    CadLigacoesC_FON_CLI.asString := Retorno2;
  end  
end;

{ ******************* Ao Pressionar as Teclas F5, F6 e F7 ******************** }
procedure TFControleLigacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 116) and (BotaoCadastrar1.Enabled) then //Atalho de F5
     BotaoCadastrar1.Click;

  if (Key = 117) and (BotaoGravar1.Enabled) then    //Atalho de F6
     BotaoGravar1.Click;

  if (Key = 118) and (BotaoCancelar1.Enabled) then  //Atalho de F7
     BotaoCancelar1.Click;

  if (Key = 119) then  //Atalho de F8
     BitBtn1.Click;
end;

{ ******** Verifica se os Campos São Vazios Para Abilitar o Gravar *********** }
procedure TFControleLigacoes.DBEditLocaliza2Change(Sender: TObject);
begin
  if (Nome.Text <> '') and (DBMemoColor2.Text <> '') then
    BotaoGravar1.Enabled := True
  else                            //Valida o Botão Gravar
    BotaoGravar1.Enabled := False;
end;

{************************* chamada externa para o controle de ligacao ********}
procedure TFControleLigacoes.AbreNovaLigacao(codCli : Integer; fone : string);
begin
  BotaoGravar1.AFecharAposOperacao := true;
  BotaoCancelar1.AFecharAposOperacao := true;
  CadLigacoes.Insert;
  DBEditLocaliza2.Text := IntToStr(codCli);
  CadLigacoesI_COD_CLI.AsInteger := codCli;
  CadLigacoesC_FON_CLI.asString := fone;
  DBEditLocaliza2.Atualiza;
  Self.ShowModal;
end;

{************************* chamada externa para o controle de ligacao ********}
procedure TFControleLigacoes.NovaLigacao;
begin
  CadLigacoes.Insert;
  Self.ShowModal;
end;

procedure TFControleLigacoes.FormShow(Sender: TObject);
begin
  DBEditLocaliza2.SetFocus; //Seta o Localiza Clientes
end;

procedure TFControleLigacoes.BitBtn1Click(Sender: TObject);
begin
  if CadLigacoes.State in [ dsEdit, dsInsert ] then
  begin
    CadLigacoesC_NOM_CLI.Clear;
    CadLigacoesI_COD_CLI.Clear;
    CadLigacoesC_NOM_SOL.Clear;
    CadLigacoesC_FON_CLI.clear;
    Nome.SetFocus;
  end;
end;

procedure TFControleLigacoes.AlteraLigacao(EmpFil, SeqLig : Integer; DataLigacao : TDateTime );
begin
  AdicionaSQLAbreTabela(CadLigacoes,' select * from cadligacoes ' +
                          ' where i_emp_fil = ' + inttostr(EmpFil) +
                          ' and i_seq_lig = ' + inttostr(SeqLig) +
                          ' and d_dat_lig = ' + SQLTextoDataAAAAMMMDD(DataLigacao) );
  CadLigacoes.edit;
  BotaoGravar1.AFecharAposOperacao := true;
  self.ShowModal;
end;


procedure TFControleLigacoes.DBCheckBox2Click(Sender: TObject);
begin
  if DBCheckBox2.Checked then
    DBEditColor1.Visible := true
  else
    DBEditColor1.Visible := false;
end;

procedure TFControleLigacoes.DBEditLocaliza1Retorno(Retorno1,
  Retorno2: String);
begin
  if Retorno1 <> '' then //Passa nome do cliente para o campo
    CadLigacoesC_NOM_SOL.AsString := Retorno1;
end;



procedure TFControleLigacoes.esolRetorno(Retorno1, Retorno2: String);
begin
  if Retorno1 <> '' then //Passa nome do cliente para o campo
    CadLigacoesC_NOM_SOL.AsString := Retorno1;
end;

procedure TFControleLigacoes.BotaoGravar1DepoisAtividade(Sender: TObject);
begin
  PostMessage(application.Handle,CT_ATUALIZARECADO,0,0);
end;

Initialization
 RegisterClasses([TFControleLigacoes]);
end.
