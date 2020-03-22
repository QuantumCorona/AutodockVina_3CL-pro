# AutodockVina_3CL-pro
Autodock Vina workflow for docking TSAs into 3CL-pro. 

The Rao [`6LU7`](https://www.rcsb.org/structure/6lu7) structure (with an in-place N3 inhibitor) is one possible starting configuration. 

Diamond managed to solve an empty structure with a solvent-accessible pocket [`6YB7`)](https://www.rcsb.org/structure/6yb7), which might be the best (March 22nd 2020) starting point today. (Download link, and data collection / science briefly described here: https://www.diamond.ac.uk/covid-19/for-scientists/Main-protease-structure-and-XChem.html )


## Prior work

Chen et al. (https://doi.org/10.12688/f1000research.22457.1) (21st Feb 2020) used the [MTiOpenScreen](https://bioserv.rpbs.univ-paris-diderot.fr/services/MTiOpenScreen/) to dock drug repurposing candidates. Their reference structure was a SARS-CoV-1 structure (PDBID: 2DUC), then mutated and minimised with GROMACS and the GROMOS force-field. SI contains this structure prepared for docking.

