# demmo-app

![demo-app](https://github.com/user-attachments/assets/88ba8e3c-0121-415d-9190-dd34fbcc3342)

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
│   ├── network.tf
│   ├── outputs.tf     
│   ├── providers.tf 
│   ├── route53.tf
│   ├── s3.tf 
│   ├── security-groups.tf
│   └── variables.tf
│
└── README.md
```