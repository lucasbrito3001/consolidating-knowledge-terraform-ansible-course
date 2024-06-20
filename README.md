# Improving knowledge in Terraform and Ansible

<img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white">
<img src="https://img.shields.io/badge/Ansible-000000?style=for-the-badge&logo=ansible&logoColor=white">
<img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue">

This project was created just to consolidate my knowledge learned in a course about Terraform and Ansible, from Alura.

- My certificate link: https://cursos.alura.com.br/certificate/2c316980-7913-45fe-bf7a-1ca1ac53efc8?lang=pt_BR

This project uses Terraform to provision an AWS EC2 instance, Ansible to configure and prepare the environment to run applications and Python to create just a sample app to run in the system.

How to use the project:

1. Apply terraform:
   - Connect to AWS and create an EC2 key pair
   - Connect to AWS CLI into your machine
   - Create a tfvars file in the _terraform_ directory to configure the variables from _terraform/variables.tf_
   - Apply terraform code to privision your infrastructure, using the code: `cd terraform; terraform apply -var-file <your-file.tfvars>`
   - Save the instance public IP output
2. Run ansible playbook:
   - Add the saved public IP to the file ./ansible/hosts.yml below _[apps-vm0]_
   - Download the EC2 key pair created in the first step
   - Run the ansible playbook, using the code: `cd ansible; ansible-playbook playbooks/setup-apps-vms.yml -u ubuntu --private-key <path-to-your-ec2-key-pair.pem> -i hosts.yml`

Once this is done, you'll be able to access the sample python app through the EC2 instance public IP or public DNS at the /api endpoint.

That's all, folks!
