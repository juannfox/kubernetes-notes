#! /bin/bash
# Kubernetes all-in-one node setup script with CRI-O engine
KUBERNETES_VERSION="v1.33.3"
K8S_URL="https://dl.k8s.io"
K8S_GPG="/etc/apt/keyrings/kubernetes-apt-keyring.gpg"
CRIO_VERSION="v1.33.3"
CRIO_URL="https://download.opensuse.org/repositories"
CRIO_GPG="/etc/apt/keyrings/cri-o-apt-keyring.gpg"
ETCD_VERSION="v3.6.4"
ARCH="arm64"

# Install reqs
apt-get update
apt-get install -y curl iptables jq

# Install CRI-O - TBD move to APT install
curl -LO https://storage.googleapis.com/cri-o/artifacts/cri-o.$ARCH.$KUBERNETES_VERSION.tar.gz
tar -xvzf cri-o.$ARCH.$KUBERNETES_VERSION.tar.gz
cp cri-o/bin/crio cri-o/bin/crictl cri-o/bin/pinns cri-o/bin/runc /usr/local/bin/
mkdir -p /usr/libexec/crio
cp cri-o/bin/crun cri-o/bin/conmon /usr/libexec/crio
export CONTAINER_CNI_PLUGIN_DIR="/opt/cni/bin"
export CONTAINER_CONFIG_DIR="/etc/crio"
export CONTAINER_CONFIG="$CONTAINER_CONFIG_DIR/crio.conf"
export CONTAINER_CNI_CONFIG_DIR="/etc/cni/net.d"
export CONTAINER_REGISTRY_DIR="/etc/containers"
mkdir -p $CONTAINER_CNI_CONFIG_DIR $CONTAINER_CNI_PLUGIN_DIR $CONTAINER_CONFIG_DIR $CONTAINER_REGISTRY_DIR
cp cri-o/cni-plugins/* $CONTAINER_CNI_PLUGIN_DIR
cp cri-o/etc/10-crio.conf $CONTAINER_CONFIG
cp cri-o/contrib/registries.conf $CONTAINER_REGISTRY_DIR/
jq . cri-o/contrib/policy.json > $CONTAINER_CONFIG_DIR/policy.json
cp cri-o/contrib/10-crio-bridge.conflist.disabled $CONTAINER_CNI_CONFIG_DIR/
cp cri-o/etc/crictl.yaml /etc

# Download other k8s components:
DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
curl -LO $K8S_URL/$KUBERNETES_VERSION/kubernetes-server-linux-$ARCH.tar.gz
tar -xvzf kubernetes-server-linux-$ARCH.tar.gz
cp kubernetes/server/bin/kube-apiserver /usr/local/bin/
cp kubernetes/server/bin/kube-controller-manager /usr/local/bin/
cp kubernetes/server/bin/kube-scheduler /usr/local/bin/
cp kubernetes/server/bin/kubelet /usr/local/bin/
cp kubernetes/server/bin/kubectl /usr/local/bin/
cp kubernetes/server/bin/kube-proxy /usr/local/bin/

# Download ETCD
curl -LO https://github.com/etcd-io/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-$ARCH.tar.gz
tar -xvzf etcd-$ETCD_VERSION-linux-$ARCH.tar.gz
cp etcd-$ETCD_VERSION-linux-$ARCH/etcd /usr/local/bin/
cp etcd-$ETCD_VERSION-linux-$ARCH/etcdctl /usr/local/bin/
cp etcd-$ETCD_VERSION-linux-$ARCH/etcdutl /usr/local/bin/

# Prepare for K8s
swapoff -a
modprobe br_netfilter
sysctl -w net.ipv4.ip_forward=1

# Install grpcurl
#curl -LO https://github.com/fullstorydev/grpcurl/releases/download/v1.9.3/grpcurl_1.9.3_linux_arm64.tar.gz
#tar -xvzf grpcurl_1.9.3_linux_arm64.tar.gz
#mv grpcurl /usr/local/bin