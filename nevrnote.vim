let s:home_path = $HOME . "/.nevrnote"
let s:git_options = "--work-tree=" . s:home_path . " --git-dir=" . s:home_path . "/.git"

" Returns a path in the git repo to save a new note.
"
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

" Add path to git repo and commit with message.
"
function! NNgit_add_and_commit(path, message)
  echo system("git " . s:git_options . " add " . a:path)
  echo system("git " . s:git_options . " commit -m '" . a:message . "'")
endfunction

" Write the current buffer as a note.
"
function! NNwrite()
  let l:current_buffer = expand("%")
  let l:message = ""

  if !strlen(l:current_buffer)
    execute "write" . NNnew_note_path()
    let l:message = "Added '...'"
  elseif stridx(l:current_buffer, s:home_path) != -1
    write
    let l:message = "Updated '...'"
  else
    echo "better not do anything with this buffer"
  end

  call NNgit_add_and_commit(expand("%"), l:message)
endfunction
