
resource "aws_cloudwatch_metric_alarm" "scale_up_alarm" {
  alarm_name          = "scale-up-alarm"
  alarm_description   = "asg-scale-up-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.upscale_threshold  # Default 50
  dimensions = {
    "AutoScalingGroupName" = var.asg_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_up.arn]
}

resource "aws_cloudwatch_metric_alarm" "scale_down_alarm" {
  alarm_name          = "asg-scale-down-alarm"
  alarm_description   = "asg-scale-down-cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.downscale_threshold # Default 30
  dimensions = {
    "AutoScalingGroupName" = var.asg_name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_down.arn]
}