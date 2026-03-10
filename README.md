# dotfiles

Various files for configuration/personalization

## Installation

- Clone the repository and install [GNU Stow](https://www.gnu.org/software/stow/) using your package management software
- then, within the root of the `dotfiles` repository, execute the following commands:

```
stow . -v --target=${HOME} --dotfiles --ignore=shell
```

- then install any desired configurations using

```
stow <toolname> -v --target=${HOME} 
```

- for tools that install to `${HOME}/.config/`, the folder structure appears as:

```
shell <toolname>
├── .config
│   └── shell <toolname>
│       ├── aliases.sh <configuration files>
│       ├── case_insensitive_completion.sh
│       ├── colored_prompt.sh
│       ├── git_prompt.sh
│       └── set_term_window_title.sh
└── install_jamgotchian_shell.sh <optional outer config>
```

- This structure allows tools to be installed selectively by specifying the toolname as described above

---

- future consideration: use `Ansible` to do syncing and dependency management
