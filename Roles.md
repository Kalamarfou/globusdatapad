| **Full name** | **Short name** | **Comment** |
|:--------------|:---------------|:------------|
| Administrator | `Admin`        | Administrateur global / grand manitou |
| Campus Manager | `CampusManager` | Administrateurs des campus |
| Student       | `Student`      | Etudiant    |
| Stakeholder   | `Stakeholder`  | Intervenant |

## SQL ##

**Note : les rôles sont maintenant créés automatiquement lors du démarrage de l'application.**

`INSERT INTO Roles (ShortName, Name, Common_IsDeleted, Common_Audit_CreatedAt, Common_Audit_LastModifiedAt, Common_Audit_CreatedBy, Common_Audit_LastModifiedBy) VALUES (N'Admin', N'Administrator', 'false', '2010-01-01 01:01:01', '2010-01-01 01:01:01', N'System', N'System');`

`INSERT INTO Roles (ShortName, Name, Common_IsDeleted, Common_Audit_CreatedAt, Common_Audit_LastModifiedAt, Common_Audit_CreatedBy, Common_Audit_LastModifiedBy) VALUES (N'CampusManager', N'Campus Manager', 'false', '2010-01-01 01:01:01', '2010-01-01 01:01:01', N'System', N'System');`

`INSERT INTO Roles (ShortName, Name, Common_IsDeleted, Common_Audit_CreatedAt, Common_Audit_LastModifiedAt, Common_Audit_CreatedBy, Common_Audit_LastModifiedBy) VALUES (N'Student', N'Student', 'false', '2010-01-01 01:01:01', '2010-01-01 01:01:01', N'System', N'System');`

`INSERT INTO Roles (ShortName, Name, Common_IsDeleted, Common_Audit_CreatedAt, Common_Audit_LastModifiedAt, Common_Audit_CreatedBy, Common_Audit_LastModifiedBy) VALUES (N'Stakeholder', N'Stakeholder', 'false', '2010-01-01 01:01:01', '2010-01-01 01:01:01', N'System', N'System');`