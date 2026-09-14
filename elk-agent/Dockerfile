FROM docker.elastic.co/elastic-agent/elastic-agent-complete:9.4.1

USER root
RUN microdnf install -y iputils && microdnf clean all
USER elastic-agent
