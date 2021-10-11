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

RUN echo "Sanity check"
RUN echo "node: $(node --version)"
RUN echo "yarn: $(yarn --version)"
RUN echo "python3: $(python3 --version)"
RUN echo "pip3: $(pip3 --version)"
RUN echo "aws: $(aws --version)"

CMD ["bash"]