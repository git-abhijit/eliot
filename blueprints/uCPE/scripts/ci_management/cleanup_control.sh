#!/bin/bash -ex
##############################################################################
# Copyright (c) 2019 Huawei Tech and others.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

# constants

TESTYAML="testk8s-nginx.yaml"

# start

source ../src/config_kubeedge > /dev/null 2>&1
cd
kubectl delete -f $TESTYAML

exec_edge_master(){

   sshpass -p ${EDGENODEPASSWORD} \
   scp ${PATH_OF_ELIOTFOLDER}/blueprints/uCPE/scripts/ci_management/cleanup_edge.sh \
   ${EDGENODEUSR}@${EDGENODEIP}:$HOME_EDGENODE

   sshpass -p ${EDGENODEPASSWORD} ssh ${EDGENODEUSR}@${EDGENODEIP} \
   source cleanup_edge.sh

   cd $PATH_OF_ELIOTFOLDER/blueprints/uCPE/scripts/ci_management
   source cleanup_master.sh
f
   sshpass -p ${EDGENODEPASSWORD} \
   scp ${PATH_OF_ELIOTFOLDER}/blueprints/uCPE/scripts/ci_management/cleanup_edge_final.sh \
   ${EDGENODEUSR}@${EDGENODEIP}:$HOME_EDGENODE

   sshpass -p ${EDGENODEPASSWORD} ssh ${EDGENODEUSR}@${EDGENODEIP} \
   source cleanup_edge_final.sh

}

exec_edge_master > /dev/null 2>&1
