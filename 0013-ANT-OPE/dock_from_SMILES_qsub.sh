#!/bin/sh
#PBS -l walltime=23:58:02
#PBS -l select=1:ncpus=24:mem=100gb

# Echo some info about our vnode to STDOUT
echo -n "hostname: ${USER} @ "
hostname
grep "model name" /proc/cpuinfo  | uniq
free
####

INPUT=SMILE_IN

cd $PBS_O_WORKDIR # BITE ME

. ~/conda_init.sh
conda activate gbga # yes, everything is in my home directory


smi2sdf -p ~/bin/mmxconst.prm "${INPUT}" -o "${INPUT%.*}.sdf"

# Nb: adding hydrogens with babel at this point, for non explicit SMILES
obminimize -h -ff mmff94 -n 10 "${INPUT%.*}.sdf"

# You need a modern babel! tested on 3.0.0 conda-forge
# Autodock vina ignores the charges 
# Hydrogens are implicit, EXCEPT FOR polar hydrogens. obabel seems to handle this OK
obabel -i sdf "${INPUT%.*}.sdf" -o pdbqt -O "${INPUT%.*}.pdbqt"

# explodes file, as vina only does one-shot work
vina_split --input "${INPUT%.*}.pdbqt"

# iterate over ligands
for f in "${INPUT%.*}"_ligand_*.pdbqt
do
    echo "Docking $f"

    vina --config vina.conf --ligand "${f}"
done

