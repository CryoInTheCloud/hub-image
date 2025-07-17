FROM quay.io/jupyter/repo2docker:main
COPY . /tmp/repo
RUN repo2docker --user-id 1000 --user-name jovyan /tmp/repo