[plugins."io.containerd.grpc.v1.cri".containerd]
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
    [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
      SystemdCgroup = true

[plugins."io.containerd.grpc.v1.cri".cni]
  [plugins."io.containerd.grpc.v1.cri".cni.network]
    cni_bin_dir = "/opt/cni/bin"
    cni_conf_dir = "/etc/cni/net.d"

