# Project Introduction

An Ansible project designed to provision a Docker Swarm cluster across two nodes and subsequently deploy a comprehensive full-stack application, facilitating the exposure of a Source Code Management (SCM) service, including:

- Logging and monitoring services
- Access via reverse proxy 
- Web Application Firewall (WAF)
- SQL database and administration panel
- Integrated LDAP authentication

## Playbook

The playbook is used to launch various roles, as well as to:

- Set the network configurations permanently on the two target Ubuntu nodes (the storage is accessible from a private network to the nodes).
- Install Docker on the nodes.
- Load and build the custom Gitea image onto the Docker registry created by the dedicated role.

## Roles

Below is a description of the different roles executed by the playbook:

- **swarm**: Initializes a Docker Swarm cluster on the first node and joins the second node.
- **nfs**: Sets up an NFS among the two nodes. Installs and configures the NFS server on the first node and proceeds to install the NFS client and mount it on the second node.
- **registry**: Deploys a Docker registry using Docker Swarm and remotely copies Gitea custom Dockerfiles and buildfiles.
- **deploy_stack**: Deploys the main Docker Swarm stack comprising the following services:
  - **Postgres**: SQL database to support Gitea.
  - **Adminer**: a database management tool.
  - **LDAP server**.
  - **Gitea**: an SCM that relies on Postgres for storage and uses the LDAP server for authentication.
  - **Modsecurity**: a WAF that filters access to Gitea.
  - **Traefik**: a reverse proxy that ensures access to various services.
  - **Node Exporter, cAdvisor, Loki, Promtail, Prometheus, Grafana**: the stack of services for logging and monitoring.
