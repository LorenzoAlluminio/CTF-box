FROM ubuntu:latest

ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y
RUN apt install -y git curl tmux neofetch vim
RUN curl -sLf https://spacevim.org/install.sh | bash
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN apt install -y zsh
RUN chsh -s $(which zsh) 
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl 
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN apt install -y python3-pip
RUN apt install -y python2
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python2 get-pip.py
RUN pip3 install virtualenv virtualenvwrapper
RUN pip3 install ipython ipdb
RUN pip3 install pwntools
RUN python2 -m pip install ipython
RUN git clone --bare https://github.com/LorenzoAlluminio/dotfiles.git $HOME/.dotfiles
RUN /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f CTF-box
RUN rm get-pip.py
COPY .p10k.zsh /root/.p10k.zsh
CMD tmux
