FROM python:3.7-alpine AS builder

WORKDIR /docker-registry-list
RUN ["apk", "add",  "--no-cache", "git"]
RUN ["git", "clone", "https://github.com/al4/docker-registry-list.git", "."]
RUN ["pip", "install", "--user", "-r", "requirements.txt"]
RUN ["apk", "del", "--purge", "git"]

FROM python:3.7-alpine AS container
COPY --from=builder /root/.local /root/.local
COPY --from=builder /docker-registry-list /opt/docker-registry-list

WORKDIR /opt/docker-registry-list
ENTRYPOINT ["python", "./docker-registry-list.py"]
CMD ["--help"]
