# Security Scan Script

Detta projekt är en del av kursen **Applied Script** och består av ett Python-script som automatiserar grundläggande säkerhetskontroller på ett Linux-system.

Scriptet är medvetet skrivet på ett **enkelt och pedagogiskt sätt**, med tydliga kommentarer och struktur, för att visa förståelse för både scripting, Linux-kommandon och grundläggande säkerhetstänk.

---

## Syfte

Syftet med projektet är att:

- automatisera återkommande säkerhetskontroller  
- samla grundläggande system- och nätverksinformation  
- identifiera öppna och lyssnande portar  
- visa hur argument och loggning används i praktiken  
- presentera resultat tydligt i terminalen och logga till fil  

Scriptet är **läs- och kontrollbaserat** och gör inga förändringar i systemet.

---

## Funktionalitet

Scriptet utför följande steg i ordning:

1. Kontrollerar att scriptet körs på Linux  
2. Kontrollerar att scriptet körs med root/sudo  
3. Startar loggning till fil  
4. Samlar systeminformation:
   - användare
   - hostname
   - kernel-version
   - uptime och systembelastning
5. Samlar nätverksinformation:
   - IP-adresser och nätverksinterface
   - routing (default gateway)
6. Listar öppna och lyssnande portar
7. (Valfritt) listar filer med SUID-bit satt
8. Visar en sammanfattning i terminalen
9. Loggar hela körningen till fil

---

## Användning

Scriptet körs med Python 3 och kräver sudo:

```bash
sudo python3 security_scan.py

### Flaggar / Argument

Scriptet stödjer följande flaggor:

- `-v`, `--version`  
  Visar scriptets version och avslutar.

- `--quick`  
  Kör en snabbare portkontroll med mindre detaljerad output.

- `--no-network`  
  Hoppar över nätverkskontroller (IP-information och routing).

- `--suid`  
  Kör en enkel kontroll av SUID-filer (valfritt, kan ta lite längre tid).

### Exempel på användning

```bash
sudo python3 security_scan.py --quick --suid
