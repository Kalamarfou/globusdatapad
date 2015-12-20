# Introduction #

Conventions pour le développement...


# Conventions de nommage #

  * Pour les noms de classes : [CamelCase](http://fr.wikipedia.org/wiki/CamelCase)

# Base de données / DAL #

  * Pour toutes les entités, il faudrait toujours avoir quatre champs supplémentaires :
    * `CreatedAt`
    * `ModifiedAt`
    * `CreatedBy`
    * `ModifiedBy`
    * (ou nom équivalent, sachant que `CreatedAt` et `CreatedBy` ne devraient pas pouvoir être modifiable lors d'une mise à jour de l'entité). Cela donne un minimum de suivi, sans ajouter d'énormes contraintes si l'on veut tracer l'ensemble des changements...