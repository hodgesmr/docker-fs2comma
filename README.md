# docker-fs2comma

FEC's `fs2comma` [tool](https://www.fec.gov/help-candidates-and-committees/filing-reports/data-conversion-tools/) as a Docker image. The originial source code is available in [hodgesmr/fs2comma](https://github.com/hodgesmr/fs2comma). This docker image is built from a [patched version](https://github.com/hodgesmr/fs2comma-linux-patch) that builds for Linux.

[View on Docker Hub](https://hub.docker.com/r/hodgesmr/fs2comma)

## Just tell me what to do.

If you have a local file: `/data/path/406260.fec`, you can convert it to CSV with:

```sh
docker run -v /data/path/:/opt/ hodgesmr/fs2comma /opt/406260.fec
```

## A Matt Hodges project

This project is maintained by [@hodgesmr](http://twitter.com/hodgesmr).

_Please use it for good, not evil._
