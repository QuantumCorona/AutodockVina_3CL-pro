# 0009_hpc_fragment_outputs

Directory for scraping the results gathered overnight on Imperial's CX1 cluster.

> wc aggregate_scores.dat
   97851   587106 10159275 aggregate_scores.dat

So just under 100'000 poses checked. Some of these will be redundant / repeats,
as I did not post-process the randomly generated SMILES to remove (statistical)
duplicates. 

No post-processing / hand picking has yet been done, these are just by the Vina
docked best-pose energy. 

See [results.dat](./results.dat) for the results with filename for docked pose,
vina score, and SMILES. 

