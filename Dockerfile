FROM ruby:2.5.1
MAINTAINER rezerbit@gmail.com

RUN apt-get update -qq \
  && apt-get install -y build-essential \
  && apt-get clean

COPY . /nmax
WORKDIR /nmax
RUN bundle install

VOLUME ["sample_data"]
CMD ["/bin/bash"]
