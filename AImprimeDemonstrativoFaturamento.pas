unit AImprimeDemonstrativoFaturamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, formularios,
  ExtCtrls, quickrpt, Db, DBTables, Qrctrls, ConfigImpressora, printers,
  StdCtrls, Buttons, Geradores;

type
  TFImprimeDemonstrativoFaturamento = class(TFormularioPermissao)
    Aux: TQuery;
    QuickRep1: TQuickRepNovo;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    FImprimeDemonstrativoFaturamento: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    Sit: TQRBand;
    QRShape3: TQRShape;
    QRSysData2: TQRSysData;
    EmpFil: TQRLabel;
    Cla: TQRLabel;
    QRBand1: TQRBand;
    Estoque: TQRLabel;
    valornota: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    Valoricms: TQRLabel;
    ValorServico: TQRLabel;
    QRShape1: TQRShape;
    AuxEMISSAO: TStringField;
    AuxNOTAS: TFloatField;
    AuxICMS: TFloatField;
    AuxSERVICO: TFloatField;
    AuxISQN: TFloatField;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    ValorISSQN: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
     procedure carregaImpressao(ComandoSQL : String;  NomeEmpresa, NomeFilial,  VprTotalNOtas,  VprTotalICMS,  VprTotalServico, VprTotalISSQN,  VprCliente, MesDiaAno : string);
  end;

var
  FImprimeDemonstrativoFaturamento: TFImprimeDemonstrativoFaturamento;

implementation

uses APrincipal, constantes;


{$R *.DFM}


{ ****************** Na criação do Formulário ******************************** }
procedure TFImprimeDemonstrativoFaturamento.FormCreate(Sender: TObject);
begin
  if not ConfigModulos.Servico then
  begin
    QRLabel16.Enabled := false;
    QRLabel1.Enabled := false;
    QRDBText7.Enabled := false;
    QRDBText1.Enabled := false;
    ValorServico.Enabled := false;
    ValorISSQN.Enabled := false;
  end;
end;

{ ******************* Quando o formulario e fechado ************************** }
procedure TFImprimeDemonstrativoFaturamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := CaFree;
end;


procedure  TFImprimeDemonstrativoFaturamento.carregaImpressao(ComandoSQL : String;  NomeEmpresa, NomeFilial, VprTotalNOtas,  VprTotalICMS,  VprTotalServico,  VprTotalISSQN,  VprCliente, MesDiaAno : string);
begin
    Aux.sql.clear;
    Aux.sql.Add(ComandoSQL);
    Aux.open;

    EmpFil.Caption := 'Empresa : ';
    if NomeEmpresa <> '' then
       EmpFil.Caption := EmpFil.Caption + NomeEmpresa
    else
       EmpFil.Caption := EmpFil.Caption + 'Todas';

    EmpFil.Caption := EmpFil.Caption + '  -  Filial : ';
    if NomeFilial <> '' then
       EmpFil.Caption := EmpFil.Caption + NomeFilial
    else
       EmpFil.Caption := EmpFil.Caption + 'Todas';

    if  VprCliente <> '' then
      Cla.Caption := 'Cliente : ' +   VprCliente
    else
      Cla.Caption := 'Clientes : Todos ';

    QRLabel10.Caption := MesDiaAno;

    valornota.caption :=  VprTotalNotas;
    Valoricms.Caption :=  VprTotalicms;
    ValorServico.Caption :=  VprTotalServico;
    ValorISSQN.Caption :=  VprTotalISSQN;
    QuickRep1.Preview;
    self.Close;
end;

Initialization
 RegisterClasses([TFImprimeDemonstrativoFaturamento]);
end.
