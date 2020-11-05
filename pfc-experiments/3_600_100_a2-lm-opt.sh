# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate
cd /home/osboxes/DeepSpeech

ARQ=3
N_HIDDEN=600
BS=100
LR=a2

python3 lm_optimizer.py \
    --alphabet_config_path CVData/lm/alphabet.txt \
    --scorer_path CVData/lm/kenlm_pt.scorer \
    --test_files CVData/clips/test.csv \
    --n_hidden $N_HIDDEN \
    --checkpoint_dir CVData/checkpoint$ARQ\_$N_HIDDEN\_$BS\_$LR/ \
    --n_trials 300
