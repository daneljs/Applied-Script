# Security Scan Script

Detta projekt är en del av kursen **Applied Script** och består av ett Python-script som automatiserar grundläggande säkerhetskontroller på ett Linux-system.

---

## Syfte/Mål

Syftet med projektet är att:
- Automatisera återkommande säkerhetskontroller på Linux-system
- Samla grundläggande system- och nätverksinformation för säkerhetsanalys
- Identifiera öppna och lyssnande portar som kan utgöra angreppsytor
- Hitta potentiellt känsliga SUID-filer
- Demonstrera användning av argument, felhantering och loggning i Python
- Skapa en tydlig och lättläst loggfil för spårbarhet

Scriptet är **läs- och kontrollbaserat** och gör inga förändringar i systemet.

---

## Funktionalitet

Scriptet utför följande steg:

### 1. Förkontroller
- Verifierar att scriptet körs på Linux
- Kontrollerar root/sudo-behörighet
- Skapar loggkatalog och startar loggning

### 2. Informationsinsamling
- **Systeminformation**
  - Användare som kör scriptet
  - Hostname
  - Kernel-version
  - Uptime och systembelastning

- **Nätverksinformation** (kan stängas av med `--no-network`)
  - IP-adresser och nätverksinterface
  - Routing-tabell (default gateway)

- **Öppna portar och anslutningar**
  - Listar lyssnande portar med `ss`-kommandot
  - Visar protokoll (TCP/UDP) och adresser
  - Kan visa alla aktiva anslutningar med `--all-conns`

- **SUID-filer** (valfritt med `--suid`)
  - Hittar filer med SUID-bit satt
  - Begränsat till de första 20 resultaten

### 3. Utdata
- Sammanfattning i terminalen med tydlig struktur
- Detaljerad logg i `logs/security_scan.log` med boxramar

---

## Systemkrav

### Operativsystem
- **Linux** (testat på Kali Linux)
- Fungerar INTE på Windows eller macOS

### Behörigheter
- Måste köras med **sudo** eller som **root**

### Beroenden
- Python 3.6 eller senare
- Standard Linux-verktyg:
  - `hostname`, `uname`, `uptime`
  - `ip` (från iproute2-paketet)
  - `ss` (från iproute2-paketet)
  - `find`, `bash`

Alla dessa verktyg finns normalt förinstallerade på moderna Linux-distributioner.

---

## Installation

### Rekommenderad installation

```bash
git clone https://github.com/daneljs/Applied-Script.git
cd Applied-Script/projekt
```




---

## Användning

### Grundläggande körning

```bash
sudo ./security_scan.py
```

### Visa hjälptext

```bash
./security_scan.py --help
```

### Flaggor och argument

| Flagga | Beskrivning |
|--------|-------------|
| `-h`, `--help` | Visar hjälptext med alla tillgängliga flaggor |
| `-v`, `--version` | Visar scriptets version och avslutar |
| `--quick` | Snabbare portkontroll med mindre detaljer |
| `--all-conns` | Visa alla anslutningar (även aktiva kopplingar) |
| `--no-network` | Hoppar över nätverkskontroller |
| `--suid` | Kör sökning efter SUID-filer |

### Exempel


```bash
# Snabb scan (mindre detaljer)
sudo ./security_scan.py --quick

# Utan nätverksinformation
sudo ./security_scan.py --no-network

# Visa alla anslutningar (inkl. aktiva)
sudo ./security_scan.py --all-conns

# Inkludera SUID-sökning
sudo ./security_scan.py --suid

# Kombinera flaggor
sudo ./security_scan.py --all-conns --suid

```

---

## Loggfil

All körning loggas till: **`logs/security_scan.log`**

Loggfilen innehåller:
- Tidsstämplar för alla händelser
- Alla körda kommandon med returkoder
- Fullständig output från varje kommando
- Eventuella fel och felmeddelanden

### Exempel på loggformat
```
2025-01-09 14:30:15 - ╔═════════════════════════════════════════════════════════════════
2025-01-09 14:30:15 - ║ SÄKERHETSSCAN STARTAD
2025-01-09 14:30:15 - ╚═════════════════════════════════════════════════════════════════
2025-01-09 14:30:15 - 
2025-01-09 14:30:15 - ═══ SYSTEMINFORMATION ═══
2025-01-09 14:30:15 - 
2025-01-09 14:30:15 - ┌─────────────────────────────────────────────────────────
2025-01-09 14:30:15 - │ KOMMANDO: hostname
2025-01-09 14:30:15 - │ Returkod: 0
2025-01-09 14:30:15 - ├─────────────────────────────────────────────────────────
2025-01-09 14:30:15 - │ ubuntu-server
2025-01-09 14:30:15 - └─────────────────────────────────────────────────────────
```

---

## Felhantering

Scriptet hanterar fel på följande sätt:

- **Ej Linux:** Avslutas med tydligt felmeddelande
- **Ej root:** Avslutas med instruktion om sudo
- **Kommandofel:** Loggas med returkod och felmeddelande
- **Oväntat fel:** Loggas med detaljerad information för felsökning
.

---



**Viktigt att känna till:**

- Scriptet kräver root-behörighet för att kunna läsa all nödvändig systeminformation
- Scriptet gör INGA förändringar i systemet - det är enbart läsande
- Loggfilen kan innehålla känslig information (IP-adresser, öppna portar)
- Loggfiler bör granskas innan de delas eller lagras publikt


---

## Screenshot

Nedan visas en körning av scriptet i terminal:

<img src="screenshot_script.png" width="700">

---

## Roadmap

### Planerad utveckling

**Kortsiktiga mål:**
- Se till att logg blir mer lättläst
- Flagga ovanliga öppna portar

**Långsiktiga mål:**
- Jämföra scanningar över tid (baseline-funktionalitet)
- Stöd för fler operativsystem
- Automatiska varningar för misstänkta SUID-filer
---

## Författare

**Daniel Törnblom**  
IT och Cybersäkerhetsspecialist 2025  
Frans Schartaus Handelsinstitut

---

## Licens

Detta projekt är skapat för utbildningsändamål inom kursen Applied Script.

---

