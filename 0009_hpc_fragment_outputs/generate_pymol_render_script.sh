# colours for the pocket; surface; transparency all set here etc. pymol session file
echo "load pocket_to_render.pse" 

for f
do
    fileout="${f%.*}.png"

    echo "load ${f}, ligand"
    echo "png ${fileout}, width=1024, ray=1"
    echo "delete ligand" # reset for next molecule.
done

