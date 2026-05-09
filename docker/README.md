# Portable CUDA 11.8 SLAM-LLM Environment

A reproducible Docker environment for SLAM-LLM, Fairseq, DeepSpeed, and ASR research.

## Features

- CUDA 11.8 devel stack
- PyTorch 2.1.0 cu118
- Fairseq pinned commit
- DeepSpeed 0.14.5
- Transformers pinned commit
- PEFT pinned commit
- nvcc included
- CUDA build toolchain included
- Multi-GPU training ready

## Why this exists

Many institutional GPU servers:
- do not allow sudo access
- have broken CUDA toolkits
- have inconsistent environments
- fail during Fairseq/DeepSpeed builds

This Docker setup aims to provide a reproducible portable environment.

## Build

```bash
docker build -t slam_llm:cu118 \
    -f docker/Dockerfile.cu118 .
```

## Run

```bash
docker run -dit \
    --gpus all \
    --name slam_asr \
    --ipc=host \
    --shm-size=256g \
    -v /speech:/speech \
    slam_llm:cu118
```

## Verify

```bash
nvidia-smi

python -c "import torch; print(torch.cuda.is_available())"

nvcc --version
```

## Tested Components

- SLAM-LLM
- Fairseq
- DeepSpeed
- Distributed NCCL training
- ASR finetuning
- Whisper
- CUDA extension compilation

## Notes

This image still requires:
- working NVIDIA host drivers
- Docker GPU runtime
- NVIDIA Container Toolkit

GPU kernel drivers cannot be packaged inside Docker.