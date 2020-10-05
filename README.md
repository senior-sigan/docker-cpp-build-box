# Build box

Docker container with Valgrind, cmake, make, g++, gcc and clang utils.

```shell
docker pull sigan/build_box:latest
```

## Build cmake project

```shell
docker run --rm -i -v $(PWD):/code sigan/build_box cmake -B cmake-build-docker
docker run --rm -i -v $(PWD):/code sigan/build_box cmake --build cmake-build-docker -j 4
```

## Valgrind check

Supposing you'v built cmake project.

```shell
docker run --rm -i -v $(PWD):/code sigan/build_box valgrind --leak-check=full ./cmake-build-docker/program
```

## Makefile

To make life simplier I'd recommend this Makekefile

```Makefile
PROGRAM ?= ""

reload_docker:
	docker run --rm -i -v $(PWD):/code sigan/build_box cmake -B cmake-build-docker

build_docker: reload_docker
	docker run --rm -i -v $(PWD):/code sigan/build_box cmake --build cmake-build-docker -j 4

valgrind_docker:
	docker run --rm -i -v $(PWD):/code sigan/build_box valgrind --leak-check=full ./$(PROGRAM)

clean_docker:
	rm -rf cmake-build-docker
```

### Build using makefile

```shell
make build_docker
```

### Valgrind check using makefile

```shell
make valgrind_docker PROGRAM=cmake-build-docker/program
```
