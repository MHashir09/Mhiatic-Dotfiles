# Zsh Setup Requirements

## Oh-My-Zsh
Install Oh My Zsh:
   `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`


## Plugins
Then you need to install following plugins required by my zshrc or you can omit this by simply removing them from my zshrc file if you choose not to install these plugins or use some other plugins.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
```
