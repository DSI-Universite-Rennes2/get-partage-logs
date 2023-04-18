# Logs de PARTAGE

[![reuse compliant](https://reuse.software/badge/reuse-compliant.svg)](https://reuse.software/) 
[![Trigger: Shell Check](https://github.com/DSI-Universite-Rennes2/get-partage-logs/actions/workflows/main.yml/badge.svg?event=push)](https://github.com/DSI-Universite-Rennes2/get-partage-logs/actions/workflows/main.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Ce script permet de rapatrier les logs de PARTAGE :

* télécharge les logs compressés non existants en local
* télécharge les logs du jour en mode incrémentiel
* Efface les logs de plus de $MAX_LOG_DAYS jours

Vous pouvez ainsi lancer ce script autant de fois qu'il vous plaira et à la fréquence de votre choix sans risques d'avoir des centaines de gigaoctets transférés. Seul ce qui manque est transféré.

## Utilisation

### Dépendance

* `lftp` 4.8.0 ou +

### Configuration

Copiez le fichier `config-partage-log-dist` en `config-partage-log` et adaptez les variables à votre environnement.

## Contribute

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the [GNU General Public License v3.0 or later](LICENSE)
as published by the Free Software Foundation.

The program in this repository meet the requirements to be REUSE compliant,
meaning its license and copyright is expressed in such as way so that it
can be read by both humans and computers alike.

For more information, see https://reuse.software/
