TITLE Dog Years Calculator     (DogYears.asm)

; Author: Joshua Nees
; Last Modified: 1/11/21
; OSU email address: neesjo@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number: Exploration 4     Due Date: None
; Description: Code along with exploration 4

INCLUDE Irvine32.inc

DOG_FACTOR = 7

.data
userName	BYTE	33 DUP(0)
userAge		DWORD	?
intro_1		BYTE	"Hi , I'm Lassie, I'm here to tell you your age in dog years!", 0
prompt_1	BYTE	"What's your name? ", 0
intro_2		BYTE	"It's nice to meet you, ", 0
prompt_2	BYTE	"What's your age? ", 0
dogAge		DWORD	?
result_1	BYTE	"Wow, that's ", 0
result_2	BYTE	" in dog years!", 0
goodbye		BYTE	"So long and farewell, ", 0

.code
main PROC

; Introduce programmer
	mov		EDX, OFFSET intro_1
	call	WriteString
	call	CrLf

; Get Users Name
	mov     EDX, OFFSET prompt_1
	call	WriteString
	; Preconditions of Readstring: (1) max len saved in ECX, (2) EDX holds pointer to string
	mov		EDX, OFFSET userName
	mov		ECX, 33
	call	ReadString
	mov		EDX, OFFSET intro_2
	call	WriteString
	mov		EDX, OFFSET userName
	call	WriteString
	call	CrLf


; Get user's age
	mov		EDX, OFFSET prompt_2
	call	WriteString
	call	ReadDec
	mov		userAge, EAX


; Calc Users Age in Dog Age
	mov		EAX, userAge
	mov		EBX, DOG_FACTOR
	mul		EBX
	mov		dogAge, EAX

; Report result
	mov		EDX, OFFSET result_1
	call	WriteString
	mov		EAX, dogAge
	call	WriteDec
	mov		EDX, OFFSET result_2
	call	WriteString
	call	CrLf


; Say good bye
	mov		EDX, OFFSET goodbye
	call	WriteString
	mov		EDX, OFFSET userName
	call	WriteString
	call	CrLf


	Invoke ExitProcess,0	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
