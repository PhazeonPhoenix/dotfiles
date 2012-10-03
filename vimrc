" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=2     " Allow backspacing over everything in insert mode
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
set nobackup		" do not keep a backup file
set history=50		" keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch		" do incremental searching
set background=dark " When set to 'dark', Vim will try to use colors that look
                    " good on a dark background. When set to 'light', Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
set number          " Enable line numbers
set showmode        " Show current mode in status bar.
set mouse=          " Kill the rat!
set hlsearch        " Switch on highlighting the last used search pattern

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  " Autoindent is always on
  set autoindent
  set smartindent
endif " has("autocmd")

" Toggle paste option in normal and insert modes
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Toggle cursorline in normal and insert modes
nnoremap <silent> <F3> :set cursorline!<CR>
inoremap <silent> <F3> <ESC>:set cursorline!<CR>a

" Force 16 color mode if not in 256 color mode
if $t_Co != 255
  set t_Co=16
endif

" Color line numbers in dark grey
highlight LineNr ctermfg=darkgrey

" Color the current line white on dark grey
highlight CursorLine cterm=NONE ctermbg=darkgray ctermfg=white
