
Program Paradigms;

Procedure PrintNumbers(Var numbers: Array Of integer; amount: integer);

Var 
  i: integer;
Begin
  For i := 1 To amount Do
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
    PrintNumbers(numbers, 50);
End;

Procedure GenerateRandomNumbers(Var numbers: Array Of integer; lowerLimit: integer; upperLimit: integer; amount: integer);

Var 
  i: integer;
  num: integer;
Begin
  If lowerLimit > upperLimit Then
    Begin
      writeln('Lower limit cannot be greater than upper limit');
      exit;
    End;

  write('Random numbers: ');
  Randomize;
  For i := 1 To amount Do
    Begin
      num := random(upperLimit + 1 - lowerLimit) + lowerLimit;
      numbers[i] := num;
    End;
  PrintNumbers(numbers, amount);
End;

Procedure SortNumbers(Var numbers: Array Of integer; amount: integer);

Var 
  i, j, temp: integer;
Begin
  write('Sorted numbers: ');
  For i := 1 To amount Do
    Begin
      For j := i + 1 To amount Do
        Begin
          If numbers[i] > numbers[j] Then
            Begin
              temp := numbers[i];
              numbers[i] := numbers[j];
              numbers[j] := temp;
            End;
        End;
    End;
  PrintNumbers(numbers, amount);
End;

Var 
  numbers_1: array[1..50] Of integer;
  numbers_2: array[1..5] Of integer;


Begin
  writeln('Generating 50 random numbers between 0 and 100 and sorting them');
  GenerateRandomNumbers(numbers_1);
  SortNumbers(numbers_1, 50);
  writeln;

  writeln('Generating 5 random numbers between 25 and 35 and sorting them');
  GenerateRandomNumbers(numbers_2, 25, 35, 5);
  SortNumbers(numbers_2, 5);
  writeln;

  readln;
End.
