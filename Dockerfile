FROM quay.io/jupyter/repo2docker:2023.06.0-1.ubuntu-22.04

# Copy the repository contents
COPY . /tmp/repo

# Set working directory
WORKDIR /tmp/repo

# Build the image using repo2docker
USER root
RUN python -m pip install --no-cache-dir repo2docker

# Use repo2docker to build the environment
RUN repo2docker --user-id=1000 --user-name=jovyan --debug /tmp/repo /srv/conda

# Switch to the jovyan user
USER 1000
WORKDIR /home/jovyan

# Set the default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]