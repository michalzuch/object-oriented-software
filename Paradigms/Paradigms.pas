
Unit Paradigms;

Interface

Procedure GenerateRandomNumbers(Var numbers: Array Of integer);
Procedure GenerateRandomNumbers(Var numbers: Array Of integer; lowerLimit: integer; upperLimit: integer; amount: integer);
Procedure SortNumbers(Var numbers: Array Of integer);


Implementation

Uses crt;

Procedure GenerateRandomNumbers(Var numbers: Array Of integer);

Var 
  i: integer;
  num: integer;

Begin
  Randomize;
  For i := 0 To 49 Do
    Begin
      num := random(101);
      numbers[i] := num;
    End;
End;


Procedure GenerateRandomNumbers(Var numbers: Array Of integer; lowerLimit: integer; upperLimit: integer; amount: integer);

Var 
  i: integer;

Begin
  If lowerLimit > upperLimit Then
    Begin
      TextColor(14);
      writeln('Lower limit cannot be greater than upper limit');
      TextColor(7);
      exit;
    End;

  If lowerLimit = upperLimit Then
    Begin
      TextColor(14);
      writeln('Lower limit and upper limit cannot be the same');
      TextColor(7);
      exit;
    End;

  If amount < 1 Then
    Begin
      TextColor(14);
      writeln('Amount cannot be less than 1');
      TextColor(7);
      exit;
    End;

  Randomize;
  For i := 0 To amount - 1 Do
    Begin
      numbers[i] := Random(upperLimit + 1 - lowerLimit) + lowerLimit;
    End;
End;


Procedure SortNumbers(Var numbers: Array Of integer);

Var 
  i: integer;
  j: integer;
  temp: integer;

Begin
  For i := 0 To Length(numbers) - 2 Do
    Begin
      For j := 0 To Length(numbers) - 2 Do
        Begin
          If numbers[j] > numbers[j + 1] Then
            Begin
              temp := numbers[j];
              numbers[j] := numbers[j + 1];
              numbers[j + 1] := temp;
            End;
        End;
    End;
End;

End.
