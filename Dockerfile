# Docker >= 17.05.0-ce allows using build-time args (ARG) in FROM (#31352).
# https://github.com/moby/moby/releases/tag/v17.05.0-ce
ARG OS_NAME=ubuntu
ARG OS_VERSION=bionic
ARG ARCH=arm64
FROM multiarch/${OS_NAME}-debootstrap:${ARCH}-${OS_VERSION}

# Test with non-root user.
ENV TEST_USER test
ENV WORK_DIR "/build"

RUN uname -a
RUN apt-get update -qq && \
  apt-get install -yq --no-install-suggests --no-install-recommends \
  build-essential \
  gcc \
  make \
  git \
  sudo

# Create test user and the environment
RUN useradd "${TEST_USER}"
WORKDIR "${WORK_DIR}"
COPY . .
RUN chown -R "${TEST_USER}:${TEST_USER}" "${WORK_DIR}"

# Enable sudo without password for convenience.
RUN echo "${TEST_USER} ALL = NOPASSWD: ALL" >> /etc/sudoers

USER "${TEST_USER}"
