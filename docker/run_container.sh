#!/bin/bash

docker run -dit \
    --gpus all \
    --name slam_asr \
    --ipc=host \
    --shm-size=256g \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    -v /folder-path:/folder-path \
    ak4off/slam_llm_fairseq:portable_cu118
