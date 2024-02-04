# Inception

## Virtual Machine (VM)
A VM is a compute resource that uses software instead of a physical computer to run programs and deploy apps. One or more virtual “guest” machines can run on a single physical “host” machine by using it's hypervisor. Each VM runs its own OS and functions separately from the other VMs, even when they are all running on the same host.

## Container
A Container packages up a single app along with its dependencies. It shared the OS services from the underlying host and isolates the apps using virtual-memory hardware.

## VMs vs Containers
Virtual machines are managed by a hypervisor, whereas Container systems use the same shared OS services from the underlying host. While VMs use tens of GBs, Containers just use tens of Mbs in size.

## Docker
Docker is a type of Container.

## Docker Compose
Docker Compose is used to handle multiple containers. We would need multiple containers when we have more than one service to be taken care of, like when we have an MVC app.
