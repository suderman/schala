" BUNDLE: git://github.com/sophacles/vim-bundle-sparkup.git

" Location of the sparkup executable. Seems to finding it in the same dir as the vim script.
let g:sparkup = 'sparkup'

" Additional args passed to sparkup.
let g:sparkupArgs = '--no-last-newline'

" Mapping used to execute sparkup.
let g:sparkupExecuteMapping = '<c-e>'

" Mapping used to jump to the next empty tag/attribute (leaving this as <c-n> breaks tab-completion)
let g:sparkupNextMapping = '<c-x>'
