
module "eks_nov25" {
  source = "github.com/aumthakkar/eks-nov25.git"

  vpc_cidr    = "10.0.0.0/16"
  aws_region  = "eu-north-1"
  name_prefix = "pht-dev"

  public_subnet_count        = 2
  private_subnet_count       = 2
  autocreate_public_subnets  = true
  autocreate_private_subnets = true

  manual_public_cidr_block  = ["10.0.30.0/24", "10.0.32.0/24"]
  manual_private_cidr_block = ["10.0.33.0/24", "10.0.35.0/24"]

  ssh_access_ip = "0.0.0.0/0"

  # EKS related variables
  cluster_name    = "pht-dev-eks-cluster"
  cluster_version = "1.32"

  endpoint_public_access  = true
  endpoint_private_access = false

  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJUdSWoZx/kv4XPHSBr7yBgnt/DkCiOWUeUHxhAoHdIP"
  key_name   = "mtckey"

  node_group_name = "pht-dev-eks-node-group"

  node_group_ami_type      = "AL2_x86_64"
  node_group_capacity_type = "SPOT"
  node_group_disk_size     = 20
  node_group_instance_type = ["t3.large"]

  desired_nodegroup_size = 1
  max_nodegroup_size     = 1
  min_nodegroup_size     = 1

}