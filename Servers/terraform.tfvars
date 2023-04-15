aws_region             = "us-east-1"
availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
vpc_id                 = "<vpc_id>"
vpc_security_group_ids = ["<sg_id>"]
ami                    = "ami-050406429a71aaa64"
instance_type          = "t2.micro"
instance_name_list     = ["server-1", "server-2", "server-3", "server-4"]

# tags
cluster = "servers"
os      = "linux"
