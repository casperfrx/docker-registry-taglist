FROM python:3.7-alpine

WORKDIR /opt/docker-registry-list

RUN ["apk", "add", "--no-cache", "git"]
RUN ["git", "clone", "https://github.com/al4/docker-registry-list.git", "./"]
RUN ["apk", "del", "git"]
RUN ["pip", "install", "--no-cache-dir", "-r", "requirements.txt"]

ENTRYPOINT ["python", "./docker-registry-list.py"]
CMD ["--help"]

