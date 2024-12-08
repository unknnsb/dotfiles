<h1 align="center">🚀 Dotfiles</h1>
<p align="center">My Minimal Dotfiles for a Productive Workflow</p>

---

### 📚 **Editor Setup**

- [Neovim](https://github.com/neovim/neovim) – A highly extensible text editor

---

### 🐚 **Fish Shell Setup**

- [Fish Shell](https://fishshell.com/) – A smart and user-friendly shell
- [Fisher](https://github.com/jorgebucaran/fisher) – Plugin manager for Fish
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish) – Fish theme for a sleek terminal look.
  Install with: `fisher install oh-my-fish/theme-bobthefish`
- [Z](https://github.com/jethrokuan/z) – Directory jumper for faster navigation
- [Eza](https://github.com/eza-community/eza) – Colorful `ls` replacement with icons
- [Ghq](https://github.com/2nthony/ghq) – Local Git repository organizer
- [Peco](https://github.com/peco/peco) – Interactive filtering tool

---

### 🔥 **Inspired Configs**

These are the dotfiles repositories that inspired this setup:

- [craftzdog/dotfiles-public](https://github.com/craftzdog/dotfiles-public) – A personal dotfiles setup
- [2nthony/dotfiles](https://github.com/2nthony/dotfiles) – Minimalist approach to dotfiles
- [ChristianChiarulli/nvim](https://github.com/ChristianChiarulli/nvim/) – Neovim configuration by Christian Chiarulli
- [theprimeagen/.dotfiles](https://github.com/ThePrimeagen/.dotfiles/) – Primeagen's powerful dotfiles setup

---

### 🚀 **Installation Instructions**

1. **Clone the dotfiles repository**:

    ```bash
    git clone --bare https://github.com/ItzNesbro/dotfiles $HOME/.dotfiles
    ```

2. **Install required dependencies**:

    Install the necessary software like **Fish** and **Neovim**:

    ```bash
    sudo apt install fish neovim
    ```

3. **Configure the dotfiles repository**:

    Create an alias to make it easier to work with the dotfiles:

    ```bash
    alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```

4. **Remove existing conflicting files** (optional but recommended):

    If the files already exist on your new device, you may want to remove them to avoid conflicts. Use the following command to ensure that your dotfiles are in sync:

    ```bash
    config checkout
    ```

5. **Hide untracked files**:

    This step ensures that untracked files won't show up in the status, keeping your workspace clean:

    ```bash
    config config --local status.showUntrackedFiles no
    ```

---

### 💬 **Connect with Me**

If you have any questions or want to discuss improvements, feel free to reach out to me on [GitHub](https://github.com/ItzNesbro) or [Instagram](https://instagram.com/_nesbeer).
