# mbentley/md2rst

docker image for [md2rst](https://tox.readthedocs.io/en/latest/)
based off of ubuntu:20.04

To pull this image:
`docker pull mbentley/md2rst`

Example usage:

1. Run md2rst:

    ```
    docker run -it --rm \
      --name md2rst \
      -e MY_USERNAME="${USER}" \
      -e MY_UID="$(id -u)" \
      -e MY_GID="$(id -g)" \
      -v "${PWD}":/data \
      -w /data \
      mbentley/md2rst \
        md2rst.sh <source> <destination>
    ```

If you wish to run md2rst and have it appear to run as if it is natively installed and work by just calling `md2rst`, create a bash function and add it to your `~/.bashrc`:

```bash
md2rst() {
  docker run -it --rm \
    --name md2rst \
    -e MY_USERNAME="${USER}" \
    -e MY_UID="$(id -u)" \
    -e MY_GID="$(id -g)" \
    -v "${PWD}":/data \
    -w /data \
    mbentley/md2rst \
      md2rst.sh ${@}
}
```
