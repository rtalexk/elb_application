# Tutorial: Implement Elastic Load Balancer in AWS

This tutorial will teach you how to implement an Application Load Balancer using AWS ELB to route traffic among instances in different avaliability zones.

## Architecture

![Architecture](/assets/architecture.png)

## Workflow

The end user makes a request to your application, which is served by a NodeJS web server hosted in an EC2 instance.

There're two instances configured the same way in two different availability zones behind the Load Balancer (ELB). Both the EC2 and the ELB are secured by a Security Group (SG).

The ELB security group is configured to receive traffic from the internet (inbound traffic) and to send requests to the EC2 (outbound traffic). The EC2 security group is configured to receive traffic from the ELB SG (inbound) and to send responses to the internet (outbound).

The Node.js app is running at port 3000 and Nginx is configured as reverse proxy to route requests from port 80 (HTTP) to port 3000 and vice versa.

## Prerequisites

This tutorial asumes you have an AWS account and you've configured AWS credentials for CLI, if you haven't [please do so](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html#post-install-configure).

To follow the procedures in this tutorial you'll need a command line terminal to run commands. Commands are shown as below:

```
(bash) $ command
----------------
output
```

`(bash) $ ` is a constant indicating that is a command running in bash. Everything below `--------------` is the output of the command, or if the command is two or more lines, it will have its own section denoted by **Output:** header.

## Security Groups
