#!/bin/bash
# run_suite.sh  →  example of a parameter sweep
for U in 2 4 6 8; do
  for z0 in 0.01 0.1 1.0; do
    casename="U${U}_z0${z0}"
    mkdir -p "$casename" && cd "$casename"
    sed -e "s/Uref = 5/Uref = $U/" -e "s/z0 = 0.1/z0 = $z0/" ../template.ini > "${casename}.ini"
    microhh init "${casename}.ini"
    microhh run "${casename}.ini" > log.txt 2>&1 &
    cd ..
  done
done
