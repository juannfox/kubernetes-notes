# Kubeastronaut notes
This is a series of notes, concepts and ideas on the topic of Kubernetes, written by a DevOps engineer on their road to completion of the Kubeastronaut certification path (which includes KCNA, KCNS, CKAD, CKA and CKS certifications).

## Epilogue
My name is Juan Fox, from Argentina, and as of today (August 2025), when I start jotting down these notes, I am a Certified Kubernetes Administrator with around 4 years of experience with this software, and around 8 years in IT. For a while now, I've been wanting to deepen my knowledge of Kuberntes, this career-changing platform that I love, and the Kubeastronaut certification pack is a great and abmitious way to do that.

## Containers

### What a container is
A *container*, in software, is a way to ship and run applications in an isolated and lightweight manner. It means running your application with its minimal requirements (dependencies and such), without a kernel (or virtualization), but still as an isolated process from the rest of their host machine.

Containers are run in isolation by using a feature called [Linux namespaces](https://www.redhat.com/en/blog/7-linux-namespaces) (and no, these are not Kubernetes namespaces). These allow to share host resources (such as CPU, RAM, I/O and network) to different processes, but in complete isolation of each other. In short, a container "sees" all the host, but is isolated from the rest of the processes and is limited to a given and dedicated resource quota.

### OCI - The standard
The [Open Container Initiative](https://opencontainers.org/) (OCI) is an industry standard defined by an open governance group of stakeholders (like Docker), which defines the specifications for working with containers, what they call the "runtime-spec", "the image-spec" and the "distribution spec".

### Container images - The recipes

A container image is much like a cooking recipe for baking "a specific container", as it defines the ingredients (files, dependencies, etc) and how to use them (run them). This is a specification defined by OCI and even though an "image" sounds much like a binary, a *container image* is really an archive containing a couple of JSON files defining the internal structure (index and manifest), and a bunch of -clearly identified (by checksum)- layers as binary (tarball) files, which contain the files for the container.

### How containers run - Container runtimes and engines
A container is ran by a *container runtime*, a software that can execute *container images* based on a specification they contain (on how to run them). So the *runtime* is the platform on top of which *containers* are run, and the most popular offering is [runc](https://github.com/opencontainers/runc). Other options are [Kata](https://katacontainers.io/) (which runs an hybrid between a container and a VM) and [gVisor](https://gvisor.dev/docs/) (which provides a sandbox-like interface between containers and their hosts), the two of which are considered more secure at the cost of lower performance.

To then manage those containers, a *container engine* is used, which simplifies running many containers on top of a *runtime* by providing us with an interface. This is where names like [Docker](https://www.docker.com/), [Podman](https://podman.io/) and [Containerd](https://containerd.io/) come in as offerings, but still no mention of [Kubernetes](https://kubernetes.io/es/), as the latter performs *container orchestration* on top of an engine.

### Container registries
A *container registry* is a repository for *container images*, that offers an interface for pulling (downloading) or pushing (uploading) these, as a means to provide an ecosystem to share and distribute them. In short, *registries* are servers that store *container images* for distribution. Since servers can vary and images too, an FQCN (similar to the FQDN in networking, fully-qualified-container-image-name) is used as a combination of the *registry* domain and the *image* name, for example "docker.io/nginx".

The most commonly known *container registry* is [Docker Hub](https://hub.docker.com/), but other public registries have been getting popular, like Microsoft's [MCR](https://mcr.microsoft.com/) or Amazon's [ECR](https://aws.amazon.com/es/ecr/). Even self-hosted (private) alternatives like [Harbor](https://goharbor.io/) or [Artifactory](https://jfrog.com/artifactory/) are available.
