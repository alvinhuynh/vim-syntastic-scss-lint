if exists("loaded_syntastic_scss_checker")
    finish
endif

let loaded_syntastic_scss_checker = 1

if !executable("scsslint")
    finish
endif

function! SyntaxCheckers_scss_sass_IsAvailable()
    return executable("scsslint")
endfunction

function! SyntaxCheckers_scss_sass_GetLocList()
      let makeprg = syntastic#makeprg#build({
                  \ 'exe': 'scsslint',
                  \ 'args': '',
                  \ 'subchecker': '' })
      let errorformat = '%E%f: line %l\, col %c\, %m'
      let loclist = SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
  
      return loclist
 endfunction

call SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'scss',
    \ 'name': 'sass'})
