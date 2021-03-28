# DONE

[x] Pages et Navigator

[x] Envoi de données vers Firestore (`AddCompteur()` dans `Firebase.dart`)

[x] Réception de données depuis Firestore (`CompteurInformation()` dans `Firebase.dart`) **MAIS BUG avec le layout utilisé dans le 'body:' du Scaffold /!\ . Si je remplace tout le body par `CompteurInformation()`, ça fonctionne mais c'est moche visuellement.**

[] Mieux comprendre les Layouts et Widgets parents pour débugger le `CompteurInformation()` 

[] Tableaux (DataTable) et Graphiques (chercher une librairie)

[] Comprendre l'arborescence de Firestore pour mieux travailler avec (pour pouvoir query un compteur particulier plutôt que tous)

[] Fusionner les pages Compteurs en une vue commune réutilisable via Index d'une Liste dart



# Erreurs

**Erreur Exception rendering** (query Firebase)
Réception des données Firebase OK, mais erreur d'affichage : Exception de rendering

Corrigé : usage de ListView et map().toList()