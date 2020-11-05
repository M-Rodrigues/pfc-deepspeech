# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate

python3 data/lm/generate_lm.py --input_txt CVData/lm/vocabulary.txt --output_dir . \
--top_k 500000 --kenlm_bins ~/kenlm/build/bin \
--arpa_order 3 --max_arpa_memory "85%" --arpa_prune "0|0|1" \
--binary_a_bits 255 --binary_q_bits 8 --binary_type trie

# --binary_a_bits 255 --binary_q_bits 8 --binary_type trie --discount_fallback

python3 data/lm/generate_package.py --alphabet CVData/lm/alphabet.txt --lm data/lm/lm.binary --vocab CVData/lm/vocabulary.txt \
--package data/lm/kenlm_pt.scorer --default_alpha 0.931289039105002 --default_beta 1.1834137581510284

cp data/lm/kenlm_pt.scorer CVData/lm/
