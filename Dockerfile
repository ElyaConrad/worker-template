# Base image -> https://github.com/runpod/containers/blob/main/official-templates/base/Dockerfile
# DockerHub -> https://hub.docker.com/r/runpod/base/tags
FROM runpod/base:0.4.0-cuda11.8.0

# The base image comes with many system dependencies pre-installed to help you get started quickly.
# Please refer to the base image's Dockerfile for more information before adding additional dependencies.
# IMPORTANT: The base image overrides the default huggingface cache location.


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends software-properties-common curl git openssh-server gcc ffmpeg wget
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update && apt-get install -y --no-install-recommends python3.10 python3.10-dev python3.10-distutils
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

#RUN pip install --upgrade pip
# RUN pip install -U fastapi uvicorn python-multipart
RUN pip install infinity-emb[all]

RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# --- Optional: System dependencies ---
# COPY builder/setup.sh /setup.sh
# RUN /bin/bash /setup.sh && \
#     rm /setup.sh


# Python dependencies
COPY builder/requirements.txt /requirements.txt
RUN python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install --upgrade -r /requirements.txt --no-cache-dir && \
    rm /requirements.txt

RUN wget -O whisper-large-v3.llamafile https://huggingface.co/Mozilla/whisperfile/resolve/main/whisper-large-v3.llamafile
# RUN chmod +x whisper-large-v3.llamafile

RUN wget -O mistral-7b-instruct-v0.2.Q4_0.llamafile https://huggingface.co/Mozilla/Mistral-7B-Instruct-v0.2-llamafile/resolve/main/mistral-7b-instruct-v0.2.Q4_0.llamafile
# RUN chmod +x mistral-7b-instruct-v0.2.Q4_0.llamafile


# RUN pip install hapless

# NOTE: The base image comes with multiple Python versions pre-installed.
#       It is reccommended to specify the version of Python when running your code.


# Add src files (Worker Template)
ADD src .
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
