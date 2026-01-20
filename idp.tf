resource "google_identity_platform_config" "default" {
  project            = local.project_id
  authorized_domains = var.authorized_domains

  sign_in {
    allow_duplicate_emails = false

    anonymous {
      enabled = false
    }

    email {
      enabled           = true
      password_required = true
    }

    phone_number {
      enabled = false
    }
  }

  multi_tenant {
    allow_tenants           = var.allow_tenants
    default_tenant_location = var.default_tenant_location
  }

  monitoring {
    request_logging {
      enabled = var.enable_logging
    }
  }

  depends_on = [google_project_service.identitytoolkit]
}

resource "google_identity_platform_default_supported_idp_config" "google" {
  idp_id        = var.idp_id
  enabled       = true
  client_id     = var.oauth_client_id
  client_secret = var.oauth_client_secret

  depends_on = [google_identity_platform_config.default]
}
