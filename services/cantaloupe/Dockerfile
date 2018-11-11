FROM openjdk:8-jdk

ENV CTL_VERSION=4.0.2

VOLUME /imageroot

# Update packages and install tools
RUN apt-get update -y && apt-get install -y wget unzip

RUN mkdir Cantaloupe

# Get and unpack Cantaloupe release archive
RUN wget https://github.com/medusa-project/cantaloupe/releases/download/v${CTL_VERSION}/Cantaloupe-${CTL_VERSION}.zip \
    && unzip Cantaloupe-${CTL_VERSION}.zip \
    && rm Cantaloupe-${CTL_VERSION}.zip

# Configure image path to mapped volume and enable filesystem cache
# RUN sed -e 's+home\/myself\/images+imageroot+' -e 's/#cache.server/cache.server/' < cantaloupe.properties.sample > ctl.props \
#     && mv Cantaloupe-${CTL_VERSION}.war Cantaloupe.war

RUN ls cantaloupe-${CTL_VERSION}/

RUN mv cantaloupe-${CTL_VERSION}/cantaloupe-${CTL_VERSION}.war Cantaloupe/cantaloupe.war
ADD services/cantaloupe/atnu-cantaloupe.properties Cantaloupe/

WORKDIR Cantaloupe

EXPOSE 8182
CMD ["java", "-Dcantaloupe.config=atnu-cantaloupe.properties", "-Xmx800m", "-jar", "cantaloupe.war"]
