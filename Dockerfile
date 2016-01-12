FROM python:3.4

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY django/requirements.txt /usr/src/app
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY django/. /usr/src/app

RUN apt-get update && apt-get install -y \
                gcc \
                gettext \
		mysql-client libmysqlclient-dev \
		postgresql-client libpq-dev \
		sqlite3 \
                libtiff-dev \
                libjpeg-dev \
                libzip-dev \
                libfreetype6-dev \
                liblcms2-dev \
                libwebp-dev \
                tcl-dev \
                tk-dev \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
