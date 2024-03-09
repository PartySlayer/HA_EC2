resource "aws_lb" "main_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.security_group.security_group_id]
  subnets            = [module.subnets.subnet_ids]
}

resource "aws_lb_listener" "main_lb_listener" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = var.tg_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_tg.arn
  }
}   

resource "aws_lb_target_group" "main_tg" {
  name     = var.tg_name
  target_type = "instance"
  port     = var.tg_port
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}