# Implementation Steps

### EC2 & AMI

1. Launch an EC2 instance in Public Subnet 1a with auto-assign public IP.

2. Security Group: Allow all traffic initially.

3. Install Apache HTTP server:
   ```bash
   sudo yum install httpd -y
   sudo systemctl start httpd
   sudo systemctl enable httpd

4. Connect EFS (see efs_setup.md for details).

5. Copy website content to /var/www/html:
    '''bash
    curl -O https://www.tooplate.com/zip-templates/2124_vertex.zip
    unzip 2124_vertex.zip
    mv 2124_vertex/* /var/www/html/

6. Reboot to verify EFS mount.

7. Create a custom AMI for autoscaling.

### Auto Scaling & Launch Template

1. Create Launch Template using the custom AMI.
2. Attach UserData script for testing environment.
3. Create Auto Scaling Group across private subnets.
4. Configure minimum, maximum, and desired instance counts.

### ALB Setup

1. Create Target Groups:
    HTTP: Port 80
    Test: Port 8080

2. Attach target groups to Auto Scaling Group.

3. Verify traffic distribution using ALB URL.

### **4. efs_setup.md**

```markdown
# EFS Setup & Mounting

## Steps
1. Enable DNS hostnames in VPC.
2. Create Security Group for EFS: allow all traffic for testing.
3. Create EFS in a public subnet and attach the SG.
4. On EC2, install Amazon EFS utils:
   ```bash
   sudo yum install amazon-efs-utils -y

5. Mount EFS:

sudo mount -t efs fs-xxxxxxxx:/ /var/www/html

6. Make mount permanent by editing /etc/fstab:

fs-xxxxxxxx.efs.ap-south-1.amazonaws.com:/ /var/www/html efs defaults,_netdev 0 0

### **5. security_dns.md**

```markdown
# Security & DNS Setup

## Security Groups
- **ALB SG**
  - Allow HTTP from 0.0.0.0/0, port 80
  - Allow TCP 8080 from your IP
- **Web Server SG**
  - Allow HTTP/8080 from ALB SG
  - Allow SSH from your IP
- **EFS SG**
  - Allow NFS port 2049 from Web Server SG

## Route 53
1. Create hosted zone.
2. Add alias record pointing to ALB DNS.
3. Update domain NS records to Route53.
4. Use AWS Certificate Manager to create SSL.
5. Add HTTPS listener to ALB and attach target groups.


