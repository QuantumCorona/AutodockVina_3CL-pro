
wget "https://covid.postera.ai/covid/submissions/7c9d1431-9a5a-49ba-8e8b-980b5470ab09"
grep -B 3 code 7c9d1431-9a5a-49ba-8e8b-980b5470ab09 | cut -f3 -d\> | cut -f1 -d\< | grep -v -- "--" > MAK-UNK-7c9d1431.smi

# then edit by hand in vim...

