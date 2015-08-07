#
# based on haron/vim Dockerfile
#
FROM ubuntu:latest 

MAINTAINER Lucas Benedicic <benedicic@cscs.ch>

# environment variables
ENV DEBIAN_FRONTEND noninteractive

# install software
RUN apt-get update && \
    apt-get install -y build-essential \
                       clang           \
                       cmake           \
                       fontconfig      \
                       git             \
                       python-dev      \
                       vim             \
                       wget

# user and locale configuration
RUN useradd dev                                                     && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime             && \
    dpkg-reconfigure locales                                        && \
    locale-gen en_US.UTF-8                                          && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

WORKDIR /home/dev
ENV HOME /home/dev
ENV LC_ALL en_US.UTF-8 
RUN chown --recursive dev:dev $HOME
USER dev

# include the user's vimrc
ADD vimrc .vimrc

# setup NeoBundle vim plugin manager
RUN mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle                                && \
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

RUN vim -E -c 'qa' ~/.vimrc

# install Powerline fonts 
RUN mkdir -p $HOME/.fonts $HOME/.config/fontconfig/conf.d                                                                       && \ 
    wget -P $HOME/.fonts https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf                            && \ 
    wget -P $HOME/.config/fontconfig/conf.d/ https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf   && \ 
    fc-cache -vf $HOME/.fonts/                                                                                                  && \ 
    echo "set guifont=Droid\\ Sans\\ Mono\\ 10" 
    # echo "set guifont=Liberation\\ Mono\\ for\\ Powerline\\ 10" 

CMD vim
