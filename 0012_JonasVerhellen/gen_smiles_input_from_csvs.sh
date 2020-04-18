for f in *.csv
do
 n="${f%.*}.smi" 
 awk -F ',' '{print $2}' "${f}" > "${n}"
done
