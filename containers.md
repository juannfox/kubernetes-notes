# Containers

## Index

- [Containers](#containers)
  - [Index](#index)
  - [What a container is](#what-a-container-is)
  - [OCI - The standard](#oci---the-standard)
  - [Container images - The recipes](#container-images---the-recipes)
    - [Dissecting a container image](#dissecting-a-container-image)
  - [How containers run - Container runtimes and engines](#how-containers-run---container-runtimes-and-engines)
    - [Logging](#logging)
  - [Container registries](#container-registries)

## What a container is

A *container*, in software, is a way to ship and run applications in an isolated, lightweight and reproducible manner. It means running your application with its minimal requirements (dependencies and such), without a kernel (or virtualization), but still as an isolated process from the rest of their host machine; given the latter, they offer a performance improvement when compared to virtual machines. Additionally, these are usually considered ephemeral, because their status does not persist when they are stopped, but an identical container can be ran again by using the same *image* (defined later on).

Containers are run in isolation by using a feature called [Linux namespaces](https://www.redhat.com/en/blog/7-linux-namespaces) (and no, these are not Kubernetes namespaces). These allow to share host resources (such as CPU, RAM, I/O and network) to different processes, but in complete isolation of each other. In short, a container "sees" all the host, but is isolated from the rest of the processes and is limited to a given and dedicated resource quota.

## OCI - The standard

The [Open Container Initiative](https://opencontainers.org/) (OCI) is an industry standard defined by an open governance group of stakeholders (like Docker), which defines the specifications for working with containers, what they call the "runtime-spec", "the image-spec" and the "distribution spec".

## Container images - The recipes

A *container image* is an *artifact* that acts like a cooking recipe for baking "a specific container", as it defines the ingredients (files) and how to use them (run them). This is a [specification defined by OCI](https://specs.opencontainers.org/image-spec/) and even though an "image" sounds much like a binary, a *container image* is really an archive containing a couple of *JSON* files with metadata and definitions of the internal structure (manifest and config), and a bunch of -clearly identified (by checksum)- layers as binary (tarball) files, which contain the files for the container.

Note: The multiple references by checksum of the components of an image are part of what OCI calls [descriptors](https://github.com/opencontainers/image-spec/blob/main/descriptor.md) and is purposely structured as a [Hash/Merkle tree](https://github.com/opencontainers/image-spec/blob/main/descriptor.md), which is great for validating data blocks transferred over the network. After all, each layer has its [checksum](https://en.wikipedia.org/wiki/Checksum) (go-to for data integrity validations) calculated, and checksums are unique, so exchanging checksums in advance allows for verifying content upon reception. The sha256 checksum of layers and files on an OCI image is called *digest*.

Visual representation:

<!-- markdownlint-disable-next-line -->
```
+-------------------------------------------------------+
|           OCI Container Image (Tarball)               |
|                                                       |
|  +--------------------+                               |
|  |#### Layer 2 #######|                               |
|  |####################|          < manifest.json >    |
|  |#### Tarball #######|           < config.json >     |
|  |####################|                               |
|  +--------------------+                               |
|  +----------------------------+                       |
|  |#### Layer 1 ###############|                       |
|  |############################|                       |
|  |##### Tarball ##############|                       |
|  |############################|                       |
|  +----------------------------+                       |
|                                                       |
+-------------------------------------------------------+
```

Each file within an image is annotated with a *media type* marker which defines which kind of file it is, out of a series of supported file types. This is important later on, when distributing images and files over the OCI distribution protocol (see [distribution-spec](https://specs.opencontainers.org/distribution-spec/?v=v1.0.0)). For example:

```json
{
  "mediaType": "application/vnd.oci.image.layer.v1.tar"
}
```

Unlike distributing OS images like we do for virtual machines, distributing images is much lighter, as the kernel is not part of the container. A container will only carry what's necessary (ideally) and for the rest rely on the host, which is visible to it as for any other normal process.

Regarding containers and security, given how easily collapsible container images are, it is never a good idea to store secrets in them. On the contrary, good practices are to provide secrets as either environment variables or mounted files, when running the container.

### Dissecting a container image

If we were to dissect (open up) a container image, we would find a bundle of JSON files and Tarball archives.

For example, for my custom image built with the following *Dockerfile* spec:

```dockerfile
FROM ubuntu
RUN echo "myfile" > /tmp/myfile.txt
```

I can save it to disk -as a tarball- and then extract it:

```bash
docker image save myimage -o myimage.tar.gz
tar -xvzf myimage.tar.gz
```

The -flat- extracted file list is as follows:

> blobs/sha256/4469d3893cf76a349c08068b3600...
> blobs/sha256/86b5d322767a8bd09f25aee78420...
> blobs/sha256/9c15b6bd680f4a96c4bef1053356...
> blobs/sha256/a68c43eed2b11c251a33f9f44954...
> blobs/sha256/c3e16085e262e1e87b20cc9df8c1...
> blobs/sha256/d0add65ade11532622d2bd75b763...
> index.json
> manifest.json
> oci-layout
> repositories

Where the *manifest* is the metadata and structure of the image, gluing it all together. It:

- Points to the *config* (another JSON file)
- Enumerates the binary layers (archive files) and their unique SHA256 checksums
- Adds some metadata

Example of the `manifest.json`:

```json
[
  {
    "Config": "blobs/sha256/a68c43eed2b11c251a33f9f44954f32341b3f4b4ed4f0f3d462cde4233e2e70f",
    "Layers": [
      "blobs/sha256/9c15b6bd680f4a96c4bef1053356e5b8c571567bb4f7d62c7c135efa18a4cfcc",
      "blobs/sha256/d0add65ade11532622d2bd75b7639be153ab4a92db9e2718902eb11aa50a77a7"
    ],
    "LayerSources": {
      "sha256:9c15b6bd680f4a96c4bef1053356e5b8c571567bb4f7d62c7c135efa18a4cfcc": {
        "digest": "sha256:9c15b6bd680f4a96c4bef1053356e5b8c571567bb4f7d62c7c135efa18a4cfcc",
        "mediaType": "application/vnd.oci.image.layer.v1.tar",
        "size": 103187456
      },
      "sha256:d0add65ade11532622d2bd75b7639be153ab4a92db9e2718902eb11aa50a77a7": {
        "digest": "sha256:d0add65ade11532622d2bd75b7639be153ab4a92db9e2718902eb11aa50a77a7",
        "mediaType": "application/vnd.oci.image.layer.v1.tar",
        "size": 2560
      }
    },
    "RepoTags": [
      "myimage:latest"
    ]
  }
]
```

The *index* is optional and is only present when images are multi-architecture, meaning they're built for multiple processor architectures, with certain different setups for each. It simply points to the *config* file for a given CPU architecture, e.g.:

```json
{
  "manifests": [
    {
      "annotations": {
        "io.containerd.image.name": "docker.io/library/myimage:latest",
        "org.opencontainers.image.ref.name": "latest"
      },
      "digest": "sha256:4469d3893cf76a349c08068b3600c3b429cfe9a9aab93bacf211f2b123b7b5e6",
      "mediaType": "application/vnd.oci.image.manifest.v1+json",
      "size": 553
    }
  ],
  "mediaType": "application/vnd.oci.image.index.v1+json",
  "schemaVersion": 2
}
```

The `oci-layout` simply defines the version OCI layout version: `{"imageLayoutVersion": "1.0.0"}`.

Once inside the `blob/sha256` folder (*blob* stands for *binary large object*), the *config* -JSON- file will be present, but its name will be a checksum, as referenced to in the *manifest*'s `.[].Config` field. It will define things like:

- The architecture of the CPU
- The command to start the container
- Environment variables
- The layers of the filesystem by checksum (blobs)

```json
{
    "architecture": "arm64",
    "config": {
        "Cmd": [
            "/bin/bash"
        ],
        "Env": [
            "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        ],
        "Labels": {
            "org.opencontainers.image.ref.name": "ubuntu",
            "org.opencontainers.image.version": "24.04"
        }
    },
    "created": "2025-08-17T13:42:03.302324883Z",
    "history": [
        {
            "created": "2025-07-30T07:00:50.822696405Z",
            "created_by": "/bin/sh -c #(nop)  ARG RELEASE",
            "empty_layer": true
        },
        {
            "created": "2025-07-30T07:00:50.866880184Z",
            "created_by": "/bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH",
            "empty_layer": true
        },
        {
            "created": "2025-07-30T07:00:50.90683424Z",
            "created_by": "/bin/sh -c #(nop)  LABEL org.opencontainers.image.ref.name=ubuntu",
            "empty_layer": true
        },
        {
            "created": "2025-07-30T07:00:50.946168009Z",
            "created_by": "/bin/sh -c #(nop)  LABEL org.opencontainers.image.version=24.04",
            "empty_layer": true
        },
        {
            "created": "2025-07-30T07:00:53.361135831Z",
            "created_by": "/bin/sh -c #(nop) ADD file:e189629238f69759e9c6cb1cac039ece646eeecb640e5eb670e5cf92543b46fb in / "
        },
        {
            "created": "2025-07-30T07:00:53.654640153Z",
            "created_by": "/bin/sh -c #(nop)  CMD [\"/bin/bash\"]",
            "empty_layer": true
        },
        {
            "comment": "buildkit.dockerfile.v0",
            "created": "2025-08-17T13:42:03.302324883Z",
            "created_by": "RUN /bin/sh -c echo \"myfile\" \u003e /tmp/myfile.txt # buildkit"
        }
    ],
    "os": "linux",
    "rootfs": {
        "diff_ids": [
            "sha256:9c15b6bd680f4a96c4bef1053356e5b8c571567bb4f7d62c7c135efa18a4cfcc",
            "sha256:d0add65ade11532622d2bd75b7639be153ab4a92db9e2718902eb11aa50a77a7"
        ],
        "type": "layers"
    },
    "variant": "v8"
}
```

If we look at the actual *blobs*, meaning those files in the folder that are actually binaries (and not JSON files), they'll match with the *layers* declared by the *manifest* and *config*, and they'll be nothing but archives (Tarballs); each will contain a content diff (differential or delta) on top of the previous layer.

For example, looking at the first and largest layer:

```bash
tar -xvzf 9c15b6bd680f4a96c4bef1053356e5b8c571567bb4f7d62c7c135efa18a4cfcc
```

Outputs:

> bin
> boot/
> dev/
> etc/.pwd.lock
> etc/alternatives/README
> etc/alternatives/awk
> etc/alternatives/nawk
> etc/alternatives/pager
> etc/alternatives/rmt
> etc/alternatives/which
> etc/apt/apt.conf.d/01-vendor-ubuntu
> ...

The second layer actually contains the file I added as part of my *Dockerfile* on top of the base image layer:

```bash
tar -xvzf d0add65ade11532622d2bd75b7639be153ab4a92db9e2718902eb11aa50a77a7
```

Outputs:

> x tmp/myfile.txt

And it is apparent now how those can be extracted in sequential order and be aggregated on top of each other, making for the filesystem I asked for on my *Dockerfile* instructions.

## How containers run - Container runtimes and engines

A container is ran by a *container runtime*, a software that can execute *container images* based on a specification they contain (on how to run them). So the *runtime* is the platform on top of which *containers* are run, and the most popular offering is [runc](https://github.com/opencontainers/runc). Other options are [Kata](https://katacontainers.io/) (which runs an hybrid between a container and a VM) and [gVisor](https://gvisor.dev/docs/) (which provides a sandbox-like interface between containers and their hosts), the two of which are considered more secure at the cost of lower performance.

To then manage those containers, a *container engine* is used, which simplifies running many containers on top of a *runtime* by providing us with an interface. This is where names like [Docker](https://www.docker.com/), [Podman](https://podman.io/) and [Containerd](https://containerd.io/) come in as offerings, but still no mention of [Kubernetes](https://kubernetes.io/es/), as the latter performs *container orchestration* on top of an engine.

### Logging

Containers run as isolated processes and hence are not connected directly to the standard output, whether it be *STDOUT* or *STDERR*. Instead, container engines keep track of the *STDOUT/STDERR* streams of a container by logging those to identifiable log files. Beside letting users view the logs through their interfaces, container engines using this logging pattern allow for monitoring (tailing) container logs by looking at their log files (and augmenting them with metadata that allows identifying the container they belong to).

## Container registries

A *container registry* is a repository for *container images*, that offers an interface for pulling (downloading) or pushing (uploading) these, as a means to provide an ecosystem to share and distribute them. In short, *registries* are servers that store *container images* for distribution. Since servers can vary and images too, an FQCN (similar to the FQDN in networking, fully-qualified-container-image-name) is used as a combination of the *registry* domain and the *image* name, for example "docker.io/nginx".

The most commonly known *container registry* is [Docker Hub](https://hub.docker.com/), but other public registries have been getting popular, like Microsoft's [MCR](https://mcr.microsoft.com/) or Amazon's [ECR](https://aws.amazon.com/es/ecr/). Even self-hosted (private) alternatives like [Harbor](https://goharbor.io/) or [Artifactory](https://jfrog.com/artifactory/) are available.
