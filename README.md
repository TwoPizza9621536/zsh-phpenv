# zsh-phpenv

A zsh plugin for phpenv based on the jenv plugin.

## Usage

To use it, install [`phpenv`](https://github.com/tokuhirom/phpenv) first.

Then clone this repository into the custom plugins directory as `phpenv` of your
zsh plugin manager which is `$ZSH_CUSTOM`, the following is for
[Oh My Zsh](https://ohmyz.sh/) which is `~/.oh-my-zsh/custom/plugins`.

```bash
git clone https://github.com/TwoPizza9621536/zsh-phpenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/phpenv
```

Finally, add phpenv to the plugins array of your zshrc file:

```bash
plugins=(... phpenv)
```

## License

Under the MIT License with the following SPDX expression:

```text
SPDX-License-Identifier: MIT
```
