\## Setup für Entwickler



\### Voraussetzungen

\- Azure CLI installiert

\- Terraform installiert

\- Zugriff auf die Azure Subscription



\### Erste Schritte



1\. \*\*Repository klonen:\*\*

```bash

&nbsp;  git clone 

&nbsp;  cd CloudProgrammingProject/terraform

```



2\. \*\*Azure Login:\*\*

```bash

&nbsp;  az login

&nbsp;  az account set --subscription "221b02a8-00e5-4b5e-82fe-e22383354732"

```



3\. \*\*Umgebungsvariable setzen (PowerShell):\*\*

```powershell

&nbsp;  $env:ARM\_SUBSCRIPTION\_ID = "221b02a8-00e5-4b5e-82fe-e22383354732"

```



4\. \*\*Terraform initialisieren:\*\*

```bash

&nbsp;  terraform init

&nbsp;  terraform plan

```



Fertig! Der Terraform State wird automatisch aus Azure geladen.

