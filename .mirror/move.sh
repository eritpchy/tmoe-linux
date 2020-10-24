cd ~/gitee/linux
COMMIT_COUNT=$(curl -L gitee.com/mo2/linux.git | grep 次提交 | awk '{print $1}')
sed -i -E "s@(tmoe linux manager) v1.*?,@\1 v1.${COMMIT_COUNT},@g" manager.sh
cp -r .gitignore debian.sh install.sh tool.sh zsh.sh manager.sh Licenses share .mirror tools .config ~/github/github-linux
cd ~/github/github-linux/.mirror
./github.sh
#printf '%s\n' 'git commit -am '
code ~/github/github-linux
