# Add your image here
FROM ubuntu:21.10


# Options for setup script
ARG INSTALL_ZSH="true"
ARG UPGRADE_PACKAGES="false"
ARG USERNAME=blackdog
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" DISPLAY=":1" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"
# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "flase" "flase" \
    #
    # ****************************************************************************
    # * TODO: Add any additional OS packages you want included in the definition *
    # * here. We want to do this before cleanup to keep the "layer" small.       *
    # ****************************************************************************
    && apt-get -y install --no-install-recommends python3-pip openssh-server sudo

RUN echo 'blackdog:dogsec' | chpasswd
RUN service ssh start
RUN echo "cd /home/blackdog/blackdog_workspace/blackdog && poetry shell" >> /bin/blackinit
RUN chmod +x /bin/blackinit
USER blackdog
RUN /bin/bash /tmp/library-scripts/utils-debian.sh
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>