module "eks" {
  source = "github.com/sahibgasimov/eks-terraform-stable//terraform?ref=main"
  #### EKS Cluster ####
  cluster_name    = "dev"
  cluster_version = "1.29"
  environment     = "dev"
  ##### ALB Ingress Controller and External DNS #####
  external_dns          = "6.20.3"
  alb_ingress           = "1.5.3"
  alb_ingress_image_tag = "v2.5.2"
  csi_driver = "v1.26.0-eksbuild.1"
  ##### Nodes Autoscaling desired instance size #####
  instance_types  = "t3.small"
  desired_size    = 2
  max_size        = 3
  min_size        = 2
  max_unavailable = 1
  ##### Route53 Domain #####
  region         = "us-east-1"
  domain         = "giddychild.com"
  hosted_zone_id = "Z06639231JA5LVJ5MKIMA"
  ##### Networking #####
  vpc_cidr         = "10.0.0.0/16"
  private_subnet_1 = "10.0.0.0/19"
  private_subnet_2 = "10.0.32.0/19"
  private_subnet_3 = "10.0.128.0/19"
  public_subnet_1  = "10.0.64.0/19"
  public_subnet_2  = "10.0.96.0/19"
  public_subnet_3  = "10.0.160.0/19"
  ##### Logs #####
  enable_cluster_log_types = ["api", "authenticator", "audit", "scheduler", "controllerManager"]
}
output "eks" {
  value = module.eks.eks
}
