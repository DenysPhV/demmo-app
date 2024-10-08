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
│       ├── clone-git.yml 
│       ├── deploy.yml     
│       └── frontend.yml
│
├── ansible/
│   ├── playbook.yml   
│   ├── hosts.ini 
│   ├── nginx.conf
│   ├── prometheus.yml    
│   └── roles/
│       ├── backend/
│       │   └── tasks/main.yml
│       ├── frontend/
│       │   └── tasks/main.yml
│       └── common/
│           └── tasks/main.yml 
│ 
├── infrastructure/
│   ├── ansible.tf
│   ├── import.tf
│   ├── main.tf
│   ├── network.tf
│   ├── outputs.tf  
│   ├── route53.tf   
│   ├── s3.tf 
│   ├── security-groups.tf
│   ├── state-lock-table.tf
│   ├── variables.tf
│   └── versions.tf
│
└── README.md
```

terraform init
terraform plan -var-file=./terraform_push_dev.tfvars
terraform init -migrate-state
terraform apply -var-file=./terraform_push_dev.tfvars
terraform destroy -var-file=./terraform_push_dev.tfvars