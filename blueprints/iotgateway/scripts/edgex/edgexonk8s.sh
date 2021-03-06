#!/bin/bash -ex
#############################################################################
# Copyright (c) 2019 Huawei Tech and others.                                #
# All rights reserved. This program and the accompanying materials          #
# are made available under the terms of the Apache License, Version 2.0     #
# which accompanies this distribution, and is available at                  # 
# http://www.apache.org/licenses/LICENSE-2.0                                #
#############################################################################

#######################################################################################
# The script is to setup the Edgex Foundry application as POD in Kubernetes.          #
#######################################################################################

echo "**********************************************************************"
echo "Edgex Platform Deployment--------------------------------------STARTED"

echo "Deploying Edgex Platform on IOT-Gateway Edge Node"
edgexPath=`pwd`
git clone https://github.com/edgexfoundry-holding/edgex-kubernetes-support.git
cd edgex-kubernetes-support/releases/edinburgh/kubernetes
ls
kubectl create -k .
cd ${edgexPath}
echo "-----------------------------------------------------------"
echo "Edgex platform PODs"
kubectl get pod
echo "-----------------------------------------------------------"
echo "-----------------------------------------------------------"
echo "Edge platform Kubernetes Services"
kubectl get svc
echo "-----------------------------------------------------------"
kubectl expose deployment edgex-core-consul --type=NodePort --name=consulnodeport
kubectl expose deployment edgex-core-command --type=NodePort --name=commandnodeport
kubectl expose deployment edgex-core-data --type=NodePort --name=datanodeport
kubectl expose deployment edgex-core-metadata --type=NodePort --name=metadatanodeport
kubectl expose deployment edgex-support-rulesengine --type=NodePort --name=rulesenginenodeport
kubectl expose deployment edgex-support-logging --type=NodePort --name=loggingnodeport
kubectl get svc | grep NodePort

echo "**********************************************************************"
echo "Edgex Platform Deployment--------------------------------------SUCCESS"








