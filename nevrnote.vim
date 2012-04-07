" echo "hello"
" 
let s:home_path = $HOME . "/.nevrnote"
let s:buffers_path = s:home_path . "/buffers"
let s:executable = "./bin/nevrnote"

" Returns a nevrnote buffer file for the current buffer.
"
function! NNbuffer_file()
  let l:current_buffer = expand("%")

  if !strlen(l:current_buffer)
    return s:buffers_path . "/new"
  end

  if stridx(l:current_buffer, s:buffers_path) != -1
    return l:current_buffer
  end

  return ""
endfunction

function! NNwrite()
  let l:buffer_file = NNbuffer_file()

  if strlen(l:buffer_file)
    echo "we can write to " . l:buffer_file
    let l:out = system(s:executable . " hello")
    if v:shell_error ==# 0
      echo "success with " . l:out
    else
      echo "failed"
    end
  else
    echo "better not do anything with this buffer"
  end

"  if filewritable("nn")
"    echo "file is writable"
"  else
"    echo "Sorry"
"  endif
endfunction
