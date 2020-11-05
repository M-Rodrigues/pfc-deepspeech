# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate
cd /home/osboxes/DeepSpeech

python3 lm_optimizer.py \
    --alphabet_config_path CVData/lm/alphabet.txt \
    --scorer_path CVData/lm/kenlm_pt.scorer \
    --test_files CVData/clips/test.csv \
    --n_hidden 200 \
    --checkpoint_dir CVData/checkpoint2_200_30_a2/ \
    --n_trails 300