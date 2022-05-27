# Autoscaling Group Module Resources

resource "aws_autoscaling_group" "AG" {
  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = var.desired_capacity
  force_delete              = true
  launch_configuration      = var.launch_configuration
  vpc_zone_identifier       = var.subnets
}