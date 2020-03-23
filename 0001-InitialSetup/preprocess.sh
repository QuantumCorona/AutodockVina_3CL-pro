cat Apo_Mpro_6YB7_refined.pdb | grep -v HETATM > Apo_Mpro_6YB7_docking.pdb

# Then edit with autodock tools:
#  * add polar hydrogens 
#  * select molecular group & save pqbqt file
#  * select area for docking & consider the situation
#
# This was just a trivial application of watching the Vina YouTube tutorial:
#  https://www.youtube.com/watch?v=-GVZP0X0Tg8

