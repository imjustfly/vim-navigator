# vim-navigator

Vim-navigator is a simple plugin which acts like web browser's navigator. You
can mark the positions under current cursor and move forward or backward
between them.

## Commands

- `:NavMark` marks the current cursor position
- `:NavBack` moves to previous cursor position
- `:NavForward` moves to next cursor position

## Installation

**Pathogen**

```
cd ~/.vim/bundle
git clone git://github.com/imjustfly/vim-navigator.git
```

**VimPlug**

Place this in your .vimrc:

```
Plug 'imjustfly/vim-navigator'
```

Then run the following in you Vim:

```
:source %
:PlugInstall
```

**NeoBundle**

Place this in your .vimrc:

```viml
NeoBundle 'imjustfly/vim-navigator'
```

Then run the following in Vim:

```
:source %
:NeoBundleInstall
```
