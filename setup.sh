sudo apt-get update
sudo apt-get install zsh zsh-syntax-highlighting zsh-autosuggestions
chsh -s $(which zsh)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
sudo chmod -R 755 $HOME/.zsh

if [ ! -f /etc/wsl.conf ] ; then
	cat <<EOT >> /etc/wsl.conf
[automount]
options = "metadata"
EOT
fi
