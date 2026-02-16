## Ramzi's Dotfiles

## Using GNU Stow

[GNU Stow](https://www.gnu.org/software/stow/) creates symlinks from this repo into your home directory, so configs stay version-controlled.

### Setup
```bash
# Clone the repo into your home directory
cd ~
git clone git@github.com:ralaruri/dotfiles.git

# Symlink everything into ~
cd ~/dotfiles
stow .
```

### Syncing changes
```bash
# Pull latest and re-stow
cd ~/dotfiles
git pull
stow .
```

### If you add new config files
```bash
# Add the file to the dotfiles repo, then re-stow
cd ~/dotfiles
stow .
git add <file>
git commit -m "Add <description>"
git push
```

### Removing symlinks
```bash
cd ~/dotfiles
stow -D .
```

> **Note:** If stow reports conflicts, it means a real file (not a symlink) already exists at the target. Back it up and remove it, then re-run `stow .`.

## Prereqs installation:
- Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- stow: `brew install stow`
- neovim: `brew install neovim`
- tmux: `brew install tmux`
- starship: `curl -sS https://starship.rs/install.sh | sh`
- poetry: `curl -sSL https://install.python-poetry.org | python3 -`
- direnv: `brew install direnv`
- asdf: `brew install asdf`
- uv: `brew install uv`
- ghostty: `brew install --cask ghostty`
- rectangle: `brew install --cask rectangle`
- vscode: `brew install --cask visual-studio-code`

### Main Configurations in this Repo:
#### Neovim
#### Tmux
#### Ghostty
