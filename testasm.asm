
include irvine32.inc
.data
   msg1 byte "value not found",0
array SWORD -3,-6,-1,-10,-1,-30,-40,-4
sentinel SWORD 0
.code
main proc
mov esi,OFFSET array
mov ecx,lengthof array

next:
test WORD PTR [esi],8000h
pushfd
add esi,TYPE array
popfd
loopnz next
jnz quit
sub esi,TYPE array
movsx eax,WORD PTR[esi] ; display the value
call WriteInt
call crlf
exit
quit:
      mov edx, OFFSET msg1
    call writestring
exit
main endp
end main
