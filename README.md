# dotfiles


https://www.atlassian.com/git/tutorials/dotfiles

# Other packages

Install fzf, ctags. Put CTags in bin directory in the home.
=======
```
echo ".cfg" >> .gitignore
git clone --bare git@github.com:droidkid/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
config checkout
```

Install Vundle:  https://github.com/VundleVim/Vundle.vim#quick-start

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

```
# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# For i3
sudo apt install jq
# Tex
sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

# For i3 https://tau.gr/posts/2020/2020-02-23-my_customizations_i3/
sudo apt install jq
```
