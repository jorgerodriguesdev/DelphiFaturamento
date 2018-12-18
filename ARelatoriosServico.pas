unit ARelatoriosServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  UCrpe32, StdCtrls, Buttons, Componentes1, ComCtrls, ExtCtrls,
  PainelGradiente, Localizacao, Mask, DBCtrls, Tabela, DBTables,
  Db, Grids, DBGrids, numericos;

type
  TFRelatoriosServico = class(TFormularioPermissao)
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
    PPeriodo: TPanelColor;
    Label4: TLabel;
    Data1: TCalendario;
    Data2: TCalendario;
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
    PForcenecedor: TPanelColor;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    Lfornecedor: TLabel;
    EFornecedor: TEditLocaliza;
    PLocal: TPanelColor;
    PFormaPagto: TPanelColor;
    Label20: TLabel;
    EFormaPgto: TEditLocaliza;
    SpeedButton5: TSpeedButton;
    LFormaPagto: TLabel;
    Label3: TLabel;
    Local: TComboBoxColor;
    PSituacao: TPanelColor;
    PTipoOS: TPanelColor;
    Label5: TLabel;
    TipoOs: TComboBoxColor;
    Label2: TLabel;
    ESituacao: TEditLocaliza;
    SpeedButton7: TSpeedButton;
    LSituacao: TLabel;
    PTecnico: TPanelColor;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    LTecnico: TLabel;
    Etecnico: TEditLocaliza;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBotaoClick(Sender: TObject);
    procedure BFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RelExecuteBegin(Sender: TObject; var Cancel: Boolean);
    procedure RelExecuteEnd(Sender: TObject);
    procedure EFIlialSelect(Sender: TObject);
  private
    Identificador : string;
    VetorMascara : array [1..6] of byte;
    function DesmontaMascara(var Vetor : array of byte; mascara:string):byte;
    function SomaPainel : integer;
    procedure ConfiguraPainels( NomeParametro : string);
    function RetornaParametro( NomeParametro : string) : string;
    function TextoDosFiltros : string;
  public
    function CarregaConfig(NomeRel, TituloForm : string) : Boolean;
  end;

var
  FRelatoriosServico: TFRelatoriosServico;

implementation

uses funstring, fundata, constantes, funObjeto, APrincipal, constmsg,
  AInicio;

{$R *.DFM}

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                          Formulario
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{ ****************** Na criação do Formulário ******************************** }
procedure TFRelatoriosServico.FormCreate(Sender: TObject);
begin
  EFIlial.APermitirVazio := Varia.FilialUsuario = '';
  data1.DateTime := PrimeiroDiaMes(date);
  data2.DateTime := UltimoDiaMes(date);
  DesmontaMascara(vetormascara, varia.MascaraPlanoConta);
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFRelatoriosServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

{****************** no show do formulario *********************************** }
procedure TFRelatoriosServico.FormShow(Sender: TObject);
begin
  EFIlial.Text := IntToStr(varia.CodigoEmpFil);
  EFIlial.Atualiza;
  LOcal.ItemIndex := 0;
  TipoOS.ItemIndex := 0;
end;

{****************** fecha o formulario ************************************** }
procedure TFRelatoriosServico.BFecharClick(Sender: TObject);
begin
  self.close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                    funcoes de configuracao do relatorio
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{******Desmonata a mascara pardão para a configuração das classificações*******}
function TFRelatoriosServico.DesmontaMascara(var Vetor : array of byte; mascara:string):byte;
var x:byte;
    posicao:byte;
begin
  posicao:=0;
  x:=0;
  while Pos('.', mascara) > 0 do
  begin
    vetor[x]:=(Pos('.', mascara)-posicao)-1;
    inc(x);
    posicao:=Pos('.', mascara);
    mascara[Pos('.', mascara)] := '*';
  end;
  vetor[x]:=length(mascara)-posicao;
  vetor[x+1] := 1;
  DesmontaMascara:=x+1;
end;

{************************** Soma altura dos paineis ***************************}
function TFRelatoriosServico.SomaPainel : integer;
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
procedure TFRelatoriosServico.ConfiguraPainels( NomeParametro : string);
begin
  if UpperCase(NomeParametro) = 'FILIAL' then
    PFilial.Visible := true else
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
  if UpperCase(NomeParametro) = 'CODVENDEDOR' then
    PCodVendedor.Visible := true;
  if UpperCase(NomeParametro) = 'CODCLIENTE' then
    PCodClientes.Visible := true;
  if UpperCase(NomeParametro) = 'CODFORNECEDOR' then
    PForcenecedor.Visible := true;
  if UpperCase(NomeParametro) = 'CODFORMAPAGTO' then
    PFormaPagto.Visible := true;
  if UpperCase(NomeParametro) = 'LOCALOS' then
    PLocal.Visible := true;
  if UpperCase(NomeParametro) = 'TIPOOS' then
    PTipoOS.Visible := true;
  if UpperCase(NomeParametro) = 'CODSITUACAO' then
    PSituacao.Visible := true;
  if UpperCase(NomeParametro) = 'CODTECNICO' then
    PTecnico.Visible := true;
end;

{******************** retorna o valor do parametro ***************************}
function  TFRelatoriosServico.RetornaParametro( NomeParametro : string) : string;
begin
  result := '@ERRO@';
  if UpperCase(NomeParametro) = 'TITULO' then result := 'Relatório de ' + trim(PainelGradiente1.Caption) else
  if UpperCase(NomeParametro) = 'NOMEEMPRESA' then result := Varia.NomeEmpresa + '               ' + CT_NomeEmpresa else
  if UpperCase(NomeParametro) = 'EMPRESA' then result := inttostr(varia.CodigoEmpresa) else
  if UpperCase(NomeParametro) = 'FILIAL' then result := EFilial.text else
  if UpperCase(NomeParametro) = 'DIAINICIO' then result := inttostr(dia(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'MESINICIO' then result := inttostr(mes(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'ANOINICIO' then result := inttostr(ano(Data1.DateTime)) else
  if UpperCase(NomeParametro) = 'DIAFIM' then result := inttostr(dia(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'MESFIM' then result := inttostr(mes(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'ANOFIM' then result := inttostr(ano(Data2.DateTime)) else
  if UpperCase(NomeParametro) = 'CODVENDEDOR' then result := EVendedor.Text else
  if UpperCase(NomeParametro) = 'CODCLIENTE' then result := EClientes.Text else
  if UpperCase(NomeParametro) = 'CODFORNECEDOR' then result := EFornecedor.Text else
  if UpperCase(NomeParametro) = 'CODFORMAPAGTO' then result := EFormaPgto.Text else
  if UpperCase(NomeParametro) = 'LOCALOS' then result := inttostr(Local.ItemIndex) else
  if UpperCase(NomeParametro) = 'TIPOOS' then result := inttostr(TipoOS.ItemIndex) else
  if UpperCase(NomeParametro) = 'CODTECNICO' then result := Etecnico.Text else
  if UpperCase(NomeParametro) = 'CODSITUACAO' then result := ESituacao.Text else
    aviso('Parametro não configurado ' + NomeParametro);
end;

function TFRelatoriosServico.TextoDosFiltros : string;
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
    if EFIlial.Text <> '' then result := result + LFilial.caption else result := result + 'Todas';
  end;

  if PCodVendedor.Visible then
  begin
    result := result + '-Vendedor: ';
    if EVendedor.Text <> '' then result := result + LVendedor.caption else result := result + 'Todos';
  end;

  if PForcenecedor.Visible then
  begin
    result := result + '-Fornecedor: ';
    if EFornecedor.Text <> '' then result := result + Lfornecedor.caption else result := result + 'Todos';
  end;

  if PFormaPagto.Visible then
  begin
    result := result + '-Forma Pagto: ';
    if EFormaPgto.Text <> '' then result := result + LFormaPagto.caption else result := result + 'Todos';
  end;

  if PSituacao.Visible then
  begin
    result := result + '-Situação: ';
    if ESituacao.Text <> '' then result := result + LSituacao.Caption else result := result + 'Todos';
  end;

  if PCodVendedor.Visible then
  begin
    result := result + '-Técnico: ';
    if Etecnico.Text <> '' then result := result + LTecnico.caption else result := result + 'Todos';
  end;

end;

{******************** Carrega Configuracoes da tela **************************}
function TFRelatoriosServico.CarregaConfig(NomeRel, TituloForm : string) : Boolean;
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
procedure TFRelatoriosServico.BBotaoClick(Sender: TObject);
var
  laco : integer;
  Parametro : string;
begin
  for laco := 0 to rel.ParamFields.Count -1 do
  begin
    Parametro := RetornaParametro(Rel.ParamFields[laco].Name);
    if Parametro = '@ERRO@' then
     abort;
    if Parametro <> '' then
      rel.ParamFields[laco].value :=  Parametro
    else
      rel.ParamFields[laco].value :=  '0';
  end;
  rel.ReportTitle := TextoDosFiltros;
  rel.Execute;
end;


{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                      Filtros
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

procedure TFRelatoriosServico.EFIlialSelect(Sender: TObject);
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


procedure TFRelatoriosServico.RelExecuteBegin(Sender: TObject;
  var Cancel: Boolean);
begin
  FInicio := TFInicio.Create(SELF);
  finicio.MudaTexto('Gerando Relatório...');
  FInicio.show;
  FInicio.Refresh;
end;

procedure TFRelatoriosServico.RelExecuteEnd(Sender: TObject);
begin
  Finicio.close;
end;


Initialization
 RegisterClasses([TFRelatoriosServico]);

end.
