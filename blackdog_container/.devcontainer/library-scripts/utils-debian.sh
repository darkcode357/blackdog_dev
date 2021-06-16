apt update
apt install openssh-server git -y
pip3 install --upgrade pip
pip3 install pipx
pip3 install poetry
echo "repository"
mkdir -p blackdog_workspace
cd /blackdog_workspace
git clone https://github.com/darkcode357/blackdog/