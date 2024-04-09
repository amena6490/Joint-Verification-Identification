Steps to implement "A Deep Four-Stream Siamese Convolutional Neural Network with Joint Verification and Identification Loss for Person Re-detection".

1. Compile caffe with quartet loss layer. 
		cd caffe-master
		make
		make pycaffe

2. To generate quartets, run "BuildData_CUHK01.py"
3. To create lmdb from txt files, run "create_lmdb_triplet_cuhk01.sh"
4. For training, change the source path of dataset in "train_val_cuhk01.prototxt" and run "train_finetune_others_CUHK01.sh".
5. Run the "flipimages.py" to produce mirror images for testing sets.
6. To compute accuracy, run "ComputeAccuracy_CUHK01.py"