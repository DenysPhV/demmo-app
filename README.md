# demmo-app

![demo-app](https://github.com/user-attachments/assets/88ba8e3c-0121-415d-9190-dd34fbcc3342)

```
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
│   ├── nginx.conf    
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

terraform init
