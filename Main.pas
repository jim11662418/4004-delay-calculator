unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, VrControls, VrWheel, VrTrackBar, StdCtrls, Menus;

type
  TMainForm = class(TForm)
    gbCode: TGroupBox;
    gbDelay: TGroupBox;
    lbCycles: TLabel;
    edCycles: TEdit;
    lbDelay: TLabel;
    edDelay: TEdit;
    lbMicroseconds: TLabel;
    gbRegisters: TGroupBox;
    edR0: TEdit;
    R0Label: TLabel;
    VrTrackBarR0: TVrTrackBar;
    R1Label: TLabel;
    edR1: TEdit;
    VrTrackBarR1: TVrTrackBar;
    R2Label: TLabel;
    edR2: TEdit;
    VrTrackBarR2: TVrTrackBar;
    R3Label: TLabel;
    edR3: TEdit;
    VrTrackBarR3: TVrTrackBar;
    gbCalculate: TGroupBox;
    Label1: TLabel;
    edCalculate: TEdit;
    btnCalculate: TButton;
    Label2: TLabel;
    meCode: TMemo;
    btnCopy: TButton;
    gbCrystal: TGroupBox;
    edFreq: TEdit;
    Label3: TLabel;
    procedure VrTrackBarR0Change(Sender: TObject);
    procedure VrTrackBarR1Change(Sender: TObject);
    procedure VrTrackBarR2Change(Sender: TObject);
    procedure VrTrackBarR3Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure edFreqExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  crystal: longint;
  cycle: single;

implementation

{$R *.dfm}

// allow only numbers to be entered into the EditBox
procedure EditNumbersOnly(var txtEdit : TEdit);
var defstyle: dWord;
begin
   defstyle := GetWindowLong(txtEdit.Handle, GWL_STYLE);
   SetWindowLong(txtEdit.Handle, GWL_STYLE, defstyle or ES_NUMBER);
end;

procedure CalculateDelay;
var R0,R1,R2,R3,C0,C1,C2,C3: longint;
begin

// the code:
//
//   delay:    fim P0,0FFH       2 cycles
//             fim P1,0FFH       2 cycles
//   loop:     isz R0,loop      C0 cycles
//             isz R1,loop      C1 cycles
//             isz R2,loop      C2 cycles
//             isz R3,loop      C3 cycles
//             bbl 0             1 cycle
//

   R0 := MainForm.VrTrackBarR0.Position;
   R1 := MainForm.VrTrackBarR1.Position;
   R2 := MainForm.VrTrackBarR2.Position;
   R3 := MainForm.VrTrackBarR3.Position;

   C0 :=                   (2*(15-R0))+2;
   C1 :=      (32*(15-R1))+(2*(15-R1))+2+C0;
   C2 :=     (544*(15-R2))+(2*(15-R2))+2+C1;
   C3 :=    (8736*(15-R3))+(2*(15-R3))+2+C2;

   C3 := C3+2; // add 2 cycles for the "fim P0,xx" instruction
   C3 := C3+2; // add 2 cycles for the "fim P1,xx" instruction
   C3 := C3+1; // add 1 cycle  for the "bbl 0" instruction

   MainForm.edCycles.Text := IntToStr(C3);
   MainForm.edDelay.Text := IntToStr(Round((C3)*cycle));
   MainForm.meCode.Lines[0] := 'delay:  fim P0,0'+IntToHex(R0,1)+IntToHex(R1,1)+'H';
   MainForm.meCode.Lines[1] := '        fim P1,0'+IntToHex(R2,1)+IntToHex(R3,1)+'H';
end;


procedure TMainForm.VrTrackBarR0Change(Sender: TObject);
begin
   edR0.Text := IntToStr(VrTrackBarR0.Position);
   CalculateDelay;
end;

procedure TMainForm.VrTrackBarR1Change(Sender: TObject);
begin
   edR1.Text := IntToStr(VrTrackBarR1.Position);
   CalculateDelay;
end;

procedure TMainForm.VrTrackBarR2Change(Sender: TObject);
begin
   edR2.Text := IntToStr(VrTrackBarR2.Position);
   CalculateDelay;
end;

procedure TMainForm.VrTrackBarR3Change(Sender: TObject);
begin
   edR3.Text := IntToStr(VrTrackBarR3.Position);
   CalculateDelay;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
   VrTrackBarR0.Position := 15;
   VrTrackBarR1.Position := 15;
   VrTrackBarR2.Position := 15;
   VrTrackBarR3.Position := 15;
   edFreq.Text := IntToStr(crystal);
   CalculateDelay;
end;

procedure TMainForm.btnCalculateClick(Sender: TObject);
var R0,R1,R2,R3,D: longint;
    minDelay,maxDelay: longint;
begin
   minDelay := Round(13 * cycle);
   maxDelay := Round(139813 * cycle);
   if (Length(edCalculate.Text) = 0) or (StrToInt(edCalculate.Text) < minDelay) or (StrToInt(edCalculate.Text) > maxDelay) then
      begin
         ShowMessage('Enter a delay between '+IntToStr(minDelay)+' and '+IntToStr(maxDelay)+' microseconds');
      end
   else
      begin
        D := StrToInt(edCalculate.Text);

        R0 := 15;
        R1 := 15;
        R2 := 15;

        R3 := 16;
        repeat
           dec(R3);
        until (Round((((8736*(15-R3))+(2*(15-R3))+2+((544*(15-R2))+(2*(15-R2))+2+((32*(15-R1))+(2*(15-R1))+2+((2*(15-R0))+2))))+5)*cycle)) > D;
        inc(R3);

        R2 := 16;
        repeat
           dec(R2);
        until (Round((((8736*(15-R3))+(2*(15-R3))+2+((544*(15-R2))+(2*(15-R2))+2+((32*(15-R1))+(2*(15-R1))+2+((2*(15-R0))+2))))+5)*cycle)) > D;
        inc(R2);

        R1 := 16;
        repeat
           dec(R1);
        until (Round((((8736*(15-R3))+(2*(15-R3))+2+((544*(15-R2))+(2*(15-R2))+2+((32*(15-R1))+(2*(15-R1))+2+((2*(15-R0))+2))))+5)*cycle)) > D;
        inc(R1);

        R0 := 16;
        repeat
           dec(R0);
        until (Round((((8736*(15-R3))+(2*(15-R3))+2+((544*(15-R2))+(2*(15-R2))+2+((32*(15-R1))+(2*(15-R1))+2+((2*(15-R0))+2))))+5)*cycle)) > D;
        inc(R0);

        VrTrackBarR0.Position := R0;
        VrTrackBarR1.Position := R1;
        VrTrackBarR2.Position := R2;
        VrTrackBarR3.Position := R3;
        CalculateDelay;
      end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   EditNumbersOnly(edCalculate);                            // only numbers allowed in edCalculate TEdit
   EditNumbersOnly(edFreq);                                 // only numbers allowed in edFreq TEdit
   crystal := 5185000;                                      // 5.068 MHz crystal. the Intel 4201A data sheet says 3.5 - 5.185 Mhz
   cycle   := ((1/(crystal div 7))* 1000000) * 8;           // single byte instructions take 8 clock periods
end;

procedure TMainForm.btnCopyClick(Sender: TObject);
begin
   meCode.SelectAll;
   meCode.CopyToClipboard;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
   Close
end;

procedure TMainForm.edFreqExit(Sender: TObject);
begin
   crystal := StrToInt(edFreq.Text);
   if (crystal < 3500000) or (crystal > 5185000) then // the data sheet for the Intel 4201A says 3.5 to 5.185 MHz
      begin
         ShowMessage('Enter a frequency between 3500000 and 5185000 Hz');
      end
   else
      begin
         cycle   := ((1/(crystal div 7))* 1000000) * 8;           // single byte instructions take 8 clock periods
         CalculateDelay;
      end;
end;

end.
