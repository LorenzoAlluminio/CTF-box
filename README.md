# CTF-box

dockerized Capture The Flag setup

## Usage

- build image
```
docker build . -t "ctfbox:latest"
```

- run the image with interactive shell
```
docker run -it ctfbox
```

- run the image with interactive shell and mount a directory in it
```
docker run -it --mount type=bind,source=/home/lorenzo/CTF/challenges/pwncollege/babyshell/level1,target=/mnt ctfbox
```

- to reconfigure the powerlevel10k theme if the default configuration is not ok
```
p10k configure
```
