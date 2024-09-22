# to run these tests

## build both containers

```bash
docker build . -t test:v1
docker build . -t test:v2 -f Dockerfile_overwrite
```

## Checkout the dockerfiles

Look at the differences. 

- test:v1 is based on Busybox
- test:v2 is based on test:v1
  - Only difference is the script, which overwrites the one added in test:v1
- the CMD runs the same script in both (/opt/cat_script.sh)

## run both

### docker run test:v1

```bash
docker run test:v1                               
this is the meow file

What does the cat say?

--------------------

this is the cat file

Meow

 _._     _,-'""`-._
(,-.`._,'(       |\`-/|
    `-.-' \ )-`( , o o)
          `-    \`_`"'-%   ```


### docker run test:v2

```bash
docker run test:v2
this is the meow file

What does the cat say?
```