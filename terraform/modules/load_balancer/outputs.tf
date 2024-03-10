output "my_alb_security_group_id" {
  value = aws_lb.main_alb.id
}

output "target_group_arn" {
  value = aws_lb_target_group.main_tg.arn
}