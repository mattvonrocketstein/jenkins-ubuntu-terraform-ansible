provider "aws" {
  region                  = "${var.aws_region}"
  profile                 = "${var.aws_profile}"
}

# Jenkins server
resource "aws_instance" "jenkins" {
  # ubuntu trusty us-east-1
  ami               = "ami-845367ff"
  # az must match ami
  availability_zone = "us-east-1d"
  # high network performance, 8 CPUs, 32GB RAM
  instance_type     = "m4.2xlarge"
  monitoring        = true
  key_name          = "tf-key"
  tags {
    Name = "jenkins-prod"
    App  = "app"
    Env  = "prod"
  }
  security_groups = ["${aws_security_group.jenkins.name}"]
  root_block_device {
    volume_type = "gp2"
    volume_size = "250"
  }
}

resource "aws_security_group" "jenkins" {
  name = "jenkins"
}

# outgoing everything
resource "aws_security_group_rule" "jenkins-out" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins.id}"
}

# incoming http for jenkins web UI
resource "aws_security_group_rule" "jenkins-web-jenkins" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins.id}"
}

# incoming http for luigid for dev/prod
resource "aws_security_group_rule" "jenkins-web-luigid" {
  type            = "ingress"
  from_port       = 8081
  to_port         = 8082
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins.id}"
}

# incoming SSH
resource "aws_security_group_rule" "jenkins-ssh" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.jenkins.id}"
}

# elastic IP for a static address across instance rebuilds
resource "aws_eip" "jenkins-prod" {
  instance = "${aws_instance.jenkins-prod.id}"
}

# give back the EIP address as output
output "jenkins-prod" {
   value = "${aws_eip.jenkins-prod.public_ip}"
}
