/*FILENAME: lex.l
This is lex file that contains the regex token values required to return for each matched token
AUTHORS: Ziyuan Liu, Peter Loomis
Instructions from CS57 2016W and Flex and Bison*/

%{
    #include "tokens.h"
%}
%x multi_comment
%x single_comment
%%

"//" {BEGIN(single_comment);}
<single_comment>.
<single_comment>\n {BEGIN(INITIAL);}

"/*" {BEGIN(multi_comment);}
<multi_comment>.
<multi_comment>\n
<multi_comment>"*/" {BEGIN(INITIAL);}

\"[^"]*\"|\'[^']*\' {return STR_T;}
"if"        {return KW_IF_T;}
"else"      {return KW_ELSE_T;}
"while"     {return KW_WHILE_T;}
"return"    {return KW_RETURN_T;}
"for"       {return KW_FOR_T;}
"void"      {return KW_VOID_T;}
"read"      {return KW_READ_T;}
"print"     {return KW_PRINT_T;}
"int"       {return KW_INT_T;}
[0-9]+[a-zA-Z_]+ {return UNDEF_T;}

[_A-Za-z][A-Za-z0-9_]* {return STD_ID_T;}

0|[1-9][0-9]* {return INT_T;}
[ \t\n] { }

"<=" {return SYM_LTE_T;}
">=" {return SYM_GTE_T;}
"==" {return SYM_EQ_T;}
"!=" {return SYM_NE_T;}
"++" {return SYM_INCR_T;}
"--" {return SYM_DECR_T;}
"&&" {return SYM_AND_T;}
"||" {return SYM_OR_T;}

[+\-*<>;,()\[\]{}%!=] {return (int)yytext[0]; }
. {return UNDEF_T;}
%%
