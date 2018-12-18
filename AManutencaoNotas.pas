unit AManutencaoNotas;
{          Autor: Sergio 
    Data Criação: 19/05/1999;
          Função: Consultar as notas fiscais

Motivo alteração:
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  formularios, StdCtrls, Componentes1, ExtCtrls, PainelGradiente,
  Localizacao, Buttons, Db, DBTables, ComCtrls, ConfigImpressora, Grids,
  DBGrids, printers, Mask, numericos, Tabela, DBCtrls, DBKeyViolation,
  Geradores, UnNotaFiscal;

type
  TFManutencaoNotas = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor1: TPanelColor;
    PanelColor2: TPanelColor;
    Localiza: TConsultaPadrao;
    NOTAS: TQuery;
    DATANOTAS: TDataSource;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    NOTASI_NRO_NOT: TIntegerField;
    NOTASC_NOM_CLI: TStringField;
    NOTASC_TIP_CAD: TStringField;
    NOTASC_FLA_ECF: TStringField;
    PanelColor3: TPanelColor;
    Label8: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Data1: TCalendario;
    data2: TCalendario;
    EClientes: TEditLocaliza;
    NOTASc_not_can: TStringField;
    NOTASL_OBS_NOT: TMemoField;
    NOTASN_TOT_PRO: TFloatField;
    NOTASN_TOT_NOT: TFloatField;
    NOTASI_NRO_LOJ: TIntegerField;
    NOTASI_NRO_CAI: TIntegerField;
    MObs: TDBMemoColor;
    NotaGrid: TGridIndice;
    NOTASC_NOT_IMP: TStringField;
    BCancelaNota: TBitBtn;
    BExcuiNota: TBitBtn;
    NOTASI_EMP_FIL: TIntegerField;
    NOTASI_SEQ_NOT: TIntegerField;
    AUX: TQuery;
    T: TPainelTempo;
    Parcelas: TQuery;
    CupomNota: TRadioGroup;
    NOTASD_DAT_EMI: TDateField;
    NOTASC_NOM_NAT: TStringField;
    BNotaDevolucao: TBitBtn;
    BNotaFiscalCupom: TBitBtn;
    NOTASC_NOT_DEV: TStringField;
    Label27: TLabel;
    SpeedButton2: TSpeedButton;
    ENatureza: TEditLocaliza;
    Label4: TLabel;
    ComponenteMove1: TComponenteMove;
    PainelGradiente2: TPainelGradiente;
    PanelColor4: TPanelColor;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    ENatDevolucao: TEditLocaliza;
    BOk: TBitBtn;
    BCancelar: TBitBtn;
    NOTASC_TIP_NOT: TStringField;
    ENota: TEditColor;
    NOTASNatureza: TStringField;
    Label6: TLabel;
    EClienteDevolucao: TEditLocaliza;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    NOTASi_COD_CLI: TIntegerField;
    NOTASC_COD_NAT: TStringField;
    NOTASC_SER_NOT: TStringField;
    ESerie: TEditColor;
    Label12: TLabel;
    BBAjuda: TBitBtn;
    NOTASC_NRO_PED: TStringField;
    CadNatureza: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ENotasRetorno(Retorno1, Retorno2: String);
    procedure Data1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure NOTASAfterScroll(DataSet: TDataSet);
    procedure BExcuiNotaClick(Sender: TObject);
    procedure BCancelaNotaClick(Sender: TObject);
    procedure CupomNotaClick(Sender: TObject);
    procedure BNotaDevolucaoClick(Sender: TObject);
    procedure BNotaFiscalCupomClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure ENatDevolucaoChange(Sender: TObject);
    procedure ENotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ENaturezaRetorno(Retorno1, Retorno2: String);
    procedure FormShow(Sender: TObject);
    procedure BBAjudaClick(Sender: TObject);
    procedure ENatDevolucaoSelect(Sender: TObject);
  private
     NF : TFuncoesNotaFiscal;
     DevolucaoCupomNotaFiscal : Boolean;
     procedure PosicionaNota(VpaGuardarPosicao : Boolean = false);
     procedure AdicionaFiltros(VpaSelect : TStrings);
     procedure MostraNatureza( devolucao : Boolean);
     procedure EscondeNatureza;
     procedure DevolucaoTotalCupomNotaFiscal(VpaNatureza : String; BaixaEstoque : String; VpaCodOpe : Integer);
  public
    { Public declarations }
  end;

var
  FManutencaoNotas: TFManutencaoNotas;

implementation

uses APrincipal, Constantes, Fundata, ConstMsg,
     Funstring, FunNumeros, ANovaNotaFiscal, FunSql, funObjeto,
     AMostraParReceber;

{$R *.DFM}

{ ****************** Na criação do Formulário ******************************** }
procedure TFManutencaoNotas.FormCreate(Sender: TObject);
begin
  BExcuiNota.Visible := not config.NaoPermitirExcNF;
  ESerie.text := varia.SerieNota;
  Data1.DateTime := PrimeiroDiaMes(date);
  Data2.DateTime := UltimoDiaMes(Date);
  PosicionaNota;
  NF := TFuncoesNotaFiscal.Criar(self, FPrincipal.BaseDados);
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFManutencaoNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FechaTabela(Notas);
  FechaTabela(aux);
  FechaTabela(Parcelas);
  NF.Free;
  Action := CaFree;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         Eventos da Consulta
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************** atualiza a consulta **********************************}
procedure TFManutencaoNotas.PosicionaNota(VpaGuardarPosicao : Boolean = false);
Var
  VpfPosicao : TBookMark;
begin
  VpfPosicao := NOTAS.GetBookmark;
  LimpaSQLTabela(Notas);
  Notas.Sql.Add(' select ' +
    ' NF.I_NRO_NOT, Cli.C_NOM_CLI, Cli.C_TIP_CAD, NF.C_FLA_ECF, NF.c_not_can, NF.L_OBS_NOT, ' +
    ' NF.N_TOT_PRO, NF.N_TOT_NOT, NF.I_NRO_LOJ, NF.I_NRO_CAI, NF.I_EMP_FIL, NF.I_SEQ_NOT, ' +
    ' NF.D_DAT_EMI, NF.C_COD_NAT,Nat.C_Cod_Nat ||''-''|| nat.C_NOM_NAT Natureza, nat.C_NOM_NAT,' +
    ' NF.C_NOT_DEV, NF.C_NOT_IMP, NF.C_TIP_NOT, NF.I_COD_CLI,  NF.C_SER_NOT, nf.C_NRO_PED ' +
    ' from ' +
    ' CadNotaFiscais as NF, CadClientes as CLI, CadNatureza as Nat ');

  AdicionaFiltros(Notas.Sql);

  Notas.Sql.Add(' order by NF.I_NRO_NOT ');
  NOTAS.open;
  NotaGrid.ALinhaSQLOrderBy := NOTAS.Sql.Count - 1;

  if (VpaGuardarPosicao) and (not Notas.eof) then
    NOTAS.GotoBookmark(VpfPosicao);
  NOTAS.FreeBookmark(VpfPosicao);
end;

{**************** adiciona os filtros da select *******************************}
procedure TFManutencaoNotas.AdicionaFiltros(VpaSelect : TStrings);
begin
  VpaSelect.Add(' where  NF.I_EMP_FIL = ' + IntToStr(Varia.CodigoEmpFil) +
                ' and nf.i_nro_not is not null '  +
                ' and NF.I_COD_CLI *= CLI.I_COD_CLI ' +
                ' and NF.C_COD_NAT *= NAT.C_COD_NAT' );

  if ENota.Text <> '' Then
    VpaSelect.Add(' and NF.I_Nro_not = '+ ENota.Text);

  VpaSelect.Add(SQLTextoDataEntreAAAAMMDD( ' NF.D_DAT_EMI ', Data1.Date, Data2.Date, true));

  if (EClientes.Text <> '') then
    VpaSelect.Add(' and NF.I_COD_CLI = ' + EClientes.Text);

  if ENatureza.Text <> '' then
    VpaSelect.Add(' and NF.C_COD_NAT = ''' + ENatureza.Text + ''''  );

  case CupomNota.ItemIndex of
    0 : VpaSelect.Add(' and NF.C_FLA_ECF = ''S''');
    1 : VpaSelect.Add(' and Isnull(NF.C_FLA_ECF, ''N'') = ''N''');
  end;

  if (ESerie.Text <> '') and (CupomNota.ItemIndex = 1) then
     VpaSelect.Add(' and NF.C_SER_NOT = ''' + ESerie.Text + '''' );

end;
{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         Evetos dos filtros superiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{***************** atualica a consulta da grade *******************************}
procedure TFManutencaoNotas.ENotasRetorno(Retorno1, Retorno2: String);
begin
  PosicionaNota;
end;

{****************** retorno da natureza ************************************* }
procedure TFManutencaoNotas.ENaturezaRetorno(Retorno1, Retorno2: String);
begin
  PosicionaNota;
end;

{**************** chama a rotina para atualizar a consulta ********************}
procedure TFManutencaoNotas.Data1Exit(Sender: TObject);
begin
  PosicionaNota;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                        eventos dos botões inferiores
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************** fecha o formulario ***********************************}
procedure TFManutencaoNotas.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

{************************ exclui a nota fiscal *******************************}
procedure TFManutencaoNotas.BExcuiNotaClick(Sender: TObject);
begin
  if SenhaDeLiberacao then
  begin
    if PodeExcluirReg(NOTASD_DAT_EMI.AsDateTime) then
    begin
      T.Execute('Excluindo nota fiscal...');
      if nf.ExcluiNotaFiscal(NOTASI_SEQ_NOT.AsInteger, NOTASI_NRO_NOT.AsInteger, NOTASc_not_can.AsString = 'S', NOTASC_SER_NOT.AsString) then
      begin
           // cancela pedido
        if ConfigModulos.PedidoVenda then
          nf.CancelaPedido(NOTASI_EMP_FIL.AsInteger, NOTASC_NRO_PED.AsString,' Nota Excluida ');
      end;
      PosicionaNota(false);
      T.Fecha;
    end;
  end;  
end;

{******************* cancela a nota fiscal ************************************}
procedure TFManutencaoNotas.BCancelaNotaClick(Sender: TObject);
begin
  if SenhaDeLiberacao then
  begin
    T.Execute('Cancelando nota fiscal...');
    if NF.CancelaNotaFiscal(NOTASI_SEQ_NOT.AsInteger) then
    begin
      // cancela pedido
      if ConfigModulos.PedidoVenda then
        nf.CancelaPedido(NOTASI_EMP_FIL.AsInteger, NOTASC_NRO_PED.AsString,' Nota Cancelada ');
    end;
    PosicionaNota;
    T.Fecha;
  end;  
end;

procedure TFManutencaoNotas.CupomNotaClick(Sender: TObject);
begin
  PosicionaNota;
end;

{******************** devolucao do cupom fiscal *******************************}
procedure TFManutencaoNotas.BNotaDevolucaoClick(Sender: TObject);
begin
 DevolucaoCupomNotaFiscal := true;
 if CupomNota.ItemIndex = 1 then
   ENatDevolucao.Text := Varia.NaturezaDevolucaoNotaFiscal
 else
   ENatDevolucao.Text := Varia.NaturezaDevolucaoCupom;
 ENatDevolucaoSelect(nil);
 ENatDevolucao.Atualiza;
 MostraNatureza(true)
end;

{******************* gera a nota de entrada do cupom **************************}
procedure TFManutencaoNotas.BNotaFiscalCupomClick(Sender: TObject);
begin
  DevolucaoCupomNotaFiscal := false;
  ENatDevolucaoSelect(nil);
  ENatDevolucao.Text := Varia.NaturezaNotaFiscalCupom;
  ENatDevolucao.Atualiza;
  MostraNatureza(false);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos das devolucoes
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******************** retorna a natureza de operacao **************************}
procedure TFManutencaoNotas.MostraNatureza( devolucao : Boolean);
begin
  if devolucao then
  begin
    EClienteDevolucao.Text := NOTASi_COD_CLI.AsString;
    EClienteDevolucao.Atualiza;
    EClienteDevolucao.Enabled := true;
    SpeedButton1.Enabled := true;
  end
  else
  begin
    EClienteDevolucao.Text := NOTASI_COD_CLI.AsString;
    EClienteDevolucao.Atualiza;
    EClienteDevolucao.Enabled := true;
    SpeedButton1.Enabled := true;
  end;

  DevolucaoCupomNotaFiscal := devolucao;
  PanelColor1.Enabled := false;
  PanelColor2.Enabled := false;
  ComponenteMove1.Visible := true;
  if ENatDevolucao.Enabled then
    ENatDevolucao.SetFocus
  else
    if EClienteDevolucao.Enabled then
      EClienteDevolucao.SetFocus;
end;

{************************** ok da natureza ************************************}
procedure TFManutencaoNotas.BOkClick(Sender: TObject);
begin
  if (ENatDevolucao.Text <> '')  and (EClienteDevolucao.text <> '')  then
  begin
    EscondeNatureza;
    // verifica natureza
    NF.LocalizaCadNatureza(CadNatureza, ENatDevolucao. text);

    // gera devolucao ou nota de cupom
    if DevolucaoCupomNotaFiscal then
    begin

      DevolucaoTotalCupomNotaFiscal( ENatDevolucao.Text,
                                    CadNatureza.fieldByname('C_BAI_EST').AsString,
                                    CadNatureza.fieldByname('I_COD_OPE').AsInteger);

    end
    else
    begin
      T.Execute('Gerando nota fiscal do cupom...');
      FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));
      FNovaNotaFiscal.ConsultaNotafiscalComCancelar( NF.NotaFiscalDoCupom( NOTASI_SEQ_NOT.AsString,
                                                                           ENatDevolucao.text,
                                                                           strtoint(EClienteDevolucao.text),
                                                                           CadNatureza.fieldByname('L_TEX_FIS').AsString ),  NOTASI_SEQ_NOT.AsInteger, ' Nota Fiscal Referente ao Cupom Fiscal nº ' + NOTASI_NRO_NOT.AsString);
      FNovaNotaFiscal.free;
      T.Fecha;
    end;
  end
  else
    aviso('Natureza ou cliente inválido!');
end;

{************************ cancela a natureza **********************************}
procedure TFManutencaoNotas.BCancelarClick(Sender: TObject);
begin
  EscondeNatureza;
end;

{******************* esconde o painel da natureza *****************************}
procedure TFManutencaoNotas.EscondeNatureza;
begin
  PanelColor1.Enabled := true;
  PanelColor2.Enabled := true;
  ComponenteMove1.Visible := false;
end;

{****************** faz a devolucao do cupom *********************************}
procedure TFManutencaoNotas.DevolucaoTotalCupomNotaFiscal(VpaNatureza : String; BaixaEstoque : String; VpaCodOpe : Integer);
Var
  VpfNotDevolucao : Integer;
begin
  T.Execute('Executando devolução total da nota fiscal...');
  // devolucao financeira
  if  NF.DevolucaoTotalNotaFiscal(NOTASI_SEQ_NOT.AsInteger) then
  begin
    VpfNotDevolucao := NF.GeraNotaFiscalDevolucao( NOTASI_SEQ_NOT.AsString, BaixaEstoque, VpaNatureza,CupomNota.ItemIndex = 0, VpaCodOpe, strtoint(EClienteDevolucao.text));
    FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(Application,'',FPrincipal.VerificaPermisao('FNovaNotaFiscal'));

    // cancela pedido
    if ConfigModulos.PedidoVenda then
      nf.CancelaPedido(NOTASI_EMP_FIL.AsInteger, NOTASC_NRO_PED.AsString,' Nota Devolvida ');

    // visualiza a nota fiscal
    FNovaNotaFiscal.ConsultaNotafiscalAlteraNumero(VpfNotDevolucao);
    FNovaNotaFiscal.free;
  end;
  PosicionaNota(true);
  T.Fecha;
end;


{************************* habilita o botao ok ********************************}
procedure TFManutencaoNotas.ENatDevolucaoChange(Sender: TObject);
begin
  BOk.Enabled := (ENatDevolucao.Text <> '') or (EClienteDevolucao.Text <> '' );
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************* apos o scrool da tabela ****************************}
procedure TFManutencaoNotas.NOTASAfterScroll(DataSet: TDataSet);
begin
  // devolucao total = S, naum devolvida = N
  // canceladas = S
  AlterarEnabledDet([BExcuiNota, BCancelaNota, BNotaDevolucao, BNotaFiscalCupom ], false);
  if CupomNota.ItemIndex = 1 then
  begin
    BExcuiNota.Enabled := (NOTASC_NOT_IMP.AsString = 'N') AND (NOTASC_NOT_DEV.AsString = 'N');
    BCancelaNota.Enabled := (NOTASC_NOT_DEV.AsString = 'N') AND (NOTASC_NOT_CAN.AsString = 'N');
    BNotaDevolucao.Enabled := (NOTASC_NOT_DEV.AsString = 'N') AND (NOTASC_NOT_CAN.AsString = 'N') AND (NOTASC_TIP_NOT.AsString = 'S');
  end
  else
  begin
    BNotaDevolucao.Enabled := (NOTASC_NOT_DEV.AsString = 'N') AND (NOTASC_NOT_CAN.AsString = 'N');
    BNotaFiscalCupom.Enabled := (NOTASC_NOT_DEV.AsString = 'N') AND (NOTASC_NOT_CAN.AsString = 'N');
  end;
end;

{********************* atualiza a consulta ************************************}
procedure TFManutencaoNotas.ENotaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    13 : PosicionaNota;
  end;
end;


procedure TFManutencaoNotas.FormShow(Sender: TObject);
begin
   Self.HelpFile := Varia.PathHelp + 'MFATURAMENTO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
end;

procedure TFManutencaoNotas.BBAjudaClick(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT,FManutencaoNotas.HelpContext);
end;

procedure TFManutencaoNotas.ENatDevolucaoSelect(Sender: TObject);
begin
  ENatDevolucao.ASelectLocaliza.Clear;
  ENatDevolucao.ASelectLocaliza.add(' Select * from CadNatureza where c_nom_nat like ''@%'' ' +
                                    ' and c_cli_for = ''S'' ' +
                                    ' and c_ati_nat = ''S'' ' +
                                    ' and i_cod_ope is not null and C_CLA_PLA is not null ' +
                                    ' and isnull(c_fil_per, ''' + inttostr(varia.CodigoEmpFil) +
                                    ''') like ''%' + inttostr(varia.CodigoEmpFil) + '%''');

  ENatDevolucao.ASelectValida.clear;
  ENatDevolucao.ASelectValida.Add(' select * from CadNatureza where C_COD_NAT = ''@'' ' +
                                  ' and c_cli_for = ''S'' ' +
                                  ' and c_ati_nat = ''S'' ' +
                                  ' and i_cod_ope is not null and C_CLA_PLA is not null ' +
                                  ' and isnull(c_fil_per, ''' + inttostr(varia.CodigoEmpFil) +
                                  ''') like ''%' + inttostr(varia.CodigoEmpFil) + '%''');



    if DevolucaoCupomNotaFiscal then
    begin
      ENatDevolucao.ASelectLocaliza.add(' and C_TIP_NAT = ''D'' ');
      ENatDevolucao.ASelectValida.Add(' and C_TIP_NAT = ''D'' ');
    end
    else
    begin
      ENatDevolucao.ASelectLocaliza.add(' and C_NOT_CUP = ''S'' ');
      ENatDevolucao.ASelectValida.Add(' and C_NOT_CUP = ''S'' ');
    end

end;

Initialization
 RegisterClasses([TFManutencaoNotas]);
end.
