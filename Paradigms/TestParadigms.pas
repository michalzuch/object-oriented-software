
Program ParadigmsTests;

Uses 
Crt,
SysUtils,
Paradigms;


Procedure PrintTestResult(testName: String; result: Boolean);

Begin
  If result Then
    Begin
      TextColor(10);
      writeln('Passed', #9, testName);
      TextColor(7);
    End
  Else
    Begin
      TextColor(12);
      writeln('Failed', #9, testName);
      TextColor(7);
    End;
End;


Procedure TestGenerate50RandomNumbers;

Const 
  AMOUNT = 50;
  LOWER_LIMIT = 0;
  UPPER_LIMIT = 100;

Var 
  i: integer;
  numbers: array[0..AMOUNT - 1] Of integer;
  result: Boolean;

Begin
  GenerateRandomNumbers(numbers);
  result := true;

  For i := 0 To AMOUNT - 1 Do
    Begin
      If (numbers[i] < LOWER_LIMIT) Or (numbers[i] > UPPER_LIMIT) Or (i > AMOUNT) Then
        Begin
          result := false;
          break;
        End;
    End;
  PrintTestResult('TestGenerate50RandomNumbers', result);
End;


Procedure TestGenerateRandomNumbers;

Const 
  AMOUNT = 10;
  LOWER_LIMIT = 500;
  UPPER_LIMIT = 1000;

Var 
  numbers: array[0..AMOUNT - 1] Of integer;
  i: integer;
  result: Boolean;

Begin
  GenerateRandomNumbers(numbers, LOWER_LIMIT, UPPER_LIMIT, AMOUNT);
  result := true;

  For i := 0 To AMOUNT - 1 Do
    Begin
      If (numbers[i] < LOWER_LIMIT) Or (numbers[i] > UPPER_LIMIT) Or (i > AMOUNT) Then
        Begin
          result := false;
          break;
        End;
    End;
  PrintTestResult('TestGenerateRandomNumbers', result);
End;


Procedure TestSortNumbers;

Var 
  expected: array[0..9] Of integer = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
  i: integer;
  numbers: array[0..9] Of integer = (10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
  result: Boolean;

Begin
  SortNumbers(numbers);
  result := true;

  For i := 0 To 9 Do
    Begin
      If (numbers[i] <> expected[i]) Then
        Begin
          result := false;
          break;
        End;
    End;
  PrintTestResult('TestSortNumbers', result);
End;


Procedure TestSortRandomGeneratedNumbers;

Const 
  AMOUNT = 50;

Var 
  i: integer;
  numbers: array[0..AMOUNT - 1] Of integer;
  result: Boolean;

Begin
  GenerateRandomNumbers(numbers);
  SortNumbers(numbers);
  result := true;

  For i := 0 To AMOUNT - 2 Do
    Begin
      If (numbers[i] > numbers[i + 1]) Then
        Begin
          result := false;
          break;
        End;
    End;
  PrintTestResult('TestSortRandomGeneratedNumbers', result);
End;


Procedure TestSortRandomGeneratedNumbersWithLowerLimitUpperLimit;

Const 
  AMOUNT = 50;
  LOWER_LIMIT = 500;
  UPPER_LIMIT = 1000;

Var 
  i: integer;
  numbers: array[0..AMOUNT - 1] Of integer;
  result: Boolean;

Begin
  GenerateRandomNumbers(numbers, LOWER_LIMIT, UPPER_LIMIT, AMOUNT);
  SortNumbers(numbers);
  result := true;

  For i := 0 To AMOUNT - 2 Do
    Begin
      If (numbers[i] > numbers[i + 1]) Then
        Begin
          result := false;
          break;
        End;
    End;
  PrintTestResult('TestSortRandomGeneratedNumbersWithLowerLimitUpperLimit', result);
End;


Procedure RunTests;

Begin
  TestGenerate50RandomNumbers;
  TestGenerateRandomNumbers;
  TestSortNumbers;
  TestSortRandomGeneratedNumbers;
  TestSortRandomGeneratedNumbersWithLowerLimitUpperLimit;
End;

Begin
  RunTests;
End.
