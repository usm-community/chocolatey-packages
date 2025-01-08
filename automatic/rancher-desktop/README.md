# Rancher Desktop

## Requirements

Rancher Desktop requires the following on Windows:

 - Windows 10 build 1909 or higher. The Home edition is supported.
 - Running on a machine with [virtualization capabilities](https://docs.microsoft.com/en-us/windows/wsl/troubleshooting#error-0x80370102-the-virtual-machine-could-not-be-started-because-a-required-feature-is-not-installed).
 - Persistent internet connection.

Rancher Desktop requires [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) on Windows; this will automatically be installed as part of the Rancher Desktop setup. Manually downloading a distribution is not necessary.

It is also recommended to have:
 - 8 GB of memory
 - 4 CPU

Additional resources may be required depending on the workloads you plan to run.

__Note__: You can use Rancher Desktop as a Non-Admin user on a Windows machine. However, an Admin's intervention is required during the installation process for the below components.

 - __WSL2__ - You need Admin privileges to install WSL2, which is an essential component of Rancher Desktop.
 - __Rancher Desktop Privileged Service__ - You need Admin privileges to install the Rancher Desktop privileged service, which is required to expose applications/services, running inside containers, on all interfaces on the host machine. However, you can skip the installation of the Rancher Desktop Privileged Service with the limitation that you will not be able to expose applications/services on any interface except `127.0.0.1`.



## Kubernetes and Container Management on the Desktop
Rancher Desktop runs Kubernetes and container management on your desktop. You can choose the version of Kubernetes you want to run. You can build, push, pull, and run container images using either containerd or Moby (dockerd). The container images you build can be run by Kubernetes immediately without the need for a registry.


### Container Management

Container management to build, push, and pull images and run containers. It uses the same container runtime as Kubernetes. Built images are immediately available to use in your local workloads without any pushing, pulling, or copying.

### Kubernetes Made Simple

Getting started with Kubernetes on your desktop can be a project. Especially if you want to match the version of Kubernetes you run locally to the one you run in production. Rancher Desktop makes it as easy as setting a preference.

### Built On Proven Projects

Rancher Desktop leverages proven projects to do the dirty work. That includes Moby, containerd, k3s, kubectl, and more. These projects have demonstrated themselves as trustworthy and provide a foundation you can trust.
