
postfix mail server with configurable hostname and trusted hosts and proper
shutdown handling

Notes
===

By default, connected rfc1918 networks are detected and allowed. Local networks 
(127.0.0.1, ::1) are also allowed.

Syslog
===

Postfix logs to a syslog server. Unless indicated, no syslog server is configured
or started started. (the phusion baseimage does start a syslog server).

For simplicity, you can bind-mount the one on the host using `-v /dev/log:/dev/log`

Potential Volumes
===

  * `/var/spool/postfix` is the spool directory. Its also where postfix chroots to by default.
  * `/etc/postfix` is the configuration directory

Options
===

You can customize the image behavior using environmental variables or entrypoint
arguments.

Environmental Variable                                       | Entrypoint Option                 | Description
-------------------------------------------------------------|-----------------------------------|-----------------------------
(use `--hostname`)                                           | `--mail-name`                     | Mail name to use (appears in mail headers). Defaults to hostname.
`TRUST="local"`             or `TRUST_LOCAL="0"`             | `--trust-local`                   | Trust addresses on the lo interface. Enabled by default.
`TRUST="connected-rfc1918"` or `TRUST_CONNECTED_RFC1918="1"` | `--trust-connected-rfc1918`       | Trust all locally connected rfc1918 subnets. Enabled by default.
`TRUST="connected"`         or `TRUST_CONNECTED="1"`         | `--trust-connected`               | Trust all addresses connected (excluding IPv6 local-link addresses). Disabled by default.
`TRUST="rfc1918"`           or `TRUST_RFC1918="1"`           | `--trust-rfc1918`                 | Trust all rfc1918 address. Disabled by default.
`TRUST="lla"`               or `TRUST_LLA="1"`               | `--trust-lla`                     | Trust the fe80::/64 IPv6 subnet. Disabled by default.
`TRUST_SUBNETS="*[space separated list of subnets]*"         | `--trust-subnet *[subnet]*`       | Trust the specified subnet (IPv4 and IPv6 supported). Disabled by default.
`TRUST_INTERFACES="*[space separated list of interfaces]*"   | `--trust-interface *[interface]*` | Trust the specified subnet (IPv4 and IPv6 supported). Disabled by default.
                                                             | `--skip-trust-*option*`           | Use with local, connected-rfc1918, connected, rfc1918, or lla to skip trusting it. Disabled by default
                                                             | `--skip-all`                      | Disable/reset all trusts. Disabled by default.
