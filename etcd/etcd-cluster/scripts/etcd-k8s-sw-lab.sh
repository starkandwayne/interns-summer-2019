#!/bin/bash
shopt -s expand_aliases
alias k8s='kubectl --kubeconfig lab-kubeadm'
echo "Logging into the etcd sluster"
k8s exec -i etcd0 sh << EOF
export ETCDCTL_API=3
etcdctl --write-out=table member list
etcdctl endpoint health
etcdctl put /test newkey "Test for the new plugin"
etcdctl get /test newkey
EOF
