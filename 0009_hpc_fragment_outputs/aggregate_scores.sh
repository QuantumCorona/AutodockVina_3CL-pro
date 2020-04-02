#grep VINA *.pdbqt | sort -nrk4

grep "0.000" ../000{6,7,8}*/scores.dat | sed -e s#scores.dat:## -e s#:REMARK## | sort -nrk4 > aggregate_scores.dat

tail -n 200 aggregate_scores.dat > aggregate_scores_top200.dat

