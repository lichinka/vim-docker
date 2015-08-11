### Building

* Check that the included `vimrc` fits your needs.
* Add any extra Vim plugins you want to use in the 'Vim plugins' section of `Dockerfile`.
* Execute the script `build.sh`

### Using the container
* Use the included script `run.sh`, which accepts two parameters, e.g.:

```
$> run.sh $(pwd)
```

will start the container with the current directory directly accessible.

```
$> run.sh /tmp my_test
```

will start the container with the local directory `/tmp` mounted under `my_test`.
