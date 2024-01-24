readme lab2

# Présentation
Le cours d'ESN11 set à mettre en oeuvre les connaissance apprise lors du cours de conception conjointe. Le but de ces TP est de se familiariser avec les systèmes basés sur un nios-II. Nous utilisons une carte électronique DE-10 lite qui contient un FPGA. L'objectif de ce lab est de réaliser un compteur sur 3 nombres et d'afficher la valeur de comptage sur des afficheurs 7 segments. Pour cela, nous allons utiliser un timer relié à une interruption. 

# Architecture
Voici l'achitecture de notre système:

![image](https://github.com/ESN2024/lacheze_lab2/assets/147801348/0e5c5e0d-30bb-4dd6-b01c-c66722486693)


Ce design possède 3 pios qui seront reliés aux 7 segments, le timer servira quand à lui à incrémenter la valeur du compteur à afficher sur les 7 segments. Une interruption sera utiliser pour l'incrémentation.

# Design Qsys
Voici le design que j'ai réalisé sur platform designer:

![image](https://github.com/ESN2024/lacheze_lab2/assets/147801348/67e5c314-3897-4f5d-aebb-3798ad965cbe)

On retrouve bien les différents éléments qui ont été décris dans l'architecture du système ainsi que l'interruption du timer qui servira à incrémenter la valeur de comptage. Le timer est envoie une interruption toute les secondes.

# Mise en oeuvre du lab
Après avoir réalisé le design qsys sur platform designer, j'ai crée un fichier vhd qui contient l'instanciation du design. Afin de pouvoir traduire les valeurs de notre code en c vers les afficheurs 7 segments, j'ai crée un fichier bcd_7segment qui va en fonction de la valeur d'entrée, va piloter les broches de l'afficheur 7 segment. J'ai ensuite relié les entrées/sorties du fichier vhd du système aux broches de la carte via Pin Planner. Après Compilation du design sur Quartus, j'ai généré le bsp du système afin de pourvoir utiliser les drivers et fonction liés aux éléments du design qsys (pio7segs , timer, interruption).

## Travail réalisé
Le lab était décomposé en 3 parties:  
-créer un compteur qui compte de 0 à 9 et afficher la valeur sur 1 afficheur 7 segments (sans timer)  
-créer un compteur qui affiche la valeur sur 3 afficheur 7 segments (sans timer)  
-créer un compteur qui affiche la valeur sur 3 afficheur 7 segments (avec timer)  

Pour chaque partie, j'ai réalisé un fichier .c différent et j'ai dut générer un makefile à chaque fois.

### Créer un compteur qui compte de 0 à 9 et afficher la valeur sur 1 afficheur 7 segments (sans timer)

fichier: digit1.c

Ce programme envoie périodiquement une val à l'afficheur 7 segments. Cette valeur est incrémenté toutes les secondes par un delai. A chaque itération de la boucle while, un test est réalisé pour savoir si la valeur est égale à 10; si c'est le cas, la valeur passe à 0.

![image](https://github.com/ESN2024/lacheze_lab2/assets/147801348/4d1747f3-a1cb-4ba1-8b1b-bf9744ffe005)

nb: les valeurs sont en non signé

### Créer un compteur qui affiche la valeur sur 3 afficheur 7 segments (sans timer)

fichier: digit3.c

La fonctionnement de ce programme reprend la même base que pour le compteur à 1 digit, cependant lorsque la valeur de comptage des unités passe de 10 à 0, il incrémente la valeur des dizaines. Le même processus est réalisé pour l'incrémentation de la valeur des centaines.

![image](https://github.com/ESN2024/lacheze_lab2/assets/147801348/305d0162-9b92-473f-888b-63fa1965cf30)

### Créer un compteur qui affiche la valeur sur 3 afficheur 7 segments (avec timer)

fichier: digit3_timer.c

