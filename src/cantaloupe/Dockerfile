FROM openjdk:10-jdk

ENV CTL_VERSION=3.4

VOLUME /imageroot

# Update packages and install tools
RUN apt-get update -y && apt-get install -y wget unzip

# Get and unpack Cantaloupe release archive
RUN wget https://github.com/medusa-project/cantaloupe/releases/download/v${CTL_VERSION}/Cantaloupe-${CTL_VERSION}.zip \
    && unzip Cantaloupe-${CTL_VERSION}.zip \
    && rm Cantaloupe-${CTL_VERSION}.zip

WORKDIR Cantaloupe-${CTL_VERSION}

# Configure image path to mapped volume and enable filesystem cache
# RUN sed -e 's+home\/myself\/images+imageroot+' -e 's/#cache.server/cache.server/' < cantaloupe.properties.sample > ctl.props \
#    && mv Cantaloupe-${CTL_VERSION}.war Cantaloupe.war

ADD src/cantaloupe/atnu-cantaloupe.properties .
RUN mv Cantaloupe-${CTL_VERSION}.war Cantaloupe.war

EXPOSE 8182
CMD ["java", "-Dcantaloupe.config=atnu-cantaloupe.properties", "-Xmx800m", "-jar", "Cantaloupe.war"]
