### Docker installation
* Make sure `docker` is correctly installed and running in the target host.
* Double check by running the following command as a normal user:

```
$> docker images
```

* If you get a permission denied error, make sure your user is a member of the `docker` group.

### Building

* Open the included `vimrc` and change it to fit your needs.
* Add or remove any VIM plugins from the 'Vim plugins' section of `Dockerfile`.
* Execute the script `build.sh` to create the container's image.

### Using the container
* The container is started by launching the included script `run.sh`, which accepts a file as a parameter, e.g.:

```
$> run.sh my_file.txt
```

will start the container with the current directory directly accessible and `my_file.txt` opened inside VIM.

```
$> run.sh
```

will start the container with the closest Git repository root found upstream, or the current directory if none exists.
* You may create an alias in your `.profile` or `.bashrc` to launch the container when calling VIM, e.g.:

```
alias vim="/path/to/run.sh"
```
* To alter your `vimrc` after building the image, change the `run.sh` script to include this line as part of the `docker run ...` command:

```
docker run ... \
-v /path/to/your/new/vimrc:/home/dev/.vimrc \
... \
```

Enjoy!
