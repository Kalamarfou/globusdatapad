# Architecture générale #

![http://groups-beta.google.com/group/globusdatapad-discuss/web/DesignOverview.png](http://groups-beta.google.com/group/globusdatapad-discuss/web/DesignOverview.png)

# Choix technologiques #

Il a été décidé d’utiliser les technologies Microsoft et notamment le framework .NET 4.0.

  * **DB** (base de données) : SQL Server 2008
  * **DAL** : bibliothèque de classes générée à partir du schéma SQL de la base : `LinqToEntities` (Entity Framework). Responsabilités du DAL :
    * CRUD générique
    * Validation
    * Internationalisation
    * Audit (simple)
  * **Services** : bibliothèque de classes classique
  * **Presentation** :
    * **WebApp** : ASP.NET MVC 2 (contient aussi des vues adaptées aux mobiles)
    * **WebServices** : WCF RESTful WebServices
  * Global services : concerne notamment le logging. A déterminer.

# Questions #

  * [ASP.NET MVC en tant que web services RESTful](http://www.shouldersofgiants.co.uk/Blog/)