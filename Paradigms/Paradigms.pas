
Program Paradigms;

Procedure GenerateRandomNumbers;

Var 
  num: integer;
Begin
  Randomize;
  For num := 1 To 50 Do
    Begin
      write(random(101), ' ');
    End;
End;

Begin
  GenerateRandomNumbers;
  readln;
End.
