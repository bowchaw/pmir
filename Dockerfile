FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

#mediainfo
RUN apt-get -qq install -y mediainfo

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN aria2c https://dl.dropboxusercontent.com/s/jo9htx7ovbvq9uf/hoiulalulali.zip && \
7z x hoiulalulali.zip && rm hoiulalulali.zip

CMD ["bash", "start.sh"]
