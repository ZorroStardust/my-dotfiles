---

# 🗂️ Dotfiles (Bare Repo Setup)

This repository manages my personal configuration files using a **bare Git repository** approach.

It allows me to:

* Track dotfiles with Git
* Sync across machines
* Avoid symlinks
* Keep `$HOME` as the working tree

---

# ⚙️ Setup on a New Machine

## 1. Clone the bare repository

```bash
git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git $HOME/.dotfiles
```

---

## 2. Define alias

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Optional: persist it

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles --work-tree=\$HOME'" >> ~/.bashrc
source ~/.bashrc
```

---

## 3. Checkout files

```bash
dotfiles checkout
```

---

## ❗ If checkout fails (very common)

Backup conflicting files:

```bash
mkdir -p ~/.dotfiles-backup

dotfiles checkout 2>&1 | grep "\." | awk '{print $1}' | while read file; do
    mkdir -p ~/.dotfiles-backup/$(dirname "$file")
    mv "$file" ~/.dotfiles-backup/"$file"
done
```

Then retry:

```bash
dotfiles checkout
```

---

## 4. Hide untracked files

```bash
dotfiles config --local status.showUntrackedFiles no
```

---

# 📦 Usage

## Add new config

```bash
dotfiles add ~/.bashrc
dotfiles commit -m "Update bash config"
dotfiles push
```

---

## Check status

```bash
dotfiles status
```

---

## View changes

```bash
dotfiles diff
```

---

# 📁 What is tracked

Typical files included:

* `.bashrc`
* `.gitconfig`
* `.vimrc`
* `.config/`
* `.tmux.conf`

---

# 🚫 What is NOT tracked

The following should NOT be committed:

* `.ssh/`
* `.gnupg/`
* `.vim/plugged/`
* `.cache/`
* `.local/share/`

---

# 🔌 Vim / Neovim Plugins

Plugins are **not tracked**.

After setup, install plugins manually:

### Vim (vim-plug)

```vim
:PlugInstall
```

---

# 🔐 Sensitive Data Strategy

Do NOT store secrets in this repo.

Use one of these approaches:

## Option 1: Local override files

Example:

```bash
~/.bashrc.local
```

In `.bashrc`:

```bash
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
```

---

## Option 2: Environment-specific config

```bash
if [ "$(hostname)" = "laptop" ]; then
    export EDITOR=nvim
fi
```

---

# 🧠 Tips

## Avoid adding entire home

❌ Never run:

```bash
dotfiles add .
```

---

## Add selectively

Always specify exact files:

```bash
dotfiles add ~/.bashrc
```

---

## Ignore unwanted files

Global ignore:

```bash
echo ".vim/plugged/" >> ~/.gitignore
dotfiles add ~/.gitignore
```

Or local-only ignore:

```bash
echo ".vim/plugged/" >> ~/.dotfiles/info/exclude
```

---

# 🔄 Updating on Existing Machines

```bash
dotfiles pull
```

---

# 🧩 Troubleshooting

## Permission issues

Git does not fully preserve:

* file ownership
* special permissions

Avoid tracking sensitive files.

---

## Conflicts after pull

Resolve like normal Git:

```bash
dotfiles status
dotfiles diff
```

---

# 📌 Summary

This setup:

* Uses a bare Git repo in `~/.dotfiles`
* Treats `$HOME` as working tree
* Tracks only essential config
* Keeps system clean and portable

---
