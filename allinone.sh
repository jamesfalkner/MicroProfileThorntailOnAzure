#!/bin/bash

if mkdir ~/allinone.lock; then
  echo "Locking succeeded" >&2
else
  echo "Lock failed - exit" >&2
  exit 1
fi
export MYARGS=$@
IFS=' ' read -r -a array <<< "$MYARGS"
export RESOURCEGROUP=$1
export WILDCARDZONE=$2
export THEHOSTNAME=$5
export ROUTEREXTIP=$7
export SSHPRIVATEDATA=${11}
export SSHPUBLICDATA=${12}
export SSHPUBLICDATA2=${13}
export SSHPUBLICDATA3=${14}
export REGISTRYSTORAGENAME=${array[14]}
export REGISTRYKEY=${array[15]}
export LOCATION=${array[16]}
export SUBSCRIPTIONID=${array[17]}
export TENANTID=${array[18]}
export FULLDOMAIN=${THEHOSTNAME#*.*}
export WILDCARDFQDN=${RESOURCEGROUP}.${FULLDOMAIN}
export WILDCARDIP=`dig +short ${WILDCARDFQDN}`
export WILDCARDNIP=${WILDCARDIP}.nip.io
echo "Show wildcard info"
echo $WILDCARDFQDN
echo $WILDCARDIP
echo $WILDCARDNIP
echo $RHSMMODE

domain=$(grep search /etc/resolv.conf | awk '{print $2}')

ps -ef | grep allinone.sh > cmdline.out

swapoff -a

echo "DEVS=${DOCKERVG}" >> /etc/sysconfig/docker-storage-setup
cat <<EOF > /etc/sysconfig/docker-storage-setup
DEVS=$DOCKERVG
VG=docker_vol
DATA_SIZE=95%VG
STORAGE_DRIVER=overlay2
CONTAINER_ROOT_LV_NAME=dockerlv
CONTAINER_ROOT_LV_MOUNT_PATH=/var/lib/docker
CONTAINER_ROOT_LV_SIZE=100%FREE
EOF

cat <<EOF > /etc/ansible/hosts
[OSEv3:children]
masters
nodes
etcd
new_nodes
new_masters

[OSEv3:vars]
debug_level=2
console_port=8443
openshift_node_debug_level="{{ node_debug_level | default(debug_level, true) }}"
openshift_master_debug_level="{{ master_debug_level | default(debug_level, true) }}"
openshift_master_access_token_max_seconds=2419200
openshift_hosted_router_replicas=1
openshift_hosted_registry_replicas=1
openshift_master_api_port="{{ console_port }}"
openshift_master_console_port="{{ console_port }}"
openshift_override_hostname_check=true
azure_resource_group=${RESOURCEGROUP}
deployment_type=origin
ansible_become=yes
ansible_ssh_user=${AUSERNAME}
remote_user=${AUSERNAME}

openshift_master_default_subdomain=${WILDCARDNIP}
osm_default_subdomain=${WILDCARDNIP}
openshift_public_hostname=${RESOURCEGROUP}.${FULLDOMAIN}

openshift_master_cluster_hostname=${RESOURCEGROUP}.${FULLDOMAIN}
openshift_master_cluster_public_hostname=${RESOURCEGROUP}.${FULLDOMAIN}

# Do not install metrics but post install
openshift_metrics_install_metrics=false

# Do not install logging but post install
openshift_logging_install_logging=false

openshift_logging_use_ops=false

[masters]
${RESOURCEGROUP} openshift_hostname=${RESOURCEGROUP}

[etcd]
${RESOURCEGROUP}

[nodes]
${RESOURCEGROUP} openshift_hostname=${RESOURCEGROUP} openshift_node_labels="{'role':'master','region':'app','region': 'infra'}" openshift_schedulable=true
EOF
