# Example:
# $ sudo bash pfc-lm-optimizer.sh 2 600 20 a1 10

# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate
cd /home/osboxes/DeepSpeech

ARQ=$1
N_HIDDEN=$2
BS=$3
LR=$4
N_TRIALS=$5

python3 lm_optimizer.py \
    --alphabet_config_path CVData/lm/alphabet.txt \
    --scorer_path CVData/lm/kenlm_pt.scorer \
    --test_files CVData/clips/test.csv \
    --n_hidden $N_HIDDEN \
    --checkpoint_dir CVData/checkpoint$ARQ\_$N_HIDDEN\_$BS\_$LR/ \
    --n_trials $N_TRIALS