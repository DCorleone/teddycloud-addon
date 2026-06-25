# TeddyCloud Add-on für Home Assistant (aktuell)

Dieses Add-on läuft TeddyCloud v0.6.8 in Home Assistant – mit IPv6-Fix damit die Weboberfläche korrekt funktioniert.

## Was ist anders als das mrueg-Add-on?
- TeddyCloud v0.6.8 (statt v0.5.4)
- IPv6-Fix in der Nginx-Konfiguration (`127.0.0.1` statt `[::1]`)

## Installation

1. Gehe in HA zu **Einstellungen → Apps → Add-on Store**
2. Klicke auf **⋮ → Repositories**
3. Füge folgende URL hinzu:
   ```
   https://github.com/DEIN_GITHUB_USERNAME/teddycloud-addon
   ```
4. Suche nach **TeddyCloud** und installiere das Add-on

## Konfiguration

Zertifikate: `/config/teddycloud/certs`
Konfiguration: `/config/teddycloud/config`
Daten: `/data/teddycloud/`

## Port 443

Port 443 muss für die Toniebox-Verbindung freigegeben sein.
Falls HA bereits Port 443 belegt, muss dieser umkonfiguriert werden.
