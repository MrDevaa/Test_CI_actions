provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mon_instance" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2
  instance_type = "t2.micro"

  tags = {
    Name = "ServeurHelloWorld"
  }
}


## terraform init       # Initialise le projet
## terraform plan       # Affiche ce qui va être créé
## terraform apply      # Crée l’infrastructure
## terraform destroy    # Supprime tout

 Et ensuite ?
Une fois ton serveur créé avec Terraform, tu peux :

Te connecter en SSH

Installer ton projet avec Ansible

Automatiser avec GitHub Actions