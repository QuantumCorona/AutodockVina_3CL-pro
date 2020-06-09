#!/bin/sh
#PBS -l walltime=23:58:02
#PBS -l select=1:ncpus=24:mem=100gb

INPUT=MAK-UNK-7c9d1431.smi

if [[ -z ${PBS_O_WORKDIR+x} ]];
then
    echo "LOCAL!"
else
    cd "${PBS_O_WORKDIR}" # BITE ME

    . ~/conda_init.sh
fi

conda activate gbga # yes, everything is in my home directory

echo "smi2sdf..."
smi2sdf -p ~/bin/mmxconst.prm "${INPUT}" -o "${INPUT%.*}.sdf"

echo "babel MMFF94 minimisation..."
obabel -i sdf "${INPUT%.*}.sdf" -o sdf -O "${INPUT%.*}_mmff94.sdf" --minimize --ff MMFF94

echo "babel splitting files..."
obabel "${INPUT%.*}_mmff94.sdf" -o sdf -O "${INPUT%.*}_.sdf" -m


for f in ${INPUT%.*}_*.sdf
do

    echo "XTB $f"

    xtb "${f}" --opt
    obabel -i sdf xtbopt.sdf -o pdbqt -O "${f%.*}_xtb.pdbqt"

    # archive these for inspection later
    mv "${f}" "${f%.*}_xtbin.sdf"
    mv xtbopt.sdf "${f%.*}_xtbopt.sdf"
    rm charges wbo xtbrestart


# You need a modern babel! tested on 3.0.0 conda-forge
# Autodock vina ignores the charges 
# Hydrogens are implicit, EXCEPT FOR polar hydrogens. obabel seems to handle this OK
    obabel -i sdf "${f%.*}_xtbin.sdf" -o pdbqt -O "${f%.*}_mm94ff.pdbqt"
    obabel -i sdf "${f%.*}_xtbopt.sdf" -o pdbqt -O "${f%.*}_xtb.pdbqt"


    echo "vina mm94ff.."
    vina --config vina.conf --ligand "${f%.*}_mm94ff.pdbqt"
    echo "vina xtb.."
    vina --config vina.conf --ligand "${f%.*}_xtb.pdbqt"
done

