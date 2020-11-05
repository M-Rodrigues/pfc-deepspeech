# Example:
# $ sudo bash pfc-test-run.sh 2 600 20 a1 1.8919195519760934 4.3188622189946715

# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate
cd /home/osboxes/DeepSpeech

# PARAMENTERS
ARQ=$1
N_HIDDEN=$2
BATCH_SIZE=$3
LEARNING_RATE=$4
EXPERIMENTO=$ARQ\_$N_HIDDEN\_$BATCH_SIZE\_$LEARNING_RATE
DATASET_SIZE=

ALFA=$5
BETA=$6

echo Iniciando rodada de teste com ML: $EXPERIMENTO

# EXECUTE
python3 DeepSpeech.py \
    --alphabet_config_path CVData/lm/alphabet.txt \
    --scorer_path CVData/lm/kenlm_pt.scorer \
    --checkpoint_dir CVData/checkpoint$EXPERIMENTO/ \
    --test_output_file CVData/test_LM\_$EXPERIMENTO.txt \
    --test_files CVData/clips/test$DATASET_SIZE.csv \
    --test_batch_size $BATCH_SIZE \
    --lm_alpha $ALFA \
    --lm_beta $BETA \
    --n_hidden $N_HIDDEN

cp CVData/test_LM\_$EXPERIMENTO.txt /media/sf_test-folder/test_LM\_$EXPERIMENTO.txt
