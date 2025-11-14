# AWS Capstone Project - Implementation Guide
This document provides a detailed step-by-step guide to implement the AWS Capstone project with high availability, scalability, resilience, and security.

## 1. EC2 Instance Setup & Custom AMI

### Step 1: Launch EC2
1. Go to the EC2 console and **launch an instance**.
2. Choose your **base AMI** (e.g., Amazon Linux 2).
3. Select **Public Subnet 1a**.
4. Enable **Auto-assign Public IP**.
5. Create or attach a **Security Group**:
   - Initially allow **all traffic** (later restricted for security).
6. Launch the instance.

### Step 2: Install Web Server
SSH into the instance:
```bash
ssh -i your-key.pem ec2-user@<public-ip>


Switch to root:

sudo -i


Install Apache HTTP server:

sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

Step 3: Mount EFS (Elastic File System)

Follow efs_setup.md for full EFS configuration. In brief:

Install EFS utils:

sudo yum install amazon-efs-utils -y


Mount EFS to web directory:

sudo mount -t efs fs-xxxxxxxx:/ /var/www/html


Make mount permanent in /etc/fstab:

fs-xxxxxxxx.efs.ap-south-1.amazonaws.com:/ /var/www/html efs defaults,_netdev 0 0

Step 4: Deploy Website Content

Download and copy the website to /var/www/html:

curl -O https://www.tooplate.com/zip-templates/2124_vertex.zip
unzip 2124_vertex.zip
mv 2124_vertex/* /var/www/html/


Verify content is served by opening the public IP in a browser.

Step 5: Create Custom AMI

After verifying the web server and EFS mount, create an AMI of the EC2 instance.

This AMI will be used for Auto Scaling Launch Templates.

2. Auto Scaling & Launch Template
Step 1: Create Launch Template

Navigate to EC2 > Launch Templates.

Click Create Launch Template:

Use your custom AMI.

Choose instance type (e.g., t2.micro).

Select Key Pair for SSH.

Default network/subnet can be used; later assign private subnets in ASG.

Add UserData script (optional) for automated configuration/testing.

Step 2: Create Auto Scaling Group (ASG)

Go to EC2 > Auto Scaling Groups.

Click Create Auto Scaling Group.

Select the Launch Template created above.

Choose private subnets 1a and 1b.

Configure desired, min, max instances:

Min: 2 (can scale down to 0)

Max: 5 (example, based on load)

Desired: 2

Attach Target Groups (created in ALB setup).

3. Application Load Balancer (ALB) Setup
Step 1: Create Target Groups

Navigate to EC2 > Target Groups.

Create two target groups:

Main-TG → HTTP → port 80

Test-TG → HTTP → port 8080

Target type: Instance.

Register instances later via Auto Scaling Group.

Step 2: Create ALB

Go to EC2 > Load Balancers > Create Load Balancer.

Select Application Load Balancer.

Assign public subnets (1a and 1b).

Configure security group:

Allow HTTP (port 80) from 0.0.0.0/0

Allow custom TCP (port 8080) from your IP

Add listeners:

HTTP → Main-TG

HTTP → Test-TG

Review and create.

Step 3: Connect ALB to ASG

In the ASG, attach both target groups.

Adjust instance numbers to test scaling behavior.

Open ALB DNS URL in a browser to verify load balancing.

4. Security Groups & Hardening
Web Server SG

Allow HTTP from ALB SG only.

Allow custom TCP 8080 from ALB SG only.

Allow SSH from your IP only.

EFS SG

Allow NFS (port 2049) from Web Server SG only.

ALB SG

Allow HTTP from 0.0.0.0/0

Allow TCP 8080 from your IP

5. DNS & SSL Setup
Step 1: Route53

Create a hosted zone in Route53.

Add alias record pointing to the ALB DNS.

Update domain NS records to point to Route53.

Step 2: SSL with Certificate Manager

Request a certificate for your domain.

Validate ownership (DNS validation recommended).

Attach certificate to ALB HTTPS listener.

Test website with HTTPS.

6. Testing & Optimization

Access the ALB URL multiple times to verify traffic distribution.

Simulate load to ensure Auto Scaling launches additional instances.

Check that EFS persistence works across new instances.

Verify HTTPS is working properly.
