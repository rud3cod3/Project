# Architecture Design

## VPC & Subnets
- Created a VPC: `192.168.0.0/24`
- Subnets:
  | Subnet | CIDR          | Type   | AZ          |
  |--------|---------------|--------|------------|
  | Public 1a | 192.168.0.0/26   | Public | ap-south-1a |
  | Public 1b | 192.168.0.64/26  | Public | ap-south-1b |
  | Private 1a | 192.168.0.128/26 | Private| ap-south-1a |
  | Private 1b | 192.168.0.192/26 | Private| ap-south-1b |

## Routing
- Internet Gateway attached to VPC
- Main route table for private subnets
- Public route table for public subnets
- NAT Gateway created in public subnets for private outbound traffic

## Security
- Dedicated security groups for EC2, ALB, and EFS
- Restrictive inbound/outbound rules for all traffic
