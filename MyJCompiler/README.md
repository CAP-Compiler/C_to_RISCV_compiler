# MyBestCompiler 

Progetto: Realizzazione di un compilatore Risk-V per file .c

Parte personale del progetto condiviso sula realizzazione di un compilatore Risk-V per file .c con un set di istruzioni ridotti a quelle elementari 

# Strutturazione

Utilizzeremo Flex/Lex come generatore di flusso di token mediante la scannerizzazione e la realizzazione di un set di regole per identificare i token.

Usermo poi Bison/ come parser e Lexical Analyzer per interpretre ciò che avviene nel flusso di token

# Stato attuale

-Alcuni errori in compilazione dovuti al file compiler.y
-Sto cercando di implementare il float

# Problematiche 

- Non riesco ancora a compilare 

# Feature da aggiungere

- Supporto float

# Note 

Ricordati di utilizzare yacc

Ricordati quando utilizzi Bison/yacc di usare bison -d per generare un nuovo file y.tab.c 