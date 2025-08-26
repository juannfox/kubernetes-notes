# Kubeastronaut notes

This is a series of notes (dated 2025), concepts and ideas on the topic of [Kubernetes](https://kubernetes.io/), written by a *DevOps* engineer on their road to completion of the [Kubeastronaut](https://www.cncf.io/training/kubestronaut/) certification path (which includes KCNA, KCNS, CKAD, CKA and CKS certifications).

A previous version of this document, dated 2022 (back when I took my first CKA exam), is also [available on this repository](2022-cka-notes-es.md), but written in Spanish and authored by a less experienced version of myself.

<!-- markdownlint-disable-next-line -->
<img src="https://training.linuxfoundation.org/wp-content/uploads/2024/04/kubestronaut-stacked-color.png" alt="Kubeastronaut" width="100" height="100">

## Index

- [Kubeastronaut notes](#kubeastronaut-notes)
  - [Index](#index)
  - [Epilogue](#epilogue)
  - [Kubernetes](#kubernetes)
    - [How Kubernetes came to be](#how-kubernetes-came-to-be)
      - [Containers go way back](#containers-go-way-back)
      - [An obsession with maritime references](#an-obsession-with-maritime-references)
      - [Docker is strongly related](#docker-is-strongly-related)
      - [The Kubernetes revolution](#the-kubernetes-revolution)
    - [Kubernetes and its many flavors](#kubernetes-and-its-many-flavors)
    - [Kubernetes for the brave](#kubernetes-for-the-brave)
    - [The Kubernetes ecosystem - Extensibility](#the-kubernetes-ecosystem---extensibility)
  - [Containers](#containers)
  - [Auto-scaling](#auto-scaling)

## Epilogue

My name is Juan Fox, from Argentina, and as of today (August 2025), when I start jotting down these notes, I am a Certified Kubernetes Administrator with around 4 years of experience with this software, and around 8 years in IT. For a while now, I've been wanting to deepen my knowledge of Kubernetes, this career-changing platform that I love, and the Kubeastronaut certification pack is a great and ambitious way to do that.

I must start my notes with a huge disclaimer: I'm a Kubernetes fanatic and I fear some of that appreciation for the technology might stem some bias into my own writings. I also am but a mundane DevOps Engineer collecting his own thoughts, based on his own experience, so take this with a grain of salt. If you do take time to read this, I appreciate it and I hope it helps, but I have to admit I mostly write these recollections for myself, as I find it to be the best way to learn (that is, to try and explain what you've learned).

## Kubernetes

Kubernetes is, at a very high level, a platform for hosting workloads (applications). What makes it stands out is that it does so by orchestrating containerized versions of those applications. It is also very well established, highly customizable, cloud-native at heart, and open source with a large -and relevant- community behind it.

The original Kubernetes project incubated by [Google](https://about.google), but it was then donated to the [Cloud Native Computing Foundation](https://www.cncf.io/) (CNCF), which is -at the same time- part of the [Linux Foundation](https://www.linuxfoundation.org/), a non-profit organization focused on the growth of open-source technologies.

### How Kubernetes came to be

The following is my own collection of the history behind Kubernetes, with its own biases. A great, very inspiring, documentary on Kubernetes was put together by the **Honeypot.io** team (now acquired by [Xing](https://www.xing.com/)), and is [available on their Youtube channel](https://www.youtube.com/watch?v=BE77h7dmoQU); it is highly recommended.

#### Containers go way back

Although containerized workloads had been around for a while, going back to the year 2000, (with names such as BSD Jail, Solaris Zones, and Linux Containers), they hadn't really revolutionized the market, which [Docker](https://www.docker.com/) and then [Kubernetes](https://kubernetes.io/) would do later on.

#### An obsession with maritime references

Containers being named and conceptually close to the idea of transport containers in real life, the community seems to have taken a like of the maritime jargon for naming their software.

It is so that most software and concepts on the container world utilizes nautical worlds for their names. From Kubernetes, which supposedly means "Helmsman" in Greek, to Helm (the "steering wheel" of a ship) and even Harbor (a port). This certainly makes it fun, and makes up for great logos.

#### Docker is strongly related

In the year 2023, Docker Inc, a startup, launched their "Docker" product, a technology that would greatly simplify running containers, to the point that developers could use this on their day to day basis, preparing isolated environments to run their tests at. Docker actually ran on top of LXC (Linux Containers) and it was only later that they switched to their own container runtime environment written in [Golang](https://go.dev/) (which was around since 2009 and created by Google).

As Docker took off, the folks at Google felt inspired and decided to launch their own open-source container platform, based on their internal workload orchestration platform called "Borg", which they had been using reliably in-house for tailored infrastructure provisioning. They decided to write the tool in Golang as well, and they launched it a year after the Docker release, in 2014; to run containers, nodes were actually using Docker as the container engine (which is no longer the case today).

#### The Kubernetes revolution

While Docker targeted -at least back then- developers as their audience, Kubernetes stood out because it was meant to host production workloads by orchestrating large amounts of containers with seemingly low effort (this might sound unfair considering how complex Kubernetes is, but  believe me, running as many containers without such a noble orchestrator would be certainly impossible). The project quickly caught the attention of the "big fishes" in the industry, such as IBM, Microsoft and Amazon (not to mention Google was already involved), which created an ecosystem of collaboration and gave Kubernetes great traction.

Kubernetes quickly became the golden standard for hosting applications cloud-native fashion, and Docker never left its side, as it positioned itself as the local-development tool behind Kubernetes. In short, you'd build and test containers with Docker, to then host them in Kubernetes.

### Kubernetes and its many flavors

Kubernetes as is, is usually referred to as "pure" or "vanilla", and is rarely ran in that format. In fact, one of Kubernetes' greatest kindnesses, in my view, is its extensibility and customizability: much like you'd do with Legos, you can add your desired components on top of K8S to obtain your ideal stack.

The large Cloud Providers (also referred to as Public Clouds or Hyper-scalers), such as AWS, GCP, Azure and others, where quick to come up with their own PAAS (Platform as a Service) versions of Kubernetes, like EKS, GKE and AKS (respectively). These add value to Kubernetes by seamlessly extending it to harness the power of the Cloud (Virtual Machines, Automatic scaling groups, Block volumes, Software Defined Networking, Load Balancers, etcetera). These are the most commonly used formats of Kubernetes and I refer to them as the different "flavors" of Kubernetes.

### Kubernetes for the brave

Of course some companies might still have their reasons to run Kubernetes on-premises (or at least, self-hosted) and they can certainly do so, at the price of complexity. Running Kubernetes like this is usually referred to as "running it on bare-metal" (although in practice you could still use virtual machines) and requires the company to come up with their own integrations to the different compute needs Kubernetes delegates to the Host-masters/Sysadmins (Load Balancers, Automatic scaling, Persistent Storage, etc).

One of the most famous tutorials on how to do so is called [Kubernetes the hard way](Host-masters/Sysadmins), by Google's Kelsey Hightower (legend in the field of Kubernetes). But, to be honest, that hustle is no longer necessary today (although it makes for great practice): Solutions such as [Rancher](https://www.rancher.com/), [K3S](https://k3s.io/), [K0S](https://k0sproject.io/), and even [Kubernetes' Kubeadm](https://kubernetes.io/es/docs/reference/setup-tools/kubeadm/) with the *Kubernetes in Kubernetes pattern*, make running Kubernetes on-premises a more mundane feat.

### The Kubernetes ecosystem - Extensibility

As I mentioned before, Kubernetes is very extensible, thanks to some very well thought API contracts. Vendors may use these interfaces (such as the Ingress API or the CRD API) to achieve interaction between their own tooling (usually in the form of controllers) and Kubernetes, effectively adding functionalities to a given cluster.

There's a huge ecosystem of software for Kubernetes that achieves a variety of different purposes, far from the core needs of workloads (Storage, Load-balancing and Compute), such as managing public DNS records, synchronizing secrets from a vault, setting up a service mesh, etc. The best place to start when looking for those is probably [the CNCF portfolio](https://www.cncf.io/projects/), but you might also find interesting projects at the [Kubernetes Special Interest Groups](https://github.com/kubernetes-sigs) (SIGs) or even the cloud provider's sites.

Not all extensions are luxury (such as automatic public DNS management), on the contrary, some of those are required for Kubernetes to run properly. Great example of this are the [network plugins](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/) (CNI), responsible for pod networking at the node level, and [CoreDNS](https://coredns.io/), a very solid in-cluster DNS solution to replace Kube-DNS.

## Containers

*Containers* are one of the core components of **Kubernetes** and I expand on these in the [Containers section](containers.md).

## Auto-scaling

The [Auto-scaling section](autoscaling.md) covers automatic *scaling*, a trait (and kindness) of Kubernetes that allows for elastic workloads, at both the cluster and pod levels.
