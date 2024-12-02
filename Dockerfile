FROM alpine/ansible:latest

RUN apk add py3-pip

RUN pip install uptime-kuma-api --break-system-packages
RUN ansible-galaxy collection install lucasheld.uptime_kuma

ADD entrypoint.yml /

ENTRYPOINT [ "ansible-playbook", "/entrypoint.yml" ]