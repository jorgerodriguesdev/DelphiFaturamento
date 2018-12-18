unit APrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBTables, ComCtrls, ExtCtrls, StdCtrls, Buttons,  formulariosFundo, Formularios,
  ToolWin, ExtDlgs, Inifiles, constMsg, FunObjeto, Db, DBCtrls, Grids,
  DBGrids, Componentes1, PainelGradiente, Tabela, Localizacao,
  Mask, Spin, UnPrincipal, EditorImagem;

const
  CampoPermissaoModulo = 'c_mod_fat';
  CampoFormModulos = 'c_mod_fat';
  NomeModulo = 'Faturamento';

type
  TFPrincipal = class(TFormularioFundo)
    Menu: TMainMenu;
    MFAlteraSenha: TMenuItem;
    MAjuda: TMenuItem;
    BaseDados: TDatabase;
    BarraStatus: TStatusBar;
    MArquivo: TMenuItem;
    MSair: TMenuItem;
    N1: TMenuItem;
    MSobre: TMenuItem;
    MFAlterarFilialUso: TMenuItem;
    CorFoco: TCorFoco;
    CorForm: TCorForm;
    CorPainelGra: TCorPainelGra;
    MFAbertura: TMenuItem;
    N6: TMenuItem;
    CoolBar1: TCoolBar;
    Produtos1: TMenuItem;
    MFFormacaoPreco: TMenuItem;
    MProdutos: TMenuItem;
    MFUnidades: TMenuItem;
    MFOperacoesEstoques: TMenuItem;
    MFprodutos: TMenuItem;
    N2: TMenuItem;
    MFCadPaises: TMenuItem;
    MFCadEstados: TMenuItem;
    MFCidades: TMenuItem;
    N3: TMenuItem;
    MFEventos: TMenuItem;
    MFProfissoes: TMenuItem;
    MFSituacoesClientes: TMenuItem;
    MFClientes: TMenuItem;
    N4: TMenuItem;
    MFTransportadoras: TMenuItem;
    MFNaturezas: TMenuItem;
    MFAdicionaProdFilial: TMenuItem;
    MFTabelaPreco: TMenuItem;
    MFCadIcmsEstado: TMenuItem;
    MFUsuarioMenu: TMenuItem;
    MNotaFiscal: TMenuItem;
    MFNovaNotaFiscal: TMenuItem;
    N5: TMenuItem;
    MFConsultaNotasFiscais: TMenuItem;
    MFManutencaoNotas: TMenuItem;
    MFImprimeNotas: TMenuItem;
    MFDemonstrativoFaturamento: TMenuItem;
    MFCondicoesPagamentos: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    MFConfiguraComissoes: TMenuItem;
    MImpDocumentos: TMenuItem;
    Manual1: TMenuItem;
    Recibos1: TMenuItem;
    NotasPromissrias1: TMenuItem;
    CarnesdePagamento1: TMenuItem;
    BoletosBancrios1: TMenuItem;
    Cheques1: TMenuItem;
    Duplicatas1: TMenuItem;
    MFImprimeCarne: TMenuItem;
    MFImprimeBoleto: TMenuItem;
    MFImprimeDuplicata: TMenuItem;
    MFConsultaPrecosProdutos: TMenuItem;
    MFlocalizaServico: TMenuItem;
    BaseEndereco: TDatabase;
    MFImprimeEnvelope: TMenuItem;
    objectEnvelope1TMenuItem1: TMenuItem;
    MFVendedores: TMenuItem;
    ForarNovoUsurio1: TMenuItem;
    N9: TMenuItem;
    MFBackup: TMenuItem;
    Contexto1: TMenuItem;
    ndice1: TMenuItem;
    Mservico: TMenuItem;
    MFFormacaoPrecoServico: TMenuItem;
    MFServicos: TMenuItem;
    N11: TMenuItem;
    MFEquipamento: TMenuItem;
    MFModelo: TMenuItem;
    MFMarca: TMenuItem;
    MFSituacoes: TMenuItem;
    N12: TMenuItem;
    MFconsultaOS: TMenuItem;
    MFOrdemServico1: TMenuItem;
    MFOrdemServico: TMenuItem;
    MFEstouroOS: TMenuItem;
    MFNovoProduto: TMenuItem;
    MFTipoEntrega: TMenuItem;
    MFClientesTabelaPreco: TMenuItem;
    MFChamadoTecnico: TMenuItem;
    MFMovReducaoEstado: TMenuItem;
    MFImprimeRomaneio: TMenuItem;
    MFImprimeNFEntrega: TMenuItem;
    MRelatorios: TMenuItem;
    MCadastroRel: TMenuItem;
    MProdutosRel: TMenuItem;
    MServicoRel: TMenuItem;
    MNotaFiscalRel: TMenuItem;
    MclientesRel: TMenuItem;
    MFaturamentoRel: TMenuItem;
    MEstoqueRel: TMenuItem;
    GeraNotaFiscaldeOS1: TMenuItem;
    MAnaliseFaturamentoRel: TMenuItem;
    MCupomFiscalRel: TMenuItem;
    MGraficoFaturamento: TMenuItem;
    MFNovaNotaFiscal3: TMenuItem;
    MFNovaNotaFiscal1: TMenuItem;
    MFNovaNotaFiscal2: TMenuItem;
    MFNovaNotaFiscal5: TMenuItem;
    MFNovaNotaFiscal4: TMenuItem;
    MFConsultaOSTerceiros: TMenuItem;
    Geral1: TMenuItem;
    Emitidas1: TMenuItem;
    Fechadas1: TMenuItem;
    Canceladas1: TMenuItem;
    ChamadoTcnico1: TMenuItem;
    Terceiros1: TMenuItem;
    MFAtendimentoExtra: TMenuItem;
    N13: TMenuItem;
    MFConsultaMatEprestado: TMenuItem;
    MFposicionaOS: TMenuItem;
    N14: TMenuItem;
    ToolBar1: TToolBar;
    BMFClientes: TSpeedButton;
    BMFProdutos: TSpeedButton;
    BMFConsultaProdutos: TSpeedButton;
    BMFNotaFiscal: TSpeedButton;
    BMFConsultaNotaFiscal: TSpeedButton;
    BMFFaturamento: TSpeedButton;
    BMFOrdemServico: TSpeedButton;
    BMFOrdemServico1: TSpeedButton;
    BSaida: TSpeedButton;
    procedure MostraHint(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MenuClick(Sender: TObject);
    procedure Contexto1Click(Sender: TObject);
    procedure ndice1Click(Sender: TObject);
    procedure MRelatoriosClick(Sender: TObject);
  private
    TipoSistema : string;
    UnPri : TFuncoesPrincipal;
    procedure VerificaTransacaoPendente;
  public
     CodProduto : String;
     VersaoSistema : Integer;
     function AbreBaseDados( Alias : string ) : Boolean;
     procedure AlteraNomeEmpresa;
     Function  VerificaPermisao( nome : string ) : Boolean;
     procedure erro(Sender: TObject; E: Exception);
     procedure abre(var Msg: TMsg; var Handled: Boolean);
     procedure VerificaMoeda;
     procedure ValidaBotoesGrupos( botoes : array of TComponent);
     procedure TeclaPressionada(var Msg: TWMKey; var Handled: Boolean);
     procedure ConfiguracaoModulos;
     procedure OrganizaBotoes;
     procedure CriaRelatorio(Sender: TObject);
     procedure CriaRelatorioGeral(Sender: TObject);
     procedure CriaRelatorioServico(Sender: TObject);
  end;


var
  FPrincipal : TFPrincipal;
  Ini : TInifile;

implementation

uses Constantes, UnRegistro, funsql, unNotaFiscal, funsistema, funstring,
     Abertura, AAlterarSenha, ASobre, FunIni, AAlterarFilialUso,
     AUnidade, AOperacoesEstoques, AProfissoes, ASituacoesClientes,
     AClientes, ACadPaises, ACadEstados, ACadCidades,
     AEventos, AProdutos, ATransportadoras, ANaturezas,
     AAdicionaProdFilial, AFormacaoPreco, ATabelaPreco, ACadIcmsEstado,
     UsuarioMenu, ANovaNotaFiscal, AConsultaNotasFiscais, AManutencaoNotas,
     AImprimeNotas, ADemosntrativoFaturamento, ACondicoesPgtos,
     AConfiguraComissoes, AImprimeDuplicata,
     AImprimeBoleto, AImprimeCarne, AMostraDuplicata, AMostraCheque,
     AMostraBoleto, AMostraCarne, AMostraNotaPromissoria, AMostraRecibo,
     ALocalizaServico,
     AImprimeEnvelope, AMostraEnvelope, AVendedores,  ABackup,
     AServicos, AFormacaoPrecoServico, AEquipamento, Amodelo, AMarca,
  ASituacoes, AOrdemServico, AConsultaOS, AEstouroOS, ANovoProduto,
  ATipoEntrega, AClientesTabelaPreco, AChamadoTecnico, AMovReducaoEstado,
  AInicio, ARelatoriosFaturamento,
  ARelatoriosGeral, AMostraMensages, AGeraNotaOS, ARelatoriosServico,
  AConsultaOSTerceiros, AAtendimentoExtra, AConsultaMatEprestado,
  APosicionaOS, AConsultaPrecosProdutos;

{$R *.DFM}


// ----- Verifica a permissão do formulários conforme tabela MovGrupoForm -------- //
Function TFPrincipal.VerificaPermisao( nome : string ) : Boolean;
begin
  result := UnPri.VerificaPermisao(nome);
  if not result then
    abort;
end;

// ------------------ Mostra os comentarios ma barra de Status ---------------- }
procedure TFPrincipal.MostraHint(Sender : TObject);
begin
  BarraStatus.Panels[3].Text := Application.Hint;
end;

// ------------------ Na criação do Formulário -------------------------------- }
procedure TFPrincipal.FormCreate(Sender: TObject);
begin
 UnPri := TFuncoesPrincipal.criar(self, BaseDados, NomeModulo);
 Varia := TVariaveis.Create;   // classe das variaveis principais
 Config := TConfig.Create;     // Classe das variaveis Booleanas
 ConfigModulos := TConfigModulo.create; // classe das variaveis de configuracao do modulo.
 Application.OnHint := MostraHint;
 Application.HintColor := $00EDEB9E;        // cor padrão dos hints
 Application.Title := 'Faturamento';  // nome a ser mostrado na barra de tarefa do Windows
 Application.OnException := Erro;
 Application.OnMessage := Abre;
end;

{************ abre base de dados ********************************************* }
function TFPrincipal.AbreBaseDados( Alias : string ) : Boolean;
begin
  result := AbreBancoDadosAlias(BaseDados,Alias);
end;

procedure TFPrincipal.erro(Sender: TObject; E: Exception);
begin
  FMostraMensagens := TFMostraMensagens.CriarSDI(application,'',true);
  FMostraMensagens.MostraErro(E.Message);
end;

// ------------------- Quando o formulario e fechado -------------------------- }
procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BaseDados.Close;
  Varia.Free;
  Config.Free;
  UnPri.free;
  Action := CaFree;
end;

// -------------------- Quando o Formulario é Iniciado ------------------------ }
procedure TFPrincipal.FormShow(Sender: TObject);
begin
 // configuracoes do usuario
 UnPri.ConfigUsu(varia.CodigoUsuario, CorFoco, CorForm, CorPainelGra, Self );
  // configura modulos
 ConfiguracaoModulos;
 AlteraNomeEmpresa;
 FPrincipal.WindowState := wsMaximized;  // coloca a janela maximizada;
 // conforme usuario, configura menu
 UnPri.EliminaItemsMenu(self, Menu);
 OrganizaBotoes;
 Application.OnShortCut := TeclaPressionada;
 Self.HelpFile := Varia.PathHelp + 'MFATURAMENTO.HLP>janela';  // Indica o Paph e o nome do arquivo de Help
 VerificaTransacaoPendente;
 VerificaVersaoSistema(CampoPermissaoModulo);
 if VerificaFormCriado('TFInicio') then
 begin
   finicio.close;
   finicio.free;
 end;
end;

{****************** organiza os botoes do formulario ************************ }
procedure TFPrincipal.OrganizaBotoes;
begin
 UnPri.OrganizaBotoes(0, [ BMFClientes, BMFProdutos,
                           BMFConsultaProdutos, BMFNotaFiscal, BMFConsultaNotaFiscal,
                           BMFFaturamento, BMFOrdemServico, BMFOrdemServico1, BSaida ]);
end;

// -------------------- Altera o Caption da Jabela Proncipal ------------------ }
procedure TFPrincipal.AlteraNomeEmpresa;
begin
  UnPri.AlteraNomeEmpresa(self, BarraStatus, NomeModulo, TipoSistema );
end;

{******************************************************************************}
procedure TFPrincipal.TeclaPressionada(var Msg: TWMKey; var Handled: Boolean);
Var
//  Produto : TFConsultaPrecosProdutos;
  Servico : TFlocalizaServico;
begin
    case Msg.CharCode  of
     123 :
         if not VerificaFormCriado('TFConsultaPrecosProdutos') then
         begin
           FConsultaPrecosProdutos := TFConsultaPrecosProdutos.criarSDI(Application,'',FPrincipal.VerificaPermisao('FConsultaPrecosProdutos'));
           FConsultaPrecosProdutos.ShowModal;
           FConsultaPrecosProdutos.free;
         end;
    122 :
          if not VerificaFormCriado('TFlocalizaServico') then
          begin
            FlocalizaServico := TFlocalizaServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaServico'));
            FlocalizaServico.ConsultaServico;
            FlocalizaServico.free;
          end;
     121 :
       if not VerificaFormCriado('FClientes') then
       begin
          FClientes := TFClientes.criarMDI(Application,0,0 ,VerificaPermisao('FClientes'));
          FClientes.FormStyle := fsNormal;
          FClientes.Visible := false;
          FClientes.Showmodal;
          FClientes.free;
       end;
    end;
end;

// -------------Quando é enviada a menssagem de criação de um formulario------------- //
procedure TFPrincipal.abre(var Msg: TMsg; var Handled: Boolean);
begin
if (Msg.message = CT_CRIAFORM) or (Msg.message = CT_DESTROIFORM) then
begin
  UnPri.ConfiguraMenus(screen.FormCount,[],[MFAbertura,MFAlterarFilialUso,ForarNovoUsurio1]);
  if (Msg.message = CT_CRIAFORM) and (config.AtualizaPermissao) then
    UnPri.CarregaNomeForms(Screen.ActiveForm.Name, Screen.ActiveForm.Hint, CampoFormModulos, Screen.ActiveForm.Tag);
    if (Msg.message = CT_CRIAFORM) then
      Screen.ActiveForm.Caption := Screen.ActiveForm.Caption + ' [ ' + varia.NomeFilial + ' ] ';
end;
end;

// --------- Verifica moeda --------------------------------------------------- }
procedure TFPrincipal.VerificaMoeda;
begin
  if (varia.DataDaMoeda <> date) and (Config.AvisaDataAtualInvalida)  then
    aviso(CT_DataMoedaDifAtual)
  else
    if (varia.MoedasVazias <> '') and (Config.AvisaIndMoeda) then
    avisoFormato(CT_MoedasVazias, [ varia.MoedasVazias]);
end;

// -------------  Valida ou naum Botoes para ususario master ou naum ------------- }
procedure TFPrincipal.ValidaBotoesGrupos( botoes : array of TComponent);
begin
  if Varia.GrupoUsuarioMaster <> Varia.GrupoUsuario then
    AlterarEnabledDet(botoes,false);
end;

{************************  M E N U   D O   S I S T E M A  ********************* }
procedure TFPrincipal.MenuClick(Sender: TObject);
begin
 if  ValidaDataFormulario(date) then
  if Sender is TComponent  then
    case ((Sender as TComponent).Tag) of
      0001 : Close;
      1050 : begin
               FAlteraSenha := TFAlteraSenha.CriarSDI(Application,'',VerificaPermisao('FAlteraSenha'));
               FAlteraSenha.ShowModal;
             end;
      1100 : begin
               FAlterarFilialUso := TFAlterarFilialUso.CriarSDI(application,'', VerificaPermisao('FAlterarFilialUso'));
               FAlterarFilialUso.ShowModal;
             end;
      1200,1210 : begin
               // ----- Formulario para alterar o usuario atual ----- //
               FAbertura := TFAbertura.Create(Application);
               FAbertura.ShowModal;
               if Varia.StatusAbertura = 'OK' then
               begin
                 AlteraNomeEmpresa;
                 ResetaMenu(Menu,ToolBar1);
                 UnPri.EliminaItemsMenu(self, menu);
                 UnPri.ConfigUsu(varia.CodigoUsuario, CorFoco, CorForm, CorPainelGra, Self );
                 ConfiguracaoModulos;
                 OrganizaBotoes;
               end
               else
                 if  ((Sender as TComponent).Tag) = 1210 then
                   FPrincipal.close;
               end;
      1250 : begin
               FUsuarioMenu := TFUsuarioMenu.CriarSDI(application,'',VerificaPermisao('FUsuarioMenu'));
               FUsuarioMenu.AbreFormulario(3);
             end;
      1270 : begin
              FBackup := TFBackup.CriarSDI(application,'',VerificaPermisao('FBackup'));
              FBackup.ShowModal;
             end;
              // ----- Sair do Sistema ----- //
      1300 : Close;
      2050 : begin
               // ------ Cadastro de Condições de Pagamento ------ //
               FCondicoesPagamentos := TFCondicoesPagamentos.CriarSDI(Application,'',VerificaPermisao('FCondicoesPagamentos'));
               FCondicoesPagamentos.ShowModal;
             end;
      2100 : begin
               // ------ Cadastra as Unidades ------ //
               FUnidades := TFUnidades.CriarSDI(application,'',VerificaPermisao('FUnidades'));
               FUnidades.ShowModal;
             end;
      2300 : begin
               // ----- Cadastra Operações de Estoque ----- //
               FOperacoesEstoques := TFOperacoesEstoques.criarSDI(application,'',VerificaPermisao('FOperacoesEstoques'));
               FOperacoesEstoques.ShowModal;
             end;
      2450 : begin
               // ------ O Cadastro de Naturezas ------ //
               FNaturezas := TFNaturezas.CriarMDI(Application,0,0,VerificaPermisao('FNaturezas'));
             end;
      2475 : begin
               FCadIcmsEstado := TFCadIcmsEstado.CriarSDI(application, '', VerificaPermisao('FCadIcmsEstado'));
               FCadIcmsEstado.ShowModal;
             end;
      2477 : begin
               FMovReducaoEstado := TFMovReducaoEstado.CriarSDI(application, '', VerificaPermisao('FMovReducaoEstado'));
               FMovReducaoEstado.ShowModal;
             end;

      2500 : begin
               FEventos := TFEventos.CriarSDI(application, '', VerificaPermisao('FEventos'));
               FEventos.ShowModal;
             end;
      2600 : begin
               // ------- As profissões do Cliente ------- //
               FProfissoes := TFProfissoes.CriarSDI(application,'',VerificaPermisao('FProfissoes'));
               FProfissoes.ShowModal;
             end;
      2700 : begin
               // ------ As Situções do Cliente ------- //
               FSituacoesClientes := TFSituacoesClientes.CriarSDI(Application,'',VerificaPermisao('FSituacoesClientes'));
               FSituacoesClientes.ShowModal;
             end;
             // ------- Cadastro de Clientes ------- //
      2750 : FClientes := TFClientes.criarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FClientes'));
      2755 : Begin
               FClientesTabelaPreco := TFClientesTabelaPreco.criarSDI(application, '', VerificaPermisao('FClientesTabelaPreco'));
               FClientesTabelaPreco.ShowModal;
             end;
      2760 : FVendedores := TFVendedores.criarMDI(application, varia.CT_AreaX, varia.CT_AreaY,VerificaPermisao('FVendedores'));
             // ------ Cadastro de Transportadora ------- //
      2775 : FTransportadoras := TFTransportadoras.criarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FTransportadoras'));
      2900 : begin
               // ------ Cadastro de Paises ------ //
               FCadPaises := TFCadPaises.CriarSDI(Application,'',VerificaPermisao('FCadPaises'));
               FCadPaises.ShowModal;
             end;
      2910 : begin
               // ------ Cadastro de Estados ------ //
               FCadEstados := TFCadEstados.CriarSDI(Application,'',VerificaPermisao('FCadEstados'));
               FCadEstados.ShowModal;
             end;
      2920 : begin
               // ------ Cadastro de Cidades ------ //
               FCidades := TFCidades.CriarSDI(Application,'',VerificaPermisao('FCidades'));
               FCidades.ShowModal;
             end;
             // ------- produtos
      3100 : FProdutos := TFProdutos.criarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FProdutos'));
      3150 : begin
               FNovoProduto := TFNovoProduto.CriarSDI(application, '', VerificaPermisao('FNovoProduto'));
               FNovoProduto.InsereNovoProduto(false);
             end;
      3200 : begin
               FAdicionaProdFilial := TFAdicionaProdFilial.criarMDI(Application, Varia.CT_areaX, Varia.CT_areaY, VerificaPermisao('FAdicionaProdFilial'));
             end;
      3300 : begin
               FTabelaPreco := TFTabelaPreco.CriarSDI(application, '',VerificaPermisao('FTabelaPreco'));
               FTabelaPreco.ShowModal;
             end;
      3400 : begin
              FFormacaoPreco := TFFormacaoPreco.CriarSDI(application, '',VerificaPermisao('FFormacaoPreco'));
              FFormacaoPreco.ShowModal;
             end;
      3500 : begin
               // ------ Configurações da Comissão ------ //
               FConfiguraComissoes := TFConfiguraComissoes.CriarSDI(Application,'',VerificaPermisao('FConfiguraComissoes'));
               FConfiguraComissoes.ShowModal;
             end;
      3600 : begin
               // ------ Configurações da Comissão ------ //
               FConsultaPrecosProdutos := TFConsultaPrecosProdutos.criarSDI(Application,'',FPrincipal.VerificaPermisao('FConsultaPrecosProdutos'));
               FConsultaPrecosProdutos.ShowModal;
             end;
      3700 : Begin
               FlocalizaServico := TFlocalizaServico.criarSDI(Application,'',FPrincipal.VerificaPermisao('FlocalizaServico'));
               FlocalizaServico.ConsultaServico;
             end;
      4010 : begin
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal'));
              FNovaNotaFiscal.NovaNotaFiscal('''V'', ''P'', ''S''', true);
             end;
      4021 : begin
              UnPri.SalvaFormularioEspecial('FNovaNotaFiscal3','Emissão de nota fiscal de devolucao',CampoFormModulos,'MFNovaNotaFiscal3');
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal3'));
              FNovaNotaFiscal.NovaNotaFiscal('''D''', false);
             end;
      4022 : begin
              UnPri.SalvaFormularioEspecial('FNovaNotaFiscal1','Emissão de nota fiscal de transferencia',CampoFormModulos,'MFNovaNotaFiscal1');
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal1'));
              FNovaNotaFiscal.NovaNotaFiscal('''T''', false);
             end;
      4023 : begin
              UnPri.SalvaFormularioEspecial('FNovaNotaFiscal2','Emissão de nota fiscal de remessa',CampoFormModulos,'MFNovaNotaFiscal2');
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal2'));
              FNovaNotaFiscal.NovaNotaFiscal('''R''', false);
             end;
      4024 : begin
              UnPri.SalvaFormularioEspecial('FNovaNotaFiscal5','Emissão de outras notas fiscais',CampoFormModulos,'MFNovaNotaFiscal5');
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal5'));
              FNovaNotaFiscal.NovaNotaFiscal('''O'',''I''', false);
             end;
      4025 : begin
              UnPri.SalvaFormularioEspecial('FNovaNotaFiscal4','Emissão de notas fiscais de compra',CampoFormModulos,'MFNovaNotaFiscal4');
              FNovaNotaFiscal := TFNovaNotaFiscal.criarSDI(application, '',VerificaPermisao('FNovaNotaFiscal4'));
              FNovaNotaFiscal.NovaNotaFiscal('''C''', false);
             end;

      4011 : FConsultaNotasFiscais := TFConsultaNotasFiscais.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FConsultaNotasFiscais'));
      4012 : FManutencaoNotas := TFManutencaoNotas.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FManutencaoNotas'));
      4013 : FImprimeNotas := TFImprimeNotas.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FImprimeNotas'));
      4014 : FDemonstrativoFaturamento := TFDemonstrativoFaturamento.CriarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FDemonstrativoFaturamento'));
      5100 : FServicos := TFServicos.criarMDI(application,varia.CT_areaX, varia.CT_areaY, FPrincipal.VerificaPermisao('FServicos'));
      5200 : begin
               FFormacaoPrecoServico := TFFormacaoPrecoServico.CriarSDI(application, '',VerificaPermisao('FFormacaoPrecoServico'));
               FFormacaoPrecoServico.ShowModal;
             end;
      5250 : begin
               FposicionaOS := TFposicionaOS .CriarSDI(application, '',VerificaPermisao('FposicionaOS '));
               FposicionaOS .ShowModal;
             end;

      5300 : begin
            FOrdemServico := TFOrdemServico.CriarSDI(application, '',VerificaPermisao('FOrdemServico'));
            FOrdemServico.NovaOS;
           end;
      5350 : begin
            UnPri.SalvaFormularioEspecial('FOrdemServico1','Altera Ordem de Serviço',CampoFormModulos,'MFOrdemServico1');
            FOrdemServico := TFOrdemServico.CriarSDI(application, '',VerificaPermisao('FOrdemServico1'));
            FOrdemServico.AlteraOS(0);
           end;
     5355 : begin
            FAtendimentoExtra := TFAtendimentoExtra.CriarSDI(application, '',VerificaPermisao('FAtendimentoExtra'));
            FAtendimentoExtra.ShowModal
           end;

     5375 : begin
            FEstouroOS := TFEstouroOS.CriarSDI(application, '',VerificaPermisao('FEstouroOS'));
            FEstouroOS.ShowModal
           end;

      5400 : begin
              FConsultaOS := TFConsultaOS.CriarSDI(application, '',VerificaPermisao('FConsultaOS'));
              FConsultaOS.ShowModal;
             end;

      5450 : begin
              FChamadoTecnico := TFChamadoTecnico.CriarSDI(application, '',VerificaPermisao('FChamadoTecnico'));
              FChamadoTecnico.ShowModal;
             end;
      5470 : begin
              FConsultaOSTerceiros := TFConsultaOSTerceiros.CriarSDI(application, '',VerificaPermisao('FConsultaOSTerceiros'));
              FConsultaOSTerceiros.ShowModal;
             end;
      5472 : begin
              FConsultaMatEprestado := TFConsultaMatEprestado.CriarSDI(application, '',VerificaPermisao('FConsultaMatEprestado'));
              FConsultaMatEprestado.ShowModal;
             end;
      5475 : begin
              FGeraNotaOS := TFGeraNotaOS.CriarSDI(application, '',VerificaPermisao('FGeraNotaOS'));
              FGeraNotaOS.ShowModal;
             end;

      5500 : begin
            FEquipamento := TFEquipamento.CriarSDI(application, '',VerificaPermisao('FEquipamento'));
            FEquipamento.ShowModal;
           end;
      5600 : begin
            FModelo := TFModelo.CriarSDI(application, '',VerificaPermisao('FModelo'));
            FModelo.ShowModal;
           end;
      5800 : begin
            FMarca := TFMarca.CriarSDI(application, '',VerificaPermisao('FMarca'));
            FMarca.ShowModal;
           end;
      5950 : begin
              FSituacoes := TFSituacoes.CriarSDI(application, '',VerificaPermisao('FSituacoes'));
              FSituacoes.ShowModal;
           end;
     5975 : begin
              FTipoEntrega := TFTipoEntrega.CriarSDI(application, '',VerificaPermisao('FTipoEntrega'));
              FTipoEntrega.ShowModal;
            end;
      7100 : FImprimeDuplicata := TFImprimeDuplicata.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeDuplicata'));
      7300 : FImprimeBoleto := TFImprimeBoleto.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeBoleto'));
      7400 : FImprimeCarne := TFImprimeCarne.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeCarne'));
      7500 : FImprimeEnvelope := TFImprimeEnvelope.CriarMDI(Application,Varia.CT_AreaX,Varia.CT_AreaY,VerificaPermisao('FImprimeEnvelope'));
      7510 : begin
               FMostraduplicata := TFMostraduplicata.CriarSDI(Application,'',VerificaPermisao('FMostraduplicata'));
               FMostraduplicata.ShowModal;
             end;
      7520 : begin
               FMostraCheque := TFMostraCheque.CriarSDI(Application,'',VerificaPermisao('FMostraCheque'));
               FMostraCheque.ShowModal;
             end;
      7530 : begin
               FMostraBoleto := TFMostraBoleto.CriarSDI(Application,'',VerificaPermisao('FMostraBoleto'));
               FMostraBoleto.ShowModal;
             end;
      7540 : begin
               FMostraCarne := TFMostraCarne.CriarSDI(Application,'',VerificaPermisao('FMostraCarne'));
               FMostraCarne.ShowModal;
             end;
      7550 : begin
              FMostraNotaPromissoria := TFMostraNotaPromissoria.CriarSDI(Application,'',VerificaPermisao('FMostraNotaPromissoria'));
              FMostraNotaPromissoria.ShowModal;
             end;
      7560 : begin
               FMostraRecibo := TFMostraRecibo.CriarSDI(Application,'',VerificaPermisao('FMostraRecibo'));
               FMostraRecibo.ShowModal;
             end;
      7570 : begin
             FMostraEnvelope := TFMostraEnvelope.CriarSDI(Application,'',VerificaPermisao('FMostraEnvelope'));
             FMostraEnvelope.ShowModal;
           end;

      8100 : begin
                 // ---- Coloca as janelas em cacatas ---- //
                 Cascade;
             end;
      8200 : begin
                 // ---- Coloca as janelas em lado a lado ---- //
                 Tile;
             end;
      8300 : begin
                 // ---- Coloca a janela em tamanho normal ---- //
                 if FPrincipal.ActiveMDIChild is TFormulario then
                 (FPrincipal.ActiveMDIChild as TFormulario).TamanhoPadrao;
               end;
      9100 : begin
                 FSobre := TFSobre.CriarSDI(application,'', VerificaPermisao('FSobre'));
                 FSobre.ShowModal;
               end;
    end;
end;

{******************* configura os modulos do sistema ************************* }
procedure TFPrincipal.ConfiguracaoModulos;
var
  Reg : TRegistro;
begin
  Reg := TRegistro.create;
  reg.ValidaModulo( TipoSistema, [MProdutos, MNotaFiscal,MImpDocumentos, MRelatorios] );
  VersaoSistema := reg.VersaoMaquina;
  reg.ConfiguraModulo(CT_IMPDOCUMENTOS, [ MImpDocumentos] );
  reg.ConfiguraModulo(CT_NOTAFISCAL, [ MNotaFiscal, BMFNotaFiscal, BMFConsultaNotaFiscal, BMFFaturamento ] );
  reg.ConfiguraModulo(CT_SENHAGRUPO, [ MFUsuarioMenu ]  );
  reg.ConfiguraModulo(CT_PRODUTO, [ MProdutos, BMFProdutos, BMFConsultaProdutos ]);
  reg.ConfiguraModulo(CT_SERVICO, [ Mservico ] );
  reg.ConfiguraModulo(CT_ORDEMSERVICO, [ MFOrdemServico1, MFOrdemServico, MFconsultaOS,MFEstouroOS,MFChamadoTecnico,
                                         MFEquipamento, MFModelo, MFMarca, MFTipoEntrega, MFSituacoes, BMFOrdemServico1, BMFOrdemServico ] );
  reg.ConfiguraModulo(CT_ECF, [ MCupomFiscalRel  ] );

  reg.Free;
 end;

{**************** verifica e exclui alguma transacao pendente ************** }
procedure TFPrincipal.VerificaTransacaoPendente;
var
  Sequencial, Filial : integer;
  NF : TFuncoesNotaFiscal;
begin
  if VerificaTransacao(1, Sequencial, Filial) then
  begin
     NF := TFuncoesNotaFiscal.criar(self, BaseDados);
     NF.Exclui_cancelaNotaFiscalDireto( Sequencial, Filial, true);
     nf.free;
     DesmarcaTransacao(1);
  end;
end;


procedure TFPrincipal.Contexto1Click(Sender: TObject);
begin
  Application.HelpCommand(HELP_FINDER,0);
end;

procedure TFPrincipal.ndice1Click(Sender: TObject);
begin
   Application.HelpCommand(HELP_KEY,0);
end;

{((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                              Relatorios
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************************** Gera os menus de relatorios ********************}
procedure TFPrincipal.MRelatoriosClick(Sender: TObject);
begin
 if  ValidaDataFormulario(date) then
  if (sender is TMenuItem) then
    if MRelatorios.Tag <> 1 then
    begin
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cadastro\Geral',(sender as TMenuItem).MenuIndex,0,99);
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cadastro\Faturamento',(sender as TMenuItem).MenuIndex,0,99);
      UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'Cliente',(sender as TMenuItem).MenuIndex,1,99);
      if ConfigModulos.Produto then
       UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Produto',(sender as TMenuItem).MenuIndex,2,99);
      if ConfigModulos.Estoque then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Estoque',(sender as TMenuItem).MenuIndex,3,99);
      if ConfigModulos.Servico then
      begin
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'Servico',(sender as TMenuItem).MenuIndex,4,0);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\Geral',(sender as TMenuItem).MenuIndex,4,0);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\Emitido',(sender as TMenuItem).MenuIndex,4,1);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\Fechado',(sender as TMenuItem).MenuIndex,4,2);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\Cancelado',(sender as TMenuItem).MenuIndex,4,3);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\ChamadoTecnico',(sender as TMenuItem).MenuIndex,4,4);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioServico,'OrdemServico\Terceiro',(sender as TMenuItem).MenuIndex,4,5);
     end;
      if ConfigModulos.NotaFiscal then
      begin
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'NotaFiscal',(sender as TMenuItem).MenuIndex,5,99);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'Faturamento',(sender as TMenuItem).MenuIndex,6,99);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'AnaliseFaturamento\Faturamento',(sender as TMenuItem).MenuIndex,7,99);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorioGeral,'AnaliseFaturamento\Cliente',(sender as TMenuItem).MenuIndex,7,99);
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'GraficoFaturamento',(sender as TMenuItem).MenuIndex,8,99);
      end;
      if ConfigModulos.ECF then
        UnPri.GeraMenuRelatorios(Menu,CriaRelatorio,'CupomFiscal',(sender as TMenuItem).MenuIndex,9,99);

      MRelatorios.Tag := 1;
    end;
end;

{******************* chama um relatorio **************************************}
procedure TFPrincipal.CriaRelatorio(Sender: TObject);
begin
  if VerificaPermisao((sender as TMenuItem).Name) then
  begin
    UnPri.SalvaFormularioEspecial((sender as TMenuItem).Name, DeletaChars((sender as TMenuItem).Caption,'&'),'c_mod_fat',(sender as TMenuItem).Name);
    FRelatoriosFaturamento := TFRelatoriosFaturamento.CriarSDI(application,'',true);
    FRelatoriosFaturamento.CarregaConfig( (sender as TMenuItem).Hint, (sender as TMenuItem).Caption);
    FRelatoriosFaturamento.ShowModal;
  end;
end;

{******************* chama um relatorio **************************************}
procedure TFPrincipal.CriaRelatorioGeral(Sender: TObject);
begin
  if VerificaPermisao((sender as TMenuItem).Name) then
  begin
    UnPri.SalvaFormularioEspecial((sender as TMenuItem).Name, DeletaChars((sender as TMenuItem).Caption,'&'),'c_mod_fat',(sender as TMenuItem).Name);
    FRelatoriosGeral := TFRelatoriosGeral.CriarSDI(application,'',true);
    FRelatoriosGeral.CarregaConfig((sender as TMenuItem).Hint, (sender as TMenuItem).Caption);
    FRelatoriosGeral.ShowModal;
  end;
end;

{******************* chama um relatorio **************************************}
procedure TFPrincipal.CriaRelatorioServico(Sender: TObject);
begin
  if VerificaPermisao((sender as TMenuItem).Name) then
  begin
    UnPri.SalvaFormularioEspecial((sender as TMenuItem).Name, DeletaChars((sender as TMenuItem).Caption,'&'),'c_mod_fat',(sender as TMenuItem).Name);
    FRelatoriosServico := TFRelatoriosServico.CriarSDI(application,'',true);
    FRelatoriosServico.CarregaConfig((sender as TMenuItem).Hint, (sender as TMenuItem).Caption);
    FRelatoriosServico.ShowModal;
  end;
end;

end.
