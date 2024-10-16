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
│ 
├── infrastructure/
│   ├── ansible/
│   │   ├── playbook.yml   
│   │   ├── hosts.ini 
│   │   ├── nginx.conf
│   │   ├── prometheus.yml    
│   │   └── roles/
│   │       ├── backend/
│   │       │   └── tasks/main.yml
│   │       ├── frontend/
│   │       │   └── tasks/main.yml
│   │       └── common/
│   │           └── tasks/main.yml
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
*starting infrastructure on aws*
- terraform init
- terraform plan -var-file=./terraform_push_dev.tfvars
- terraform apply -var-file=./terraform_push_dev.tfvars

*entered to instance bastion server, take in console*
ssh -i "mindlab_key.pem" ec2-user@bastion_server_ip

*entered to instance ci cd with ip CI CD server, take in console*
ssh -i "mindlab_key.pem" ec2-user@ci_cd_server_ip

*Uninstalling infrastructure*
- terraform destroy -var-file=./terraform_push_dev.tfvars

### Ansible
- ansible-playbook -i inventory playbook.yml 


### Nginx
- sudo systemctl status nginx
- sudo systemctl reload nginx


