FROM python:3.10-slim

RUN apt-get update && \
    apt-get install \
        gcc \
        openssl \
        libssl-dev \
        libffi-dev \
        -yq

RUN pip install \
    cryptography==2.8 \
    github3.py==1.3.0 \
    jwcrypto==0.6.0 \
    pyjwt==1.7.1

COPY token_getter.py app/
COPY entrypoint.sh app/
RUN chmod u+x app/entrypoint.sh
WORKDIR app/

CMD /app/entrypoint.sh
