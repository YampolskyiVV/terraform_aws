provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "for-task" {
  ami = "ami-28e07e50"
  instance_type = "t2.micro"

  tags {
    Name = "for-task-terraform"
  }
}
