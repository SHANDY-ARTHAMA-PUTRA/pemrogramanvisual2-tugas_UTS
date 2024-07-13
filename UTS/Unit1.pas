unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    ZConnection1: TZConnection;
    DataSource1: TDataSource;
    ZTable1: TZTable;
    dbgrd1: TDBGrid;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
   if edt1.Text = '' then
  begin
    Showmessage('Id masih kosong');
    edt1.SetFocus;
  end else
  if edt2.Text = '' then
  begin
    Showmessage('Nama masih kosong');
    edt2.SetFocus;
  end else
  if edt3.Text = '' then
  begin
    Showmessage('Deskripsi masih kosong');
    edt3.SetFocus;
  end else
  begin
    with Ztable1 do
    begin
      Append;
      FieldByname('id').AsInteger := StrToInt(edt1.Text);
      FieldByName('nama').AsString := edt2.Text;
      FieldByName('deskripsi').AsString := edt3.Text;
      Post;
      Showmessage('Data berhasil disimpan');
    end;
  end;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  if edt1.Text = '' then
  begin
    Showmessage('Id masih kosong');
    edt1.SetFocus;
  end else
  if edt2.Text = '' then
  begin
    Showmessage('Nama masih kosong');
    edt2.SetFocus;
  end else
  if edt3.Text = '' then
  begin
    Showmessage('Deskripsi masih kosong');
    edt3.SetFocus;
  end else
  begin
    with Ztable1 do
    begin
      Edit;
      FieldByname('id').AsInteger := StrToInt(edt1.Text);
      FieldByName('nama').AsString := edt2.Text;
      FieldByName('deskripsi').AsString := edt3.Text;
      Post;
      Showmessage('Data berhasil Diubah');
    end;
  end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
 if messageDlg('Apakah anda yakin ingin menghapus data ' + Ztable1.FieldByName('nama').AsString+' ini?',mtConfirmation,[Mbyes,Mbno],0)=mryes then
  begin
    Ztable1.Delete;
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin

edt1.Clear;
edt2.Clear;
edt3.Clear;

end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := Ztable1.FieldByName('id').AsString;
  edt2.Text := Ztable1.FieldByName('nama').AsString;
  edt3.Text := Ztable1.FieldByName('deskripsi').AsString;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin

Close;

end;

end.
