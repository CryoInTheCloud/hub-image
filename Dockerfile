FROM quay.io/cryointhecloud/hub-image:latest

# Copy your modified environment.yml
COPY environment.yml /tmp/environment.yml

# Update the conda environment with your new package
USER root
RUN mamba env update -n notebook -f /tmp/environment.yml

# Switch back to jovyan user
USER $NB_UID