# AutodockVina_3CL-pro
Autodock Vina workflow for docking TSAs into 3CL-pro. 

## Structures

* The Rao [`6LU7`](https://www.rcsb.org/structure/6lu7) 2.16 Å structure (with an in-place N3 inhibitor) is one possible starting configuration. The solution was very prompt, but it has perhaps been superseeded. 

* [`6Y7M`](https://www.rcsb.org/structure/6y7m) 
  * Tristan Croll: 'complex of the main SARS-CoV-2 protease with a covalent inhibitor. At 1.9A resolution you don't expect there to be much wrong with this, and there isn't. A small handful of dodgy sidechains', as refined further by Tristan Croll: 
https://mobile.twitter.com/CrollTristan/status/1240684849670828034

* [`6YB7`](https://www.rcsb.org/structure/6yb7) Diamond managed to solve an empty structure with a solvent-accessible pocket, which might be the best (March 22nd 2020) starting point today. (Download link, and data collection / science briefly described here: https://www.diamond.ac.uk/covid-19/for-scientists/Main-protease-structure-and-XChem.html )
  * Tristan Croll: (https://mobile.twitter.com/CrollTristan/status/1241742943737860097) 
"In my opinion it's fine (great, really). Hard to wrong at 1.29
A! Only real site for concern is the very last residue at the C-terminus
(probably not important in the grand scheme of things). ... OK - one piece of
advice for that. There are lots of residues with altlocs - not sure if any of
them impact on the active site, but make sure you choose carefully (i.e. ensure
the set you choose is self-consistent)."

* Muramatsu et al. in a 2016 PNAS https://doi.org/10.1073/pnas.1601327113, provided 
[`2DUC`](https://www.rcsb.org/structure/2duc) and [`5B6O`](https://www.rcsb.org/structure/5b6O), the Sars-CoV(-1) 3CL-pro structure with a substrate in place in a catalytically deficiant mutant. 

## Prior docking

Chen et al. (https://doi.org/10.12688/f1000research.22457.1) (21st Feb 2020) used the [MTiOpenScreen](https://bioserv.rpbs.univ-paris-diderot.fr/services/MTiOpenScreen/) to dock drug repurposing candidates. Their reference structure was a SARS-CoV-1 structure (PDBID: 2DUC), then mutated and minimised with GROMACS and the GROMOS force-field. SI contains this structure prepared for docking.

