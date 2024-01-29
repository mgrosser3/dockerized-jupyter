FROM python:3.9

# Build argument
ARG jupyter="jupyter notebook" 
ENV JUPYTER=$jupyter

# Install packages for software development
RUN apt update -y
RUN apt install -y git cmake

# Install Jupyter Notebook or Lab
RUN if [ "$JUPYTER" = "jupyter-lab" ]; then pip install jupyterlab; \
    elif [ "$JUPYTER" = "jupyter notebook" ]; then pip install jupyter; \
    # Invalid jupyter argument leads to exit code 10.
    else exit 10; \
    fi

# Install packages for PDF export 
RUN apt install -y texlive-xetex texlive-fonts-recommended texlive-plain-generic pandoc

# Add User 'jupyter'
RUN useradd -rm -d /home/jupyter -s /bin/bash -g root -G sudo -u 1001 jupyter
USER jupyter
WORKDIR /home/jupyter
ENV PATH=$PATH:/home/jupyter/.local/bin

# Configure Jupyter
RUN $JUPYTER --generate-config
EXPOSE 10212

# Run Jupyter 
CMD "$JUPYTER" --no-browser --port=10212 --ip 0.0.0.0
