FROM circleci/node:latest

RUN sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && sudo apt-get update \
  && sudo apt-get install -y google-chrome-stable

RUN sudo mkdir fonts

RUN cd opt \
  && sudo wget -q https://github.com/adobe-fonts/source-han-sans/raw/release/OTF/SourceHanSansJ.zip \
  && sudo unzip SourceHanSansJ.zip \
  && sudo mv SourceHanSansJ/*.otf ../fonts \
  && sudo rm -rf SourceHanSansJ*

RUN cd opt \
  && sudo wget -q http://getsuren.com/download/download.cgi?name=GN-Kin-iro_SansSerif.zip \
  && sudo unzip download.cgi?name=GN-Kin-iro_SansSerif.zip \
  && sudo mv *.ttf ../fonts \
  && sudo rm download.cgi?name=GN-Kin-iro_SansSerif.zip
