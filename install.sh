#!/bin/bash -e

# install python prereqs
add-apt-repository -y ppa:fkrull/deadsnakes
apt-get update
apt-get install -y libxml2 libxml2-dev libxslt1.1 libxslt1-dev libffi-dev libssl-dev libpq-dev libmysqlclient-dev

# Installing pip-8.1.2
wget https://bootstrap.pypa.io/3.2/get-pip.py
python get-pip.py
python -m pip install pip==8.1.2

# Installing virtualenv-13.1.2
wget https://pypi.python.org/packages/source/v/virtualenv/virtualenv-13.1.2.tar.gz#md5=b989598f068d64b32dead530eb25589a
tar xvzf virtualenv-13.1.2.tar.gz
cd virtualenv-13.1.2
python setup.py install
cd /

#!/bin/bash
for file in /u16pytall/version/*;
do
  $file
done
