" echo "hello"
" 
let s:nn_home_path = $HOME . "/.nevrnote"
let s:nn_buffers_path = s:nn_home_path . "/buffers"
let s:nn_executable = "./nn.rb"

" Returns a nevrnote buffer file for the current buffer.
"
function! NNbuffer_file()
  let l:current_buffer = expand("%")

  if !strlen(l:current_buffer)
    return s:nn_buffers_path . "/new"
  end

  if stridx(l:current_buffer, s:nn_buffers_path) != -1
    return l:current_buffer
  end

  return ""
endfunction

function! NNwrite()
  let l:buffer_file = NNbuffer_file()

  if strlen(l:buffer_file)
    echo "we can write to " . l:buffer_file
    let l:out = system(s:nn_executable . " hello")
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
