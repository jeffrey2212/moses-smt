# Moses-SMT Docker Image

This Docker image facilitates the setup of Moses Statistical Machine Translation (SMT) system, specifically tailored for English to Chinese translation.

## Docker Image

The complete image can be found on Docker Hub: [jeffrey2212/moses-smt](https://hub.docker.com/r/jeffrey2212/moses-smt).

## Usage

Pull the Docker image using the following command:

```bash
docker pull jeffrey2212/moses-smt
```

## Versioning

This image is based on Moses version 4.0. For a setup with Moses version 3.0, refer to the original repository: [techiaith/docker-moses-smt](https://github.com/techiaith/docker-moses-smt)

## Dockerfile

The Dockerfile details the setup of various tools and dependencies required for Moses SMT, including GIZA++, IRSTLM, and CMPH, on an Ubuntu 16.04 base image.
