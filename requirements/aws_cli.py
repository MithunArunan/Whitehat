curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip3 install --user --upgrade awscli
export PATH=~/Library/Python/3.4/bin:$PATH
source ~/.bash_profile
aws configure
