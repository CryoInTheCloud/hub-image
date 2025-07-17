FROM quay.io/cryointhecloud/hub-image:latest

USER root
RUN pip install jupyter-keepalive
USER $NB_UID