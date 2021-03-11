"
" This function takes a year and returns 1 if it's a leap year
" and 0 otherwise.
"
function LeapYear(year)
    if (a:year % 4) == 0
        if (a:year % 100) == 0
            if (a:year % 400) == 0
                return 1
            else
                return 0
            endif
        else
            return 1
        endif
    else
        return 0
    endif
endfunction
