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
export AUSERNAME=$3
export PASSWORD=$4
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
yum install -y httpd-tools
htpasswd -c -b /etc/origin/master/htpasswd ${AUSERNAME} ${PASSWORD}
yum install -y wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
yum -y install https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.6.2-1.el7.ans.noarch.rpm
yum -y --enablerepo=epel install pyOpenSSL
mkdir -p /usr/share/ansible
cd /usr/share/ansible/
git clone https://github.com/openshift/openshift-ansible
cd openshift-ansible
git checkout release-3.9
chmod 755 -R /usr/share/ansible/openshift-ansible

cat <<EOF > /etc/ansible/hosts
[OSEv3:children]
masters
nodes
etcd

[OSEv3:vars]
debug_level=2
console_port=8443
openshift_node_debug_level="{{ node_debug_level | default(debug_level, true) }}"
openshift_master_debug_level="{{ master_debug_level | default(debug_level, true) }}"
openshift_master_access_token_max_seconds=2419200
openshift_hosted_router_replicas=1
openshift_hosted_registry_replicas=1
openshift_master_api_port=8443
openshift_master_console_port=8443
openshift_override_hostname_check=true
azure_resource_group=${RESOURCEGROUP}
deployment_type=origin
openshift_release=v3.9
ansible_become=true
openshift_disable_check=memory_availability,disk_availability,docker_storage,package_version,docker_image_availability,package_availability
openshift_master_default_subdomain=${WILDCARDNIP}
osm_default_subdomain=${WILDCARDNIP}
openshift_public_hostname=${RESOURCEGROUP}.${FULLDOMAIN}
container_runtime_docker_storage_setup_device=/dev/sdc
openshift_master_cluster_hostname=${RESOURCEGROUP}.${FULLDOMAIN}
openshift_master_cluster_public_hostname=${RESOURCEGROUP}.${FULLDOMAIN}
openshift_enable_service_catalog=true

# Do not install metrics but post install
openshift_metrics_install_metrics=false

# Do not install logging but post install
openshift_logging_install_logging=false

openshift_logging_use_ops=false

[masters]
${RESOURCEGROUP} openshift_hostname=${RESOURCEGROUP} ansible_connection=local

[etcd]
${RESOURCEGROUP} ansible_connection=local

[nodes]
${RESOURCEGROUP} openshift_hostname=${RESOURCEGROUP} openshift_node_labels="{'role':'master','region':'app','region': 'infra'}" openshift_schedulable=true ansible_connection=local
EOF


ansible-playbook -i /etc/ansible/hosts /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -i /etc/ansible/hosts /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml
