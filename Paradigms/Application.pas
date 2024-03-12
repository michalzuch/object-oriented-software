
Program Application;

Uses 
Paradigms;


Procedure PrintNumbers(Var numbers: Array Of integer);

Var 
  i: integer;

Begin
  For i := 0 To Length(numbers) - 1 Do
    Begin
      write(numbers[i], ' ');
    End;
  writeln;
End;

Var 
  numbers_1: array[0..49] Of integer;
  numbers_2: array[0..4] Of integer;
  numbers_3: array[0..9] Of integer;

Begin
  writeln('---');
  writeln('Generating 50 random numbers between 0 and 100 and sorting them...');
  writeln;

  GenerateRandomNumbers(numbers_1);
  write('Random numbers: ');
  PrintNumbers(numbers_1);

  write('Sorted numbers: ');
  SortNumbers(numbers_1);
  PrintNumbers(numbers_1);

  writeln('---');

  writeln;

  writeln('---');
  writeln('Generating 5 random numbers between 25 and 35 and sorting them...');
  writeln;

  GenerateRandomNumbers(numbers_2, 25, 35, 5);
  write('Random numbers: ');
  PrintNumbers(numbers_2);

  write('Sorted numbers: ');
  SortNumbers(numbers_2);
  PrintNumbers(numbers_2);

  writeln('---');

  writeln;

  writeln('---');
  writeln('Stop when lower limit is greater than upper limit...');
  GenerateRandomNumbers(numbers_3, 10, 1, 10);
  writeln('---');

  writeln;

  writeln('---');
  writeln('Stop when lower limit is equal to upper limit...');
  GenerateRandomNumbers(numbers_3, 10, 10, 10);
  writeln('---');

  writeln;

  writeln('---');
  writeln('Stop when amount is lower than 1...');
  GenerateRandomNumbers(numbers_3, 10, 20, 0);
  writeln('---');
End.
