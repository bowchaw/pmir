FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

#mediainfo
RUN apt-get -qq install -y mediainfo

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN aria2c https://dl.dropboxusercontent.com/s/jo9htx7ovbvq9uf/hoiulalulali.zip && \
7z x hoiulalulali.zip && rm hoiulalulali.zip

COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN cp .netrc /root/.netrc
RUN chmod 600 /usr/src/app/.netrc
RUN chmod +x aria.sh

CMD ["bash", "start.sh"]
