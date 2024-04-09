#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

OUTDIR=/home/n9346490/Quartet/CUHK01Data

EXAMPLE=$OUTDIR
DATA=$OUTDIR
TOOLS=/home/n9346490/Quartet/caffe-master/build/tools

TRAIN_DATA_ROOT=$OUTDIR/image/train/
VAL_DATA_ROOT=$OUTDIR/image/val/

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=224
  RESIZE_WIDTH=224
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the validation data is stored."
  exit 1
fi

echo "Creating train lmdb pos1..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $TRAIN_DATA_ROOT \
    $DATA/CUHK01_train_pos1.txt \
    $EXAMPLE/XX_train_lmdb_pos1

echo "Creating train lmdb pos2..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $TRAIN_DATA_ROOT \
    $DATA/CUHK01_train_pos2.txt \
    $EXAMPLE/XX_train_lmdb_pos2

echo "Creating train lmdb neg1..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $TRAIN_DATA_ROOT \
    $DATA/CUHK01_train_neg1.txt \
    $EXAMPLE/XX_train_lmdb_neg1
	
echo "Creating train lmdb neg2..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $TRAIN_DATA_ROOT \
    $DATA/CUHK01_train_neg2.txt \
    $EXAMPLE/XX_train_lmdb_neg2

echo "Creating valrank lmdb pos..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $VAL_DATA_ROOT \
    $DATA/CUHK01_valrank_pos.txt \
    $EXAMPLE/XX_valrank_lmdb_pos

echo "Creating valrank lmdb neg..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle=false \
    $VAL_DATA_ROOT \
    $DATA/CUHK01_valrank_neg.txt \
    $EXAMPLE/XX_valrank_lmdb_neg
	
echo "Done."
