# Terraform Infrastructure for Development VMs

Basic Terraform Infrastructure for spinning up Development VMs on AWS or DigitalOcean

## Requirements

To use this Terraform Infrastructure, you will need to have the following environment variables set:

- `AWS_ACCESS_KEY_ID`: AWS Access Key ID for your account
- `AWS_SECRET_ACCESS_KEY`: AWS Secret Access Key for your account
- `AWS_ACCOUNT_NUMBER`: AWS Account Number
- `DO_TOKEN`: DigitalOcean API Token
- `SSH_FINGERPRINT`: SSH Fingerprint for DigitalOcean

## Spinning up a development VM

### Enable VM Type

To spin up a development VM, enable the type of VM you want in variables.tf:

1. AWS VM (Intel)

For an intel architecture AWS vm set the `enable_aws_amd64_dev` variable to `true`:

```hcl
variable "enable_aws_amd64_dev" {
  type    = bool
  default = true
}
```

2. AWS VM (ARM)

For an arm architecture AWS vm set the `enable_aws_arm64_dev` variable to `true`:

```hcl
variable "enable_aws_arm64_dev" {
  type    = bool
  default = true
}
```

3. Digital Ocean VM (Intel)

For an intel architecture AWS vm set the `enable_do_instance` variable to `true`:

```hcl
variable "enable_do_instance" {
  type    = bool
  default = true
}
```

### Applying changes

To apply the changes from your workstation, run the following commands:

```bash
make apply
```

Alternatively, you can commit your changes to the repository and let the github actions pipeline apply the changes for you.
