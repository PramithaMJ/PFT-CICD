# SERVER1: 'MASTER-SERVER' (with Jenkins, Docker, Ansible, Trivy)
# CREATING A SECURITY GROUP FOR JENKINS SERVER
# Allow SSH, HTTP, HTTPS, 8080, 8081
resource "aws_security_group" "my_security_group1" {
  name        = "my-security-group1"
  description = "Allow SSH, HTTP, HTTPS, 8080 for Jenkins "

  # SSH Inbound Rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# CREATE AN JENKINS EC2 INSTANCE USING EXISTING PEM KEY
resource "aws_instance" "my_ec2_instance1" {
  ami                    = "ami-0cf10cdf9fcd62d37"
  instance_type          = "t2.medium"
  vpc_security_group_ids = [aws_security_group.my_security_group1.id]
  key_name               = "PFT" # key-name here, of the pem-key  created

  # Consider EBS volume 30GB
  root_block_device {
    volume_size = 30    # Volume size 30 GB
    volume_type = "gp2" # General Purpose SSD
  }

  tags = {
    Name = "MASTER-SERVER"
  }

  # USING REMOTE-EXEC PROVISIONER TO INSTALL TOOLS
  provisioner "remote-exec" {
    # ESTABLISHING SSH CONNECTION WITH EC2
    connection {
      type        = "ssh"
      private_key = file("./PFT.pem") #  key-name 
      user        = "ec2-user"
      host        = self.public_ip
    }

    inline = [
      # wait for 200sec before EC2 initialization
      "sleep 200",
      # Install Git 
      "sudo yum install git -y",

      # Install Node.js and npm
      # REF: https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
      "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash",
      "source ~/.bashrc",
      "nvm install node",
      "node -v",
      "npm -v",
      
      # Install Jenkins 
      # REF: https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key",
      "sudo yum install java-17-amazon-corretto -y",
      "sudo yum install jenkins -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",

      # Install Docker
      # REF: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html
      "sudo yum update -y",
      "sudo yum install docker -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker jenkins",
      # To avoid below permission error
      # Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
      "sudo chmod 666 /var/run/docker.sock",

      # Install Trivy
      # REF: https://aquasecurity.github.io/trivy/v0.18.3/installation/
      "sudo rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.rpm",

      # Install Ansible
      "sudo yum update -y",
      "sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y",
      "sudo yum install git python python-devel python-pip openssl ansible -y",
    ]
  }
}

# STEP3: OUTPUT PUBLIC IP OF EC2 INSTANCE
output "ACCESS_YOUR_JENKINS_HERE" {
  value = "http://${aws_instance.my_ec2_instance1.public_ip}:8080"
}

output "Jenkins_Initial_Password" {
  value = "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
}

# STEP4: OUTPUT PUBLIC IP OF EC2 INSTANCE
output "MASTER_SERVER_PUBLIC_IP" {
  value = aws_instance.my_ec2_instance1.public_ip
}

# STEP5: OUTPUT PRIVATE IP OF EC2 INSTANCE
output "MASTER_SERVER_PRIVATE_IP" {
  value = aws_instance.my_ec2_instance1.private_ip
}
