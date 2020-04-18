# whatever you want to do, there's always a unix tool...
split -l 500 --additional-suffix=.smi frag_children.smi f_

for i in f_*.smi
do
 cat dock_from_SMILES_qsub.sh | sed s/SMILE_IN/${i}/ > ${i%.*}.sh
 echo "$i Go!"
 qsub ${i%.*}.sh
done

