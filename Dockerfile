FROM python:rc-alpine

WORKDIR /app

COPY . /app/

RUN apk add --no-cache libstdc++ &&\
    apk add --no-cache --virtual .build-deps  \
            build-base \
            libressl-dev \
            libffi-dev \
            musl-dev \
            libstdc++ \
            libxslt-dev  && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install -r requirements.txt && \
    apk del .build-deps
    
CMD ["python3", "/app/helper_main.py"]
