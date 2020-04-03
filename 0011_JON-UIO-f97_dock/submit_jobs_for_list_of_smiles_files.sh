for i 
do
 cat dock_from_SMILES_qsub.sh | sed s/SMILE_IN/${i}/ > ${i%.*}.sh
 echo "$i Go!"
 qsub ${i%.*}.sh
done

