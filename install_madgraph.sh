###############################################
#  Script for Installing Madgraph on LxPlus
###############################################
CYAN='\033[0;36m'
NC='\033[0m'
echo -e "${CYAN} Installing Madgraph ${NC}"
wget https://launchpad.net/mg5amcnlo/3.0/3.6.x/+download/MG5_aMC_v3.5.7.tar.gz
tar -xf MG5_aMC_v3.5.7.tar.gz
rm MG5_aMC_v3.5.7.tar.gz
cd MG5_aMC_v3_5_7/ 

