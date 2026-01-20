variable "enable_logging" {
  type        = bool
  default     = true
  description = <<EOF
Enables activity logging for Identity Platform user requests.
This includes sign-ins, sign-ups, password resets, etc.
EOF
}

variable "idp_id" {
  type        = string
  description = <<EOF
ID of the IDP. Possible values include: apple.com, facebook.com, gc.apple.com, github.com, google.com, linkedin.com, microsoft.com, playgames.google.com, twitter.com, yahoo.com.
EOF
}

variable "oauth_client_id" {
  type        = string
  description = <<EOF
The oauth client ID configured in the identity platform.
EOF
}

variable "oauth_client_secret" {
  type        = string
  sensitive   = true
  description = <<EOF
The oauth client secret configured in the identity platform.
EOF
}

variable "authorized_domains" {
  type        = set(string)
  default     = []
  description = <<EOF
A list of domains authorized for OAuth redirects.
EOF
}

variable "allow_tenants" {
  type        = bool
  default     = false
  description = <<EOF
Whether this project can have tenants or not.
EOF
}

variable "default_tenant_location" {
  type        = string
  default     = ""
  description = <<EOF
The default cloud parent org or folder that the tenant project should be created under.
The parent resource name should be in the format of "/", such as "folders/123" or "organizations/456".
If the value is not set, the tenant will be created under the same organization or folder as the agent project.
EOF
}
