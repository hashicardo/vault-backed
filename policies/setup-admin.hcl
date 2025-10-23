# Policy for managing Vault configuration via Terraform
# This policy allows the minimum required permissions to configure:
# - AWS Secrets Engine
# - JWT Auth Method
# - Vault Policies

# Manage AWS Secrets Engine mount
path "platform/sys/mounts/aws" {
  capabilities = ["create", "read", "update", "delete"]
}

path "platform/sys/mounts" {
  capabilities = ["read", "list"]
}

# Configure AWS Secrets Engine settings
path "platform/aws/config/root" {
  capabilities = ["create", "read", "update", "delete"]
}

# Manage AWS Secrets Engine roles
path "platform/aws/roles/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List AWS roles
path "platform/aws/roles" {
  capabilities = ["list"]
}

# Manage JWT auth method mount (must be called jwt)
path "platform/sys/auth/jwt" {
  capabilities = ["create", "read", "update", "delete", "sudo"]
}

# List auth methods
path "platform/sys/auth" {
  capabilities = ["read", "list"]
}

# Read and manage JWT auth method tune settings
path "platform/sys/mounts/auth/jwt/tune" {
  capabilities = ["read", "update"]
}

# Configure JWT auth backend
path "platform/auth/jwt/config" {
  capabilities = ["create", "read", "update", "delete"]
}

# Manage JWT auth backend roles
path "platform/auth/jwt/role/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List JWT auth backend roles
path "platform/auth/*/role" {
  capabilities = ["list"]
}

# Manage Vault policies
path "platform/sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# List policies
path "platform/sys/policies/acl" {
  capabilities = ["list"]
}

# Read policy for validation
path "platform/sys/policy/*" {
  capabilities = ["read"]
}

# To authenticate the Terraform provider:
# Allow creating child tokens (required by Terraform Vault provider)
path "auth/token/create" {
  capabilities = ["create", "update"]
}

# Allow looking up token information
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allow renewing the token
path "auth/token/renew-self" {
  capabilities = ["update"]
}

# Optional but recommended: allow revoking self
path "auth/token/revoke-self" {
  capabilities = ["update"]
}