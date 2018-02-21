FROM debian:stretch

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i 's/^exit 101$/exit 0/' /usr/sbin/policy-rc.d \
    && apt-get update \
    && apt-get install -y \
        curl \
        gnupg2 \
        lsb-release \
        procps \
        systemd \
    && curl -sS https://dl.google.com/cloudagents/install-logging-agent.sh | bash \
    && apt-get autoremove \
    && sed -i "s/num_threads 8/num_threads 8\n  detect_json true\n  # Enable metadata agent lookups.\n  enable_metadata_agent true\n  metadata_agent_url \"http:\/\/local-metadata-agent.stackdriver.com:8000\"/" "/etc/google-fluentd/google-fluentd.conf" \
    && rm -rf /var/lib/apt/lists/* \
    && rm /tmp/* \
    && find /var/log -name "*.log" -type f -delete

ADD run.sh /run.sh

CMD /run.sh
