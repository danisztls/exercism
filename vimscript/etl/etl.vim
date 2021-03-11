"
" We are going to do the Transform step of an Extract-Transform-Load.
"
" Example:
"
"   :echo Transform({'1': ['a', 'b'], '2': ['c']})
"   {'a': 1, 'b': 1, 'c': 2}
"

function! Transform(scores) abort
    let scores = {}
    for [key, value] in items(a:scores)
        for char in value
            let scores[tolower(char)] = key - 0
        endfor
    endfor
    return scores
endfunction
