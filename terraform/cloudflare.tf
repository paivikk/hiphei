provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_token}"
}

resource "cloudflare_zone_settings_override" "default" {
    name = "${var.cloudflare_domain}"
    settings {
        ssl = "flexible"
        always_online = "on"
        always_use_https = "on"
    }
}

resource "cloudflare_record" "www" {
  domain  = "${var.cloudflare_domain}"
  name    = "www"
  value   = "${google_compute_address.default.address}"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "domain" {
  domain  = "${var.cloudflare_domain}"
  name    = "@"
  value   = "${google_compute_address.default.address}"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "force_www" {
  zone = "${var.cloudflare_domain}"
  target = "https://${var.cloudflare_domain}/*"
  priority = 1
  actions = {
    forwarding_url {
      url = "https://www.${var.cloudflare_domain}/$1"
      status_code = "301",
    }
  }
}
