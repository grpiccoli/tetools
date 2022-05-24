# tetools
This is a fork of tetools that runs using LtrDetector, making it compatible with more fragmented assemblies and parallel LTR detection

# SAMPLE USAGE

s="singularity run -B /home:/out -W /out --env LC_ALL=C --env LIBDIR=/out/Libraries --env BLASTDB=/out/databases docker://grpiccoli/tetools"

$s RepeatModeler -dir /home/test -database /out/databases/test -LTRStruct -pa 32
