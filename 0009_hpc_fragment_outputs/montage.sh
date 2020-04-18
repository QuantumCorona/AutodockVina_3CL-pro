# what it lacks in elegance...
montage -geometry 300x300 ` cat results.dat | cut -f1 -d\  | sed s/pdbqt/pdbqt\.png\ / | tr -d '\n' ` montage_all.png

# for my next trick

montage -geometry 300x300 ` tail -n 20 results.dat | cut -f1 -d\  | sed s/pdbqt/pdbqt\.png\ / | tr -d '\n' ` montage_best20_2d.png
montage -geometry 300x300 ` tail -n 10 results.dat | cut -f1 -d\  | sed s/pdbqt/pdbqt\.png\ / | tr -d '\n' ` montage_best10_2d.png

# may as well do the docked poses since we're here...
montage -geometry 300x300 ` tail -n 20 results.dat | cut -f1 -d\  | sed s/pdbqt/png\ / | tr -d '\n' ` montage_best20_docked.jpg
montage -geometry 300x300 ` tail -n 10 results.dat | cut -f1 -d\  | sed s/pdbqt/png\ / | tr -d '\n' ` montage_best10_docked.jpg



