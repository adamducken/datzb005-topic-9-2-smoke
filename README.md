# DatZB005 — 9.2. praktiskais darbs

Adam Ducken.

- `AD.bat` pieprasa vārdu, uzvārdu un skaitli 100–999, pārbauda ievadi un
  piedāvā atkārtot aprēķinu. Beigās pievieno autora tekstu, noņem paslēpšanas
  atribūtu un pārsauc rezultātu par `Vards_Uzvards.txt`, aizstājot esošu failu.
- `rekinat.bat` ieraksta trīs ciparus, to summu, reizinājumu un `help attrib`
  failā `rezultats.txt`, parāda saturu un paslēpj failu. Katrs aprēķins aizstāj
  iepriekšējo rezultātu; faili tiek saglabāti blakus skriptiem.
- `test.bat` pagaidu mapē pārbauda aprēķinus, nederīgu ievadi, atkārtošanu,
  autora tekstu, faila paslēpšanu, pārsaukšanu un esoša rezultāta aizstāšanu.

Windows Command Prompt:

```bat
AD.bat
rekinat.bat 123
test.bat
```

Ievadot `Adam` un `Ducken`, gala fails ir `Adam_Ducken.txt`.
GitHub Actions palaiž `test.bat` uz `windows-latest`, tāpat kā 9.1. darbā.

Komandu dokumentācija: [attrib](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/attrib)
un [ren](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/ren).
