# Dockerized Jupyter Environment

<a href="/LICENSE">![License](https://img.shields.io/github/license/mgrosser3/dockerized-jupyter)</a>

This project provides a Dockerfile that can be used to create a Jupyter container.
[Jupyter](https://jupyter.org/) provides a web-based interactive development environment.

## Build Docker Container

### Jupyter Notebook

A Jupyter Notebook container is created by default:

```
docker build . -t [TAG]
```
You can also use the build argument *jupyter* to define the Jupyter Notebook
with the following command:

```
docker build . -t [TAG] --build-arg="jupyter=jupyter notebook"
```

### Jupyter Lab

If you want to use Jupyter Lab, you can use "jupyter-lab" as value for the build argument *jupyter*.

```
docker build . -t [TAG] --build-arg="jupyter=jupyter-lab"
```
## Run Docker Container

You can start the jupyter Docker container with the following command. WORKSPACE should be the path to
your workspace directory and TAG must be replaced by the tag of the jupyter container.

```
docker run -it --name jupyter -p 10212:10212 -v [WORKSPACE]:/home/jupyter/workspace [TAG]
```
