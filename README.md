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
## Install Python Dependencies

### Manually

You can open the terminal in your Jupyter environment and use *pip* to install a Python package.

**Note** that the packages only remain installed for as long as the container exists. If the container is
recreated, the manually installed packages are no longer available.

### Requirements in Workspace

Each time the container is started, the requirements.txt file in the workspace folder is checked. This means
that you can change your dependencies via the requirements.txt file to add a new package or change the version
of a package.

**Note** that you cannot remove a package with the help of the requirements file. Even if you remove an entry,
the package remains installed. You must remove it manually or recreate the container.

