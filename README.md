# FxManager
- Script simple a utiliser vous pouvez le placer ou vous voulez mais  a coter de votre `server-data` est mieux.
- Vous devez installer manuellement votre serveur fivem ce script ne peut pas encore le faire pour vous.
- FxManager détecte si un serveur en cours d'exécution si ce n'est pas le cas il vous propose de le lancer.

### Prérequis
- [Screen](https://doc.ubuntu-fr.org/screen "Screen") 

`sudo apt install screen`

- [Tar](https://doc.ubuntu-fr.org/tar "Tar") (Déjà installer sur la pluspart des distribution basé debian)

`sudo apt install xz-utils`


###### Vous devez remplacer les valeurs des variables suivantes:
```
screenName="fxServerDev"    # Nom de la session screen
data="/home/$USER/fxdev/server-data"     # Chemin server-data
pathServer="/home/$USER/fxdev"       # Chemin de la racine du serveur
cache="/home/$USER/fxdev/server-data/cache"     #Chemin du cache serveur
```

|Commande        |Raccourci     |Description                  |
|----------------|--------------|-----------------------------|
|`start`         |`st`          |Démarre le serveur           |
|`stop`          |`sp`          |Eteint le serveur            |
|`reboot`        |`r`           |Redémarrer le serveur        |
|`console`       |`c`           |Affiche la console           |
|`quit`          |`q`           |Quitte FxManager             |
|`update`        |`u`           |Mise à jour serveur          |

--------

Vous pouvez utiliser et modifier ce code à votre guise. Cependant, ne prétendez jamais que c'est votre propre code et fournissez toujours un crédit approprié. Je ne vous aiderai cependant pas si vous souhaitez modifier mon code.
