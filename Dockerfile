FROM ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates gdebi && \
curl -o /tmp/chrome.deb https://sjmulder.nl/dl/chrome/chrome64_62.0.3202.75.deb && \
gdebi -n /tmp/chrome.deb && \
apt-get purge -y curl gdebi && \
rm -rf /var/lib/apt/lists/* /tmp/*

RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m -d /home/app -c "App user" app && chmod 755 /home/app

WORKDIR /home/app

USER app

CMD google-chrome
