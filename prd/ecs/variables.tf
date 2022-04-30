/***** Common *****/

variable "aws_region" {
  type        = string
  description = "AWS region. Must match region of vpc_id and public_subnet_ids."
  default = "us-west-2"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of ACM SSL certificate"
  default = "arn:aws:acm:us-west-2:996435522985:certificate/f1cb9336-5a7c-4244-9731-281f6ad76da5"
}

variable "cohort" {
  type        = number
  description = "Cohort number used for namespacing"
  default =  1
}

variable "default_tags" {
  type        = map(any)
  description = "Tags"
  default = {
    app = "cyberconnect"
  }
}

variable "deployments" {
  type        = number
  description = "Number of deployments of the module"
  default = 1
}

variable "domain_name" {
  type        = string
  description = "Domain name for ACM SSL certificate. Including TLD."
  default = "cyberconnect.dev"
}

variable "ecs_cluster_name" {
  type        = string
  description = "Name of ECS cluster"
  default = "prd-node-v2"
}

variable "eth_network" {
  type        = map(string)
  description = "Ethereum network"
  default = {
    dev  = "ropsten"
    tnet = "ropsten"
    prod = "mainnet"
  }
}

variable "env" {
  type        = string
  description = "Environment name"
  default = "prod"
}

variable "image_tag" {
  type        = string
  description = "Image tag"
  default = "latest"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet ids for the VPC"
  default = ["subnet-05c9b56287f535c68", "subnet-09751987b7df528b9"]
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of ALB subnet ids"
  default = ["subnet-00565b0cbdc9d5510", "subnet-07dc0efd3e4f13ca2"]
}

variable "s3_bucket_name" {
  type        = string
  description = "Name of S3 bucket to use as a backend for Ceramic and IPFS"
  default = "prd-node-v2"
}

variable "vpc_id" {
  type        = string
  description = "Id of VPC"
  default = "vpc-04c782ab18036532d"
}

variable "vpc_security_group_id" {
  type        = string
  description = "VPC security group id"
  default = "sg-03c521c144751d7cf"
}

/***** Ceramic *****/

variable "ceramic_anchor_service_api_url" {
  type        = string
  description = "URL for Ceramic Anchor Service API"
  default = "https://cas.3boxlabs.com"
}

variable "ceramic_cors_allowed_origins" {
  type        = string
  description = "Web browser CORS allowed origins as stringified regex"
  default     = ".*"
}

variable "ceramic_cpu" {
  type        = number
  description = "vCPU units to allocate to the Ceramic daemon ECS task"
  default     = 4096
}

variable "ceramic_env" {
  type        = string
  description = "Optional. Environment namespace for Ceramic"
  default     = "prod"
}

variable "ceramic_eth_rpc_url" {
  type        = string
  description = "Ethereum RPC URL. Must match anchor service ETH network"
  default = "https://mainnet.infura.io/v3/3914adb8f2b447a59b87715957581b1a"
}

variable "ceramic_efs_logs_fs_id" {
  type        = string
  description = "ID of EFS volume for Ceramic logs"
  default = "fs-0ddf5fa7a79b05bc2"
}

variable "ceramic_efs_logs_fs_name" {
  type        = string
  description = "Name of EFS volume for Ceramic logs"
  default = "prd-node-v2"
}

variable "ceramic_memory" {
  type        = number
  description = "Memory allocation per Ceramic daemon ECS task"
  default     = 16384
}

variable "ceramic_network" {
  type        = string
  description = "Ceramic network"
  default = "elp"
}

variable "ceramic_task_count" {
  type        = number
  description = "Number of Ceramic ECS tasks to run in the ECS service"
  default     = 1
}

/***** IPFS *****/

variable "ipfs_cpu" {
  type        = number
  description = "vCPU units to allocate to the IPFS ECS task"
  default     = 4096 # 1024 = 1 vCPU
}

variable "ipfs_memory" {
  type        = number
  description = "Memory allocation per IPFS API instance"
  default     = 16384
}

variable "ipfs_task_count" {
  type        = number
  description = "Number of IPFS ECS tasks to run in the ECS service"
  default     = 1
}

variable "ipfs_enable_alb_logging" {
  type        = bool
  description = "True to enable ALB logs (stored in a new S3 bucket)"
  default     = false
}

variable "ipfs_default_log_level" {
  type        = string
  description = "IPFS default log level"
  default     = "info"
}

variable "use_existing_ipfs_peer_identities" {
  type        = string
  description = "Use existing IPFS peer identities"
  default     = false
}
