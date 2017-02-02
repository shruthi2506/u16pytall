#!/bin/bash -e

apt-get update
apt-get install -y libxml2 libxml2-dev libxslt1.1 libxslt1-dev libffi-dev libssl-dev libpq-dev libmysqlclient-dev

#installing pyenv environment
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Installing pip-8.1.2
wget https://bootstrap.pypa.io/3.2/get-pip.py
python get-pip.py
python -m pip install pip==8.1.2 #use same version as on ubuntu 14 image

# Installing virtualenv-13.1.2
wget https://pypi.python.org/packages/source/v/virtualenv/virtualenv-13.1.2.tar.gz#md5=b989598f068d64b32dead530eb25589a
tar xvzf virtualenv-13.1.2.tar.gz
cd virtualenv-13.1.2
python setup.py install
cd /

#Installing a plugin for pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
eval "$(pyenv virtualenv-init -)"

./u16pytall/version/pypy3.sh

declare -a versions=('2.7.9' '3.2.5' '3.3.6' '3.4.6' '3.5.2' '3.6.0' 'pypy-5.1'  'pypy3.3-5.5-alpha')
for version in "${versions[@]}"
do
 echo "=================== Installing $version =============="
 pyenv install $version
 echo "==================== Successfully installed $version ================"
done


