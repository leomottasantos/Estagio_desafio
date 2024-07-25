FROM python:3.11.3-alpine3.18
LABEL mantainer="leonardomottadossantos@gmail.com"


ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

COPY . /desafio_estagio

COPY scripts /scripts

WORKDIR /desafio_estagio

EXPOSE 8000

RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /desafio_estagio/requirements.txt && \
    adduser --disabled-password --no-create-home duser && \
    mkdir -p /data/web/static && \
    mkdir -p /data/web/media && \
    mkdir -p /var/www/staticfiles && \
    chown -R duser:duser /venv && \
    chown -R duser:duser /desafio_estagio && \
    chown -R duser:duser /data/web/static && \
    chown -R duser:duser /var/www/staticfiles && \
    chown -R duser:duser /data/web/media && \
    chmod -R 755 /desafio_estagio && \
    chmod -R 755 /data/web/static && \
    chmod -R 755 /var/www/staticfiles && \
    chmod -R 755 /data/web/media && \
    chmod -R +x /scripts


ENV PATH="/scripts:/venv/bin:$PATH"

USER duser

CMD ["commands.sh"]