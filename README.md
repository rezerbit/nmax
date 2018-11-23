# nmax

💎 A script that finds n largest numbers from a text stream.

[![Build Status](https://travis-ci.org/rezerbit/nmax.svg?branch=master)](https://travis-ci.org/rezerbit/nmax)
[![Codecov](https://codecov.io/gh/rezerbit/nmax/branch/master/graph/badge.svg)](https://codecov.io/gh/rezerbit/nmax)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/23656270db624fd285c4e645ea436150)](https://www.codacy.com/app/rezerbit/nmax?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=rezerbit/nmax&amp;utm_campaign=Badge_Grade)

## Usage

If you have installed ruby:

```bash
git clone git@github.com:rezerbit/nmax.git
cd nmax
export PATH="./bin:$PATH"
setup
cat samle_data/<YOUR_SAMPLE_FILE> | nmax 10000
```

Or you can use docker:
```bash
docker run --rm -ti\
  -v <YOUR_DIRRECTORY_WITH_SAMPLE_FILE>:/nmax/sample_data \
  registry.rezerbit.com/nmax

cat sample_data/<YOUR_SAMPLE_FILE> | nmax 10000
```

For example:
```bash
docker run --rm -ti\
  -v /Users/rezerbit/projects/nmax/spec/fixtures:/nmax/sample_data \
  registry.rezerbit.com/nmax

cat sample_data/small_sample_data.txt | nmax 10
```

## How build and push the image for usage

```bash
docker build -t registry.rezerbit.com/nmax .
docker push registry.rezerbit.com/nmax
```

## Development in a container

```bash
docker-compose up
docker exec -ti nmax bash
```

## License

MIT
