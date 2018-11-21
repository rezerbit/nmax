# nmax

[![Build Status](https://travis-ci.org/rezerbit/nmax.svg?branch=master)](https://travis-ci.org/rezerbit/nmax)

💎 A script that finds n largest numbers from a text stream.

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
```docker
docker run --rm \
  -ti registry.rezerbit.com/nmax \
  --mount type=bind, \
          source=<YOUR_DIRRECTORY_WITH_SAMPLE_FILE>, \
          target=/nmax/samle_data

cat samle_data/<YOUR_SAMPLE_FILE> | nmax 10000
```

## Development in a container

```bash
docker-compose up
docker exec -ti <CONTAINER_NAME> bash
```

### How build the image for usage

```bash
docker build -t registry.rezerbit.com/nmax .
```

## License

MIT
