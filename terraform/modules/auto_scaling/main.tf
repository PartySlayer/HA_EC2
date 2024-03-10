
resource "aws_autoscaling_group" "main_asg" {
  name                      = var.asg_name
  max_size                  = var.asg_max        # Default 5
  min_size                  = var.asg_min        # Default 2
  health_check_type         = "ELB"
  desired_capacity          = var.asg_capacity   # Default 2
  target_group_arns         = [module.load_balancer.target_group_arn]

  vpc_zone_identifier       = [module.subnets.subnet_ids]
  
  launch_template {
    id      = module.launch_template.launch_template_id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale_up"
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.main_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = var.scale_up_adjust          # Default 1
  cooldown               = var.scale_up_cooldown        # Default 300
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down"
  policy_type            = "SimpleScaling"
  autoscaling_group_name = aws_autoscaling_group.main_asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = var.scale_down_adjust        # Default -1
  cooldown               = var.scale_down_cooldown      # Default 300
  
}