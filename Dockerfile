FROM quay.io/thoth-station/s2i-minimal-py38-notebook:v0.5.0

ENV JUPYTER_ENABLE_LAB=true
ENV CRIO_RUNTIME=true

WORKDIR /opt/app-root/bin

COPY setup-elyra.sh start-notebook.sh requirements.txt ./

RUN python3 -m pip install -r requirements.txt && \
    rm -f requirements.txt

RUN chmod -R g+w /opt/app-root/lib/python3.8/site-packages && \
      fix-permissions /opt/app-root -P

WORKDIR /opt/app-root/bin
