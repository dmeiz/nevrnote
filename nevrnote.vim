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

function! NNnew_note_path()
  let l:path = s:home_path . strftime("/%Y/%m/%d")
  if isdirectory(l:path)
    let l:files = split(glob(l:path . "/*"))
    if empty(l:files)
      return l:path . "/1"
    else
      let l:last_file = get(l:files, len(l:files) - 1)
      let l:incremented_file = strpart(l:last_file, len(l:path) + 1) + 1
      return l:path . "/" . l:incremented_file
    end
  else
    echo "Creating " . l:path
    if !mkdir(l:path, "p")
      throw "Fatal: Couldn't create directory " . l:path
    end
    return l:path . "/1"
  end
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
