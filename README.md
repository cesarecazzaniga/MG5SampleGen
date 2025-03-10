# MG5SampleGen
Code to setup the generation of samples with MG5+Pythia8+Delphes chain

## Installation on lxplus

Run the script:

```
./install_madgraph.sh

```

This will install mg5 in your current directory and move inside.
MG5 needs to be configured with the following packages:

1. ```LHAPDF```: sets of pdfs to be used (we use lhapdf6)
2. ```pythia8```: parton shower, hadronization and particles decays (version 8)
3. ```mg5amc_py8_interface```: interface between pythia8 and mg5amc
4. ```hepmc```: file format used as output from pythia8 and input for detector simulation
5. ```delphes```: fast detector simulation

You can install the packages to be interfaced with MG5 in the following way:

```
./bin/mg5_aMC

install lhapdf6
install pythia8
install mg5amc_py8_interface
install hepmc
install delphes

```

For LHAPDF to be used for MC samples generation with MG5, you need to export expicitely its location before running the code.
Modify ```setup_mg_producton.sh``` to setup the location of LHAPDF library.

## Cards

Cards to setup the event generation are provided by MG5 directly. They are stored in ```Template/LO/Cards``` and in ```Template/Common/Cards/```
The main cards of interest are:

1. ```param_card_default.dat``` (in ```Template/LO/Cards```): main settings of SM parameters.
2. ```param_card_default.dat``` (in ```Template/LO/Cards```): main settings for pdfs, number of events to simulate, beam type, centre-of-mass energy, phase space gen-level cuts.
3. ```pythia8_card_default.dat``` (in ```Template/LO/Cards```): defaults for pythia8, matching settings, MPI, etc.
4. ```delphes_card_default.dat``` (in ```Template/Common/Cards/```): parametrization of detector efficiencies, reco and gen collections to be saved.

N.B. When launching the generation, MG5 will use by default these cards. If you want to use for example a different detector card, you can just copy it from ```Template/Common/Cards/``` into ```delphes_card_default.dat```.

## Testing 

A basic production of MC events using the chain can be done as follows.
Setup the launcher file. This is a setup file that can be given to run MG5 specifying: process, number of events to simulate, energy and type of beams, phase space cuts, matching scheme, pythia8 and detector switch.

An example can be found [here](https://github.com/cesarecazzaniga/MG5SampleGen/blob/main/launch_files_examples/launcher_QCD_dijet_SMALLtest.txt).

Once the main settings are specified in the launcher, then the generation can be started:

```
./bin/mg5_aMC launcher_QCD_dijet_SMALLtest.txt

```

## Submitting jobs

A minimal job submission example is provided in this repo [here](https://github.com/cesarecazzaniga/MG5SampleGen/tree/main/condor_submit).
The code executed is ```sims_launcher_test.sh```. There you need to specify the launcher file and the output directories where to save the output of the simulation.
By default the code will save only the output of the detector simulation in order to save space, the additional information provided by madgraph is not kept.






