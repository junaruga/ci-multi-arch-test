FROM multiarch/ubuntu-debootstrap:arm64-bionic

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
