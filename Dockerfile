FROM ruby:2.5.3
MAINTAINER rezerbit@gmail.com

RUN apt-get update -qq \
  && apt-get install -y build-essential \
  && apt-get clean

COPY . /nmax
WORKDIR /nmax
RUN gem update bundle && bundle install --without development
ENV PATH="./bin:$PATH"

VOLUME ["sample_data"]
CMD ["/bin/bash"]
