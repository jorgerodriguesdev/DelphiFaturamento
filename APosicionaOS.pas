unit APosicionaOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, PainelGradiente, StdCtrls, Buttons, Componentes1, Localizacao,
  DBCtrls, Db, DBTables, ComCtrls, Mask, Tabela, Grids, DBGrids;

type
  TFPosicionaOS = class(TFormularioPermissao)
    PanelColor1: TPanelColor;
    BitBtn1: TBitBtn;
    PanelColor2: TPanelColor;
    Label1: TLabel;
    PanelColor3: TPanelColor;
    DBText49: TDBText;
    DBText50: TDBText;
    DBText51: TDBText;
    DBText52: TDBText;
    DBText53: TDBText;
    DBText54: TDBText;
    DBText55: TDBText;
    DBText56: TDBText;
    DBText57: TDBText;
    DBText58: TDBText;
    DBText59: TDBText;
    DBText60: TDBText;
    DBText61: TDBText;
    DBText62: TDBText;
    DBText63: TDBText;
    DBText64: TDBText;
    DBText65: TDBText;
    DBText66: TDBText;
    Produto: TQuery;
    DSProduto: TDataSource;
    Localiza: TConsultaPadrao;
    Produtocodigo: TStringField;
    Produtoc_nom_pro: TStringField;
    Produton_qtd_mov: TFloatField;
    Produtoc_cod_uni: TStringField;
    Produton_vlr_uni: TFloatField;
    Produton_vlr_tot: TFloatField;
    Produtoi_cod_usu: TIntegerField;
    Produtol_des_tec: TMemoField;
    Produtoi_cod_ors: TIntegerField;
    Produtoc_cod_pro: TStringField;
    Produtoc_cod_pro_1: TStringField;
    Servico: TQuery;
    DsServico: TDataSource;
    ProdutoD_DAT_AVI: TDateField;
    ProdutoC_NON_AVI: TStringField;
    ProdutoL_OBS_MOV: TMemoField;
    Servicoi_cod_ser: TIntegerField;
    Servicoc_nom_ser: TStringField;
    Servicoi_cod_ors: TIntegerField;
    Servicoi_emp_fil: TIntegerField;
    Servicoi_cod_usu: TIntegerField;
    Servicon_qtd_mov: TFloatField;
    Servicoc_cod_uni: TStringField;
    Servicon_vlr_uni: TFloatField;
    Servicon_vlr_tot: TFloatField;
    Servicoi_emp_fil_1: TIntegerField;
    Servicol_obs_ser: TMemoField;
    ServicoS: TStringField;
    Terceiros: TQuery;
    DSTerceiros: TDataSource;
    TerceirosI_COD_ORS: TIntegerField;
    TerceirosI_EMP_FIL: TIntegerField;
    TerceirosI_COD_CLI: TIntegerField;
    TerceirosC_des_pro: TStringField;
    TerceirosC_NRO_SER: TStringField;
    TerceirosL_OBS_TER: TMemoField;
    TerceirosD_DAT_COM: TDateField;
    TerceirosI_NOT_COM: TIntegerField;
    TerceirosD_DAT_REM: TDateField;
    TerceirosI_NOT_REM: TIntegerField;
    TerceirosD_DAT_RET: TDateField;
    TerceirosI_NOT_FOR: TIntegerField;
    TerceirosC_NOM_MAR: TStringField;
    TerceirosC_NOM_MOD: TStringField;
    TerceirosN_VLR_SER: TFloatField;
    TerceirosN_VLR_COB: TFloatField;
    TerceirosC_NOM_CLI: TStringField;
    EditOs: TEditColor;
    Produtoi_emp_fil: TIntegerField;
    Dsmovcados: TDataSource;
    movcados: TQuery;
    MovCadosI_COD_CLI: TIntegerField;
    MovCadosC_NOM_CLI: TStringField;
    MovCadosC_Bai_Cli: TStringField;
    MovCadosC_Est_Cli: TStringField;
    MovCadosC_End_Cli: TStringField;
    MovCadosc_fon_fax: TStringField;
    MovCadosc_cgc_cli: TStringField;
    MovCadosc_cpf_cli: TStringField;
    MovCadosc_ins_cli: TStringField;
    MovCadosC_Cid_Cli: TStringField;
    MovCadosC_Cep_Cli: TStringField;
    MovCadosD_DAT_PRE: TDateField;
    MovCadosT_HOR_PRE: TDateTimeField;
    MovCadosC_DEF_APR: TStringField;
    MovCadosI_EMP_FIL: TIntegerField;
    MovCadosI_COD_ORS: TIntegerField;
    MovCadosD_DAT_FEC: TDateField;
    MovCadosC_TIP_CHA: TStringField;
    MovCadosC_CLI_REC: TStringField;
    MovCadosC_NOM_USU: TStringField;
    MovCadosI_COD_USU: TIntegerField;
    MovCadosD_DAT_CAD: TDateField;
    MovCadosI_COD_SIT: TIntegerField;
    MovCadosN_VLR_HOR: TFloatField;
    MovCadosC_OBS_EQU: TStringField;
    MovCadosC_CHA_TEC: TStringField;
    MovCadosC_OBS_ABE: TStringField;
    MovCadosI_COD_PAG: TIntegerField;
    MovCadosI_COD_FRM: TIntegerField;
    MovCadosI_COD_ENT: TIntegerField;
    MovCadosC_COD_PRO: TStringField;
    MovCadosC_SIT_ORS: TStringField;
    MovCadosD_DAT_AVI: TDateField;
    MovCadosC_NON_AVI: TStringField;
    MovCadosD_DAT_EMP: TDateField;
    MovCadosD_DAT_DEV: TDateField;
    MovCadosN_TOT_PRO: TFloatField;
    MovCadosC_ACE_EQU: TStringField;
    MovCadosN_TOT_SER: TFloatField;
    MovCadosN_VLR_PER: TFloatField;
    MovCadosC_DES_ACR: TStringField;
    MovCadosL_OBS_MOV: TMemoField;
    MovCadosN_TOT_TER: TFloatField;
    MovCadosI_COD_ATE: TIntegerField;
    MovCadosD_DAT_AGE: TDateField;
    MovCadosH_HOR_AGE: TTimeField;
    MovCadosI_NRO_ATE: TIntegerField;
    MovCadosI_COD_EQU: TIntegerField;
    MovCadosI_COD_MAR: TIntegerField;
    MovCadosI_COD_MOD: TIntegerField;
    MovCadosN_TOT_ORS: TFloatField;
    MovCadosN_TOT_HOR: TFloatField;
    MovCadosL_OBS_TER: TMemoField;
    MovCadosI_SEQ_PRO: TIntegerField;
    MovCadosC_VOL_ENT: TStringField;
    MovCadosC_ORC_EQU: TStringField;
    MovCadosC_NRO_NOT: TStringField;
    MovCadosC_NRO_SER: TStringField;
    MovCadosC_ACE_EMP: TStringField;
    MovCadosC_NOM_EQU: TStringField;
    MovCadosC_NOM_MAR: TStringField;
    MovCadosC_NOM_MOD: TStringField;
    MovCadosC_NOM_SIT: TStringField;
    MovCadosatendente: TStringField;
    MovCadostecnico: TStringField;
    MovCadosc_nom_pro: TStringField;
    MovCadosc_tip_pes: TStringField;
    MovCadosTIPO: TStringField;
    MovCadosc_nom_pag: TStringField;
    MovCadosc_nom_frm: TStringField;
    ScrollBox1: TScrollBox;
    Shape3: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label23: TLabel;
    DBText67: TDBText;
    DBText68: TDBText;
    Shape15: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Label5: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    Label24: TLabel;
    DBText9: TDBText;
    DBText20: TDBText;
    Label16: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label15: TLabel;
    Shape6: TShape;
    Label35: TLabel;
    Label29: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label62: TLabel;
    Label66: TLabel;
    Label27: TLabel;
    Label31: TLabel;
    Label67: TLabel;
    Label76: TLabel;
    Label30: TLabel;
    DBText6: TDBText;
    DBText8: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText31: TDBText;
    DBText32: TDBText;
    DBText33: TDBText;
    DBText34: TDBText;
    Label37: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label34: TLabel;
    Label57: TLabel;
    Label4: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Shape14: TShape;
    Label56: TLabel;
    Label58: TLabel;
    DBText29: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    DBText37: TDBText;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText41: TDBText;
    DBText42: TDBText;
    DBText43: TDBText;
    DBText44: TDBText;
    DBText45: TDBText;
    DBText46: TDBText;
    Label32: TLabel;
    Label81: TLabel;
    Label65: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label12: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    DBText69: TDBText;
    DBText17: TDBText;
    Label2: TLabel;
    DBText16: TDBText;
    DBText30: TDBText;
    Label10: TLabel;
    DBText40: TDBText;
    Shape17: TShape;
    Shape2: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label13: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    ECodServico: TDBEditLocaliza;
    Grade: TDBGridColor;
    GServicos: TDBGridColor;
    DBMemoColor1: TDBMemoColor;
    Shape11: TShape;
    Shape4: TShape;
    Label40: TLabel;
    DBText47: TDBText;
    DBGridColor1: TDBGridColor;
    DBMemoColor2: TDBMemoColor;
    Label6: TLabel;
    DBEditColor1: TDBEditColor;
    MovCadosc_des_ent: TStringField;
    Label18: TLabel;
    DBText48: TDBText;
    MovCadosc_fo1_CLI: TStringField;
    Label22: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditOsExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MovCadosCalcFields(DataSet: TDataSet);
  private
    procedure AdicionaFiltros(VpaSelect : TStrings);
    procedure LocalizaProdutoOS;
    procedure LocalizaServicoOS;
    procedure LocalizaAberturaFechamentoOS;
    procedure LocalizaTerceirosOs;
  public
    procedure ConsultaOS( CadOrs : Integer);
  end;

var
  FPosicionaOS: TFPosicionaOS;

implementation
uses APrincipal,funsql,funobjeto,funnumeros,constmsg,constantes,funstring ;

{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFPosicionaOS.FormCreate(Sender: TObject);
begin

end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFPosicionaOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Produto.close;
  Servico.Close;
  movcados.close;
  Terceiros.Close;
  Action := CaFree;
end;


{ *************** Registra a classe para evitar duplicidade ***************** }
procedure TFPosicionaOS.BitBtn1Click(Sender: TObject);
begin
  self.Close;
end;

{***************************  LocalizaProdutoOs  ******************************}
procedure TFPosicionaOS.LocalizaProdutoOs;
begin
  Produto.Close;
  Produto.sql.Clear;
  Produto.SQL.Add(' Select ' +
                  ' mov.c_cod_pro codigo, pro.c_nom_pro, mov.n_qtd_mov, ' +
                  ' CAD.D_DAT_AVI,CAD.C_NON_AVI,CAD.L_OBS_MOV,cad.i_emp_fil,' +
                  ' mov.c_cod_uni, mov.n_vlr_uni, mov.n_vlr_tot,cad.i_cod_usu, ' +
                  ' pro.l_des_tec , cad.i_cod_ors, mov.c_cod_pro , pro.c_cod_pro ' +
                  ' from MovOrdemServico mov, cadprodutos as pro , cadordemservico as cad ');
  Adicionafiltros(Produto.SQL);
  Produto.SQL.Add(' and mov.i_cod_ors = cad.i_cod_ors ' +
                  ' and mov.i_emp_fil = cad.i_emp_fil ' +
                  ' and mov.i_seq_pro = pro.i_seq_pro ' );
  Produto.Open;
end;

{***************************  LocalizaServicoOs  ******************************}
procedure TFPosicionaOS.LocalizaServicoOs;
begin
  Servico.Close;
  Servico.SQL.Clear;
  Servico.SQL.Add(' Select ' +
                  ' mov.i_cod_ser , ser.c_nom_ser, cad.i_cod_ors,mov.i_emp_fil,cad.i_cod_usu, ' +
                  ' mov.n_qtd_mov, mov.c_cod_uni, mov.n_vlr_uni, mov.n_vlr_tot,cad.i_emp_fil, ' +
                  ' ser.l_obs_ser, ''S'' ' +
                  ' from MovOrdemServico mov, cadservico ser,  cadordemservico as cad ');
  AdicionaFiltros(Servico.SQL);
  Servico.SQL.Add(' and mov.i_emp_fil = cad.i_emp_fil ' +
                  ' and mov.i_cod_ors = cad.i_cod_ors  ' +
                  ' and mov.i_cod_ser = ser.i_cod_ser ' +
                  ' and mov.i_cod_emp = ser.i_cod_emp ' );
  Servico.Open;
end;

{***************************  LocalizaAberturaFechamentoOS  *******************}
procedure TFPosicionaOS.LocalizaAberturaFechamentoOS;
begin
  Movcados.Close;
  Movcados.SQL.Clear;
  Movcados.SQL.Add(' SELECT  CLI.I_COD_CLI,CLI.C_NOM_CLI,Cli.C_Bai_Cli,Cli.C_Est_Cli,Cli.C_End_Cli, ' +
                   ' Cli.c_fon_fax,Cli.c_fo1_CLI,CLI.c_cgc_cli,CLI.c_cpf_cli,CLI.c_ins_cli,Cli.C_Cid_Cli,Cli.C_Cep_Cli, ' +
                   ' cad.I_COD_CLI, cad.D_DAT_PRE, cad.T_HOR_PRE, cad.C_DEF_APR, ' +
                   ' cad.I_EMP_FIL, cad.I_COD_ORS, cad.D_DAT_FEC, cad.C_TIP_CHA, ' +
                   ' cad.C_CLI_REC, cad.C_NOM_USU, cad.I_COD_USU, cad.D_DAT_CAD, ' +
                   ' cad.I_COD_SIT, cad.N_VLR_HOR, cad.C_OBS_EQU, cad.C_CHA_TEC, ' +
                   ' cad.C_OBS_ABE, cad.I_COD_PAG, cad.I_COD_FRM, cad.I_COD_ENT, ' +
                   ' cad.C_COD_PRO, cad.C_SIT_ORS, cad.D_DAT_AVI, cad.C_NON_AVI, ' +
                   ' cad.D_DAT_EMP, cad.D_DAT_DEV, cad.N_TOT_PRO, cad.C_ACE_EQU, ' +
                   ' cad.N_TOT_SER, cad.N_VLR_PER, cad.C_DES_ACR, cad.L_OBS_MOV, ' +
                   ' cad.N_TOT_TER, cad.I_COD_ATE, cad.D_DAT_AGE, cad.H_HOR_AGE, ' +
                   ' cad.I_NRO_ATE, cad.I_COD_EQU, cad.I_COD_MAR, cad.I_COD_MOD, ' +
                   ' cad.N_TOT_ORS, cad.N_TOT_HOR, cad.L_OBS_TER, cad.I_SEQ_PRO, ' +
                   ' cad.C_VOL_ENT, cad.C_ORC_EQU, cad.C_NRO_NOT, cad.C_NRO_SER, ' +
                   ' cad.C_ACE_EMP, cli.c_tip_pes, ent.c_des_ent, ' +
                   ' EQU.C_NOM_EQU, MAR.C_NOM_MAR, MOD.C_NOM_MOD, SIT.C_NOM_SIT, ' +
                   ' usu.c_nom_usu atendente, tec.c_nom_usu tecnico, pro.c_nom_pro, ' +
                   ' pag.c_nom_pag, frm.c_nom_frm ' +
                   ' FROM ' +
                   ' CADORDEMSERVICO AS cad, ' +
                   ' MOVORDEMSERVICO AS MOVOS, ' +
                   ' CADCLIENTES AS CLI, '  +
                   ' CadUsuarios as Usu, dba.CadUsuarios as TEC, CadSituacoes as Sit, ' +
                   ' cadequipamentos equ, cadmarcas mar, cadmodelo mod, Cadprodutos pro, ' +
                   ' CADCONDICOESPAGTO PAG, CADFORMASPAGAMENTO FRM, cadtipoentrega ent ');

  AdicionaFiltros(movcados.SQL);
  Movcados.SQL.Add(' AND cad.I_COD_CLI = CLI.I_COD_CLI ' +
                   ' and Usu.I_Cod_Usu =* cad.I_COD_ATE ' +
                   ' and TEC.I_Cod_Usu =* Cad.I_Cod_Usu ' +
                   ' and Sit.I_cod_sit =* Cad.I_cod_sit ' +
                   ' and Cad.i_cod_equ *= equ.i_cod_equ ' +
                   ' and cad.i_cod_mar *= mar.i_cod_mar ' +
                   ' and Cad.i_cod_mod *= mod.i_cod_mod ' +
                   ' and Cad.I_SEQ_PRO *= pro.I_SEQ_PRO ' +
                   ' and Cad.i_cod_pag *= pag.i_cod_pag ' +
                   ' and Cad.I_COD_FRM *= frm.i_cod_frm ' +
                   ' and Cad.I_COD_ENT *= ENT.i_cod_ent ');
  Movcados.Open;

   if movcadosc_tip_pes.AsString = 'F' then
     DBText69.DataField := 'c_cpf_cli'
   else
     DBText69.DataField := 'c_cgc_cli';
end;

{***************************  LocalizaTerceirosOS  ****************************}
procedure TFPosicionaOS.LocalizaTerceirosOs;
begin
  Terceiros.Close;
  Terceiros.SQL.Clear;
  Terceiros.SQL.Add(' Select TER.I_COD_ORS, TER.I_EMP_FIL ,CLI.I_COD_CLI,' +
                    ' ter.C_des_pro, TER.C_NRO_SER, cad.L_OBS_TER, ' +
                    ' TER.D_DAT_COM, TER.I_NOT_COM, TER.D_DAT_REM, ' +
                    ' TER.I_NOT_REM, TER.D_DAT_RET, TER.I_NOT_FOR, ' +
                    ' MAR.C_NOM_MAR,MOD.C_NOM_MOD,TER.N_VLR_SER, ' +
                    ' TER.N_VLR_COB,CLI.C_NOM_CLI ' +
                    ' From ' +
                    ' MovTerceiroOS  as  TER, ' +
                    ' CadModelo  as  MOD, ' +
                    ' CadMarcas  as  MAR, ' +
                    ' CadClientes as  CLI, ' +
                    ' CadOrdemServico as cad ' );
  AdicionaFiltros(Terceiros.SQL);
  Terceiros.SQL.Add(' AND TER.I_COD_MAR = MAR.I_COD_MAR ' +
                    ' AND cad.I_COD_ORS = TER.I_COD_ORS ' +
                    ' and cad.i_emp_fil = ter.i_emp_fil ' +
                    ' and TER.I_COD_EQU = cad.I_COD_EQU ' +
                    ' and TER.I_COD_MOD = MOD.I_COD_MOD ' +
                    ' and TER.I_COD_CLI = CLI.I_COD_CLI ' );
  Terceiros.SQL.Add(' Order by TER.I_COD_ORS ');
  Terceiros.Open;

end;

{***************************  Adiciona Filtros  ******************************}
procedure TFPosicionaOs.AdicionaFiltros(VpaSelect : TStrings);
begin
  VpaSelect.add(' Where cad.I_Emp_Fil = ' + IntToStr(Varia.CodigoEmpFil));

  if EditOs.Text <> '' Then
    VpaSelect.Add(' and cad.I_cod_Ors = '+ EditOs.text);
end;

{***************************  Teclas de Atalho  ******************************}
procedure TFPosicionaOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    38 : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - 10;
    40 : ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 10;
    114 : EditOs.SetFocus;
  end;
end;

{************************** Passa as procedures c/ Parâmetro  ****************}
procedure TFPosicionaOS.EditOsExit(Sender: TObject);
begin
  if (EditOs.Text  <> '') and (not BitBtn1.Focused) then
  begin
    LocalizaProdutoOS;
    LocalizaServicoOS;
    LocalizaAberturaFechamentoOS;
    LocalizaTerceirosOs;
    if self.visible then
      DBEditColor1.SetFocus;
    ScrollBox1.VertScrollBar.Position := 0;
  end;
end;

procedure TFPosicionaOS.FormActivate(Sender: TObject);
begin
  if EditOs.Enabled then
     EditOs.SetFocus;
end;

procedure TFPosicionaOS.MovCadosCalcFields(DataSet: TDataSet);
begin
  if MovCadosC_SIT_ORS.AsString = 'A' then
    MovCadosTIPO.AsString := 'Aberta'
  else
    if MovCadosC_SIT_ORS.AsString = 'C' then
      MovCadosTIPO.AsString := 'Cancelada'
  else
    MovCadosTIPO.AsString := 'Fechada'

end;

procedure TFPosicionaOS.ConsultaOS( CadOrs : Integer);
begin
  EditOs.Text := IntToStr(CadOrs);
  EditOsExit(nil);
  Self.ShowModal;
end;

Initialization
  RegisterClasses([TFPosicionaOS]);
end.
