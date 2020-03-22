unit upesquisa;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  ZConnection, ZDataset;

type

  { TfrmPesquisa }

  TfrmPesquisa = class(TForm)
    btnPesquisa: TButton;
    cbCampos: TComboBox;
    cbFiltro: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtResultado: TEdit;
    edtBusca: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
     cCampos, cCampoRetorno, cTabela : string;
  public
     constructor Create(AOwner : TComponent; par_lstCampos : Array of string;par_cTabela, par_cCampoResult :string);
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.lfm}

{ TfrmPesquisa }

procedure TfrmPesquisa.btnPesquisaClick(Sender: TObject);
begin
  if ZQuery1.Active then
     ZQuery1.Close;

  with ZQuery1.sql do
     begin
       Clear;
       add('select '+cCampos);
       add('from '+cTabela);
       add('where '+trim(cbCampos.Text)+' like :cParametro');
     end;
  if trim(cbFiltro.Text) = 'parte' then
     ZQuery1.ParamByName('cParametro').AsString:='%'+trim(edtBusca.text)+'%'
  else if trim(cbFiltro.Text) = 'igual' then
     ZQuery1.ParamByName('cParametro').AsString:=trim(edtBusca.text)
  else if trim(cbFiltro.Text) = 'inicio' then
           ZQuery1.ParamByName('cParametro').AsString:=trim(edtBusca.text)+'%'  ;
  ZQuery1.Open;
  edtResultado.Text:='';

end;

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  edtResultado.Text:=ZQuery1.FieldByName(cCampoRetorno).AsVariant;
  ZQuery1.Close;
  ZConnection1.Disconnect;
  frmPesquisa.ModalResult:=mrYes;
end;

constructor TfrmPesquisa.Create(AOwner: TComponent;
  par_lstCampos: array of string; par_cTabela, par_cCampoResult: string);
var
 n : Integer;
begin
  inherited Create(AOwner);
  ZConnection1.Connect;
  cCampoRetorno:=par_cCampoResult;
  cCampos:='';
  cTabela:=par_cTabela;
  for n := 0 to Length(par_lstCampos) -1 do
    begin
      cbCampos.Items.Add(par_lstCampos[n]);
      if n = 0 then
        cCampos := par_lstCampos[n]
      else
        cCampos := cCampos +','+ par_lstCampos[n];
    end;
  cbCampos.ItemIndex:=1;
  if ZQuery1.Active then
     ZQuery1.Close;
  with ZQuery1.sql do
     begin
       Clear;
       add('select '+cCampos);
       add('from '+cTabela);
     end;
  ZQuery1.Open;
end;

end.

