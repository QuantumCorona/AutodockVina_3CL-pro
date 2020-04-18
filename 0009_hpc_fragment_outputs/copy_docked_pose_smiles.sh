echo "# docking_file vina_best_score SMILES" > results.dat

while read l; do
    echo $l
    f=` echo "$l" | awk '{print $1}' `
    score=` echo "$l" | awk '{print $4}' `

    echo "File: $f score: ${score}"
# looks like: File: ../0007_hpc_fragment_children_2/f_as_ligand_1683_out.pdbqt score: -9.7

    newname=` echo ${f} | sed -e s#_hpc_.*/f## -e s#\.\.\/## ` 
    # super messy - should have chosen directory names more simply
    echo "newname ${newname}"

    smiles_file=` echo ${f} | sed s/_ligand_.*_out\.pdbqt/\.smi/ `
    smiles_line=` echo ${f} | sed s/_/\ /g | awk '{print $8}' `

#    echo "smiles_file: $smiles_file smiles_line: $smiles_line"

    smiles=` sed -n "${smiles_line}p" ${smiles_file} `

    echo "${newname} ${score} ${smiles}" >> results.dat
    cp -a "${f}" "${newname}"

done < aggregate_scores_top200.dat 

