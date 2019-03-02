if exists('loaded_vim_navigator_plugin') | finish | endif
let loaded_vim_navigator_plugin = 1

function! s:mark()
	let pos = [bufnr("%"), winsaveview()]
	if !exists('w:positions')
		let w:positions = []
        let w:cursor = -1
    endif

    if w:cursor != -1 && w:positions[ w:cursor ] == pos
        return
    end

    let w:cursor += 1
    if w:cursor < len(w:positions)
        let w:positions[ w:cursor ] = pos
        let w:positions = w:positions[ 0 : w:cursor ]
    else
		call add(w:positions, pos)
    endif
endfunction

function! s:forward()
	if !exists('w:positions') || len(w:positions) == 0
		echo "position list empty"
		return
	endif
    if w:cursor + 1 >= len(w:positions)
        echo "already at the end of position list"
		return
    endif
    let w:cursor += 1
    let [bufnr, pos] = w:positions[ w:cursor ]
	if bufnr != bufnr("%")
		execute "edit #" . bufnr
	endif
    call winrestview(pos)
endfunction

function! s:backward()
	if !exists('w:positions') || len(w:positions) == 0
		echo "position list empty"
		return
	endif
    if w:cursor <= 0
        echo "already at the beginning of position list"
		return
    endif
    let w:cursor -= 1
    let [bufnr, pos] = w:positions[ w:cursor ]
	if bufnr != bufnr("%")
		execute "edit #" . bufnr
	endif
    call winrestview(pos)
endfunction

command! NavMark call s:mark()
command! NavForward call s:forward()
command! NavBackward call s:backward()
