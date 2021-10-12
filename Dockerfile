FROM node:14.18-buster
LABEL maintainer="11157420+pjmp@users.noreply.github.com"

ENV PYTHON_VERSION 3.8.5
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/root/.local/bin:$PATH"

# setup base deps
RUN apt-get update -y \
    && apt install python3-pip -y \
    && pip3 install awscli --user

RUN mkdir /root/.ssh/ && touch /root/.ssh/config && echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN touch /root/.ssh/id_rsa

RUN printf "Sanity check:\nnode: %s\nyarn: %s\npython: %s\npip3: %s\naws: %s\n" "$(node --version)" "$(yarn --version)" "$(python3 --version)" "$(pip3 --version)" "$(aws --version)"

CMD ["bash"]