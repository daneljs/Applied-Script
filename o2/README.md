# Övning 2 – MD5 Hash Checker

## Syfte
Syftet med denna övning är att förstå hur hashfunktioner (MD5) används i praktiken och varför MD5 är olämpligt för lösenord i moderna system.

## Beskrivning
I övningen används:
- Ett Python-script för att generera MD5-hashar av enkla numeriska lösenord
- Hashcat för att knäcka hashvärden i en kontrollerad testmiljö

Målet är att visa hur snabbt svaga lösenord kan återställas när en snabb och osäker hashfunktion används.

## Innehåll
- `md5_hasher.py` – genererar MD5-hashar
- `mina_hashar.txt` – innehåller skapade hashvärden
- `md5-hashcat.sh` – script för att köra Hashcat
- `screenshot_md5-hashcat.png` – dokumentation av resultat

## Så körs övningen

```
1. python3 md5_hasher.py – skapa hashvärden  
2. ./md5-hashcat.sh – knäck hasharna med Hashcat  
3. hashcat --show -m 0 mina_hashar.txt – visa resultat

```

## Sammanfattning

Samtliga hashvärden kunde knäckas i testmiljön.
Övningen visar tydligt varför MD5 inte bör användas för lösenord och ger praktisk förståelse för hur lösenordsstyrka kan analyseras med säkerhetsverktyg.

Extra

Scriptet testades även mot hashvärden som skapats av min kurskamrat Fredrik, med samma resultat – lösenorden kunde återställas i kontrollerad testmiljö.