# Outils à utiliser #

  * SQL Server 2008
  * Visual Studio 2010 (ASP.NET MVC 2 est directement inclus dedans)
  * Versionning : Tortoise SVN

# Configuration #

TODO.

# Warning #

Attention à ne **JAMAIS** committer les fichiers suivants :
  * app.config
  * web.config
  * **.suo**

Il faut les marquer comme "ignorés" dans `TortoiseSVN`.
A la place on peut committer des fichiers identiques à votre configuration, par exemple app.config.martin etc