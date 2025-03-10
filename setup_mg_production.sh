#!/bin/bash -e

MGPATH=/afs/cern.ch/user/c/cazzanig/private/Madgraph/MG5_aMC_v3_5_7
export LD_LIBRARY_PATH=$MGPATH/HEPTools/lhapdf6_py3/lib:$MGPATH/HEPTools/lhapdf6_py3/lib:$LD_LIBRARY_PATH
