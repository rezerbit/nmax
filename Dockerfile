FROM ruby:2.5.3

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . /nmax
WORKDIR /nmax
RUN gem update bundle && bundle install --without development
ENV PATH="./bin:$PATH"

VOLUME ["sample_data"]
CMD ["/bin/bash"]
