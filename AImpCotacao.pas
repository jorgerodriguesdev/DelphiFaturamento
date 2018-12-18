unit AImpCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, QuickRpt, Db, DBTables, Qrctrls, jpeg, Parcela, Geradores, printers,
  QRExport;

type
  TFImpOrcamento = class(TFormularioPermissao)
    QuickRep1: TQuickRepNovo;
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    LNomeFilial: TQRLabel;
    LEndereco: TQRLabel;
    MovOrcamento: TQuery;
    Aux: TQuery;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    Parcelas: TQRMemo;
    QRLabel5: TQRLabel;
    CorpoProdutos: TQRBand;
    CriaParcelas: TCriaParcelasReceber;
    QRLabel6: TQRLabel;
    LNomCon: TQRLabel;
    QRLabel4: TQRLabel;
    NomCli: TQRLabel;
    Orcamento: TQRLabel;
    FotoProduto: TQRImage;
    LDescricaoFoto: TQRLabel;
    MovOrcamentoCodPro: TStringField;
    MovOrcamentoNomPro: TStringField;
    MovOrcamentoQtdPro: TFloatField;
    MovOrcamentoVlrPro: TFloatField;
    MovOrcamentoTotPro: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    MovOrcamentoC_Cod_Uni: TStringField;
    LEndCli: TQRLabel;
    LMunCli: TQRLabel;
    QRSysData1: TQRSysData;
    LDatOrc: TQRLabel;
    LHorOrc: TQRLabel;
    CadOrcamento: TQuery;
    CadOrcamentoI_EMP_FIL: TIntegerField;
    CadOrcamentoI_LAN_ORC: TIntegerField;
    CadOrcamentoI_COD_CLI: TIntegerField;
    CadOrcamentoI_COD_PAG: TIntegerField;
    CadOrcamentoD_DAT_ORC: TDateField;
    CadOrcamentoT_HOR_ORC: TTimeField;
    CadOrcamentoD_DAT_ENT: TDateField;
    CadOrcamentoT_HOR_ENT: TTimeField;
    CadOrcamentoN_DIA_VAL: TIntegerField;
    CadOrcamentoN_PER_ACR: TFloatField;
    CadOrcamentoN_PER_DES: TFloatField;
    CadOrcamentoC_FLA_RES: TStringField;
    CadOrcamentoC_FLA_SIT: TStringField;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    MovOrcamentoC_Imp_fot: TStringField;
    MovOrcamentoL_Des_Tec: TMemoField;
    QRMemo1: TQRMemo;
    QrlItem: TQRLabel;
    LFone: TQRLabel;
    QrlFonefax: TQRLabel;
    CadOrcamentoC_CON_ORC: TStringField;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    CadOrcamentoD_DAT_VAL: TDateTimeField;
    MovOrcamentoC_Imp_Des: TStringField;
    LBairro: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    MovServicoOrcamento: TQuery;
    MovServicoOrcamentoI_Cod_Ser: TIntegerField;
    MovServicoOrcamentoN_Vlr_Ser: TFloatField;
    MovServicoOrcamentoN_Qtd_Ser: TFloatField;
    MovServicoOrcamentoN_Vlr_Tot: TFloatField;
    MovServicoOrcamentoC_Nom_Ser: TStringField;
    MovOrcamentoI_Seq_Pro: TIntegerField;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel19: TQRLabel;
    CadOrcamentoN_VLR_TOT: TFloatField;
    LWWW: TQRLabel;
    MObservacoes: TQRMemo;
    CadOrcamentoL_OBS_ORC: TMemoField;
    CadOrcamentoI_COD_VEN: TIntegerField;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape1: TQRShape;
    CadOrcamentoC_NOM_VEN: TStringField;
    QRDBText13: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText14: TQRDBText;
    MovOrcamenton_des_pro: TFloatField;
    QRLabel25: TQRLabel;
    CadOrcamentoN_VLR_PER: TFloatField;
    CadOrcamentoC_DES_ACR: TStringField;
    CadOrcamentoC_VLR_PER: TStringField;
    TotalDoc: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CorpoProdutosBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    Item, VprUltimoProduto : Integer;
    procedure CarregaRelatorio(VpaOrcamento, NroOrcamento : String);
    procedure CarregaNomeFilial;
    procedure CarregaCabecalho(VpaOrcamento,  NroOrcamento : String);
    procedure CarregaCadOrcamento(VpaOrcamento,  NroOrcamento : String);
    procedure CarregaProdutos(VpaOrcamento : String);
    procedure CarregaServicos(VpaOrcamento : String);
    procedure PosicionaProdutos(VpaOrcamento : String);
    procedure CarregaCliente(Codigo :Integer);
    procedure CarregaParcelas(condicao,Orcamento : Integer);
    procedure AdicionaCabecalhoParcelas(Parcelas : TQRMemo);
    function ValorOrcamento : double;
    Function NomeCondicao(Codigo : Integer):String;
    procedure CarregaFotoProduto(Produto : String);
    Function PathFoto(Produto : string) : String;
    Function ProdutoFoto : string;
    procedure PosicionaImpressora;
    procedure MudaCabecalho;
  public
    { Public declarations }
    procedure VisualizaImpressao(VpaOrcamento, NroOrcamento : String);
    procedure ImprimeCotacao(VpaOrcamento,  NroOrcamento : String);
  end;
var
  FImpOrcamento: TFImpOrcamento;

implementation

Uses Constantes,FunString,Fundata, FunSQl;

{$R *.DFM}


{ ******************* Quando o formulario e fechado ************************** }
procedure TFImpOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CadOrcamento.close;
   MovOrcamento.close;
   aux.close;
   MovServicoOrcamento.close;
   QuickRep1.free;
   Action := CaFree;
end;

{**************************Quando o formulario é criado************************}
procedure TFImpOrcamento.FormCreate(Sender: TObject);
begin
  Item := 0;
  MudaCabecalho;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                           Ações que carregam o relatorio
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{****************** visualiza a impressao do orcamento ************************}
procedure TFImpOrcamento.VisualizaImpressao(VpaOrcamento, NroOrcamento : String);
begin
  CarregaRelatorio(VpaOrcamento, NroOrcamento);
  QuickRep1.Preview;
  close;
end;

{************************** imprime a cotacao *********************************}
procedure TFImpOrcamento.ImprimeCotacao(VpaOrcamento,  NroOrcamento : String);
begin
  CarregaRelatorio(VpaOrcamento, NroOrcamento);
  QuickRep1.Print;
  close;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                         eventos do Cabeçalho do relatório
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************Carrega o  cabeçalho do relatório************************}
procedure TFImpOrcamento.CarregaCabecalho(VpaOrcamento,  NroOrcamento : String);
begin
   CarregaNomeFilial;
   CarregaCadOrcamento(VpaOrcamento,  NroOrcamento);
   CarregaCliente(CadOrcamentoI_COD_CLI.Asinteger);
end;

{***********************Retorna o nome do cliente******************************}
procedure TFImpOrcamento.CarregaCliente(Codigo :Integer);
Var
  VpfCGCCPF : String;
begin
  AdicionaSQLAbreTabela(aux,'Select * from dba.CadClientes '+
                            ' Where I_Cod_Cli = '+ IntToStr(Codigo));
  if Aux.FieldByName('C_Tip_Pes').Asstring = 'J' then
    VpfCGCCPF := 'Insc. Estl : ' + Aux.FieldByName('C_Ins_Cli').Asstring + '     CGC : '+
                 Aux.FieldByName('C_Cgc_Cli').Asstring
  else
    VpfCGCCPF := 'RG : ' + Aux.FieldByName('C_Reg_Cli').Asstring + '     CPF : '+
                 Aux.FieldByName('C_CPF_Cli').Asstring;

  NomCli.Caption :=  aux.fieldbyname('C_Nom_Cli').AsString;
  LEndCli.Caption :=  aux.FieldByName('C_End_Cli').AsString +  ' -  Nr.'+
                      aux.FieldByName('I_Num_end').Asstring + '   -    '+ aux.FieldByName('C_Bai_Cli').Asstring ;
  LMunCli.Caption := aux.fieldbyname('C_Cid_Cli').AsString + ' - ' +
                      aux.fieldbyname('C_Est_Cli').AsString ;
  VpfCGCCPF :=  AdicionaCharE(' ',VpfCgcCPf,115-Length(LMunCli.Caption));
  LMunCli.Caption := LMunCli.Caption + VpfCGCCPF;
  QrlFonefax.Caption := 'Fone : ' + aux.fieldbyname('C_Fo1_Cli').AsString + '              Fax: ' +
                     aux.fieldbyname('C_Fon_Fax').AsString + '              e-mail : ' + aux.fieldbyname('C_END_ELE').AsString;
end;

{*******************Carrega os dados do cadOrcamento***************************}
procedure TFImpOrcamento.CarregaCadOrcamento(VpaOrcamento,  NroOrcamento : String);
begin
  AdicionaSQLAbreTabela(CadOrcamento,' Select * from CadOrcamentos Cad, CadVendedores Ven ' +
                                     ' Where ven.I_emp_Fil = '+ InTToStr(Varia.CodigoEmpFil) +
                                     ' and cad.I_Lan_Orc = ' + VpaOrcamento +
                                     ' and cad.i_cod_ven *= ven.i_cod_ven ' );
  CadOrcamento.open;
  LDatOrc.Caption := CadOrcamentoD_DAT_ORC.AsString;
  LHorOrc.Caption := CadOrcamentoT_HOR_ORC.AsString;
  Self.Orcamento.Caption := 'Orçamento : ' + NroOrcamento;
  if Config.MostraCasaDecimalQTD then
    MovOrcamentoQtdPro.DisplayFormat := varia.MascaraQtd;
end;

{******************** carrega os nomes das filiais ****************************}
procedure TFImpOrcamento.CarregaNomeFilial;
begin
  AdicionaSQLAbreTabela(Aux,'Select * from CadFiliais ' +
                            ' Where I_Emp_fil = ' + InttoStr(Varia.CodigoEmpFil));
  LNomeFilial.Caption := Aux.FieldByName('C_Nom_Fan').Asstring;
  LEndereco.Caption := Aux.FieldByName('C_End_Fil').Asstring +', '+
                       Aux.FieldByName('I_Num_Fil').Asstring ;
  LBairro.Caption := Aux.FieldByName('C_Bai_Fil').Asstring +
                    '      CEP : ' + Aux.FieldByName('C_Cep_Fil').Asstring + '         ' +
                       Aux.FieldByName('C_Cid_Fil').Asstring + '/' + Aux.FieldByName('C_Est_Fil').Asstring;
  LFone.Caption  := 'Fone: ' + Aux.FieldByName('C_Fon_Fil').Asstring + '    Fax: ' + Aux.FieldByName('C_Fax_Fil').Asstring+
                    '              ' + Aux.FieldByName('C_end_ele').Asstring;
  LWww.Caption := Aux.FieldByName('C_www_Fil').Asstring;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                       eventos dos produtos do Orcamento
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{*********************Carrega os produtos do orcamento*************************}
procedure TFImpOrcamento.CarregaProdutos(VpaOrcamento : String);
begin
   PosicionaProdutos(VpaOrcamento);
   MovOrcamento.last;
   VprUltimoProduto := MovOrcamentoI_Seq_Pro.AsInteger;
end;

{********************Posiciona os produtos do MovOrcamento*********************}
procedure TFImpOrcamento.PosicionaProdutos(VpaOrcamento : String);
var
  Produto : string;
begin
  if UpperCase(Varia.CodigoProduto) = 'C_COD_BAR' then
    produto := Varia.CodigoProduto
  else
    produto := ' pro.' + Varia.CodigoProduto;
  AdicionaSQLAbreTabela(MovOrcamento,'Select '+ produto + ' CodPro, pro.C_Nom_Pro NomPro, '+
                  ' Orc.N_Qtd_Pro QtdPro, Orc.N_Vlr_Pro VlrPro, Orc.N_Vlr_Tot TotPro, '+
                  ' Orc.C_Cod_Uni, Orc.C_Imp_fot, Pro.L_Des_Tec, Orc.C_Imp_Des, Pro.I_seq_Pro, orc.n_des_pro '+
                  ' from dba.MovOrcamentos Orc, dba.CadProdutos Pro, MovQdadeProduto Qtd ' +
                  ' Where Orc.I_Seq_Pro = Pro.I_Seq_pro '+
                  '  and Orc.I_emp_fil = ' + IntToStr(Varia.CodigoEmpFil) +
                  ' and Orc.I_Lan_Orc = ' + VpaOrcamento +
                  ' and Qtd.I_emp_Fil = ' + IntToStr(Varia.CodigoEmpFil) +
                  ' and Qtd.I_Seq_Pro = Pro.I_Seq_Pro ' +
                  ' order by ' + produto );
end;

{*************** verifica se imprime a descriao do produto ********************}
procedure TFImpOrcamento.CorpoProdutosBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not MovOrcamento.Eof then
  begin
    QRMemo1.Lines.clear;
    if MovOrcamentoC_Imp_Des.AsString = 'S' Then
    begin
     QRMemo1.Lines.Text := MovOrcamentoL_Des_Tec.AsString;
     QRMemo1.Height := QRMemo1.Lines.Count * 17;
     CorpoProdutos.Height := 20 + QRMemo1.Height;
    end
    else
    begin
      QRMemo1.visible := false;
      CorpoProdutos.Height := 20
    end;
     inc(Item);
     if Item > MovOrcamento.RecordCount then
       QrlItem.Caption := DeletaChars(InttoStr(MovOrcamento.RecordCount - Item),'-')
     else
       QrlItem.Caption := InttoStr(Item);
   end
   else
     QrlItem.Caption := '';
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos dos servicos
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{********************* carrega o servico do orcamento *************************}
procedure TFImpOrcamento.CarregaServicos(VpaOrcamento : String);
begin
  AdicionaSQLAbreTabela(MovServicoOrcamento,'Select Mov.I_Cod_Ser, Mov.N_Vlr_Ser,'+
                ' Mov.N_Qtd_Ser, Mov.N_Vlr_Tot, Ser.Ser.C_Nom_Ser ' +
                ' from CadServico Ser, MovSErvicoOrcamento Mov ' +
                ' Where Mov.I_Emp_Fil  = ' + IntToStr(Varia.CodigoEmpFil) +
                ' and Mov.I_Lan_Orc = ' + VpaOrcamento +
                ' and Mov.I_Cod_Ser = Ser.I_cod_Ser ');
end;

{******************  Imprime os servicos do orcamento *************************}
procedure TFImpOrcamento.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := VprUltimoProduto = MovOrcamentoI_Seq_pro.AsInteger;
end;

{****************** imprime o titulo dos servicos *****************************}
procedure TFImpOrcamento.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (VprUltimoProduto = MovOrcamentoI_Seq_pro.AsInteger) and not(MovServicoOrcamento.IsEmpty);
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                   Carrega as parcelas do Orcamento e o sumario
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{************************Carrega as parcelas do Orcamento**********************}
procedure TFImpOrcamento.CarregaParcelas(condicao,Orcamento : Integer);
var
   laco : Integer;
   ValorTotal,ValorDesAcr : double;
begin
   TotalDoc.Caption := 'Total : ' + FormatFloat(varia.MascaraMoeda, CadOrcamentoN_VLR_TOT.AsCurrency);
   LNomCon.Caption := NomeCondicao(condicao);

   AdicionaCabecalhoParcelas(Parcelas);

   ValorDesAcr := 0;
   ValorTotal := ValorOrcamento;

   AdicionaSQLAbreTabela(aux, 'select n_per_con from CADCONDICOESPAGTO where i_cod_pag = ' + inttostr(condicao) );
   if aux.fieldByName('n_per_con').AsCurrency = 0 then
   begin
     // calcula desconto ou acrescimos
     if CadOrcamentoN_VLR_PER.AsCurrency <> 0 then
     begin
       if  CadOrcamentoC_VLR_PER.AsString = 'V' then
         ValorDesAcr := CadOrcamentoN_VLR_PER.AsCurrency
       else
         ValorDesAcr := ValorOrcamento *(CadOrcamentoN_VLR_PER.AsCurrency / 100);

       if CadOrcamentoC_DES_ACR.AsString = 'A' then
         ValorTotal := ValorTotal + ValorDesAcr
       else
         ValorTotal := ValorTotal - ValorDesAcr
     end;
   end;
   aux.close;

   CriaParcelas.Parcelas(ValorTotal,Condicao,true,Date);
   for laco := 0 to CriaParcelas.TextoParcelas.Count - 1 do
   begin
      Parcelas.Lines.add(CentraStr(InttoStr(laco + 1),6) + ' - '+
                         CentraStr(CriaParcelas.TextoVencimentos.Strings[laco],10) + ' - ' +
                         AdicionaBrancoE(Formatfloat(Varia.MascaraMoeda,StrToFloat(DeletaChars(CriaParcelas.TextoParcelas.Strings[laco],'.'))),17));
   end;
   parcelas.Lines.Add(' ');
   parcelas.Lines.Add(AdicionaBrancoE('Valor Total : ' + FormatFloat(Varia.MascaraMoeda,CriaParcelas.ValorTotal) ,39));
   parcelas.Lines.Add(' ');
   parcelas.Lines.Add(' ');
end;

{****************** retorna o valor do orcamento ******************************}
function TFImpOrcamento.ValorOrcamento : double;
begin
  result := 0;
  MovOrcamento.First;
  While not MovOrcamento.Eof do
  begin
    Result := result + MovOrcamentoTotPro.AsFloat;
    MovOrcamento.next;
  end;

  MovServicoOrcamento.first;
  While not MovServicoOrcamento.Eof do
  begin
    result := Result + MovServicoOrcamentoN_Vlr_Tot.AsFloat;
    MovServicoOrcamento.next;
  end;
end;

{********************Adiciona um cabeçalho nas parcelas************************}
procedure TFImpOrcamento.AdicionaCabecalhoParcelas(Parcelas : TQRMemo);
begin
   Parcelas.Lines.Clear;
   parcelas.lines.add(CentraStr('PARC.',5) + '   '+
                         CentraStr('VENCIMENTO',10) + '   ' +
                         AdicionaBrancoE('VALOR',15));
   parcelas.lines.add('');
end;

{*************************retorna o nome da Condição***************************}
Function TFImpOrcamento.NomeCondicao(Codigo : Integer) : String;
begin
   aux.close;
   aux.sql.clear;
   aux.sql.add('Select * from dba.CadCondicoesPagto ' +
               ' Where I_Cod_Pag = '+ IntToStr(codigo));
   aux.open;

   result := aux.FieldByName('C_Nom_Pag').asstring;
end;

{**********************Carrega a foto do Produto*******************************}
procedure TFImpOrcamento.CarregaFotoProduto(Produto : String);
begin
   try
      FotoProduto.Picture.LoadFromFile(PathFoto(Produto));
      if fotoproduto.Picture = nil then
         LDescricaoFoto.Caption := '';
  except
      FotoProduto.Picture := nil;
      LDescricaoFoto.Caption := '';
   end;
end;

{*************************Retorna o Path da foto*******************************}
Function TFImpOrcamento.PathFoto(Produto:String) : String;
begin
  AdicionaSQLAbreTabela(aux, 'Select * from dba.CadProdutos  ' +
               ' Where i_SEQ_Pro = ' + Produto  );
   LDescricaoFoto.Caption := Aux.fieldbyname('C_Nom_Pro').Asstring;
   result := Varia.DriveFoto +  aux.FieldByName('C_Pat_Fot').AsString;
end;

{************retorna o codigo do produto que será impressa a foto**************}
Function TFImpOrcamento.ProdutoFoto : string;
begin
   MovOrcamento.First;
   While not MovOrcamento.eof do
   begin
      if MovOrcamentoC_Imp_fot.AsString = 'S' Then
         begin
         result :=MovOrcamentoI_Seq_Pro.AsString;
         exit;
         end;
      MovOrcamento.Next;
   end;
   result := ''
end;

{******************** verifica o tamanho do sumario ****************************}
procedure TFImpOrcamento.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if LDescricaoFoto.Caption = '' then
    MObservacoes.Width := 697;
  MObservacoes.Top := 48 +(Parcelas.Lines.Count * 17);  // posiciona as observacoes abaixo das parcelas
  MObservacoes.Lines.Text := CadOrcamentoL_OBS_ORC.AsString;  // carrega a observacao
  MObservacoes.lines.Insert(0, 'Vendedor : ' + CadOrcamentoI_Cod_Ven.Asstring + ' - ' + CadOrcamentoC_NOM_VEN.AsString); // carrega o codigo do vendedor
  if Varia.DiasValidade <> 0 then
  begin
    MObservacoes.lines.Insert(0, '  ' );
    MObservacoes.lines.Insert(0, 'Orçamento válido até : ' + CadOrcamentoD_DAT_VAL.AsString ); // data de validate
  end;
  MObservacoes.Lines.Add(varia.TextoOrcamento.text);
  MObservacoes.Height := MObservacoes.Lines.Count * 17;  //calcula o valor da observacao
  QRBand3.Height := 48 +(Parcelas.Lines.Count * 17) +(MObservacoes.Lines.Count * 17); // calcula o valor do sumario
  if QRBand3.Height < 244 Then // tamanho minimo do sumario
    QRBand3.Height := 244;
end;

{(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((
                                 eventos diversas
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))}

{**************** posiciona a impressora do quicreport ************************}
procedure TFImpOrcamento.PosicionaImpressora;
  var
  VpfLaco : Integer;
begin
  for VpfLaco := 0 to printer.Printers.Count -1 do
    if printer.Printers[VpfLaco] = Varia.ImpressoraRelatorio then
       QuickRep1.PrinterSettings.PrinterIndex := VpfLaco;
end;

{********************Carrega o relatorio do orcamento**************************}
procedure TFImpOrcamento.CarregaRelatorio(VpaOrcamento,  NroOrcamento : String);
begin
   PosicionaImpressora;
   CarregaCabecalho(VpaOrcamento,  NroOrcamento);
   CarregaProdutos(VpaOrcamento);
   CarregaServicos(VpaOrcamento);
   CarregaFotoProduto(ProdutoFoto);
   CarregaParcelas(CadOrcamentoI_COD_PAG.AsInteger,StrToInt(VpaOrcamento));
   QuickRep1.ReportTitle := 'Orçamento Nr. ' + VpaOrcamento;
end;

procedure TFImpOrcamento.MudaCabecalho;

  procedure mudaTamLabel( texto : array of TQRLabel);
  var
    laco : integer;
  begin
    for laco := 0 to high(texto) do
      texto[laco].top := texto[laco].top + varia.AlturaCabImpOrcamento;
  end;

begin
  QRBand4.Height := QRBand4.Height + varia.AlturaRodImpOrcamento;
  LNomeFilial.Enabled := not config.MostrarEmpresaImpOrcamento;
  LEndereco.Enabled := not config.MostrarEmpresaImpOrcamento;
  LBairro.Enabled := not config.MostrarEmpresaImpOrcamento;
  LFone.Enabled := not config.MostrarEmpresaImpOrcamento;
  QRShape1.Enabled := not config.MostrarEmpresaImpOrcamento;

  QRBand1.Height := QRBand1.Height + varia.AlturaCabImpOrcamento;
  QRDBText1.top := QRDBText1.top + varia.AlturaCabImpOrcamento;
  QRShape1.top := QRShape1.top + varia.AlturaCabImpOrcamento;

  mudaTamLabel([ QRLabel23, QRLabel9, QRLabel21, QRLabel10, QRLabel14, QRLabel11,
                 QRLabel25, QRLabel13, QRLabel16, QRLabel17, QRLabel7,
                 LDatOrc, LHorOrc, QRLabel12, qrlfoneFax, lMunCli, lendCli,
                 NomCli, QRLabel4, Orcamento, lendereco, lbairro, lfone, QRLabel22,QRLabel3]);
end;


Initialization
{ *************** Registra a classe para evitar duplicidade ****************** }
 RegisterClasses([TFImpOrcamento]);
end.
