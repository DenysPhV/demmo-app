# demmo-app

[demo-app.jpg](image%2Fdemo-app.jpg)

```commandline
demmo-app/
│
├── backend/                     # Clone from github
│
├── frontend/                    # Clone from github
│
├── .github/                     
│   └── workflows/
│       ├── backend.yml       
│       └── frontend.yml
│
├── ansible/
│   ├── playbook.yml   
│   ├── hosts.ini     
│   └── roles/
│       ├── backend/
│       │   └── tasks/main.yml
│       ├── frontend/
│       │   └── tasks/main.yml
│       └── common/
│           └── tasks/main.yml 
│ 
├── terraform-iac/
│   ├── ec2-backend.tf
│   ├── ec2-frontend.tf
│   ├── main.tf
│   ├── outputs.tf     
│   ├── providers.tf 
│   ├── s3.tf 
│   └── variables.tf
│
└── README.md
```