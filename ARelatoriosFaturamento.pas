unit ARelatoriosFaturamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  UCrpe32, StdCtrls, Buttons, Componentes1, ComCtrls, ExtCtrls,
  PainelGradiente, Localizacao, Mask, DBCtrls, Tabela, DBTables,
  Db, Grids, DBGrids, numericos;

type
  TFRelatoriosFaturamento = class(TFormularioPermissao)
    PainelGradiente1: TPainelGradiente;
    PanelColor2: TPanelColor;
    Rel: TCrpe;
    BBotao: TBitBtn;
    Localiza: TConsultaPadrao;
    BFechar: TBitBtn;
    ScrollBox1: TScrollBox;
    Fundo: TPanelColor;
    PFilial: TPanelColor;
    Label24: TLabel;
    SpeedButton1: TSpeedButton;
    LFilial: TLabel;
    EFIlial: TEditLocaliza;
    PTabelaPreco: TPanelColor;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    LTabela: TLabel;
    ETabela: TEditLocaliza;
    PClassificacao: TPanelColor;
    LbClassificacao: TLabel;
    SpeedButton5: TSpeedButton;
    LClassificacao: TLabel;
    Eclassificacao: TEditLocaliza;
    PPeriodo: TPanelColor;
    Label4: TLabel;
    Data1: TCalendario;
    Data2: TCalendario;
    PSerie: TPanelColor;
    Label5: TLabel;
    ESerie: TEditColor;
    PTipoNota: TPanelColor;
    Label6: TLabel;
    TipoNota: TComboBoxColor;
    PCodVendedor: TPanelColor;
    LbVendedores: TLabel;
    SpeedButton4: TSpeedButton;
    LVendedor: TLabel;
    EVendedor: TEditLocaliza;
    PCodClientes: TPanelColor;
    Label18: TLabel;
    SpeedButton2: TSpeedButton;
    LCliente: TLabel;
    Eclientes: TEditLocaliza;
    Pestado: TPanelColor;
    Label8: TLabel;
    BPais: TSpeedButton;
    Lestado: TLabel;
    EEstado: TEditLocaliza;
    PTipoData: TPanelColor;
    Label10: TLabel;
    TipoData: TComboBoxColor;
    PProduto: TPanelColor;
    Label3: TLabel;
    SpeedButton6: TSpeedButton;
    LProduto: TLabel;
    EProduto: TEditLocaliza;
    POpeEstoque: TPanelColor;
    Label11: TLabel;
    SpeedButton7: TSpeedButton;
    LopeEstoque: TLabel;
    EOpeEstoque: TEditLocaliza;
    PSomenteZerados: TPanelColor;
    SomZer: TCheckBox;
    PSomenteNeg: TPanelColor;
    SomNeg: TCheckBox;
    PIgnorarNeg: TPanelColor;
    IgnNeg: TCheckBox;
    PIgnorarZerados: TPanelColor;
    IgnZer: TCheckBox;
    PtipoPedido: TPanelColor;
    Label1: TLabel;
    Tipo: TComboBoxColor;
    PignoraPeriodo: TPanelColor;
    IgnorarPeriodo: TCheckBox;
    PTipoDataPed: TPanelColor;
    Label9: TLabel;
    TipodataPed: TComboBoxColor;
    Pcidade: TPanelColor;
    Lbendereco: TLabel;
    SpeedButton8: TSpeedButton;
    LCidade: TLabel;
    ECidades: TEditLocaliza;
    PAmostragem: TPanelColor;
    Label7: TLabel;
    EAmostragem: Tnumerico;
    PInventario: TPanelColor;
    Label12: TLabel;
    EInventario: TEditLocaliza;
    SpeedButton9: TSpeedButton;
    LInventario: TLabel;
    PPeriodoVenda: TPanelColor;
    Label13: TLabel;
    Data3: TCalendario;
    Data4: TCalendario;
    PRegiao: TPanelColor;
    Label14: TLabel;
    ERegiao: TEditLocaliza;
    SpeedButton10: TSpeedButton;
    LRegiao: TLabel;
    PSituacaoPed_Orc: TPanelColor;
    Label15: TLabel;
    SpeedButton11: TSpeedButton;
    LSituacaoPed_ORC: TLabel;
    ESituacaoPed_Orc: TEditLocaliza;
    PTransportadora: TPanelColor;
    LbTransportadora: TLabel;
    SpeedButton12: TSpeedButton;
    LTransportadora: TLabel;
    ETransportadora: TEditLocaliza;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBotaoClick(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure ETabelaSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EProdutoSelect(Sender: TObject);
    procedure EProdutoRetorno(Retorno1, Retorno2: String);
    procedure IgnorarPeriodoClick(Sender: TObject);
    procedure RelExecuteBegin(Sender: TObject; var Cancel: Boolean);
    procedure RelExecuteEnd(Sender: TObject);
    procedure EFIlialSelect(Sender: TObject);
  private
    Identificador : string;
    seqpro : integer;
    function SomaPainel : integer;
    procedure ConfiguraPainels( NomeParametro : string);
    function RetornaParametro( NomeParametro : string) : string;
    function TextoDosFiltros : string;
    procedure AdicionaSqlSemVenda;
  public
    function CarregaConfig(NomeRel, TituloForm : string) : Boolean;
  end;

var
  FRelatoriosFaturamento: TFRelatoriosFaturamento;

implementation

uses funstring, fundata, constantes, funObjeto, APrincipal, constmsg, funsql,
  AInicio;

{$R *.DFM}

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Formulario
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ****************** Na criação do Formulário ******************************** }
procedure TFRelatoriosFaturamento.FormCreate(Sender: TObject);
begin
  EFIlial.APermitirVazio := Varia.FilialUsuario = '';
  data1.DateTime := PrimeiroDiaMes(date);
  data2.DateTime := UltimoDiaMes(date);
  seqpro := 0;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFRelatoriosFaturamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

{****************** no show do formulario *********************************** }
procedure TFRelatoriosFaturamento.FormShow(Sender: TObject);
begin
  EFIlial.Text := IntToStr(varia.CodigoEmpFil);
  EFIlial.Atualiza;
  TipoNota.ItemIndex := 0;
  TipoData.ItemIndex := 0;
  TipodataPed.ItemIndex := 0;
  tipo.ItemIndex := 2;
  ESerie.Text := Varia.SerieNota;
  Etabela.OnSelect(nil);
  ETabela.Text := IntToStr(varia.TabelaPreco);
  ETabela.Atualiza;
end;

{****************** fecha o formulario ************************************** }
procedure TFRelatoriosFaturamento.BFecharClick(Sender: TObject);
begin
  self.close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                    funcoes de configuracao do relatorio
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{***************  Gera o relatorio ****************************************** }
procedure  TFRelatoriosFaturamento.AdicionaSqlSemVenda;
begin
  rel.sql.query.Clear;
  rel.sql.query.add(' SELECT ');
  rel.sql.query.add(' CADCLIENTES."I_COD_CLI", CADCLIENTES."C_NOM_CLI", CADCLIENTES."C_FO1_CLI" ');
  rel.sql.query.add(' FROM ');
  rel.sql.query.add(' "DBA"."CADCLIENTES" CADCLIENTES ');
  rel.sql.query.add(' WHERE ');

  rel.sql.query.add(' CADCLIENTES."I_COD_CLI" NOT IN ');
  rel.sql.query.add(' (select cad.i_cod_cli from cadNotaFiscais cad, CadNatureza MovNat where ');
  rel.sql.query.add('   cad.c_not_can = ''N'' and cad.c_not_dev = ''N'' ');
  rel.sql.query.add(' and cad.i_cod_cli is not null ');
  rel.sql.query.add(' and MovNat.C_COD_NAT = Cad.C_COD_NAT ');
  rel.sql.query.add(' and MovNat.C_MOS_FAT = ''S'' ');

  if EFIlial.Text = '' then
    rel.sql.query.add(' and left(cad.I_emp_fil,1) = ' + IntToStr(varia.CodigoEmpresa))
  else
    rel.sql.query.add(' and cad.I_emp_fil = ' + EFIlial.text);

  rel.sql.query.add(SQLTextoDataEntreAAAAMMDD('cad.d_dat_emi',data1.DateTime,data2.DateTime, true) + ') ');

  if not IgnorarPeriodo.Checked then
  begin
    rel.sql.query.add(' and CADCLIENTES."I_COD_CLI" IN ');
    rel.sql.query.add(' (select cad1.i_cod_cli from cadNotaFiscais cad1, CadNatureza MovNat where ');
    rel.sql.query.add('  cad1.c_not_can = ''N'' and cad1.c_not_dev = ''N'' ');
    rel.sql.query.add('  and cad1.i_cod_cli is not null ' );
    rel.sql.query.add('  and MovNat.C_COD_NAT = Cad1.C_COD_NAT ');
    rel.sql.query.add('  and MovNat.C_MOS_FAT = ''S'' ');

    if EFIlial.Text = '' then
      rel.sql.query.add(' and left(cad1.I_emp_fil,1) = ' + IntToStr(varia.CodigoEmpresa))
    else
      rel.sql.query.add(' and cad1.I_emp_fil = ' + EFIlial.text);
    rel.sql.query.add(SQLTextoDataEntreAAAAMMDD('cad1.d_dat_emi',data3.DateTime,data4.DateTime, true) + ') ');
  end;

  if ERegiao.Text <> '' then
    rel.sql.query.add(' and CADCLIENTES."I_COD_REG" = ' + ERegiao.text);
  if  ECidades.Text <> '' then
    rel.sql.query.add(' and CADCLIENTES."C_CID_CLI" = ''' + ECidades.text + '''');

  rel.sql.query.add(' ORDER BY');
  rel.sql.query.add(' CADCLIENTES."C_NOM_CLI" ASC ');
end;


{************************** Soma altura dos paineis ***************************}
function TFRelatoriosFaturamento.SomaPainel : integer;
var
  laco : Integer;
begin
   result := 0;
   for laco := 0 to (Fundo.ControlCount -1) do
     if (Fundo.Controls[laco] is TPanelColor) then
       if (Fundo.Controls[laco] as TPanelColor).Visible then
         result := result + (Fundo.Controls[laco] as TPanelColor).Height;
end;

{*********************** Configura os paineis visiveis ***********************}
procedure TFRelatoriosFaturamento.ConfiguraPainels( NomeParametro : string);
begin
  if UpperCase(NomeParametro) = 'FILIAL' then
    PFilial.Visible := true else
  if  UpperCase(NomeParametro) = 'CODTABELA' then
    PTabelaPreco.Visible := true else
  if  UpperCase(NomeParametro) = 'CODCLASSIFICACAO' then
    PClassificacao.Visible := true;

  if  UpperCase(NomeParametro) = 'DIAINICIOVENDA' then
  begin
    PPeriodoVenda.Visible := true;
    IgnorarPeriodo.Caption := ' Ignorar Período de Venda ';
  end;

  if  UpperCase(NomeParametro) = 'DIAINICIO' then
  begin
    PPeriodo.Visible := true;
    Data1.Visible := true;
  end  else
  if  UpperCase(NomeParametro) = 'DIAFIM' then
  begin
    PPeriodo.Visible := true;
    Data2.Visible := true;
  end else
  if UpperCase(NomeParametro) = 'SERIE' then
    PSerie.Visible := true else
  if UpperCase(NomeParametro) = 'NOTACUPOM' then
    PTipoNota.Visible := true;
  if UpperCase(NomeParametro) = 'CODVENDEDOR' then
    PCodVendedor.Visible := true;
  if UpperCase(NomeParametro) = 'CODCLIENTE' then
    PCodClientes.Visible := true;
  if UpperCase(NomeParametro) = 'ESTADO' then
    Pestado.Visible := true;
  if UpperCase(NomeParametro) = 'TIPODATA' then
    PTipoData.Visible := true;
  if UpperCase(NomeParametro) = 'SEQPRODUTO' then
    PProduto.Visible := true;
  if UpperCase(NomeParametro) = 'CODOPERACAO' then
    POpeEstoque.Visible := true;
  if UpperCase(NomeParametro) = 'IGNORARNEG' then
    PIgnorarNeg.Visible := true;
  if UpperCase(NomeParametro) = 'SOMENTENEG' then
    PSomenteNeg.Visible := true;
  if UpperCase(NomeParametro) = 'IGNORARZERADOS' then
    PIgnorarZerados.Visible := true;
  if UpperCase(NomeParametro) = 'SOMENTEZERADOS' then
    PSomenteZerados.Visible := true;
  if UpperCase(NomeParametro) = 'IGNORADATA' then
    PignoraPeriodo.Visible := true;
  if UpperCase(NomeParametro) = 'TIPODATAPED' then
    PTipoDataPed.Visible := true;
  if UpperCase(NomeParametro) = 'AMOSTRAGEM' then
    PAmostragem.Visible := true;
  if UpperCase(NomeParametro) = 'TIPOPEDIDO' then
    PtipoPedido.Visible := true;
  if UpperCase(NomeParametro) = 'CIDADE' then
    PCidade.Visible := true;
  if UpperCase(NomeParametro) = 'CODINVENTARIO' then
    PInventario.Visible := true;
  if UpperCase(NomeParametro) = 'CODREGIAO' then
    PRegiao.Visible := true;
  if UpperCase(NomeParametro) = 'CODSITUACAOPED_ORC' then
    PSituacaoPed_Orc.Visible := true;
  if UpperCase(NomeParametro) = 'CODTRANSPORTADORA' then
    PTransportadora.Visible := true;
end;

{******************** retorna o valor do parametro ***************************}
function  TFRelatoriosFaturamento.RetornaParametro( NomeParametro : string) : string;
begin
  result := '@ERRO@';
  if UpperCase(NomeParametro) = 'TITULO' then result := 'Relatório de ' + trim(PainelGradiente1.Caption) else
  if UpperCase(NomeParametro) = 'NOMEEMPRESA' then result := Varia.NomeEmpresa + '               ' + CT_NomeEmpresa else
  if UpperCase(NomeParametro) = 'EMPRESA' then result := inttostr(varia.CodigoEmpresa) else
  if UpperCase(NomeParametro) = 'FILIAL' then result := EFilial.text else
  if UpperCase(NomeParametro) = 'DIAINICIOVENDA' then result := inttostr(dia(Data3.DateTime)) else
  if UpperCase(NomeParametro) = 'DIAINICIO' then result := inttostr(dia(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'MESINICIO' then result := inttostr(mes(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'ANOINICIO' then result := inttostr(ano(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'DIAFIM' then result := inttostr(dia(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'MESFIM' then result := inttostr(mes(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'ANOFIM' then result := inttostr(ano(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'CODTABELA' then result := ETabela.Text else
  if UpperCase(NomeParametro) = 'CODCLASSIFICACAO' then result := EClassificacao.text else
  if UpperCase(NomeParametro) = 'SERIE' then result := ESerie.text else
  if UpperCase(NomeParametro) = 'NOTACUPOM' then result := inttostr(TipoNota.ItemIndex) else
  if UpperCase(NomeParametro) = 'CODVENDEDOR' then result := EVendedor.Text else
  if UpperCase(NomeParametro) = 'CODCLIENTE' then result := EClientes.Text else
  if UpperCase(NomeParametro) = 'ESTADO' then result := EEstado.Text else
  if UpperCase(NomeParametro) = 'TIPODATA' then result := inttostr(TipoData.ItemIndex) else
  if UpperCase(NomeParametro) = 'CODIGO' then
  begin
    If Uppercase(Varia.CodigoProduto) = 'C_COD_PRO' then
      result := '1'
    else
      result := '0';
  end else
  if UpperCase(NomeParametro) = 'SEQPRODUTO' then result := IntTostr(seqpro) else
  if UpperCase(NomeParametro) = 'CODOPERACAO' then result := EOpeEstoque.Text else
  if UpperCase(NomeParametro) = 'IGNORARZERADOS' then
    begin if IgnZer.Checked then result := '1' else result := '0' end else
  if UpperCase(NomeParametro) = 'IGNORARNEG' then
    begin if IgnNeg.Checked then result := '1' else result := '0' end else
  if UpperCase(NomeParametro) = 'SOMENTEZERADOS' then
    begin if SomZer.Checked then result := '1' else result := '0' end else
  if UpperCase(NomeParametro) = 'SOMENTENEG' then
    begin if SomNeg.Checked then result := '1' else result := '0' end else
  if UpperCase(NomeParametro) = 'IGNORADATA' then
      begin if IgnorarPeriodo.Checked then result := '0' else result := '1' end else
  if UpperCase(NomeParametro) = 'TIPODATAPED' then result := inttostr(TipodataPed.ItemIndex) else
  if UpperCase(NomeParametro) = 'TIPOPEDIDO' then result := inttostr(tipo.ItemIndex) else
  if UpperCase(NomeParametro) = 'AMOSTRAGEM' then result := inttostr(trunc(EAmostragem.avalor)) else
  if UpperCase(NomeParametro) = 'CIDADE' then result := ECidades.Text else
  if UpperCase(NomeParametro) = 'CODINVENTARIO' then result := EInventario.Text else
  if UpperCase(NomeParametro) = 'SQLSEMVENDA' then begin result := ''; AdicionaSqlSemVenda; end else
  if UpperCase(NomeParametro) = 'CODSITUACAOPED_ORC' then result := ESituacaoPed_Orc.Text else
  if UpperCase(NomeParametro) = 'CODTRANSPORTADORA' then result := ETransportadora.Text else
  if UpperCase(NomeParametro) = 'CODREGIAO' then result := ERegiao.Text else
  begin
    if ( UpperCase(NomeParametro)[1] + UpperCase(NomeParametro)[2] + UpperCase(NomeParametro)[3])
          = 'PM-' then
    result := 'LINK'
    else
      aviso('Parametro não configurado ' + NomeParametro);
  end;
end;

function TFRelatoriosFaturamento.TextoDosFiltros : string;
begin
  result := Identificador;
  if PPeriodo.Visible then
  begin
    result := result + '-Período de ';
    if (Data1.Enabled) then result := result + datetostr(data1.date) else result := 'Todo';
    if (Data2.visible) then result := result + ' à ' + datetostr(data2.date);
  end;

  if PFilial.Visible then
  begin
    result := result + '-Filial: ';
    if EFIlial.Text <> '' then result := result + EFIlial.text else result := result + 'Todas';
  end;

  if PClassificacao.Visible then
  begin
    result := result + '-Classificação: ';
    if EClassificacao.Text <> '' then result := result + LClassificacao.caption else result := result + 'Todas';
  end;

  if PTransportadora.Visible then
  begin
    result := result + '-Transportadora: ';
    if ETransportadora.Text <> '' then result := result + LTransportadora.caption else result := result + 'Todas';
  end;


  if PTabelaPreco.Visible then
  begin
    result := result + '-Tabela Preço: ';
    if ETabela.Text <> '' then result := result + LTabela.Caption else result := result + 'Todas';
  end;

  if PSerie.Visible then
  begin
    result := result + '-Série: ';
    if ESerie.Text <> '' then result := result + ESerie.Text else result := result + 'Todas';
  end;

  if PTipoNota.Visible then
  begin
    result := result + '-Tipo: ';
    result := result + TipoNota.Text;
  end;

  if PCodVendedor.Visible then
  begin
    result := result + '-Vendedor: ';
    if EVendedor.Text <> '' then result := result + LVendedor.caption else result := result + 'Todos';
  end;

  if PCodClientes.Visible then
  begin
    result := result + '-Cliente: ';
    if Eclientes.Text <> '' then result := result + LCliente.caption else result := result + 'Todos';
  end;

  if Pestado.Visible then
  begin
    result := result + '-Estado: ';
    if EEstado.Text <> '' then result := result + Lestado.caption else result := result + 'Todos';
  end;

  if PTipoData.Visible then
  begin
    result := result + '-Data por: ';
    result := result + TipoData.Text;
  end;

  if PProduto.Visible then
  begin
    result := result + '-Produto: ';
    if EProduto.Text <> '' then result := result + LProduto.caption else result := result + 'Todos';
  end;

  if POpeEstoque.Visible then
  begin
    result := result + '-Ope. Estoque: ';
    if EOpeEstoque.Text <> '' then result := result + LopeEstoque.caption else result := result + 'Todos';
  end;

  if PtipoPedido.Visible then
  begin
    result := result + '-Tipo: ' +  tipo.Text;
  end;

  if PTipoDataPed.Visible then
  begin
    result := result + '-Data por: ' +  TipodataPed.Text;
  end;

  if Pcidade.Visible then
  begin
    result := result + '-Cidade: ';
    if ECidades.Text <> '' then result := result + ECidades.Text else result := result + 'Todas';
  end;

  if PInventario.Visible then
  begin
    result := result + '-Invetário: ';
    if EInventario.Text <> '' then result := result + LInventario.CAPTION else result := result + 'Todas';
  end;

  if PRegiao.Visible then
  begin
    result := result + '-Região : ';
    if ERegiao.Text <> '' then result := result + LRegiao.CAPTION else result := result + 'Todas';
  end;

  if PSituacaoPed_Orc.Visible then
  begin
    result := result + '-Situação : ';
    if ESituacaoPed_Orc.Text <> '' then result := result + LSituacaoPed_ORC.CAPTION else result := result + 'Todas';
  end;

end;

{******************** Carrega Configuracoes da tela **************************}
function TFRelatoriosFaturamento.CarregaConfig(NomeRel, TituloForm : string) : Boolean;
var
  laco : integer;
begin
   result := false;
   PainelGradiente1.Caption := '   ' + copy(TituloForm,6,length(tituloForm)) + '   ';
   Identificador := DeletaChars(copy(TituloForm,1,5),'&');
   if FileExists(varia.PathRel + NomeRel) then
   begin
     rel.ReportName := varia.PathRel + NomeRel;
     rel.Connect.Retrieve;
     rel.Connect.DatabaseName := varia.AliasBAseDados;
     rel.Connect.ServerName := varia.AliasRelatorio;

     rel.ParamFields.Retrieve;
     for laco := 0 to rel.ParamFields.Count -1 do
       ConfiguraPainels(Rel.ParamFields[laco].Name);
     self.ClientHeight := SomaPainel + 95;
     result := true;
     fundo.Align := alClient;
   end
   else
     Aviso('Relatório não encontrado "' + varia.PathRel + NomeRel + '"');
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                    Gera relatorio
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{***************  Gera o relatorio ****************************************** }
procedure TFRelatoriosFaturamento.BBotaoClick(Sender: TObject);
var
  laco : integer;
  Parametro : string;
begin
  for laco := 0 to rel.ParamFields.Count -1 do
  begin
    Parametro := RetornaParametro(Rel.ParamFields[laco].Name);
    if Parametro = '@ERRO@' then
     abort;
    if Parametro <> 'LINK' then
    begin
      if Parametro <> '' then
        rel.ParamFields[laco].value :=  Parametro
      else
        rel.ParamFields[laco].value :=  '0';
    end;
  end;
  rel.ReportTitle := TextoDosFiltros;
  rel.Execute;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Filtros
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFRelatoriosFaturamento.ETabelaSelect(Sender: TObject);
begin
  ETabela.ASelectValida.Clear;
  ETabela.ASelectValida.Add(' select * from cadTabelaPreco ' +
                                  ' where  i_cod_tab =  @ ' +
                                  ' and i_cod_emp = ' + InttoStr( Varia.CodigoEmpresa));
  ETabela.ASelectLocaliza.Clear;
  ETabela.ASelectLocaliza.Add(' select * from cadTabelaPreco ' +
                                    ' where  c_nom_tab like ''@%'' ' +
                                    ' and i_cod_emp = ' + InttoStr( Varia.CodigoEmpresa));
end;

procedure TFRelatoriosFaturamento.EProdutoSelect(Sender: TObject);
begin
  Eproduto.ASelectValida.Clear;
  Eproduto.ASelectValida.add(' Select Pro.C_Cod_Pro, pro.C_Nom_Pro, pro.C_Cod_Uni, ' +
                             ' pro.I_SEQ_PRO, mov.C_COD_BAR ' +
                             ' From cadprodutos as pro, ' +
                             ' MovQdadeProduto as mov ' +
                             ' Where pro.I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) +
                             ' and ' + varia.CodigoProduto + ' = ''@''' +
                             ' and pro.C_KIT_PRO = ''P'' ' +
                             ' and pro.I_seq_pro = Mov.I_seq_pro ' +
                             ' and mov.I_Emp_Fil = ' + IntTostr(varia.CodigoEmpFil));
  EProduto.ASelectLocaliza.clear;
  EProduto.ASelectLocaliza.add(' Select pro.C_Cod_Pro, pro.C_Nom_Pro, pro.C_Cod_Uni, ' +
                               ' pro.I_SEQ_PRO, mov.C_COD_BAR ' +
                               ' from cadprodutos as pro, ' +
                               ' MovQdadeProduto as mov ' +
                               ' Where pro.I_Cod_Emp = ' + IntToStr(varia.CodigoEmpresa) +
                               ' and pro.c_nom_pro like ''@%''' +
                               ' and pro.C_KIT_PRO = ''P'' ' +
                               ' and pro.I_seq_pro = Mov.I_seq_pro ' +
                               ' and mov.I_Emp_Fil = ' + IntTostr(varia.CodigoEmpFil));
end;

procedure TFRelatoriosFaturamento.EProdutoRetorno(Retorno1,
  Retorno2: String);
begin
  if Retorno1 <> '' then
    seqpro := strtoint(Retorno1)
  else
    if EProduto.text = '' then
      seqPro := 0;
end;

procedure TFRelatoriosFaturamento.IgnorarPeriodoClick(Sender: TObject);
begin
  if not PPeriodoVenda.Visible then
  begin
    Label4.Enabled := not IgnorarPeriodo.Checked;
    data1.Enabled := not IgnorarPeriodo.Checked;
    data2.Enabled := not IgnorarPeriodo.Checked;
  end
  else
  begin
    Label13.Enabled := not IgnorarPeriodo.Checked;
    data3.Enabled := not IgnorarPeriodo.Checked;
    data4.Enabled := not IgnorarPeriodo.Checked;
  end;
end;

procedure TFRelatoriosFaturamento.RelExecuteBegin(Sender: TObject;
  var Cancel: Boolean);
begin
  FInicio := TFInicio.Create(SELF);
  finicio.MudaTexto('Gerando Relatório...');
  FInicio.show;
  FInicio.Refresh;
end;

procedure TFRelatoriosFaturamento.RelExecuteEnd(Sender: TObject);
begin
  finicio. close;
end;

procedure TFRelatoriosFaturamento.EFIlialSelect(Sender: TObject);
begin
   EFIlial.ASelectLocaliza.Text := ' Select * from CadFiliais as fil ' +
                                         ' where c_nom_fan like ''@%'' ' +
                                         ' and i_cod_emp = ' + IntTostr(varia.CodigoEmpresa);
   EFIlial.ASelectValida.Text := ' Select * from CadFiliais where I_EMP_FIL = @% ' +
                                       ' and i_cod_emp = ' + IntTostr(varia.CodigoEmpresa);
   if Varia.FilialUsuario <> '' then
   begin
     EFIlial.ASelectValida.add(' and i_emp_fil not in ( ' + Varia.FilialUsuario + ')');
     EFIlial.ASelectLocaliza.add(' and i_emp_fil not in ( ' + Varia.FilialUsuario + ')');
   end;
end;

Initialization
 RegisterClasses([TFRelatoriosFaturamento]);

end.
