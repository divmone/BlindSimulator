Program TextTrainingProgram;

Uses
    SysUtils, Windows;

Type
    TStringDynArray = Array Of String;

Const
    MaxWidth = 20;
    LevelStep = 2;

Type
    TStringArray = Array Of String;
    TArr = Array Of TStringArray;

Function CreateText(Const Dictionary: TStringArray;
  OriginalString: String): String;
Var
    I: Integer;
    Word: String;
    Num: Integer;
Begin
    Randomize;
    Num := Random(9);
    Word := Dictionary[Num];
    OriginalString := OriginalString + ' ' + Word;
    CreateText := OriginalString;
End;


procedure MoveCursorToCenter();
var
  ConsoleInfo: TConsoleScreenBufferInfo;
  ConsoleHandle: THandle;
  ConsoleWidth, ConsoleHeight: Integer;
  NewX, NewY: Integer;
  Coord: TCoord;
begin
  ConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);

  // �������� ���������� � ������� �������
  GetConsoleScreenBufferInfo(ConsoleHandle, ConsoleInfo);
  ConsoleWidth := ConsoleInfo.srWindow.Right - ConsoleInfo.srWindow.Left + 1;
  ConsoleHeight := ConsoleInfo.srWindow.Bottom - ConsoleInfo.srWindow.Top + 1;

  // ������������ ����� ���������� ��� ����������� ������� � �����
  NewX := (ConsoleWidth - 1) div 2;
  NewY := ConsoleInfo.dwCursorPosition.Y; // Keep the current vertical position

  // ������������� ����� ���������� �������
  Coord.X := NewX;
  Coord.Y := NewY;
   SetConsoleCursorPosition(ConsoleHandle, Coord);
end;

Function CreateDictionary(Const PathToIn: String; OriginalString: String): TArr;
Var
    InputFile: TextFile;
    Dictionary: TStringArray;
    I: Integer;
    Word: String;
    Arr: TArr;
Begin
    SetLength(Arr, 2, 1);
    SetLength(Dictionary, 10);
    AssignFile(InputFile, PathToIn);
    Reset(InputFile);
    For I := 0 To High(Dictionary) Do
    Begin
        Readln(InputFile, Word);
        Dictionary[I] := Word;
    End;
    OriginalString := CreateText(Dictionary, OriginalString);
    Arr[0][0] := OriginalString;
    Arr[1] := Dictionary;
    CreateDictionary := Arr;
End;

Function InputTextFromFile(Const Num: Integer; OriginalString: String)
  : TStringArray;
Var
    PathToIn: String;
    Arr: TArr;
    Orr: TStringArray;
Begin
    Setlength(Orr, 2);
    Case Num Of
        2:
            PathToIn := '2.txt';
        3:
            PathToIn := '3.txt';
        4:
            PathToIn := '4.txt';
        5:
            PathToIn := '5.txt';
        6:
            PathToIn := '6.txt';
        7:
            PathToIn := '7.txt';
        8:
            PathToIn := '8.txt';
    End;
    Arr := CreateDictionary(PathToIn, OriginalString);
    OriginalString := Arr[0][0];
    Orr[0] := OriginalString;
    Orr[1] := Pathtoin;
    InputTextFromFile := Orr;
End;

Procedure PrintGameRules();
Begin
    Writeln('���� "�������� ����": ',#13#10,
            '1.������������ ������ �� 20 ���������� ���� ����������� ���������.',#13#10,
            '2.��������� ������ ������, ������� ��������� ��������.',#13#10,
            '3.��������� ����������� ��������� ������ � �������� ���������� ����� ������ �� �������.',#13#10,
            '4.������������ ����� ��������, �� � ��� ����������� ������� ��������� �����.',#13#10,
            '5.���� ��������� ������ �����, �� ����� ����������� �� 2 �������.',#13#10,
            '6.���� ������������ �� ���������� ������ ������ ��� ���� ������ �� ������ �������.',#13#10,
            '7.��� ����� ���������� "13" ���� �����������.');
End;

Function CreateStr(Const LenStr: Integer): String;
Var
    ResultValue, RandomNumber, Num, I, Choice: Integer;
    OriginalString: String;
    Orr: TStringArray;
Begin
    ResultValue := 0;
    Randomize;
    If LenStr > 40 Then
    Begin
        While ResultValue < 44 Do
        Begin
            RandomNumber := Random(7) + 2;
            ResultValue := ResultValue + RandomNumber + 1;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End;
    End
    else
    If LenStr > 30 Then
    Begin
        While ResultValue < 34 Do
        Begin
            RandomNumber := Random(7) + 2;
            ResultValue := ResultValue + RandomNumber + 1;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End;
    End
    else
    If LenStr > 20 Then
    Begin
        While ResultValue < 24 Do
        Begin
            RandomNumber := Random(7) + 2;
            ResultValue := ResultValue + RandomNumber + 1;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End;
    End
    else
    If LenStr = 20 Then
    Begin
        Choice := Random(4);
        If Choice = 0 Then
        Begin
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 3 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
    End
    Else If LenStr = 18 Then
    Begin
        Choice := Random(4);
        If Choice = 0 Then
        Begin
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 3 Then
        Begin
            RandomNumber := 8;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
    End
    Else If LenStr = 16 Then
    Begin
        Choice := Random(4);
        If Choice = 0 Then
        Begin
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 3 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
    End
    Else If LenStr = 14 Then
    Begin
        Choice := Random(4);
        If Choice = 0 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 3 Then
        Begin
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
    End
    Else If LenStr = 12 Then
    Begin
        Choice := Random(4);
        If Choice = 0 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 4;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 3 Then
        Begin
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 6;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
    End
    Else If LenStr = 10 Then
    Begin
        Choice := Random(3);
        If Choice = 0 Then
        Begin
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 7;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 2 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 3;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End;
    End
    Else If LenStr = 8 Then
    Begin
        Choice := Random(2);
        If Choice = 0 Then
        Begin
            RandomNumber := 8;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End
        Else If Choice = 1 Then
        Begin
            RandomNumber := 2;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
            RandomNumber := 5;
            Orr := InputTextFromFile(RandomNumber, OriginalString);
            OriginalString := Orr[0];
        End;
    End
    Else If LenStr = 6 Then
    Begin
        RandomNumber := 2;
        Orr := InputTextFromFile(RandomNumber, OriginalString);
        OriginalString := Orr[0];
        RandomNumber := 3;
        Orr := InputTextFromFile(RandomNumber, OriginalString);
        OriginalString := Orr[0];
    End
    Else If LenStr = 4 Then
    Begin
        RandomNumber := 4;
        Orr := InputTextFromFile(RandomNumber, OriginalString);
        OriginalString := Orr[0];
    End
    Else If LenStr = 2 Then
    Begin
        RandomNumber := 2;
        Orr := InputTextFromFile(RandomNumber, OriginalString);
        OriginalString := Orr[0];
    End;
     If (LenStr > 20) And (ResultValue < LenStr) And (LenStr - ResultValue <> 1)
      And (LenStr - ResultValue <> 9) Then
    Begin
        RandomNumber := LenStr - ResultValue;
        ResultValue := ResultValue + RandomNumber;
        Orr := InputTextFromFile(RandomNumber, OriginalString);
        OriginalString := Orr[0];
    End;
    CreateStr := OriginalString;
End;

Function SecondIncorrectLetters(Const OriginalString: String;
  Var Input: String): String;
// �������� ���� + �� ��� �����
Var
    CorrectedString: String;
    I: Integer;

Begin
    For I := Low(OriginalString) To High(OriginalString) Do
    Begin
        If OriginalString[I] <> Input[I] Then
        Begin
            If I >= 1 Then
            Begin
                CorrectedString := CorrectedString + OriginalString[I - 1] +
                  OriginalString[I] + OriginalString[I];
            End
            Else
            Begin
                CorrectedString := CorrectedString + OriginalString[I] +
                  OriginalString[I] + OriginalString[I + 1];
            End;
        End
        Else
        Begin
            // ��������� ����������� ������ � ����������
            CorrectedString := CorrectedString + OriginalString[I];
        End;
    End;
    SecondIncorrectLetters := CorrectedString;
End;

Function FirstIncorrectLetters(Var OriginalString: String;
  Const Input: String): String;
// �������� ����
Var
    CorrectedString: String;
    I: Integer;
Begin

    For I := Low(OriginalString) To High(OriginalString) Do
    Begin
        If OriginalString[I] <> Input[I] Then
        Begin
            CorrectedString := CorrectedString + OriginalString[I] +
              OriginalString[I];
        End
        Else
        Begin
            // ��������� ����������� ������ � ����������
            CorrectedString := CorrectedString + OriginalString[I];
        End;
    End;
    FirstIncorrectLetters := CorrectedString;
End;

Function TherdIncorrectLetters(Const OriginalString: String;
  Var Input: String): String;
// �������� ����
Var
    CorrectedString, WordIn, WordOr: String;
    I, StartIdx, StartOr, EndIn, EndOr: Integer;
Begin
    // �������������� ��������� ������ ��� ������ ���� � ������ str1
    StartIdx := 1;

    // ��������� ������ ����� �� ������ ������
    For I := Low(OriginalString) To High(OriginalString) Do
    Begin
        // ���� ������� ������ �������� �������� ��� ��������� ����� ������
        If (Input[I] = ' ') Or (I = Length(Input)) Then
        Begin
            // �������� ����� �� ������ ������
            If I = Length(Input) Then
                WordIn := Copy(Input, StartIdx, I - StartIdx + 1)
            Else
                Wordin := Copy(Input, StartIdx, I - StartIdx);

            // ���� ���������� � ������ ������
            StartIdx := 1;
            While StartIdx <= Length(OriginalString) Do
            Begin
                // ���� ������� ������ �������� �������� ��� ��������� ����� ������
                If (OriginalString[StartIdx] = ' ') Or
                  (StartIdx = Length(OriginalString)) Then
                Begin
                    // �������� ����� �� ������ ������
                    If StartIdx = Length(OriginalString) Then
                        Wordor := Copy(OriginalString, StartIdx,
                          StartIdx - StartIdx + 1)
                    Else
                        Wordor := Copy(OriginalString, StartIdx,
                          StartIdx - StartIdx);

                    // ���������� �����
                    If CompareText(Wordin, Wordor) <> 0 Then
                    Begin
                        // ����� �� �������, ��������� ��� ��� ���� � ���������
                        CorrectedString := CorrectedString + ' ' + Wordor +
                          ' ' + Wordor;
                    End
                    Else
                    Begin
                        // ����� �������, ��������� ��� ���� ��� � ���������
                        CorrectedString := CorrectedString + ' ' + Wordor;
                    End;

                    // ��������� � ���������� ����� � ������ ������
                    StartIdx := StartIdx + 1;
                    Break;
                End;

                // ��������� � ���������� ������� � ������ ������
                StartIdx := StartIdx + 1;
            End;
        End;

        // ��������� � ���������� ������� �� ������ ������
        StartIdx := StartIdx + 1;
    End;
    // CorrectedString := TrimLeft(CorrectedString);
    Writeln(CorrectedString);
    TherdIncorrectLetters := CorrectedString;
End;

Function FothIncorrectLetters(Const OriginalString: String;
  Var Input: String): String;
// �������� ������
Var
    CorrectedString: String;
    I: Integer;
Begin
    For I := Low(OriginalString) To High(OriginalString) Do
        If OriginalString[I] <> Input[I] Then
        Begin
            CorrectedString := OriginalString + OriginalString;
            Break;
        End
        Else
            CorrectedString := OriginalString;
    FothIncorrectLetters := CorrectedString;
End;

Function SplitStringIntoWords(Const Str: String): TStringDynArray;
Var
    I, Count, StartPos, EndPos: Integer;
    Word: String;
    Words: TStringDynArray;
Begin
    Count := 0;
    I := 1;

    While I <= Length(Str) Do
    Begin
        // ���������� �������
        While (I <= Length(Str)) And (Str[I] = ' ') Do
            Inc(I);

        // �������� ��������� �����
        StartPos := I;

        While (I <= Length(Str)) And (Str[I] <> ' ') Do
            Inc(I);

        EndPos := I - 1;

        // ��������� ����� � ������
        If EndPos >= StartPos Then
        Begin
            Word := Copy(Str, StartPos, EndPos - StartPos + 1);
            SetLength(Words, Count + 1);
            Words[Count] := Word;
            Inc(Count);
        End;
    End;
    SplitStringIntoWords := Words;
End;

Function UserTry(Var OriginalString: String): String;
Var
    Input: String;
    IsCorrect: Boolean;
Begin
    IsCorrect := True;
    Repeat
    Begin
        IsCorrect := True;
        MoveCursorToCenter();
        Readln(Input);
        Input := TrimLeft(Input);
        If Input = '13' Then
        Begin
            Writeln('����� �� ���������-���������.');
            Break;
        End;
        If Length(OriginalString) <> Length(Input) Then
        Begin
            Writeln('�� ����� �� ���������� ���������� �������� !');
            IsCorrect := False;
        End;
    End;
    Until IsCorrect;
    UserTry := Input;
End;

Function LevelRools(Const Level: Integer; Const Words1: TStringDynArray;
  Const Words2: TStringDynArray; Original: String; Inp: String): String;
Var
    CorrectedString, CorrectedWord, Word: String;
    I, RandomNumber: Integer;
    OriginalString, Input: String;
    Orr: TStringArray;
Begin
    If Original <> Inp Then
    Begin
        For I := Low(Words1) To High(Words1) Do
        Begin
            If Words1[I] <> Words2[I] Then
            Begin
                OriginalString := Words1[I];
                Input := Words2[I];
                Case Level Of
                    1:
                        CorrectedWord :=
                          FirstIncorrectLetters(OriginalString, Input);
                    2:
                        CorrectedWord :=
                          SecondIncorrectLetters(OriginalString, Input);
                    3:
                        CorrectedWord :=
                          TherdIncorrectLetters(OriginalString, Input);
                    4:
                        CorrectedWord :=
                          FothIncorrectLetters(OriginalString, Input);
                End;
                CorrectedString := CorrectedString + ' ' + CorrectedWord  ;
            End
            Else
            Begin
                RandomNumber := Length(Words1[I]);
                Orr := InputTextFromFile(RandomNumber, CorrectedString);
                CorrectedString := Orr[0];
            End;
        End;
    End
    Else
    Begin
        CorrectedString := Original;
    End;
    LevelRools := CorrectedString;
End;

Procedure Game();
Var
    Level, Width: Integer;
    Input, OriginalString, CorrectedString: String;
    IsCorrect: Boolean;
    LenStr: Integer;
    I: Integer;
    Words1, Words2: TStringDynArray;
Begin
    Level := 1;
    Width := 50;
    While Level < 5 Do
    Begin
        LenStr := 20;
        Writeln('������� ', Level);
        While LenStr > 0 Do
        Begin
            OriginalString := CreateStr(LenStr);
            OriginalString := TrimLeft(OriginalString);
            MoveCursorToCenter();
            Writeln(OriginalString);
            Repeat
                Input := UserTry(OriginalString);
                If Input = '13' Then
                Begin
                    Exit;
                End;
                Words1 := SplitStringIntoWords(OriginalString);
                Words2 := SplitStringIntoWords(Input);
                CorrectedString := LevelRools(Level, Words1, Words2,
                  OriginalString, Input);
                CorrectedString := TrimLeft(CorrectedString);
                If CorrectedString <> OriginalString Then
                Begin
                    Writeln('� ��������� �� �������� , ���������� ��� ���. ');
                     Write('������������ ������ : ');
                    MoveCursorToCenter();
                    Writeln(CorrectedString);
                    OriginalString := CorrectedString;
                    LenStr := Length(OriginalString);
                End
                Else If Input = OriginalString Then
                Begin
                    Writeln('�� ����� ������ ����� , ����������� � ��� �� ����. ');
                    LenStr := LenStr - LevelStep;
                    Break;
                End;
                If Length(OriginalString) > Width Then
                Begin
                    Writeln('�� ��������� ������ ������. ���� , �� �� ���������.');
                    Exit;
                End;
            Until OriginalString <> CorrectedString;
            If LenStr = 0 Then
            Begin
                Writeln('�� ������ ', Level, '-� ������� !');
                Inc(Level);
            End;
            If Level = 5 Then
            Begin
                Writeln('���������� !!! �� ������ ��� ������ !!! ���������� ��������� !!! ');
                Exit;
            End;
        End;
    End;
    Readln;
End;

Begin
    PrintGameRules();
    Randomize;
    Game();
    Readln;

End.
