

mex private/edgesDetectMex.cpp -outdir private "-DUSEOMP" CFLAGS="\$CFLAGS -fopenmp" LDFLAGS="\$LDFLAGS -fopenmp"
mex private/edgesNmsMex.cpp    -outdir private "-DUSEOMP" CFLAGS="\$CFLAGS -fopenmp" LDFLAGS="\$LDFLAGS -fopenmp"
mex private/spDetectMex.cpp    -outdir private "-DUSEOMP" CFLAGS="\$CFLAGS -fopenmp" LDFLAGS="\$LDFLAGS -fopenmp"
mex private/edgeBoxesMex.cpp   -outdir private
