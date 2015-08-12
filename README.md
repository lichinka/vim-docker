### Docker installation
* Make sure `docker` is correctly installed and running in the target host.
* Double check by running the following command as a normal user:

```
$> docker images
```

* If you get a permission denied error, make sure your user is a member of the `docker` group.

### Building

* Open the included `vimrc` and change it to fit your needs.
* Add or remove any Vim plugins from the 'Vim plugins' section of `Dockerfile`.
* Execute the script `build.sh`

### Using the container
* The container is started by launching the included script `run.sh`, which accepts two parameters, e.g.:

```
$> run.sh $(pwd)
```

will start the container with the current directory directly accessible.

```
$> run.sh /tmp my_test
```

will start the container with the local directory `/tmp` mounted under `my_test`.
* You may create an alias in your `.profile` or `.bashrc` to launch the container when calling `vi`, e.g.:

```
alias vi="/path/to/run.sh $(pwd)"
```
