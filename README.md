# dotfiles

## Stow

This repo is managed by GNU Stow.

### Usage

I keep my dotfiles repo in ~/repos/dotfiles, so we need to adapt the paths when running stow, which would by default softlink to the parent directory of the cwd.

```bash
stow -d ~/repos/dotfiles/ -t ~ -R <package>
```