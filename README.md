# ansible-hypervisor

### Passwörter
Für die Installation der virtuellen Maschinen wird ein Passwort benötigt, dass den Zugriff über den virt-manager ermöglicht.
Diese werden im auf dem System, auf dem Ansible ausgeführt wird im ansible-hypervisor Repository in der Datei ``passwords.yml`` abgelegt.

Diese Datei ist [Ansible Vault](https://docs.ansible.com/ansible/playbooks_vault.html) verschlüsselt. Und verbleibt zusätzlich nur lokal. Durch einen Eintrag in ``.gitignore`` wird die Datei vor versehentlichem einchecken ins Git geschützt.

#### Passwortsafe anlegen
Um den Passwortsafe lokal anzulegen muss folgender Befehl in diesem Verzeichnis ausgeführt werden:

```sh
ansible-vault create passwords.yml
```
Anschließend muss das Passwort zum verschlüsseln der Datei angegeben werden. Danach wird die Datei im default Editor geöffnet.

#### Inhalt des Passwortsafes
Je nach dem welche Rollen ausgeführt werden, sollte die ``passwords.yml`` folgende Variablen definieren:

```yml
# Passwort, das bei Installation einer VM für den root Account gesetzt wird (Hinweis: Der Login remote via ssh ist hiermit nicht möglich):
# Das root Passwort sollte zusätzlich mittels md5 gehased sein:
setup_root_pw: password_as_md5_hash
```
