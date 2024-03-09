In this repository will be covered how to setup a high avaiability AWS solution using terraform.

![HA_EC2](https://github.com/PartySlayer/HA_EC2/assets/120326157/458b658c-3cbe-409d-a332-2aec9035190b)

Let's suppose a client needs to put up a website accessible by any amount users 24/7.
Basically the application should be highly available, on a scalable infrastracture.

In order to achieve this, 2 things are strictly required: an Application Load Balancer to manage traffic correctly and an Auto Scaling group to handle workload peaks.

As a best practice for HA, when scaling up the ASgroup spawns the new instance in a different avaiability zone.
Specific details will be provided in each of the modules directory.
