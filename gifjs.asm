; a hand-made GIF containing valid JavaScript code
; abusing header to start a JavaScript comment
; inspired by Saumil Shah's Deadly Pixels presentation
; Ange Albertini, BSD Licence 2013
; yasm gifjs.asm -o img.gif
 
WIDTH equ 10799 ; equivalent to 2f2a, which is '/*' in ASCII, thus starting an opening comment
 
HEIGTH equ 64
 
db 'GIF89a'
dw WIDTH, HEIGTH
 
db 0 ; GCT
db -1 ; background color
db 0 ; default aspect ratio
 
db 02ch ; Image descriptor
dw 0, 0 ; NW corner
dw WIDTH, HEIGTH ; w/h of image
db 0 ; color table
db 2 ; lzw size
db 0
db 3bh ; GIF terminator
 
; end of the GIF
 
db '*/' ; closing the comment
db '=1;' ; creating a fake use of that GIF89a string

db 'document.addEventListener("DOMContentLoaded",(ev)=>{'
incbin "shim.inc"
incbin "js/js1k-1443.js"
db '});'
