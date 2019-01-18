#!/bin/bash
cd ~/repo/fluent-plugin-buffer-output-stub
gem build fluent-plugin-buffer-output-stub.gemspec
mv fluent-plugin-buffer-output-stub-0.0.1.gem ~/repo/google-fluentd/docker/fluent-plugin-buffer-output-stub-0.0.1.gem
cd ~/repo/google-fluentd/docker
docker build --no-cache .
