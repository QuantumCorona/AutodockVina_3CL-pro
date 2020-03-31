# You need a modern babel! tested on 3.0.0 conda-forge
#
# BUT WHERE DOES BABEL GET ITS PARTIAL CHARGES FROM? GASTEIGER DEFAULT?
#
obabel -i sdf frag_one_shot.sdf -o pdbqt -O frag_one_shot.pdbqt

# explodes file, as vina only does one-shot work
vina_split --input frag_one_shot.pdbqt

# iterate over ligands
for f in frag_one_shot_ligand_*.pdbqt
do
    echo "Docking $f"

    vina --config vina.conf --ligand "${f}"
done
