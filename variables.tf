#------------------------------------------------------------------------------
# Misc
#------------------------------------------------------------------------------
variable "name_preffix" {
  description = "Name preffix for resources on AWS"
}

#------------------------------------------------------------------------------
# AWS Networking
#------------------------------------------------------------------------------
variable "vpc_id" {
  description = "ID of the VPC"
}

#------------------------------------------------------------------------------
# AWS ECS SERVICE
#------------------------------------------------------------------------------
variable "ecs_cluster_arn" {
  description = "ARN of an ECS cluster"
}

variable "deployment_maximum_percent" {
  description = "(Optional) The upper limit (as a percentage of the service's desiredCount) of the number of running tasks that can be running in a service during a deployment."
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "(Optional) The lower limit (as a percentage of the service's desiredCount) of the number of running tasks that must remain running and healthy in a service during a deployment."
  type        = number
  default     = 100
}

variable "desired_count" {
  description = "(Optional) The number of instances of the task definition to place and keep running. Defaults to 0."
  type        = number
  default     = 1
}

variable "enable_ecs_managed_tags" {
  description = "(Optional) Specifies whether to enable Amazon ECS managed tags for the tasks within the service."
  type        = bool
  default     = false
}

variable "health_check_grace_period_seconds" {
  description = "(Optional) Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 2147483647. Only valid for services configured to use load balancers."
  type        = number
  default     = 0
}

variable "ordered_placement_strategy" {
  description = "(Optional) Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. The maximum number of ordered_placement_strategy blocks is 5. This is a list of maps where each map should contain \"id\" and \"field\""
  type        = list
  default     = []
}

variable "placement_constraints" {
  type        = list
  description = "(Optional) rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. This is a list of maps, where each map should contain \"type\" and \"expression\""
  default     = []
}

variable "platform_version" {
  description = "(Optional) The platform version on which to run your service. Defaults to 1.4.0. More information about Fargate platform versions can be found in the AWS ECS User Guide."
  default     = "1.4.0"
}

variable "propagate_tags" {
  description = "(Optional) Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION. Default to SERVICE"
  default     = "SERVICE"
}

variable "service_registries" {
  description = "(Optional) The service discovery registries for the service. The maximum number of service_registries blocks is 1. This is a map that should contain the following fields \"registry_arn\", \"port\", \"container_port\" and \"container_name\""
  type        = map
  default     = {}
}

variable "task_definition_arn" {
  description = "(Required) The full ARN of the task definition that you want to run in your service."
}

variable "force_new_deployment"{
  description = "(Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g. myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered_placement_strategy and placement_constraints updates."
  type = bool
  default = false
}

#------------------------------------------------------------------------------
# AWS ECS SERVICE network_configuration BLOCK
#------------------------------------------------------------------------------
variable "public_subnets" {
  description = "The public subnets associated with the task or service."
  type        = list
}

variable "private_subnets" {
  description = "The private subnets associated with the task or service."
  type        = list
}

variable "security_groups" {
  description = "(Optional) The security groups associated with the task or service. If you do not specify a security group, the default security group for the VPC is used."
  type        = list
  default     = []
}

variable "assign_public_ip" {
  description = "(Optional) Assign a public IP address to the ENI (Fargate launch type only). If true service will be associated with public subnets. Default false. "
  type        = bool
  default     = false
}

#------------------------------------------------------------------------------
# AWS ECS SERVICE load_balancer BLOCK
#------------------------------------------------------------------------------
variable "container_name" {
  description = "Name of the running container"
}

#------------------------------------------------------------------------------
# AWS ECS SERVICE AUTOSCALING
#------------------------------------------------------------------------------
variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
}

variable "max_cpu_threshold" {
  description = "Threshold for max CPU usage"
  default = "85"
  type = string
}
variable "min_cpu_threshold" {
  description = "Threshold for min CPU usage"
  default = "10"
  type = string
}

variable "max_cpu_evaluation_period"{
    description = "The number of periods over which data is compared to the specified threshold for max cpu metric alarm"
    default = "3"
    type = string
}
variable "min_cpu_evaluation_period"{
    description = "The number of periods over which data is compared to the specified threshold for min cpu metric alarm"
    default = "3"
    type = string
}

variable "max_cpu_period"{
    description = "The period in seconds over which the specified statistic is applied for max cpu metric alarm"
    default = "60"
    type = string
}
variable "min_cpu_period"{
    description = "The period in seconds over which the specified statistic is applied for min cpu metric alarm"
    default = "60"
    type = string
}

variable "scale_target_max_capacity" {
  description = "The max capacity of the scalable target"
  default = 5
  type = number
}

variable "scale_target_min_capacity" {
  description = "The min capacity of the scalable target"
  default = 1
  type = number
}

#------------------------------------------------------------------------------
# AWS LOAD BALANCER
#------------------------------------------------------------------------------
variable "lb_arn" {
  description = "Load Balancer ARN"
  type        = string
}

variable "lb_http_tgs_arns" {
  description = "List of HTTP LB Target Group ARNs"
  type        = list(string)
}

variable "lb_https_tgs_arns" {
  description = "List of HTTPS LB Target Group ARNs"
  type        = list(string)
}

variable "lb_http_listeners_arns" {
  description = "List of HTTP LB Listeners ARNs"
  type = list(string)
}

variable "lb_https_listeners_arns" {
  description = "List of HTTPS LB Listeners ARNs"
  type = list(string)
}

variable "load_balancer_sg_id" {
  description = "The ID of the security group of the Load Balancer. This is to allow traffic only from Load Balancer"
  type        = string
}
