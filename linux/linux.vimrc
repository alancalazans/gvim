"																			###
"													##  #####  ###### ####### #
"													##         ######         #
"														#       #######       ##
"														#       ######       #
"														#       ####       ##
"														#       ##        #####
"													 ##       #       ########
"												 ####             ###########
"													###           # ##########
"														#          ############
"														#        ##  ##   #  #  #
"														#       ###  ## ### ### #
"														#     ####  ##  ## ### #
"														#   ############## ### #
"														 ###    #######
"																			##
"==============================================================================
" File: .vimrc ou _vimrc
" Author: Alan Calazans <alan2calazans@gmail.com>
" Last Update: Dom 26 Abr 2020 20:02:00 BRT
" Created: Sex 22 Mai 2009 10:01:22 BRT
" Installation: - As dotfile drop the file into your $HOME/ folder.
"               - In Command line put $vim -U .vimrc.
" License: GNU General Public License v3
"          <http://www.gnu.org/licenses/gpl.html>
" Version: 4.0
" Notes: Based on the file:
"        .vimrc (1.0) made by Ivan Carlos da Silva Lopes
"        .vimrc made by Aurelio Marinho Jarga (verde)
"        .vimrc made by Sérgio Luiz Araújo Silva  (voyeg3r) and
"        .vimrc made by J. F. Mitre <jfmitre (at) gmail.com>
"==============================================================================
set noautochdir " Definir diretorio atual automaticamente
set nostartofline " Não resetar o cursor para o inicio da linha
set autoread " Ler arquivo automaticamente caso ele for modificado externalmente
set ai " Ao criar nova linha, usa indentação da linha anterior
set nocompatible
set ruler " show the cursor position all the time
set showmatch " Faz o highlight do parênteses, colechetes ou chave correspondente
"=============================== -> LIGTHLINE =================================
"											Configuration for landscape Theme
"==============================================================================
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'readonly', 'filename', 'modified', ] ],
	\   'right': [ [ 'lineinfo' ],
	\              [ 'percent' ],
	\              [ 'tagbar', 'fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\ 'separator': { 'left': '【', 'right': '】' },
	\ 'component': {
	\   'lineinfo': '%l\%L [%p%%], %c, %n',
	\   'readonly': '%{&readonly?"\ue0a2":""}',
	\ }
	\ }
"==============================================================================
"							 Mudar cor da barra de status dependendo do modo
"==============================================================================
" Ao entrar em modo insert ele muda a cor da barra de status
" altera a cor da linha de status dependendo do modo
if version >= 700
 au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
 au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif
"==============================================================================
"								 Permite que o mouse seja utilizado na edição
"==============================================================================
set mouse=a
"==============================================================================
"						Alguns tipos de arquivos devem ser ignorados pelo Vim.
"==============================================================================
set wildignore=*.o,*.obj,*.bak,*.exe,*.dll,*.com,*.class,*.au,*.wav,*.ps,*.avi,*.wmv,*.flv,*.djvu,*.pdf,*.chm,*.dvi,*.svn/,*~
"source $VIMRUNTIME/mswin.vim
"behave mswin
"==============================================================================
"						Define codificação, fonte, tema, nº de linha e colunas
"==============================================================================
"set nobomb
set encoding=utf-8
set fileencoding=utf-8
"set encoding=iso-8859-1
"set fileencoding=iso-8859-1
"==============================================================================
"			 Retira os ^M que ficam no final de arquivos salvos pelo windows.
"==============================================================================
nmap \/ :%s/\r//g<cr>
"==============================================================================
"					 Remove espaços redundantes no fim das linhas com \e
"==============================================================================
nmap \e mz:%s/\s\+$//g<cr>`z
"==============================================================================
"							 Mapeia a tecla \c para compilar o programa em C
"==============================================================================
"au BufNewFile,BufRead *.c nmap \c :!gcc "%" -Wall -o "%<"<cr>
au BufNewFile,BufRead *.c nmap \c :!gcc -Wall "%"<cr>
"==============================================================================
"									Mapeia a tecla \x para executar o programa
"==============================================================================
"nmap \x :!./"%<"<cr>
nmap \x :!./a.out<cr>
"==============================================================================
"							Configuração de fonte (tamanho e nome) para o GVim
"==============================================================================
if has("gui_running")
	if has("gui_gtk2")
		" Para GTK2
		" Ajustando o tamanho da fonte de acordo com o tamanho da resolução
		" Adicionando no ~/.bashrc as linhas :
		" #--------------------------------------------------------------------
		" # Definindo variável de screen para o vim
		" #--------------------------------------------------------------------
		"  export SCREENSIZE=$(xdpyinfo  | grep 'dim'\
		"                     | sed -e 's/x.*//g' -e 's/^.*[a-z]: *//g')
		" #--------------------------------------------------------------------
		" A beleza dessas linhas é que elas observam o tamanho da resolução do
		" computador cliente, e não do host. Apenas o tamanho horizontal é
		" utilizado como referência, ou seja, 1280x1024, apenas 1280 é
		" verificado para determinar o tamanho da fonte. Isso não funciona bem
		" em monitores cujo o maior tamanho seja o vertical.
		if exists("$SCREENSIZE")
			" se existe a variável $SCREENSIZE
			if ($SCREENSIZE > 1300)
				" se $SCREENSIZE é maior que 1300
				set guifont=Monospace\ 14
			elseif ($SCREENSIZE < 850)
				" se $SCREENSIZE é menor que 850
				set guifont=Monospace\ 8
			else
				" se $SCREENSIZE é maior que 850 e menor que 1300
				set guifont=Monospace\ 11
			endif " Existe SCREENSIZE, e com base nele define-se guifont
			else
				" caso a variável $SCREENSIZE não exista, use...
				" set guifont=DejaVu\ Sans\ Mono\ Book\ 10
				set guifont=Monospace\ 11
		endif  " Define tamanho se existe ou não $SCREENSIZE
	elseif has("x11")
		" Para GTK
		"set guifont=DejaVu\ Sans\ Mono\ Book\ 11
		set guifont=Monospace\ 11
		"set guifont=Courier\ New\ 11
	elseif has("gui_win32")
		" Para Windows
		" set guifont=Consolas:h12:cANSI
		set guifont=Courier\ New:h12:cANSI
	else
		" Para todos as outras gui use ...
		set guifont=Monospace\ 11
	endif " Conclui a verificação do tipo de interface gráfica
endif " Conclui sobre a existência de uma interface gráfica
"==============================================================================
"													Configura linhas, colunas
"==============================================================================
"set lines=42 columns=80
"set wildmenu
"==============================================================================
"											Função para trocar o tema de cores
"								 A primeira linha refere-se ao esquema padrão
"==============================================================================
colorscheme southernlights
function! ToggleColorscheme()
	if g:colors_name == 'southernlights'
		colorscheme cyberpunk
	elseif g:colors_name == 'cyberpunk'
		colorscheme midnight
	elseif g:colors_name == 'midnight'
		colorscheme turbo
	elseif g:colors_name == 'turbo'
		colorscheme borland
	elseif g:colors_name == 'borland'
		colorscheme greens
	elseif g:colors_name == 'greens'
		colorscheme southernlights
	endif
endfunction
nmap <silent>\t :call ToggleColorscheme()<cr>:echo g:colors_name<cr>
"==============================================================================
"											Suprime a mensagem inicial do GVim
"==============================================================================
set shortmess+=I
"==============================================================================
"									Recarrega o arquivo de configuração vimrc
"				Seja a fonte o arquivo .vimrc ou _vimrc, dependendo do sistema
"==============================================================================
if &term == "win32" || "pcterm" || has("gui_win32")
"	map ,v :e C:\gVimPortable\Data\settings\_vimrc <cr>
"	nmap ,v :<c-u>source C:\gVimPortable\Data\settings\_vimrc<bar>echo "Vimrc recarregando!"<cr>
	nmap ,v :source $MYVIMRC<cr>
else
"	map ,v :e ~/.vimrc<cr>
"	nmap ,v :<c-u>source ~/.vimrc<bar>echo "Vimrc recarregando!"<cr>
	nmap ,v :source $MYVIMRC<cr>
endif
"==============================================================================
"					 Sidebar de navegação (NERDTree) em off na carga do GVim
"==============================================================================
let g:nerdtree_tabs_open_on_gui_startup=0
"==============================================================================
"							 Atalho p/ sidebar de navegação (plugin NERDTree)
"==============================================================================
nmap \b :NERDTreeTabsToggle<cr>
"==============================================================================
"													Mostra ou não a identacão
"==============================================================================
"set listchars=tab:¦·,trail:·,eol:$
"set listchars=tab:▸·,trail:·,eol:¬
set listchars=tab:¦\ ,trail:·,eol:¬
"set list
nmap \i :set list!<cr>
"==============================================================================
"													 Ativa e Desativa DrawIt
"==============================================================================
nmap [[ :call ToggleDrawIt('true')<cr>
nmap ]] :call ToggleDrawIt('false')<cr>i
function! ToggleDrawIt(draw)
	if a:draw=='true'
		:DIstart
	else
		:DIstop
	endif
endfunction
"==============================================================================
"															 Multiple Cursors
"				 https://github.com/terryma/vim-multiple-cursors#installation															 
"==============================================================================
"As ligações de teclas, desative-as e reatribua-as da maneira que desejar:
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
"let g:multi_cursor_quit_key            = '<Esc>'
"==============================================================================
"														 Alinhamento de texto
"==============================================================================
nmap \, <esc>:left<cr>
nmap \; <esc>:center<cr>
nmap \. <esc>:right<cr>
"==============================================================================
"													Opções da linha de status
"==============================================================================
" [1][+][RO] ~/.vimrc [vim] [utf-8] 34, 0x22 0-15 13%"
set laststatus=2 " Quando exibir a linha de status: 2=always
set statusline= " Limpa a linha de status
set statusline+=[%n] " Número do buffer atual
set statusline+=%m%r\ " [+] Quando o arquivo for modificado, [RO] para apenas leitura
set statusline+=%f\ " Nome do arquivo
set statusline+=[%{strlen(&ft)?&ft:'none'}] " Tipo do arquivo
set statusline+=[%{strlen(&fenc)?&fenc:&enc}] " Codificação
set statusline+=%= " Alinha tudo a seguir à direita
set statusline+=%b,0x%-8B\ " ASCII e número hexadecimal do caractere sob o cursor
set statusline+=%-4.(%l-%c%)\ %<%P " Linha-coluna do cursor e percentual do arquivo
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ " Como o vim interpreta o cursor abaixo, tipo vimString
"==============================================================================
"									Autocompletar html, css, javascript, php.
"==============================================================================
filetype on
if has('autocmd')
	filetype plugin indent on
	"           │     │    └──── Enable file type detection
	"           │     └───────── Enable loading of indent file
	"           └─────────────── Enable loading of plugin files
	autocmd FileType javascript set complete-=k/home/$USER/.vim/doc/js-list.txt complete+=k/home/$USER/.vim/doc/js-list.txt
	autocmd FileType php set complete-=k/home/$USER/.vim/doc/php-list.txt complete+=k/home/$USER/.vim/doc/php-list.txt
	autocmd FileType css set complete-=k/home/$USER/.vim/doc/css-list.txt complete+=k/home/$USER/.vim/doc/css-list.txt
endif
set omnifunc=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html,xhtml set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType c set omnifunc=ccomplete#Complete
" adiciona omnifunc para demais formatos
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif
imap <c-e> <c-x> <c-o>
setlocal sm " Destaca Abertura e fechamento {} [] ()
"==============================================================================
"																		Emmet
"==============================================================================
"imap <c-n> <c-y>,
"==============================================================================
"									Definindo sintaxe para algumas extenções.
"==============================================================================
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ep set filetype=html
au BufRead,BufNewFile *.pl6 set filetype=perl
au BufRead,BufNewFile *.ts set filetype=javascript
au BufRead,BufNewFile *.go set filetype=go
"==============================================================================
"							Remover barra de menu, barra rolagem e etc do gVim
"==============================================================================
"set guioptions-=m
"set guioptions-=T
"set guioptions-=r
set guioptions+=b "Exibe barra de rolagem vertical
"==============================================================================
"		 Essa opção faz com que o <Backspace> se mova e delete nesses locais:
"								indent - permite passar sobre autoindentação.
"				eol - permite passar sobre o line-break, juntando duas linhas.
"							start - permite passar sobre o ponto de inserção.
"==============================================================================
set backspace=indent,eol,start
"==============================================================================
"									 Numeração de linhas e busca de palavras
"==============================================================================
set nu "linhas numeradas
set is hls is scs "para busca
"==============================================================================
"													 Cor da numeração lateral
"==============================================================================
"hi LineNr     guifg=pink     ctermfg=lightMagenta
hi LineNr     guifg=green    ctermfg=lightGreen
"==============================================================================
"													Ativa coloração de sintaxe
"==============================================================================
syntax on
"==============================================================================
"																	 Backups
"==============================================================================
set nobackup "desabilita os bkps
set noswapfile "evita arquivos temporarios
set nowritebackup "evita arquivos tmp que começam com ~ ou termina com .swp
"==============================================================================
"												 Identação e quebra de linhas
"==============================================================================
set linebreak " Quebra a linha sem quebrar a palavra
set autoindent " Auto identação
set smartindent " Auto-indenta
set ci "recuo
set tabstop=2 " tab = 2 brancos
set shiftwidth=2 " Quando o autoindent faz um tab, ele é do tamanho de 2
set softtabstop=2 " Tecla Backspace volta 2 espaços quando estiver numa identação
set noexpandtab " set expandtab "cria espaços no lugar de tabulação
"set nowrap  " Sem wrap (quebra de linha)
"==============================================================================
"					 permite indentar bloco de texto selecionado usando 'tab'
"								com guia e “des”indentar usando 'shift + tab'
"==============================================================================
imap <s-tab> <c-o><lt><lt>
nmap <tab> >>
nmap <s-tab> <lt><lt>
vmap <tab> >>
vmap <s-tab> <lt>
"==============================================================================
"																 Atalhos Abas
"------------------------------------------------------------------------------
"													'Ctrl+t' abre uma nova aba
"==============================================================================
imap <c-t> <esc>:tabnew<cr>i
nmap <c-t> :tabnew<cr>
"==============================================================================
"				Abrir, Salvar Como arquivo; Localizar e substituir no arquivo
"==============================================================================
nmap \a :browse confirm e<cr>
nmap \w :browse confirm saveas<cr>
nmap \f :promptfind<cr>
nmap \s :promptrepl<cr>
"==============================================================================
"										 'Ctrl+PageUp' pula para próxima aba
"==============================================================================
imap <c-pageup> <esc>:tabnext<cr>i
"==============================================================================
"									 'Ctrl+PageDown' volta para aba anterior
"==============================================================================
imap <c-pagedown> <esc>:tabprevious<cr>i
"==============================================================================
"												'Ctrl+e' fecha a aba corrente
"==============================================================================
imap <c-e> <esc>:tabclose<cr>i
"==============================================================================
"													Atalhos comuns de teclado
"------------------------------------------------------------------------------
"						 Permite selecionar com SHIFT + SETA como no Windows
"==============================================================================
set selectmode=mouse,key
set mousemodel=popup
set keymodel=startsel,stopsel
set selection=exclusive
"==============================================================================
"									Backspace no modo de visão apaga a seleção
"==============================================================================
vmap <bs> d
"==============================================================================
"													 CTRL-X e SHIFT-Del corta
"==============================================================================
vnoremap <c-x> "+x
vnoremap <s-del> "+x
"==============================================================================
"													CTRL-C e CTRL-insert copia
"==============================================================================
vnoremap <c-c> "+y
vnoremap <c-insert> "+y
"==============================================================================
"													CTRL-V e SHIFT-insert cola
"==============================================================================
noremap <c-v> "+gP
noremap <s-insert> "+gP
inoremap <c-v> <c-o>:set nosi<cr><c-r>+<c-o>:set si<cr>
inoremap <s-insert> <c-r>+
cnoremap <c-v> <c-o>:set nosi<cr><c-r>+<c-o>:set si<cr>
cnoremap <s-insert> <c-r>+
"==============================================================================
"																 CTRL-S salva
"==============================================================================
noremap <c-s> :update<cr>
vnoremap <c-s> <c-c>:update<cr>
inoremap <c-S> <c-o>:update<cr>
"==============================================================================
"																CTRL-Z desfaz
"==============================================================================
noremap <c-z> u
vnoremap <c-z> <c-c>u
inoremap <c-z> <c-o>u
"==============================================================================
"																 CTRL-Y refaz
"==============================================================================
noremap <c-y> <c-r>
inoremap <c-y> <c-o><c-r>
"==============================================================================
"														CTRL-A seleciona tudo
"==============================================================================
noremap <c-a> gggH<c-o>G
inoremap <c-a> <c-o>gg<c-o>gH<c-o>G
cnoremap <c-a> <c-c>gggH<c-o>G
onoremap <c-a> <c-c>gggH<c-o>G
snoremap <c-a> <c-c>gggH<c-o>G
xnoremap <c-a> <c-c>ggVG
map <c-a> <esc>ggvG
"==============================================================================
"														CTRL-F4 fecha a janela
"==============================================================================
noremap <c-F4> <c-w>c
inoremap <c-F4> <c-o><c-w>c
cnoremap <c-F4> <c-c><c-w>c
onoremap <c-F4> <c-c><c-w>c
"==============================================================================
"						 mostra o inicio de um bloco recem fechado {}, [], ()
"==============================================================================
set sn
"==============================================================================
" Outra forma de pular fora dos parênteses, colchetes e chaves, mover o cursor
"																no modo insert
"==============================================================================
imap <c-l> <esc><right>a
imap <c-h> <esc><left>a
"==============================================================================
"													 Habilita auto-indentação
"==============================================================================
if has("autocmd")
	filetype plugin indent on
endif
"==============================================================================
"									Movimentação de bloco de texto selecionado
"==============================================================================
" Move bloco de texto selecionado pra cima
function! MoveUp()
	let end=line("'>")
	let start=line("'<")
	if (start > 1)
		let dif=end - start
		exec "'<,'>d"
		exec "normal kP"
		exec "normal " . (start-1) . "GV" . (end-1) . "G"
	else
		exec "normal " . (start) . "GV" . (end) . "G"
	endif
endfunction
" Move bloco de texto selecionado para baixo
function! MoveDown()
	let end=line("'>")
	let start=line("'<")
	if (end < line("$")-1)
		let dif=end - start
		exec "'<,'>d"
		exec "normal p" . (start+1) . "GV" . (end+1) . "G"
	else
		exec "normal " . (start) . "GV" . (end) . "G"
	endif
endfunction
" Duplica um bloco de texto
function! Duplicate()
	let end=line("'>")
	let start=line("'<")
	let dif=end - start
	exec "'<,'>y"
	exec "normal " . end . "G"
	exec "normal p"
	exec "normal " . (start+dif+1) . "GV" . (end+dif+1) . "G"
endfunction
" Move bloco de texto selecionado pra cima
vmap <c-s-up> :<c-u> call MoveUp()<cr>
" Move bloco de texto selecionado pra baixo
vmap <c-s-down> :<c-u>call MoveDown()<cr>
" Duplica o bloco de texto selecionado
vmap <c-d> :<c-u>call Duplicate()<cr>
"==============================================================================
"											Fechamento automático de tags HTML
"==============================================================================
imap ><tab>> <esc>mt?<\w<cr>:let @/=""<cr>lyiw`ta</><esc>P`tli
"==============================================================================
"											,l limpa o buffer de buscas
"==============================================================================
nmap ,l :let @/=""<cr>
"==============================================================================
"									 Entra no modo visual para tabular bloco
"==============================================================================
"imap <f11> <esc><s-v>
"==============================================================================
"											  Executar código com QuickRun
"==============================================================================
imap <c-b> <esc>:QuickRun<cr>i
"==============================================================================
"											MarkDownPreview - Default Setting
"								https://github.com/iamcco/markdown-preview.vim
"==============================================================================
let g:mkdp_path_to_chrome = "/opt/waterfox/waterfox"
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).
"==============================================================================
"															 MarkDownPreview
"==============================================================================
" for normal mode
nmap <silent> \1 <Plug>MarkdownPreview
" for insert mode
"imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> \2 <Plug>StopMarkdownPreview
" for insert mode
"imap <silent> <F9> <Plug>StopMarkdownPreview