Checked out from https://github.com/rkh/zsh-jj - b6453d6ff5d233d472e5088d066c6469eb05c71b - then changed

# Jujutsu support for Z Shell 

This repository contains two things:

* VCS Info support for Jujutsu (inside [functions](functions) directory)
* A pre-configured zsh prompt for both Jujutsu and git, as a zsh plugin, inspired by [zap-prompt](https://github.com/zap-zsh/zap-prompt)

If you want to use the prompt out of the box, you can set it up however you install zsh plugins.

With [zap](https://www.zapzsh.com/), add the following to your `.zshrc`:

```shell
plug "rkh/zsh-jj"
```

Without a plugin manager, clone the repository, and source `zsh-jj.plugin.zsh` in your `.zshrc`:

```shell
source /path/to/zsh-jujutsu/zsh-jj.plugin.zsh
```

If you only want JJ support, but not the prompt, add the functions directory to your `$fpath` and enable `jj` in your `.zshrc`:

```shell
fpath+=/path/to/zsh-jujutsu/functions
zstyle ':vcs_info:*' enable jj
```
