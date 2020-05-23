# Derived from official mysql image (our base image)
FROM mysql:8.0.20
# Add a database
ENV MYSQL_DATABASE company

#Set Terminal
ENV TERM=xterm

#Set EST Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
COPY ./scripts/ /docker-entrypoint-initdb.d/
