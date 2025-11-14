# Testing & Optimization

## Steps
1. Verify load balancing:
   - Access ALB URL multiple times.
   - Ensure traffic is distributed across multiple EC2 instances.
2. Stress test using CPU load:
   - Confirm Auto Scaling spins up new instances as CPU threshold is reached.
3. Verify EFS persistence across instances:
   - Check website content consistency.
4. Confirm HTTPS works properly.
