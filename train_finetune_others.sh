#!/usr/bin/env sh

/home/n9346490/Quartet/caffe-master/build/tools/caffe train \
     --solver=/home/n9346490/Quartet/solver_CUHK01.prototxt --weights=/home/n9346490/Quartet/weights.caffemodel 2>&1 | tee /home/n9346490/Quartet/chuck01.txt 
