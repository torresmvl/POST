# P.O.S.T ~ Power-On Self-Test

There is no BIOS on virtual appliances but this does not mean that one has no configuration to be made and checked on deployments. This repo is a demo with **Vagrant** and **Terraform** (with some **Ansible** help).

---

## Use-cases

This virtual environment was created to test automated deploys of LXC Containers (and/or KVM) on top of ProxmoxVE (our in-house cloud provider) - validating terraform scripts and testing our's **cloud-init** setups. If everything works, these cloud-init setups are deployed with terraform on mainstream public cloud providers where is ours production deployments.

## Pre-requisites

These three apps needs to be installed on yours development machine:

- Oracle VirtualBox
- Hashicorp Vagrant
- Hashicorp Terraform

<sub>Ansible is not needed since Vagrant will provide to the guest VM.</sub>

## Using this repo

Do `vagrant up` and deploy the ProxmoxVE endpoint;

Once deployed, access the PVE web interface and login with root/vagrant user/password pair;

Download the alpine-3.12 LXC template;

Create a Linux Bridge network **vmbr0** with **eth0** (VBox NAT) - note that you won't be able to `vagrant ssh` nor resolve hostnames;

cd into terraform/ folder and do terraform tests.

## Defaults

The VM deployed is based on **debian/buster64** box publicly available on Vagrant Cloud with:

- **4 Gb** RAM

- **2x** vCPU

Private IPv4 address: 192.168.99.12/24
