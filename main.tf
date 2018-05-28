provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "for-task" {
  ami = "ami-e251209a"
  instance_type = "t2.micro"
  key_name = "your_key_pair_name"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags {
    Name = "for-task-terraform"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("path_to_your_privat_key.pem")}"
    timeout = "3m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }

}

resource "aws_security_group" "instance" {
  name = "for-task-terraform-instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "public_ip" {
  value = "${aws_instance.for-task.public_ip}"
}
