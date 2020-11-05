# SETUP VIRTUAL ENVIRONMENT
source $HOME/tmp/deepspeech-train-venv/bin/activate

# PARAMENTERS
EXPERIMENTO=$1
SAMPLE_1=common_voice_pt_19589080.wav
SAMPLE_2=common_voice_pt_19479853.wav
SAMPLE_3=common_voice_pt_19453257.wav
SAMPLE_4=common_voice_pt_19401492.wav

echo $SAMPLE_1
deepspeech \
    --model /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/output_graph_$EXPERIMENTO.pbmm \
    --audio CVData/clips/$SAMPLE_1 \
    --json > /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/s1.json

echo $SAMPLE_2
deepspeech \
    --model /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/output_graph_$EXPERIMENTO.pbmm \
    --audio CVData/clips/$SAMPLE_2 \
    --json > /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/s2.json

echo $SAMPLE_3
deepspeech \
    --model /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/output_graph_$EXPERIMENTO.pbmm \
    --audio CVData/clips/$SAMPLE_3 \
    --json > /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/s3.json

echo $SAMPLE_4
deepspeech \
    --model /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/output_graph_$EXPERIMENTO.pbmm \
    --audio CVData/clips/$SAMPLE_4 \
    --json > /media/sf_test-folder/experimentos/exp-$EXPERIMENTO/s4.json

# deepspeech \
#     --model /media/sf_test-folder/experimentos/exp-AA/output_graph_AA.pbmm \
#     --audio CVData/clips/common_voice_pt_19589080.wav \
#     --scorer CVData/lm/lenlm_pt.scorer
