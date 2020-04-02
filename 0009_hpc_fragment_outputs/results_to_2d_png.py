from rdkit import Chem
from rdkit.Chem import AllChem

from rdkit.Chem import Draw
from PIL import Image

def process(skip=0, filename="results.dat"):
    smiles=open(filename,'r')

    for n,line in enumerate(smiles):
        if (line[0]=="#"): #comment... 
            continue
        field=line.split(' ')

        id=field[0]
        score=field[1]
        smile=field[2]

        print("Generating SMILE %d: %s %s" %(n,id,smile) )
        
        m = Chem.MolFromSmiles(smile)
    
        tmp=AllChem.Compute2DCoords(m)
        img=Draw.MolsToImage([m],  subImgSize=(400,400), legends=[f'{id} : {score}'] )
        img.thumbnail((300,300), Image.ANTIALIAS )
        img.save( '%s.png'%(id))

# Run!
import argparse
parser = argparse.ArgumentParser(description='Generate PNGs and XYZ from results.dat file.')
parser.add_argument('filename',  default="results.dat")
args=parser.parse_args()

process(skip=0,filename=vars(args)['filename'])

