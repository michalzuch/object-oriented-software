
Program Paradigms;

Procedure PrintNumbers(Var numbers: Array Of integer);

Var 
  i: integer;
Begin
  For i := 1 To 50 Do
    Begin
      write(numbers[i], ' ');
    End;
  writeln;
End;

Procedure GenerateRandomNumbers(Var numbers: Array Of integer);

Var 
  i: integer;
  num: integer;
Begin
  write('Random numbers: ');
  Randomize;
  For i := 1 To 50 Do
    Begin
      num := random(101);
      numbers[i] := num;
    End;
  PrintNumbers(numbers);
End;

Procedure SortNumbers(Var numbers: Array Of integer);

Var 
  i, j, temp: integer;
Begin
  write('Sorted numbers: ');
  For i := 1 To 50 Do
    Begin
      For j := i + 1 To 50 Do
        Begin
          If numbers[i] > numbers[j] Then
            Begin
              temp := numbers[i];
              numbers[i] := numbers[j];
              numbers[j] := temp;
            End;
        End;
    End;
  PrintNumbers(numbers);
End;

Var 
  numbers: array[1..50] Of integer;

Begin
  GenerateRandomNumbers(numbers);
  SortNumbers(numbers);
  readln;
End.
