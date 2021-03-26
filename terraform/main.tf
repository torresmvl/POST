terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.6.7"
    }
  }
}

resource "proxmox_lxc" "lxc-alpine" {
  hostname = "terraform-alpine"
  cores    = 1
  memory   = "1024"
  swap     = "2048"
  features {
    nesting = true
  }
  rootfs {
    storage = "local"
    size    = "8G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6    = "dhcp"
  }
  ostemplate   = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz"
  password     = "password"
  target_node  = "buster"
  unprivileged = true
  onboot       = true
  start        = false
}
