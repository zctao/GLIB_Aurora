echo off
REM convert fizzim state machine file to verilog 
perl -S c:\temp\fizzim\fizzim.pl -encoding onehot <%1 >%~n1.v