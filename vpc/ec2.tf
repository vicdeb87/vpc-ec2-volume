resource "aws_instance" "server2" {
  ami                    = "ami-02f624c08a83ca16f"
  instance_type          = "t2.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = filebase64("setup.sh")

  tags = {
    name = "terraform_instance"
  }

}