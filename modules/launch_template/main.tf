resource "aws_launch_template" "launch_template" {

  name = var.lt_name
  
  image_id = var.lt_image_id
  instance_type = var.lt_instance
  key_name = var.lt_key_name
  
  user_data = filebase64("${path.module}/server.sh")

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 8
      volume_type = "gp2"
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [var.security_group_id]
  }
}