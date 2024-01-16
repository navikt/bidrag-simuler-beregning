FROM navikt/java:18
LABEL maintainer="Team Bidrag" \
      email="bidrag@nav.no"

COPY ./target/bidrag-grunnlag-*.jar app.jar

EXPOSE 8080

ENV ENVOY_ADMIN_API=http://127.0.0.1:15000
ENV SPRING_PROFILES_ACTIVE=nais