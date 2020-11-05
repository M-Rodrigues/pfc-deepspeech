# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate
cd /home/osboxes/DeepSpeech

# TRAINING PARAMENTERS
EXPERIMENTO=3_200_100_a4
DATASET_SIZE=
BATCH_SIZE=100
N_HIDDEN=200
LEARNING_RATE=0.005

echo Iniciando experimento $EXPERIMENTO

# PREPOCESSING
if [ -d "CVData/checkpoint_$EXPERIMENTO" ] 
then
rm -rf CVData/checkpoint$EXPERIMENTO
fi

# EXECUTE TRAINING
python3 DeepSpeech.py \
    --alphabet_config_path CVData/lm/alphabet.txt \
    --scorer_path CVData/lm/kenlm_pt.scorer \
    --checkpoint_dir CVData/checkpoint$EXPERIMENTO/ \
    --train_files CVData/clips/train$DATASET_SIZE.csv \
    --train_batch_size $BATCH_SIZE \
    --test_output_file CVData/test\_$EXPERIMENTO.txt \
    --dev_files CVData/clips/dev$DATASET_SIZE.csv \
    --dev_batch_size $BATCH_SIZE \
    --test_files CVData/clips/test$DATASET_SIZE.csv \
    --test_batch_size $BATCH_SIZE \
    --export_dir CVData/graphs/ \
    --learning_rate $LEARNING_RATE \
    --early_stop true \
    --es_epochs 15 \
    --lm_alpha 0 --lm_alpha_max 0 \
    --lm_beta 0 --lm_beta_max 0 \
    --n_hidden $N_HIDDEN \
    --data_aug_features_additive 0.3 \
    --data_aug_features_multiplicative 0.3 \
    --augmentation_speed_up_std 0.3 \
    --dropout_rate 0.2

# GENERATE PB GRAPH FILE
./convert_graphdef_memmapped_format --in_graph=CVData/graphs/output_graph.pb --out_graph=CVData/graphs/output_graph_$EXPERIMENTO.pbmm

cp CVData/LOG\_$N_HIDDEN.json /media/sf_test-folder/LOG\_$EXPERIMENTO.json
cp CVData/graphs/output_graph_$EXPERIMENTO.pbmm /media/sf_test-folder/output_graph_$EXPERIMENTO.pbmm
cp CVData/test\_$EXPERIMENTO.txt /media/sf_test-folder/test\_$EXPERIMENTO.txt

