unit AConsultaOSTerceiros;

//               Autor: Leonardo Emanuel Pretti
//     Data da Criação: 11/07/2001
//              Função: Consultar Os Materiais Da OS Que Estão Em Terceiros
//        Alterado por: JORGE EDUARDO
//   Data da Alteração: 10/10/01
// Motivo da Alteração: ACRESCENTAR MAIS ALGUNS FILTROS

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  Db, DBTables, Tabela, StdCtrls, Buttons, BotaoCadastro, ExtCtrls,
  Componentes1, PainelGradiente, Localizacao, Grids, DBGrids,
  DBKeyViolation, ComCtrls, Mask, numericos;

type
  TFConsultaOSTerceiros = class(TFormularioPermissao)
    PanelColor1: TPanelColor;
    BotaoFechar1: TBotaoFechar;
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    GridIndice1: TGridIndice;
    Localiza: TConsultaPadrao;
    DataMovTerceiroOS: TDataSource;
    MovTerceiroOS: TQuery;
    DataSource2: TDataSource;
    Query2: TQuery;
    Label3: TLabel;
    EditOs: TEditColor;
    Label9: TLabel;
    Situacao: TComboBoxColor;
    Label1: TLabel;
    Flag: TComboBoxColor;
    Label4: TLabel;
    Data1: TCalendario;
    Label5: TLabel;
    Data2: TCalendario;
    AuxCli: TQuery;
    AuxCliI_COD_CLI: TIntegerField;
    AuxCliC_NOM_CLI: TStringField;
    Label18: TLabel;
    Ecliente: TEditLocaliza;
    SpeedButton6: TSpeedButton;
    Label20: TLabel;
    MovTerceiroOSI_COD_ORS: TIntegerField;
    MovTerceiroOSI_EMP_FIL: TIntegerField;
    MovTerceiroOSC_NRO_SER: TStringField;
    MovTerceiroOSD_DAT_COM: TDateField;
    MovTerceiroOSI_NOT_COM: TIntegerField;
    MovTerceiroOSD_DAT_REM: TDateField;
    MovTerceiroOSI_NOT_REM: TIntegerField;
    MovTerceiroOSD_DAT_RET: TDateField;
    MovTerceiroOSI_NOT_FOR: TIntegerField;
    MovTerceiroOSC_NOM_MAR: TStringField;
    MovTerceiroOSC_NOM_MOD: TStringField;
    MovTerceiroOSC_NOM_EQU: TStringField;
    MovTerceiroOSC_NOM_CLI: TStringField;
    MovTerceiroOSDias: TIntegerField;
    MovTerceiroOSC_DES_PRO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BotaoFechar1Click(Sender: TObject);
    procedure EditOsExit(Sender: TObject);
    procedure LocalizaFornecedorRetorno(Retorno1, Retorno2: String);
    procedure EclienteRetorno(Retorno1, Retorno2: String);
    procedure MovTerceiroOSCalcFields(DataSet: TDataSet);
  private
    procedure AtualizaConsulta;
    procedure AdicionaFiltros (VpaSelect : TStrings);
  public
    { Public declarations }
  end;

var
  FConsultaOSTerceiros: TFConsultaOSTerceiros;

implementation
   uses APrincipal, Constantes, funsql, fundata, funobjeto, funnumeros;
{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFConsultaOSTerceiros.FormCreate(Sender: TObject);
begin
  Situacao.ItemIndex := 0;  //Todas as OS
  Flag.ItemIndex := 0;
  Data1.Date := PrimeiroDiaMes(Date);
  Data2.Date := UltimoDiaMes(Date);
  AtualizaConsulta;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFConsultaOSTerceiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MovTerceiroOS.Close;
 Action := CaFree;
end;

{ **************************** Atualiza Consulta ***************************** }
procedure TFConsultaOSTerceiros.AtualizaConsulta;
begin
  MovTerceiroOS.SQL.Clear;
  MovTerceiroOS.SQL.Add(' Select TER.I_COD_ORS, TER.I_EMP_FIL, '+
                        '        ter.C_des_pro, TER.C_NRO_SER, '+
                        '        TER.D_DAT_COM, TER.I_NOT_COM, TER.D_DAT_REM, '+
                        '        TER.I_NOT_REM, TER.D_DAT_RET, TER.I_NOT_FOR, '+
                        '        MAR.C_NOM_MAR,MOD.C_NOM_MOD,                '+
                        '        EQU.C_NOM_EQU,     '+
                        '        CLI.C_NOM_CLI                 '+
                        ' From                                                 '+
                        '        MovTerceiroOS     as  TER,                   '+
                        '        CadModelo        as  MOD,                    '+
                        '        CadMarcas         as  MAR,                   '+
                        '        CadClientes       as  CLI,                   '+
                        '        CadEquipamentos   as  EQU                    ');
  AdicionaFiltros(MovTerceiroOS.SQL);
  MovTerceiroOS.SQL.Add('         and TER.I_COD_MAR = MAR.I_COD_MAR           '+
                        '         and TER.I_COD_EQU = EQU.I_COD_EQU           '+
                        '         and TER.I_COD_MOD = MOD.I_COD_MOD           '+
                        '         and TER.I_COD_CLI = CLI.I_COD_CLI           ');
  MovTerceiroOS.SQL.Add('Order by TER.I_COD_ORS ');
  MovTerceiroOS.Open;
end;

{ ***************************** Adiciona Filtros ***************************** }
procedure TFConsultaOSTerceiros.AdicionaFiltros (VpaSelect : TStrings);
begin
  VpaSelect.Add(' Where TER.I_EMP_FIL = ' + IntToStr (Varia.CodigoEmpFil));

  case Flag.ItemIndex of
       0 : VpaSelect.add(SQLTextoDataEntreAAAAMMDD(' TER.D_DAT_REM ', Data1.Date,Data2.Date, true  ));
       1 : VpaSelect.add(SQLTextoDataEntreAAAAMMDD(' TER.D_DAT_COM ', Data1.Date,Data2.Date, true  ));
       2 : VpaSelect.add(SQLTextoDataEntreAAAAMMDD(' TER.D_DAT_RET ', Data1.Date,Data2.Date, true  ));
       3 : VpaSelect.add('  ');
  end;

  if EditOs.Text <> '' then
    VpaSelect.Add(' and TER.I_COD_ORS = '+ EditOs.Text)
  else
    VpaSelect.Add(' ');

  if ECliente.Text <> '' then
    VpaSelect.Add(' and Ter.I_COD_CLI = '+ ECliente.Text)
  else
    VpaSelect.Add(' ');


  case Situacao.ItemIndex of                    //SITUAÇÕES DAS OS's
   0 : VpaSelect.Add(' and ter.d_dat_ret is null');
   1 : VpaSelect.Add(' and ter.d_dat ret is not null ');
   2 : VpaSelect.Add(' ');
  end;

end;

{ *************** Registra a classe para evitar duplicidade ****************** }
procedure TFConsultaOSTerceiros.BotaoFechar1Click(Sender: TObject);
begin
  Self.Close;  //Fecha Formulário
end;

procedure TFConsultaOSTerceiros.EditOsExit(Sender: TObject);
begin
  AtualizaConsulta;
end;

procedure TFConsultaOSTerceiros.LocalizaFornecedorRetorno(Retorno1,
  Retorno2: String);
begin
 AtualizaConsulta;
end;

procedure TFConsultaOSTerceiros.EclienteRetorno(Retorno1,
  Retorno2: String);
begin
  AtualizaConsulta;
end;

procedure TFConsultaOSTerceiros.MovTerceiroOSCalcFields(DataSet: TDataSet);
begin
  if not MovTerceiroOSD_DAT_REM.isnull then
    MovTerceiroOSDias.AsInteger := trunc(date - MovTerceiroOSD_DAT_REM.asdatetime);
end;

Initialization
 RegisterClasses([TFConsultaOSTerceiros]);
end.
