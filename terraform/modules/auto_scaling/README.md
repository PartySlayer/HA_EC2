This module creates an autoscaling group and defines 2 SimpleScaling policies: a scale up and a scale down.
The group scales up when the avarage cpu usage reach 50% and down scales when the avarage cpu usage returns back to 30%
