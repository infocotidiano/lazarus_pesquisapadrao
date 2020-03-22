unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnCliente: TButton;
    btnFornecedor: TButton;
    edtResultado: TEdit;
    Label1: TLabel;
    procedure btnClienteClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
   uses upesquisa;
{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin

  frmPesquisa := TfrmPesquisa.Create(self,['codigo','nome','telefone'],'cliente','nome');
  try

     frmPesquisa.ShowModal;
     edtResultado.Text:= frmPesquisa.edtResultado.Text;
  finally
    FreeAndNil(frmPesquisa);
  end;
end;

procedure TfrmPrincipal.btnFornecedorClick(Sender: TObject);
begin
  frmPesquisa := TfrmPesquisa.Create(self,['codigo','nome','endereco','numero'],'fornecedor','nome');
  try

     frmPesquisa.ShowModal;
     edtResultado.Text:= frmPesquisa.edtResultado.Text;
  finally
    FreeAndNil(frmPesquisa);
  end;

end;

end.

