IDEAL
 

MODEL small
STACK 1000h
p386


NOCOLORR =160
NOCOLORG =64
NOCOLORB =192

FILE_NAME_LEN = 29


;this game has 6 bits of sub pixels in the vectors(fixed point)

;current max sizes of images, if a new character is added check if he fits the criteria, if he doesn't then update the array sizes and frame amounts(frame amount needs to be updated in the code and add a placeholder to the old characters)

;max size: 25*15



;MAX ATTACK VELOCITY IS ((16^4)/2)-1 (base and after scale)



;PLAYER1 CONSTANTS
PLAYER1_STARTING_X_POSITION = 128;
PLAYER1_STARTING_Y_POSITION = 85
PLAYER1MAXLIVES = 3

;PLAYER2 CONSTANTS
PLAYER2_STARTING_X_POSITION = 180;180
PLAYER2_STARTING_Y_POSITION = 85
PLAYER2MAXLIVES = 3




;GNOME WEAPON RELATIVE POSITION TO PLAYER (facing right)-----------------------------
;position x if facing right = player position + relative
;position y if faceing right = player position + relative

;position x if facing left = player position + player Width - relative
;position y if faceing left = player position + relative









;Selection screen
ICONWIDTH = 35
ICONHIGHT = 35

GNOMECHARNUM = 1
GNOMEICONX = 18
GNOMEICONY = 49
GREENGNOMECHARNUM = 2
GREENGNOMEICONX = 59
GREENGNOMEICONY = 49
HAMMERCHARNUM = 3
HAMMERICONX = 100
HAMMERICONY = 49
HORSECHARNUM = 4
HORSEICONX = HAMMERICONX+ICONWIDTH+6
HORSEICONY = 49

STARTBUTTONX = 260
STARTBUTTONY = 165
STARTBUTTONHIGHT = 13
STARTBUTTONWIDTH = 33

PLAYER1SELECTICONX = 92
PLAYER1SELECTICONY = 156

PLAYER2SELECTICONX = 191
PLAYER2SELECTICONY = 156

;Battle Screens

PLAYER1WINTEXTX = 84
PLAYER1WINTEXTY = 45
PLAYER1WINTEXTHIGHT = 19
PLAYER1WINTEXTWIDTH = 151

PLAYER1WINSICONX = 142
PLAYER1WINSICONY = 4


PLAYER2WINTEXTX = 84
PLAYER2WINTEXTY = 45
PLAYER2WINTEXTHIGHT = 19
PLAYER2WINTEXTWIDTH = 151

PLAYER2WINSICONX = 142
PLAYER2WINSICONY = 4


DRAWTEXTX = 127
DRAWTEXTY = 42
DRAWTEXTHIGHT = 19
DRAWTEXTWIDTH = 66


SPACECONTEXTX = 81
SPACECONTEXTY = 86
SPACECONTEXTHIGHT = 9
SPACECONTEXTWIDTH = 157



PAUSETEXTX = 85
PAUSETEXTY = 32
PAUSETEXTHIGHT = 50
PAUSETEXTWIDTH = 149



;PLAYERS STATS(lives and damage)
DIGITHIGHT = 7
DIGITWIDTH = 4

DISTANCEBETWEENDIGITS = 2

HEARTHIGHT = 9
HEARTWIDTH = 9

DISTANCEBETWEENHEARTS = 2

PLAYERTAGHIGHT = 9
PLAYERTAGWIDTH = 14

PLAYER1TAGX = 64
PLAYER1TAGY = 175

PLAYER1HEARTSX = 83
PLAYER1HEARTSY = 175

PLAYER1DAMAGEX = 83
PLAYER1DAMAGEY = 185


PLAYER2TAGX = 192
PLAYER2TAGY = 175

PLAYER2HEARTSX = 211
PLAYER2HEARTSY = 175

PLAYER2DAMAGEX = 211
PLAYER2DAMAGEY = 185




;STAGE FILES PARAMETERS-------------------------
STAGEHIGHT = 53
STAGEWIDTH = 100
STAGENAME equ 'images\misc\Stage.bmp'



DATASEG


	;ASYNCKEYBOARD SET UP, DON'T TOUCH
	OldKeyboardInterruptOffset  dw ?   ; Old keaboard interrupt offset
	OldKeyboardInterruptSegment dw ?   ; Old keaboard interrupt Segment 
	OldTimeInterruptOffset      dw ?   ; Old Time interrupt offset
	OldTimeInterruptSegment     dw ?   ; Old Time interrupt Segmentב
	CurrentOldInterruptOffset   dw ?   ; The currnet Old interrupt offset
	CurrentOldInterruptSegment  dw ?   ; The currnet Old interrupt
	
	keyboardInterruptPOS    equ 9*4    ; The position of the keaborad interrupt in the interrupt vector table
	TimeInterruptPOS        equ 28*4   ; The position of the time interrupt in the interrupt vector table
	currentInterruptPOS     db ?       ; The cuurent interrupt position in the interrupt vector table
	currentInterruptOFFSET  dw ?       ; The cuurent interrupt offset


	
	



	
	;CHARACTERS each character also needs an icon file
	
	
	;GNOME WEAPON RELATIVE POSITION TO PLAYER EXPLANATION(facing right)
	;position x if facing right = player position + relative
	;position y if faceing right = player position + relative

	;position x if facing left = player position + player Width - relative
	;position y if faceing left = player position + relative
	
	
	
	
	HorseIconFileName db 'images\chars\Hr\HrIcon.bmp',0,1,1
HorseCharacterStart=$
	;character size
	dw 15 ; character hight
	dw 15 ; character width
	
	
	;Character Standing-------------------------------------
	db 'images\chars\Hr\HrStand.bmp',0,1 ;character stand frame file name
	
	;Weapon Standing
	db 'images\chars\Hr\HrStandW.bmp',0 ;weapon stand frame file name
	dw 3 ;weapon stand frame hight
	dw 12 ;weapon stand frame width
	dw 4 ;weapon stand frame relative x
	dw 6 ;weapon stand frame relative y
	
	;Character Running--------------------------------------
	;Frame 1
	db 'images\chars\Hr\HrRun1.bmp',0,1,1 ;character run frame 1 file name
	
	;Frame 2
	db 'images\chars\Hr\HrRun2.bmp',0,1,1 ;character run frame 2 file name
	
	;Frame 3
	db 'images\chars\Hr\HrRun3.bmp',0,1,1 ;character run frame 2 file name
	
	;Weapon Running
	;Frame 1
	db 'images\chars\Hr\HrRun1W.bmp',0,1 ;weapon run frame 1 file name
	dw 3  ;weapon run frame 1 hight
	dw 12   ;weapon run frame 1 width;
	dw 4  ;weapon run frame 1 relative x 
	dw 6  ;weapon run frame 1 relative y;weapon 
	;Frame 2
	db 'images\chars\Hr\HrRun2W.bmp',0,1 ;weapon run frame 2 file name
	dw 3  ;weapon run frame 2 hight
	dw 12   ;weapon run frame 2 width;
	dw 4  ;weapon run frame 1 relative x 
	dw 5  ;weapon run frame 1 relative y;weapon 
	
	;Frame 3
	db 'images\chars\Hr\HrRun3W.bmp',0,1 ;weapon run frame 2 file name
	dw 3  ;weapon run frame 1 hight
	dw 13   ;weapon run frame 1 width;
	dw 4  ;weapon run frame 1 relative x 
	dw 6  ;weapon run frame 1 relative y;weapon 
	
	;Character Hit------------------------------------------
	db 'images\chars\Hr\HrHit.bmp',0,1,1,1 ;Character hit frame file name
	
	;Weapon Hit
	db 'images\chars\Hr\HrHitW.bmp',0,1,1 ;weapon hit frame file name
	dw 4 ;weapon hit frame hight
	dw 13  ;weapon hit frame width
	dw 3 ;weapon hit frame relative x
	dw 3 ;weapon hit frame relative y
	
	;Character Air------------------------------------------
	db 'images\chars\Hr\HrAir.bmp',0,1,1,1 ;Character air frame file name
	
	;Weapon Air
	db 'images\chars\Hr\HrAirW.bmp',0,1,1 ;weapon air frame file name
	dw 3 ;weapon air frame hight
	dw 12  ;weapon air frame width
	dw 4 ;weapon air frame relative x 
	dw 5 ;weapon air frame relative Y
	
	;Character Regular Attack-------------------------------
	;Frame 1
	db 'images\chars\Hr\HrRAtF1.bmp',0,1 ;Character regular attack frame 1 file name
	;Frame 2
	db 'images\chars\Hr\HrRAtF2.bmp',0,1 ;Character regular attack frame 2 file name
	;Frame 3
	db 'images\chars\Hr\HrRAtF3.bmp',0,1 ;Character regular attack frame 3 file name
	;Frame 4
	db 'images\chars\Hr\HrRAtF4.bmp',0,1 ;Character regular attack frame 4 file name
	;Frame 5
	db 'images\chars\Hr\HrRAtF5.bmp',0,1 ;Character regular attack frame 5 file name
	;Frame 6
	db 'images\chars\Hr\HrRAtF6.bmp',0,1 ;Character regular attack frame 6 file name
	;Frame 7
	db 'images\chars\Hr\HrRAtF7.bmp',0,1 ;Character regular attack frame 7 file name
	;Frame 8
	db 'images\chars\Hr\HrRAtF8.bmp',0,1 ;Character regular attack frame 8 file name
	;Frame 9
	db 'images\chars\Hr\HrRAtF9.bmp',0,1 ;Character regular attack frame 9 file name
	;Frame 10
	db 'images\chars\Hr\HrRAtFA.bmp',0,1 ;Character regular attack frame 10 file name
	;Frame 11
	db 'images\chars\Hr\HrRAtFB.bmp',0,1 ;Character regular attack frame 11 file name
	;Frame 12
	db 'images\chars\Hr\HrRAtFC.bmp',0,1 ;Character regular attack frame 12 file name
	
	
	;Weapon Regular Attack
	;Frame 1
	db 'images\chars\Hr\HrRAtF1W.bmp',0 ;weapon regular attack frame 1 file name
	dw 3  ;weapon regular attack frame 1 hight
	dw 12  ;weapon regular attack frame 1 width
	dw 4  ;weapon regular attack frame 1 relative x
	dw 5  ;weapon regular attack frame 1 relative y
	dw 350;weapon regular attack frame 1 base velocity x 
	dw 0 ;weapon regular attack frame 1 base velocity y
	dw 200  ;weapon regular attack frame 1 self inflicted velocity x;relative to direction
	dw -36 ;weapon regular attack frame 1 self inflicted velocity y
	dw 1  ;weapon regular attack frame 1 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attavk frame 1 velocity scale to damage parameter small ---- how the scaling works: BaseVelocity+BaseVelocity*(Damage/(2^small))
	dw 0  ;weapon regular attavk frame 1 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 1 stun
	dw 7  ;weapon regular attack frame 1 damage
	dw 0  ;weapon regular attack frame 1 hitable after hit
	
	;Frame 2
	db 'images\chars\Hr\HrRAtF2W.bmp',0 ;weapon regular attack frame 2 file name
	dw 10 ;weapon regular attack frame 2 hight
	dw 18 ;weapon regular attack frame 2 width
	dw -1  ;weapon regular attack frame 2 relative x
	dw 4  ;weapon regular attack frame 2 relative y
	dw 200;weapon regular attack frame 2 base velocity x
	dw 0;weapon regular attack frame 2 base velocity y
	dw 100  ;weapon regular attack frame 2 self inflicted velocity x
	dw -36  ;weapon regular attack frame 2 self inflicted velocity y
	dw 0  ;weapon regular attack frame 2 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attavk frame 2 velocity scale to damage parameter 1 small
	dw 0  ;weapon regular attavk frame 2 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 2 stun
	dw 2  ;weapon regular attack frame 2 damage
	dw 1  ;weapon regular attack frame 2 hitable after hit
	;Frame 3
	db 'images\chars\Hr\HrRAtF3W.bmp',0 ;weapon regular attack frame 3 file name
	dw 10 ;weapon regular attack frame 3 hight
	dw 18 ;weapon regular attack frame 3 width
	dw -1  ;weapon regular attack frame 3 relative x
	dw 4  ;weapon regular attack frame 3 relative y
	dw 300;weapon regular attack frame 3 base velocity x
	dw 0;weapon regular attack frame 3 base velocity y
	dw 100  ;weapon regular attack frame 3 self inflicted velocity x
	dw -36  ;weapon regular attack frame 3 self inflicted velocity y
	dw 0  ;weapon regular attack frame 3 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attavk frame 3 velocity scale to damage parameter 1 small
	dw 0  ;weapon regular attavk frame 3 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 3 stun
	dw 2  ;weapon regular attack frame 3 damage
	dw 1  ;weapon regular attack frame 3 hitable after hit
	;Frame 4
	db 'images\chars\Hr\HrRAtF4W.bmp',0 ;weapon regular attack frame 4 file name
	dw 10 ;weapon regular attack frame 4 hight
	dw 23 ;weapon regular attack frame 4 width
	dw -5  ;weapon regular attack frame 4 relative x
	dw 4  ;weapon regular attack frame 4 relative y
	dw 300;weapon regular attack frame 4 base velocity x
	dw 0;weapon regular attack frame 4 base velocity y
	dw 0  ;weapon regular attack frame 4 self inflicted velocity x
	dw -35  ;weapon regular attack frame 4 self inflicted velocity y
	dw 0  ;weapon regular attack frame 4 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 4 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 4 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 4 stun
	dw 1  ;weapon regular attack frame 4 damage
	dw 1  ;weapon regular attack frame 4 hitable after hit
	;Frame 5
	db 'images\chars\Hr\HrRAtF5W.bmp',0 ;weapon regular attack frame 5 file name
	dw 10  ;weapon regular attack frame 5 hight
	dw 23 ;weapon regular attack frame 5 width
	dw -5  ;weapon regular attack frame 5 relative x
	dw 4  ;weapon regular attack frame 5 relative y
	dw 150;weapon regular attack frame 5 base velocity x
	dw 0;weapon regular attack frame 5 base velocity y
	dw 0  ;weapon regular attack frame 5 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 5 self inflicted velocity y
	dw 0  ;weapon regular attack frame 5 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 5 velocity scale to damage parameter 1  small 
	dw 0  ;weapon regular attack frame 5 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 5 stun
	dw 2  ;weapon regular attack frame 5 damage
	dw 1  ;weapon regular attack frame 5 hitable after hit
	;Frame 6
	db 'images\chars\Hr\HrRAtF6W.bmp',0 ;weapon regular attack frame 6 file name
	dw 10   ;weapon regular attack frame 6 hight
	dw 24  ;weapon regular attack frame 6 width
	dw -5   ;weapon regular attack frame 6 relative x
	dw 4   ;weapon regular attack frame 6 relative y
	dw 150 ;weapon regular attack frame 6 base velocity x
	dw 0 ;weapon regular attack frame 6 base velocity y
	dw 0   ;weapon regular attack frame 6 self inflicted velocity x ;relative to direction
	dw -35   ;weapon regular attack frame 6 self inflicted velocity y
	dw 0  ;weapon regular attack frame 6 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 6 velocity scale to damage parameter 1  --- 
	dw 0   ;weapon regular attack frame 6 is startup (only for animation) bool
	dw 12  ;weapon regular attack frame 6 stun
	dw 2   ;weapon regular attack frame 6 damage
	dw 1   ;weapon regular attack frame 6 hitable after hit
	;Frame 7
	db 'images\chars\Hr\HrRAtF7W.bmp',0 ;weapon regular attack frame 7 file name
	dw 10  ;weapon regular attack frame 7 hight
	dw 24 ;weapon regular attack frame 7 width
	dw -5  ;weapon regular attack frame 7 relative x
	dw 4  ;weapon regular attack frame 7 relative y
	dw 150;weapon regular attack frame 7 base velocity x
	dw 00;weapon regular attack frame 7 base velocity y
	dw 0  ;weapon regular attack frame 7 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 7 self inflicted velocity y
	dw 0  ;weapon regular attack frame 7 self self velocity reset bool (0-no reset, 1-reset)
	dw 20 ;weapon regular attack frame 7 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 7 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 7 stun
	dw 2  ;weapon regular attack frame 7 damage
	dw 1  ;weapon regular attack frame 7 hitable after hit
	;Frame 8
	db 'images\chars\Hr\HrRAtF8W.bmp',0 ;weapon regular attack frame 8 file name
	dw 10 ;weapon regular attack frame 8 hight
	dw 23 ;weapon regular attack frame 8 width
	dw -5  ;weapon regular attack frame 8 relative x
	dw 4  ;weapon regular attack frame 8 relative y
	dw 150;weapon regular attack frame 8 base velocity x
	dw 30;weapon regular attack frame 8 base velocity y
	dw 0  ;weapon regular attack frame 8 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 8 self inflicted velocity y
	dw 0  ;weapon regular attack frame 8 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 8 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 8 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 8 stun
	dw 1  ;weapon regular attack frame 8 damage
	dw 1  ;weapon regular attack frame 8 hitable after hit
	;Frame 9
	db 'images\chars\Hr\HrRAtF9W.bmp',0 ;weapon regular attack frame 9 file name
	dw 10 ;weapon regular attack frame 9 hight
	dw 23 ;weapon regular attack frame 9 width
	dw -5  ;weapon regular attack frame 9 relative x
	dw 4  ;weapon regular attack frame 9 relative y
	dw 150;weapon regular attack frame 9 base velocity x
	dw 30;weapon regular attack frame 9 base velocity y
	dw 0  ;weapon regular attack frame 9 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 9 self inflicted velocity y
	dw 0  ;weapon regular attack frame 9 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 9 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 9 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 9 stun
	dw 2  ;weapon regular attack frame 9 damage
	dw 1  ;weapon regular attack frame 9 hitable after hit
	;Frame 10
	db 'images\chars\Hr\HrRAtFAW.bmp',0 ;weapon regular attack frame 10 file name
	dw 10 ;weapon regular attack frame 10 hight
	dw 24 ;weapon regular attack frame 10 width
	dw -5  ;weapon regular attack frame 10 relative x
	dw 4  ;weapon regular attack frame 10 relative y
	dw 150;weapon regular attack frame 10 base velocity x
	dw 30;weapon regular attack frame 10 base velocity y
	dw 0  ;weapon regular attack frame 10 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 10 self inflicted velocity y
	dw 0  ;weapon regular attack frame 10 self self velocity reset bool (0-no reset, 1-reset)
	dw 20  ;weapon regular attack frame 10 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 10 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 10 stun
	dw 2  ;weapon regular attack frame 10 damage
	dw 1  ;weapon regular attack frame 10 hitable after hit
	;Frame 11
	db 'images\chars\Hr\HrRAtFBW.bmp',0 ;weapon regular attack frame 11 file name
	dw 10 ;weapon regular attack frame 11 hight
	dw 24 ;weapon regular attack frame 11 width
	dw -5  ;weapon regular attack frame 11 relative x
	dw 4  ;weapon regular attack frame 11 relative y
	dw 130;weapon regular attack frame 11 base velocity x
	dw -50;weapon regular attack frame 11 base velocity y
	dw 0  ;weapon regular attack frame 11 self inflicted velocity x ;relative to direction
	dw -35  ;weapon regular attack frame 11 self inflicted velocity y
	dw 0  ;weapon regular attack frame 11 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 11 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 11 is startup (only for animation) bool
	dw 10 ;weapon regular attack frame 11 stun
	dw 8  ;weapon regular attack frame 11 damage
	dw 0  ;weapon regular attack frame 11 hitable after hit
	;Frame 12
	db 'images\chars\Hr\HrRAtFCW.bmp',0 ;weapon regular attack frame 12 file name
	dw 3 ;weapon regular attack frame 12 hight
	dw 16 ;weapon regular attack frame 12 width
	dw 3  ;weapon regular attack frame 12 relative x
	dw 5  ;weapon regular attack frame 12 relative y
	dw 80;weapon regular attack frame 12 base velocity x
	dw 30;weapon regular attack frame 12 base velocity y
	dw 0  ;weapon regular attack frame 12 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 12 self inflicted velocity y
	dw 0  ;weapon regular attack frame 12 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 12 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 12 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 12 stun
	dw 2  ;weapon regular attack frame 12 damage
	dw 0  ;weapon regular attack frame 12 hitable after hit
	
	
	; Frame Amount
	dw 12 ;Character regular attack frames max
	dw 7 ;Lag amount from useing regular attack
	dw 3 ;Character run frames max
	
	; character physics parameters
	dw 60 ;character stage horizontal acceleration
	dw 180 ;character stage horizontal max speed
	dw 1 ;character stage friction rate divider
	dw 8;character stage momentum shift divider
	
	dw 20 ;character air horizontal acceleration
	dw 140;character air horizontal max speed
	dw 12;character air friction rate divider
	dw 5;character air momentum shift divider
	
	dw 2;character hit friction x divider rate max
	dw 2;character hit friction y divider rate max
	
	dw 35;character gravity acceleration
	dw 230;character gravity max speed
	
	dw 3;character jump squat max
	dw 180;character short stage jump power
	dw 280;character high stage jump power
	dw 300;character air jump power
	dw 10;character time between jumps;was 10
	
	dw 2;character max jumps
	
	dw 1; character weight
HorseCharacterEnd=$
	
	
	
	
	;CHESTER
	HammerIconFileName db 'images\chars\HM\HMIcon.bmp',0,1,1
HammerCharacterStart=$
	;character size
	dw 12 ; character hight
	dw 6 ; character width
	
	
	;Character Standing-------------------------------------
	db 'images\chars\HM\HMStand.bmp',0,1 ;character stand frame file name
	
	;Weapon Standing
	db 'images\chars\HM\HMStandW.bmp',0 ;weapon stand frame file name
	dw 10 ;weapon stand frame hight
	dw 8 ;weapon stand frame width
	dw -6 ;weapon stand frame relative x
	dw -4 ;weapon stand frame relative y
	
	;Character Running--------------------------------------
	;Frame 1
	db 'images\chars\HM\HMRun1.bmp',0,1,1 ;character run frame 1 file name
	
	;Frame 2
	db 'images\chars\HM\HMRun2.bmp',0,1,1 ;character run frame 2 file name
	
	;Frame 3
	db 'images\chars\HM\HMRun3.bmp',0,1,1 ;character run frame 2 file name
	
	;Weapon Running
	;Frame 1
	db 'images\chars\HM\HMRun1W.bmp',0,1 ;weapon run frame 1 file name
	dw 10  ;weapon run frame 1 hight
	dw 8   ;weapon run frame 1 width;
	dw -6  ;weapon run frame 1 relative x 
	dw -4  ;weapon run frame 1 relative y;weapon 
	;Frame 2
	db 'images\chars\HM\HMRun2W.bmp',0,1 ;weapon run frame 2 file name
	dw 10  ;weapon run frame 2 hight
	dw 8   ;weapon run frame 2 width;
	dw -6  ;weapon run frame 1 relative x 
	dw -4  ;weapon run frame 1 relative y;weapon 
	
	;Frame 3
	db 'images\chars\HM\HMRun3W.bmp',0,1 ;weapon run frame 2 file name
	dw 10  ;weapon run frame 1 hight
	dw 8   ;weapon run frame 1 width;
	dw -6  ;weapon run frame 1 relative x 
	dw -4  ;weapon run frame 1 relative y;weapon 
	
	;Character Hit------------------------------------------
	db 'images\chars\HM\HMHit.bmp',0,1,1,1 ;Character hit frame file name
	
	;Weapon Hit
	db 'images\chars\HM\HMHitW.bmp',0,1,1 ;weapon hit frame file name
	dw 10 ;weapon hit frame hight
	dw 8  ;weapon hit frame width
	dw -6 ;weapon hit frame relative x
	dw -4 ;weapon hit frame relative y
	
	;Character Air------------------------------------------
	db 'images\chars\HM\HMAir.bmp',0,1,1,1 ;Character air frame file name
	
	;Weapon Air
	db 'images\chars\HM\HMAirW.bmp',0,1,1 ;weapon air frame file name
	dw 10 ;weapon air frame hight
	dw 8  ;weapon air frame width
	dw -6 ;weapon air frame relative x 
	dw -4 ;weapon air frame relative Y
	
	;Character Regular Attack-------------------------------
	;Frame 1
	db 'images\chars\HM\HMRAtF1.bmp',0,1 ;Character regular attack frame 1 file name
	;Frame 2
	db 'images\chars\HM\HMRAtF2.bmp',0,1 ;Character regular attack frame 2 file name
	;Frame 3
	db 'images\chars\HM\HMRAtF3.bmp',0,1 ;Character regular attack frame 3 file name
	;Frame 4
	db 'images\chars\HM\HMRAtF4.bmp',0,1 ;Character regular attack frame 4 file name
	;Frame 5
	db 'images\chars\HM\HMRAtF5.bmp',0,1 ;Character regular attack frame 5 file name
	;Frame 6
	db 'images\chars\HM\HMRAtF6.bmp',0,1 ;Character regular attack frame 6 file name
	;Frame 7
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 7 file name
	;Frame 8
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 8 file name
	;Frame 9
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 9 file name
	;Frame 10
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 10 file name
	;Frame 11
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 11 file name
	;Frame 12
	db 'images\chars\HM\HMPlaceH.bmp',0 ;Character regular attack frame 12 file name
	
	
	;Weapon Regular Attack
	;Frame 1
	db 'images\chars\HM\HMRAtF1W.bmp',0 ;weapon regular attack frame 1 file name
	dw 10  ;weapon regular attack frame 1 hight
	dw 8  ;weapon regular attack frame 1 width
	dw -6  ;weapon regular attack frame 1 relative x
	dw -4  ;weapon regular attack frame 1 relative y
	dw 800;weapon regular attack frame 1 base velocity x 
	dw -360;weapon regular attack frame 1 base velocity y
	dw 0  ;weapon regular attack frame 1 self inflicted velocity x;relative to direction
	dw 0  ;weapon regular attack frame 1 self inflicted velocity y
	dw 0  ;weapon regular attack frame 1 self self velocity reset bool (0-no reset, 1-reset)
	dw 5  ;weapon regular attavk frame 1 velocity scale to damage parameter small ---- how the scaling works: BaseVelocity+BaseVelocity*(Damage/(2^small))
	dw 1  ;weapon regular attavk frame 1 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 1 stun
	dw 7  ;weapon regular attack frame 1 damage
	dw 0  ;weapon regular attack frame 1 hitable after hit
	
	;Frame 2
	db 'images\chars\HM\HMRAtF2W.bmp',0 ;weapon regular attack frame 2 file name
	dw 11 ;weapon regular attack frame 2 hight
	dw 8 ;weapon regular attack frame 2 width
	dw -5  ;weapon regular attack frame 2 relative x
	dw -6  ;weapon regular attack frame 2 relative y
	dw 800;weapon regular attack frame 2 base velocity x
	dw -360;weapon regular attack frame 2 base velocity y
	dw 0  ;weapon regular attack frame 2 self inflicted velocity x
	dw 0  ;weapon regular attack frame 2 self inflicted velocity y
	dw 0  ;weapon regular attack frame 2 self self velocity reset bool (0-no reset, 1-reset)
	dw 5  ;weapon regular attavk frame 2 velocity scale to damage parameter 1 small
	dw 1  ;weapon regular attavk frame 2 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 2 stun
	dw 7  ;weapon regular attack frame 2 damage
	dw 0  ;weapon regular attack frame 2 hitable after hit
	;Frame 3
	db 'images\chars\HM\HMRAtF3W.bmp',0 ;weapon regular attack frame 3 file name
	dw 10 ;weapon regular attack frame 3 hight
	dw 10 ;weapon regular attack frame 3 width
	dw -3  ;weapon regular attack frame 3 relative x
	dw -7  ;weapon regular attack frame 3 relative y
	dw 320;weapon regular attack frame 3 base velocity x
	dw -230;weapon regular attack frame 3 base velocity y
	dw 0  ;weapon regular attack frame 3 self inflicted velocity x
	dw 0  ;weapon regular attack frame 3 self inflicted velocity y
	dw 0  ;weapon regular attack frame 3 self self velocity reset bool (0-no reset, 1-reset)
	dw 6  ;weapon regular attavk frame 3 velocity scale to damage parameter 1 small
	dw 0  ;weapon regular attavk frame 3 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 3 stun
	dw 14  ;weapon regular attack frame 3 damage
	dw 0  ;weapon regular attack frame 3 hitable after hit
	;Frame 4
	db 'images\chars\HM\HMRAtF4W.bmp',0 ;weapon regular attack frame 4 file name
	dw 9 ;weapon regular attack frame 4 hight
	dw 12 ;weapon regular attack frame 4 width
	dw 1  ;weapon regular attack frame 4 relative x
	dw -3  ;weapon regular attack frame 4 relative y
	dw 440;weapon regular attack frame 4 base velocity x
	dw 220;weapon regular attack frame 4 base velocity y
	dw 0  ;weapon regular attack frame 4 self inflicted velocity x
	dw 0  ;weapon regular attack frame 4 self inflicted velocity y
	dw 0  ;weapon regular attack frame 4 self self velocity reset bool (0-no reset, 1-reset)
	dw 6  ;weapon regular attack frame 4 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 4 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 4 stun
	dw 21  ;weapon regular attack frame 4 damage
	dw 0  ;weapon regular attack frame 4 hitable after hit
	;Frame 5
	db 'images\chars\HM\HMRAtF5W.bmp',0 ;weapon regular attack frame 5 file name
	dw 9  ;weapon regular attack frame 5 hight
	dw 13 ;weapon regular attack frame 5 width
	dw 0  ;weapon regular attack frame 5 relative x
	dw 3  ;weapon regular attack frame 5 relative y
	dw 440;weapon regular attack frame 5 base velocity x
	dw 270;weapon regular attack frame 5 base velocity y
	dw 0  ;weapon regular attack frame 5 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 5 self inflicted velocity y
	dw 0  ;weapon regular attack frame 5 self self velocity reset bool (0-no reset, 1-reset)
	dw 6  ;weapon regular attack frame 5 velocity scale to damage parameter 1  small 
	dw 0  ;weapon regular attack frame 5 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 5 stun
	dw 21  ;weapon regular attack frame 5 damage
	dw 0  ;weapon regular attack frame 5 hitable after hit
	;Frame 6
	db 'images\chars\HM\HMRAtF6W.bmp',0 ;weapon regular attack frame 6 file name
	dw 9   ;weapon regular attack frame 6 hight
	dw 13  ;weapon regular attack frame 6 width
	dw 0   ;weapon regular attack frame 6 relative x
	dw 3   ;weapon regular attack frame 6 relative y
	dw 180 ;weapon regular attack frame 6 base velocity x
	dw -310 ;weapon regular attack frame 6 base velocity y
	dw 0   ;weapon regular attack frame 6 self inflicted velocity x ;relative to direction
	dw 0   ;weapon regular attack frame 6 self inflicted velocity y
	dw 0  ;weapon regular attack frame 6 self self velocity reset bool (0-no reset, 1-reset)
	dw 6  ;weapon regular attack frame 6 velocity scale to damage parameter 1  --- 
	dw 0   ;weapon regular attack frame 6 is startup (only for animation) bool
	dw 12  ;weapon regular attack frame 6 stun
	dw 12   ;weapon regular attack frame 6 damage
	dw 0   ;weapon regular attack frame 6 hitable after hit
	;Frame 7
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 7 file name
	dw 5  ;weapon regular attack frame 7 hight
	dw 3 ;weapon regular attack frame 7 width
	dw 0  ;weapon regular attack frame 7 relative x
	dw 3  ;weapon regular attack frame 7 relative y
	dw 600;weapon regular attack frame 7 base velocity x
	dw 360;weapon regular attack frame 7 base velocity y
	dw 0  ;weapon regular attack frame 7 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 7 self inflicted velocity y
	dw 0  ;weapon regular attack frame 7 self self velocity reset bool (0-no reset, 1-reset)
	dw 60 ;weapon regular attack frame 7 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 7 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 7 stun
	dw 8  ;weapon regular attack frame 7 damage
	dw 0  ;weapon regular attack frame 7 hitable after hit
	;Frame 8
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 8 file name
	dw 5 ;weapon regular attack frame 8 hight
	dw 3 ;weapon regular attack frame 8 width
	dw 4  ;weapon regular attack frame 8 relative x
	dw 7  ;weapon regular attack frame 8 relative y
	dw 80;weapon regular attack frame 8 base velocity x
	dw 30;weapon regular attack frame 8 base velocity y
	dw 0  ;weapon regular attack frame 8 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 8 self inflicted velocity y
	dw 0  ;weapon regular attack frame 8 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 8 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 8 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 8 stun
	dw 8  ;weapon regular attack frame 8 damage
	dw 0  ;weapon regular attack frame 8 hitable after hit
	;Frame 9
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 9 file name
	dw 5 ;weapon regular attack frame 9 hight
	dw 3 ;weapon regular attack frame 9 width
	dw 4  ;weapon regular attack frame 9 relative x
	dw 7  ;weapon regular attack frame 9 relative y
	dw 80;weapon regular attack frame 9 base velocity x
	dw 30;weapon regular attack frame 9 base velocity y
	dw 0  ;weapon regular attack frame 9 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 9 self inflicted velocity y
	dw 0  ;weapon regular attack frame 9 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 9 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 9 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 9 stun
	dw 8  ;weapon regular attack frame 9 damage
	dw 0  ;weapon regular attack frame 9 hitable after hit
	;Frame 10
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 10 file name
	dw 5 ;weapon regular attack frame 10 hight
	dw 3 ;weapon regular attack frame 10 width
	dw 4  ;weapon regular attack frame 10 relative x
	dw 7  ;weapon regular attack frame 10 relative y
	dw 80;weapon regular attack frame 10 base velocity x
	dw 30;weapon regular attack frame 10 base velocity y
	dw 0  ;weapon regular attack frame 10 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 10 self inflicted velocity y
	dw 0  ;weapon regular attack frame 10 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 10 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 10 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 10 stun
	dw 8  ;weapon regular attack frame 10 damage
	dw 0  ;weapon regular attack frame 10 hitable after hit
	;Frame 11
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 11 file name
	dw 5 ;weapon regular attack frame 11 hight
	dw 3 ;weapon regular attack frame 11 width
	dw 4  ;weapon regular attack frame 11 relative x
	dw 7  ;weapon regular attack frame 11 relative y
	dw 80;weapon regular attack frame 11 base velocity x
	dw 30;weapon regular attack frame 11 base velocity y
	dw 0  ;weapon regular attack frame 11 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 11 self inflicted velocity y
	dw 0  ;weapon regular attack frame 11 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 11 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 11 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 11 stun
	dw 8  ;weapon regular attack frame 11 damage
	dw 0  ;weapon regular attack frame 11 hitable after hit
	;Frame 12
	db 'images\chars\HM\HMPlaceH.bmp',0 ;weapon regular attack frame 12 file name
	dw 5 ;weapon regular attack frame 12 hight
	dw 3 ;weapon regular attack frame 12 width
	dw 4  ;weapon regular attack frame 12 relative x
	dw 7  ;weapon regular attack frame 12 relative y
	dw 80;weapon regular attack frame 12 base velocity x
	dw 30;weapon regular attack frame 12 base velocity y
	dw 0  ;weapon regular attack frame 12 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 12 self inflicted velocity y
	dw 0  ;weapon regular attack frame 12 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 12 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 12 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 12 stun
	dw 8  ;weapon regular attack frame 12 damage
	dw 0  ;weapon regular attack frame 12 hitable after hit
	
	
	; Frame Amount
	dw 6 ;Character regular attack frames max
	dw 6 ;Lag amount from useing regular attack
	dw 3 ;Character run frames max
	
	; character physics parameters
	dw 40 ;character stage horizontal acceleration
	dw 200 ;character stage horizontal max speed
	dw 1 ;character stage friction rate divider
	dw 2;character stage momentum shift divider
	
	dw 30 ;character air horizontal acceleration
	dw 165;character air horizontal max speed
	dw 12;character air friction rate divider
	dw 5;character air momentum shift divider
	
	dw 2;character hit friction x divider rate max
	dw 2;character hit friction y divider rate max
	
	dw 30;character gravity acceleration
	dw 220;character gravity max speed
	
	dw 3;character jump squat max
	dw 180;character short stage jump power
	dw 310;character high stage jump power
	dw 345;character air jump power
	dw 10;character time between jumps;was 10
	
	dw 2;character max jumps
	
	dw 4; character weight
HammerCharacterEnd=$
	
	
	
	
	
	
	
	
	;Green Gnome()------------------------------------------------
	
	GreenGnomeIconFileName db 'images\chars\GG\GGIcon.bmp',0,1,1
GreenGnomeCharacterStart=$
	;character size
	dw 15 ; character hight
	dw 9 ; character width
	
	
	;Character Standing-------------------------------------
	db 'images\chars\GG\GGStand.bmp',0,1 ;character stand frame file name
	
	;Weapon Standing
	db 'images\chars\GG\GGStandW.bmp',0 ;weapon stand frame file name
	dw 2 ;weapon stand frame hight
	dw 13 ;weapon stand frame width
	dw 4 ;weapon stand frame relative x
	dw 10 ;weapon stand frame relative y
	
	;Character Running--------------------------------------
	;Frame 1
	db 'images\chars\GG\GGRun1.bmp',0,1,1 ;character run frame 1 file name
	
	;Frame 2
	db 'images\chars\GG\GGRun2.bmp',0,1,1 ;character run frame 2 file name
	
	;Frame 3
	db 'images\chars\GG\GGPlaceH.bmp',0 ;character run frame 3 file name
	
	;Weapon Running
	;Frame 1
	db 'images\chars\GG\GGRun1W.bmp',0,1 ;weapon run frame 1 file name
	dw 2  ;weapon run frame 1 hight
	dw 13 ;weapon run frame 1 width;
	dw 3  ;weapon run frame 1 relative x 
	dw 11 ;weapon run frame 1 relative y;weapon 
	;Frame 2
	db 'images\chars\GG\GGRun2W.bmp',0,1 ;weapon run frame 2 file name
	dw 2  ;weapon run frame 2 hight
	dw 13 ;weapon run frame 2 width
	dw 4  ;weapon run frame 2 relative x 
	dw 10 ;weapon run frame 2 relative y
	;Frame 3
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon run frame 2 file name
	dw 5   ;weapon run frame 3 hight
	dw 3   ;weapon run frame 3 width
	dw 0   ;weapon run frame 3 relative x 
	dw 0   ;weapon run frame 3 relative y 
	
	;Character Hit------------------------------------------
	db 'images\chars\GG\GGHit.bmp',0,1,1,1 ;Character hit frame file name
	
	;Weapon Hit
	db 'images\chars\GG\GGHitW.bmp',0,1,1 ;weapon hit frame file name
	dw 11 ;weapon hit frame hight
	dw 6  ;weapon hit frame width
	dw -4 ;weapon hit frame relative x
	dw -3 ;weapon hit frame relative y
	
	;Character Air------------------------------------------
	db 'images\chars\GG\GGAir.bmp',0,1,1,1 ;Character air frame file name
	
	;Weapon Air
	db 'images\chars\GG\GGAirW.bmp',0,1,1 ;weapon air frame file name
	dw 11;weapon air frame hight
	dw 6 ;weapon air frame width
	dw 2 ;weapon air frame relative x
	dw -3;weapon air frame relative Y
	
	;Character Regular Attack-------------------------------
	;Frame 1
	db 'images\chars\GG\GGRAtF1.bmp',0,1 ;Character regular attack frame 1 file name
	;Frame 2
	db 'images\chars\GG\GGRAtF2.bmp',0,1 ;Character regular attack frame 2 file name
	;Frame 3
	db 'images\chars\GG\GGRAtF3.bmp',0,1 ;Character regular attack frame 3 file name
	;Frame 4
	db 'images\chars\GG\GGRAtF4.bmp',0,1 ;Character regular attack frame 4 file name
	;Frame 5
	db 'images\chars\GG\GGRAtF5.bmp',0,1 ;Character regular attack frame 5 file name
	;Frame 6
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 6 file name
	;Frame 7
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 7 file name
	;Frame 8
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 8 file name
	;Frame 9
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 9 file name
	;Frame 10
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 10 file name
	;Frame 11
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 11 file name
	;Frame 12
	db 'images\chars\GG\GGPlaceH.bmp',0 ;Character regular attack frame 12 file name
	
	;Weapon Regular Attack
	;Frame 1
	db 'images\chars\GG\GGRAtF1W.bmp',0 ;weapon regular attack frame 1 file name
	dw 9  ;weapon regular attack frame 1 hight
	dw 9  ;weapon regular attack frame 1 width
	dw 4  ;weapon regular attack frame 1 relative x
	dw 2  ;weapon regular attack frame 1 relative y
	dw 850;weapon regular attack frame 1 base velocity x 
	dw -360;weapon regular attack frame 1 base velocity y
	dw 0  ;weapon regular attack frame 1 self inflicted velocity x;relative to direction
	dw 0  ;weapon regular attack frame 1 self inflicted velocity y
	dw 0  ;weapon regular attack frame 1 self self velocity reset bool (0-no reset, 1-reset)
	dw 8  ;weapon regular attavk frame 1 velocity scale to damage parameter small ---- how the scaling works: BaseVelocity+BaseVelocity*(Damage/(2^small))
	dw 0  ;weapon regular attavk frame 1 is startup (only for animation) bool
	dw 15 ;weapon regular attack frame 1 stun
	dw 14  ;weapon regular attack frame 1 damage
	dw 0  ;weapon regular attack frame 1 hitable after hit
	
	;Frame 2
	db 'images\chars\GG\GGRAtF2W.bmp',0 ;weapon regular attack frame 2 file name
	dw 11 ;weapon regular attack frame 2 hight
	dw 11 ;weapon regular attack frame 2 width
	dw 4  ;weapon regular attack frame 2 relative x
	dw 0  ;weapon regular attack frame 2 relative y
	dw 850;weapon regular attack frame 2 base velocity x
	dw -360;weapon regular attack frame 2 base velocity y
	dw 0  ;weapon regular attack frame 2 self inflicted velocity x
	dw 0  ;weapon regular attack frame 2 self inflicted velocity y
	dw 0  ;weapon regular attack frame 2 self self velocity reset bool (0-no reset, 1-reset)
	dw 8  ;weapon regular attack frame 2 velocity scale to damage parameter 1 small
	dw 0  ;weapon regular attack frame 2 is startup (only for animation) bool
	dw 15 ;weapon regular attack frame 2 stun
	dw 14  ;weapon regular attack frame 2 damage
	dw 0  ;weapon regular attack frame 2 hitable after hit
	;Frame 3
	db 'images\chars\GG\GGRAtF3W.bmp',0 ;weapon regular attack frame 3 file name
	dw 12 ;weapon regular attack frame 3 hight
	dw 13 ;weapon regular attack frame 3 width
	dw 4  ;weapon regular attack frame 3 relative x
	dw 0  ;weapon regular attack frame 3 relative y
	dw 850;weapon regular attack frame 3 base velocity x
	dw -360;weapon regular attack frame 3 base velocity y
	dw 0  ;weapon regular attack frame 3 self inflicted velocity x
	dw 0  ;weapon regular attack frame 3 self inflicted velocity y
	dw 0  ;weapon regular attack frame 3 self self velocity reset bool (0-no reset, 1-reset)
	dw 8  ;weapon regular attack frame 3 velocity scale to damage parameter 1 small
	dw 0  ;weapon regular attack frame 3 is startup (only for animation) bool
	dw 15 ;weapon regular attack frame 3 stun
	dw 14  ;weapon regular attack frame 3 damage
	dw 0  ;weapon regular attack frame 3 hitable after hit
	;Frame 4
	db 'images\chars\GG\GGRAtF4W.bmp',0 ;weapon regular attack frame 4 file name
	dw 16 ;weapon regular attack frame 4 hight
	dw 12 ;weapon regular attack frame 4 width
	dw 4  ;weapon regular attack frame 4 relative x
	dw 1  ;weapon regular attack frame 4 relative y
	dw 850;weapon regular attack frame 4 base velocity x
	dw 360;weapon regular attack frame 4 base velocity y
	dw 0  ;weapon regular attack frame 4 self inflicted velocity x
	dw 0  ;weapon regular attack frame 4 self inflicted velocity y
	dw 0  ;weapon regular attack frame 4 self self velocity reset bool (0-no reset, 1-reset)
	dw 8 ;weapon regular attack frame 4 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 4 is startup (only for animation) bool
	dw 15 ;weapon regular attack frame 4 stun
	dw 14  ;weapon regular attack frame 4 damage
	dw 0  ;weapon regular attack frame 4 hitable after hit
	;Frame 5
	db 'images\chars\GG\GGRAtF5W.bmp',0 ;weapon regular attack frame 5 file name
	dw 10 ;weapon regular attack frame 5 hight
	dw 12 ;weapon regular attack frame 5 width
	dw 4  ;weapon regular attack frame 5 relative x
	dw 7  ;weapon regular attack frame 5 relative y
	dw 600;weapon regular attack frame 5 base velocity x
	dw 400;weapon regular attack frame 5 base velocity y
	dw 0  ;weapon regular attack frame 5 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 5 self inflicted velocity y
	dw 0  ;weapon regular attack frame 5 self self velocity reset bool (0-no reset, 1-reset)
	dw 8 ;weapon regular attack frame 5 velocity scale to damage parameter 1  small 
	dw 0  ;weapon regular attack frame 5 is startup (only for animation) bool
	dw 15 ;weapon regular attack frame 5 stun
	dw 16  ;weapon regular attack frame 5 damage
	dw 0  ;weapon regular attack frame 5 hitable after hit
	;Frame 6
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 6 file name
	dw 5 ;weapon regular attack frame 6 hight
	dw 3 ;weapon regular attack frame 6 width
	dw 4  ;weapon regular attack frame 6 relative x
	dw 7  ;weapon regular attack frame 6 relative y
	dw 80 ;weapon regular attack frame 6 base velocity x
	dw 30 ;weapon regular attack frame 6 base velocity y
	dw 0  ;weapon regular attack frame 6 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 6 self inflicted velocity y
	dw 0  ;weapon regular attack frame 6 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 6 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 6 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 6 stun
	dw 8  ;weapon regular attack frame 6 damage
	dw 0  ;weapon regular attack frame 6 hitable after hit
	;Frame 7
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 7 file name
	dw 5 ;weapon regular attack frame 7 hight
	dw 3 ;weapon regular attack frame 7 width
	dw 4  ;weapon regular attack frame 7 relative x
	dw 7  ;weapon regular attack frame 7 relative y
	dw 80;weapon regular attack frame 7 base velocity x
	dw 30;weapon regular attack frame 7 base velocity y
	dw 0  ;weapon regular attack frame 7 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 7 self inflicted velocity y
	dw 0  ;weapon regular attack frame 7 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 7 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 7 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 7 stun
	dw 8  ;weapon regular attack frame 7 damage
	dw 0  ;weapon regular attack frame 7 hitable after hit
	;Frame 8
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 8 file name
	dw 5 ;weapon regular attack frame 8 hight
	dw 3 ;weapon regular attack frame 8 width
	dw 4  ;weapon regular attack frame 8 relative x
	dw 7  ;weapon regular attack frame 8 relative y
	dw 80;weapon regular attack frame 8 base velocity x
	dw 30;weapon regular attack frame 8 base velocity y
	dw 0  ;weapon regular attack frame 8 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 8 self inflicted velocity y
	dw 0  ;weapon regular attack frame 8 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 8 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 8 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 8 stun
	dw 8  ;weapon regular attack frame 8 damage
	dw 0  ;weapon regular attack frame 8 hitable after hit
	;Frame 9
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 9 file name
	dw 5 ;weapon regular attack frame 9 hight
	dw 3 ;weapon regular attack frame 9 width
	dw 4  ;weapon regular attack frame 9 relative x
	dw 7  ;weapon regular attack frame 9 relative y
	dw 80;weapon regular attack frame 9 base velocity x
	dw 30;weapon regular attack frame 9 base velocity y
	dw 0  ;weapon regular attack frame 9 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 9 self inflicted velocity y
	dw 0  ;weapon regular attack frame 9 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 9 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 9 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 9 stun
	dw 8  ;weapon regular attack frame 9 damage
	dw 0  ;weapon regular attack frame 9 hitable after hit
	;Frame 10
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 10 file name
	dw 5 ;weapon regular attack frame 10 hight
	dw 3 ;weapon regular attack frame 10 width
	dw 4  ;weapon regular attack frame 10 relative x
	dw 7  ;weapon regular attack frame 10 relative y
	dw 80;weapon regular attack frame 10 base velocity x
	dw 30;weapon regular attack frame 10 base velocity y
	dw 0  ;weapon regular attack frame 10 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 10 self inflicted velocity y
	dw 0  ;weapon regular attack frame 10 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 10 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 10 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 10 stun
	dw 8  ;weapon regular attack frame 10 damage
	dw 0  ;weapon regular attack frame 10 hitable after hit
	;Frame 11
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 11 file name
	dw 5 ;weapon regular attack frame 11 hight
	dw 3 ;weapon regular attack frame 11 width
	dw 4  ;weapon regular attack frame 11 relative x
	dw 7  ;weapon regular attack frame 11 relative y
	dw 80;weapon regular attack frame 11 base velocity x
	dw 30;weapon regular attack frame 11 base velocity y
	dw 0  ;weapon regular attack frame 11 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 11 self inflicted velocity y
	dw 0  ;weapon regular attack frame 11 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 11 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 11 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 11 stun
	dw 8  ;weapon regular attack frame 11 damage
	dw 0  ;weapon regular attack frame 11 hitable after hit
	;Frame 12
	db 'images\chars\GG\GGPlaceH.bmp',0 ;weapon regular attack frame 12 file name
	dw 5 ;weapon regular attack frame 12 hight
	dw 3 ;weapon regular attack frame 12 width
	dw 4  ;weapon regular attack frame 12 relative x
	dw 7  ;weapon regular attack frame 12 relative y
	dw 80;weapon regular attack frame 12 base velocity x
	dw 30;weapon regular attack frame 12 base velocity y
	dw 0  ;weapon regular attack frame 12 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 12 self inflicted velocity y
	dw 0  ;weapon regular attack frame 12 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 12 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 12 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 12 stun
	dw 8  ;weapon regular attack frame 12 damage
	dw 0  ;weapon regular attack frame 12 hitable after hit
	
	
	
	; Frame Amount
	dw 5 ;Character regular attack frames max
	dw 5 ;Lag amount from useing regular attack
	dw 2 ;Character run frames max
	
	; character physics parameters
	dw 60 ;character stage horizontal acceleration
	dw 220 ;character stage horizontal max speed
	dw 1 ;character stage friction rate divider
	dw 1;character stage momentum shift divider
	
	dw 35 ;character air horizontal acceleration
	dw 180;character air horizontal max speed
	dw 12;character air friction rate divider
	dw 4;character air momentum shift divider
	
	dw 2;character hit friction x divider rate max
	dw 2;character hit friction y divider rate max
	
	dw 40;character gravity acceleration
	dw 280;character gravity max speed
	
	dw 3;character jump squat max
	dw 240;character short stage jump power
	dw 280;character high stage jump power
	dw 400;character air jump power
	dw 10;character time between jumps;was 10
	
	dw 3;character max jumps
	
	dw 30; character weight
GreenGnomeCharacterEnd=$
	
	
	
	
	
	
	;Gnome------------------------------------------------------
	
	GnomeIconFileName db 'images\chars\Gn\GnIcon.bmp',0,1,1
GnomeCharacterStart=$
	;character size
	dw 15 ; character hight
	dw 9 ; character width
	
	
	;Character Standing-------------------------------------
	db 'images\chars\Gn\GnStand.bmp',0,1 ;character stand frame file name
	
	;Weapon Standing
	db 'images\chars\Gn\GnStandW.bmp',0 ;weapon stand frame file name
	dw 2 ;weapon stand frame hight
	dw 13 ;weapon stand frame width
	dw 4 ;weapon stand frame relative x
	dw 10 ;weapon stand frame relative y
	
	;Character Running--------------------------------------
	;Frame 1
	db 'images\chars\Gn\GnRun1.bmp',0,1,1 ;character run frame 1 file name
	
	;Frame 2
	db 'images\chars\Gn\GnRun2.bmp',0,1,1 ;character run frame 2 file name
	
	;Frame 3
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;character run frame 3 file name
	
	;Weapon Running
	;Frame 1
	db 'images\chars\Gn\GnRun1W.bmp',0,1 ;weapon run frame 1 file name
	dw 2  ;weapon run frame 1 hight
	dw 13 ;weapon run frame 1 width;
	dw 3  ;weapon run frame 1 relative x 
	dw 11 ;weapon run frame 1 relative y;weapon 
	;Frame 2
	db 'images\chars\Gn\GnRun2W.bmp',0,1 ;weapon run frame 2 file name
	dw 2  ;weapon run frame 2 hight
	dw 13 ;weapon run frame 2 width
	dw 4  ;weapon run frame 2 relative x 
	dw 10 ;weapon run frame 2 relative y
	;Frame 3
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon run frame 2 file name
	dw 5   ;weapon run frame 3 hight
	dw 3   ;weapon run frame 3 width
	dw 0   ;weapon run frame 3 relative x 
	dw 0   ;weapon run frame 3 relative y 
	
	;Character Hit------------------------------------------
	db 'images\chars\Gn\GnHit.bmp',0,1,1,1 ;Character hit frame file name
	
	;Weapon Hit
	db 'images\chars\Gn\GnHitW.bmp',0,1,1 ;weapon hit frame file name
	dw 11 ;weapon hit frame hight
	dw 6  ;weapon hit frame width
	dw -4 ;weapon hit frame relative x
	dw -3 ;weapon hit frame relative y
	
	;Character Air------------------------------------------
	db 'images\chars\Gn\GnAir.bmp',0,1,1,1 ;Character air frame file name
	
	;Weapon Air
	db 'images\chars\Gn\GnAirW.bmp',0,1,1 ;weapon air frame file name
	dw 11;weapon air frame hight
	dw 6 ;weapon air frame width
	dw 2 ;weapon air frame relative x
	dw -3;weapon air frame relative Y
	
	;Character Regular Attack-------------------------------
	;Frame 1
	db 'images\chars\Gn\GnRAtF1.bmp',0,1 ;Character regular attack frame 1 file name
	;Frame 2
	db 'images\chars\Gn\GnRAtF2.bmp',0,1 ;Character regular attack frame 2 file name
	;Frame 3
	db 'images\chars\Gn\GnRAtF3.bmp',0,1 ;Character regular attack frame 3 file name
	;Frame 4
	db 'images\chars\Gn\GnRAtF4.bmp',0,1 ;Character regular attack frame 4 file name
	;Frame 5
	db 'images\chars\Gn\GnRAtF5.bmp',0,1 ;Character regular attack frame 5 file name
	;Frame 6
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 6 file name
	;Frame 7
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 7 file name
	;Frame 8
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 8 file name
	;Frame 9
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 9 file name
	;Frame 10
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 10 file name
	;Frame 11
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 11 file name
	;Frame 12
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;Character regular attack frame 12 file name
	
	
	;Weapon Regular Attack
	;Frame 1
	db 'images\chars\Gn\GnRAtF1W.bmp',0 ;weapon regular attack frame 1 file name
	dw 9  ;weapon regular attack frame 1 hight
	dw 9  ;weapon regular attack frame 1 width
	dw 4  ;weapon regular attack frame 1 relative x
	dw 2  ;weapon regular attack frame 1 relative y
	dw 80;weapon regular attack frame 1 base velocity x 
	dw -20;weapon regular attack frame 1 base velocity y
	dw 0  ;weapon regular attack frame 1 self inflicted velocity x;relative to direction
	dw 0  ;weapon regular attack frame 1 self inflicted velocity y
	dw 0  ;weapon regular attack frame 1 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 1 velocity scale to damage parameter small ---- how the scaling works: BaseVelocity+BaseVelocity*(Damage/(2^small))
	dw 0  ;weapon regular attack frame 1 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 1 stun
	dw 17  ;weapon regular attack frame 1 damage
	dw 0  ;weapon regular attack frame 1 hitable after hit
	
	;Frame 2
	db 'images\chars\Gn\GnRAtF2W.bmp',0 ;weapon regular attack frame 2 file name
	dw 11 ;weapon regular attack frame 2 hight
	dw 11 ;weapon regular attack frame 2 width
	dw 4  ;weapon regular attack frame 2 relative x
	dw 0  ;weapon regular attack frame 2 relative y
	dw 80;weapon regular attack frame 2 base velocity x
	dw -20;weapon regular attack frame 2 base velocity y
	dw 0  ;weapon regular attack frame 2 self inflicted velocity x
	dw 0  ;weapon regular attack frame 2 self inflicted velocity y
	dw 0  ;weapon regular attack frame 2 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 2 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 2 is startup (only for animation) bool
	dw 14 ;weapon regular attack frame 2 stun
	dw 17  ;weapon regular attack frame 2 damage
	dw 0  ;weapon regular attack frame 2 hitable after hit
	;Frame 3
	db 'images\chars\Gn\GnRAtF3W.bmp',0 ;weapon regular attack frame 3 file name
	dw 12 ;weapon regular attack frame 3 hight
	dw 13 ;weapon regular attack frame 3 width
	dw 4  ;weapon regular attack frame 3 relative x
	dw 0  ;weapon regular attack frame 3 relative y
	dw 80;weapon regular attack frame 3 base velocity x
	dw -20;weapon regular attack frame 3 base velocity y
	dw 0  ;weapon regular attack frame 3 self inflicted velocity x
	dw 0  ;weapon regular attack frame 3 self inflicted velocity y
	dw 0  ;weapon regular attack frame 3 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 3 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 3 is startup (only for animation) bool
	dw 14 ;weapon regular attack frame 3 stun
	dw 17  ;weapon regular attack frame 3 damage
	dw 0  ;weapon regular attack frame 3 hitable after hit
	;Frame 4
	db 'images\chars\Gn\GnRAtF4W.bmp',0 ;weapon regular attack frame 4 file name
	dw 16 ;weapon regular attack frame 4 hight
	dw 12 ;weapon regular attack frame 4 width
	dw 4  ;weapon regular attack frame 4 relative x
	dw 1  ;weapon regular attack frame 4 relative y
	dw 80 ;weapon regular attack frame 4 base velocity x
	dw 30;weapon regular attack frame 4 base velocity y
	dw 0  ;weapon regular attack frame 4 self inflicted velocity x
	dw 0  ;weapon regular attack frame 4 self inflicted velocity y
	dw 0  ;weapon regular attack frame 4 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 4 velocity scale to damage parameter 1
	dw 0  ;weapon regular attack frame 4 is startup (only for animation) bool
	dw 14 ;weapon regular attack frame 4 stun
	dw 20  ;weapon regular attack frame 4 damage
	dw 0  ;weapon regular attack frame 4 hitable after hit
	;Frame 5
	db 'images\chars\Gn\GnRAtF5W.bmp',0 ;weapon regular attack frame 5 file name
	dw 10 ;weapon regular attack frame 5 hight
	dw 12 ;weapon regular attack frame 5 width
	dw 4  ;weapon regular attack frame 5 relative x
	dw 7  ;weapon regular attack frame 5 relative y
	dw 80;weapon regular attack frame 5 base velocity x
	dw 30;weapon regular attack frame 5 base velocity y
	dw 0  ;weapon regular attack frame 5 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 5 self inflicted velocity y
	dw 0  ;weapon regular attack frame 5 self self velocity reset bool (0-no reset, 1-reset)
	dw 4  ;weapon regular attack frame 5 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 5 is startup (only for animation) bool
	dw 14 ;weapon regular attack frame 5 stun
	dw 16  ;weapon regular attack frame 5 damage
	dw 0  ;weapon regular attack frame 5 hitable after hit
	;Frame 6
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 6 file name
	dw 5 ;weapon regular attack frame 6 hight
	dw 3 ;weapon regular attack frame 6 width
	dw 4  ;weapon regular attack frame 6 relative x
	dw 7  ;weapon regular attack frame 6 relative y
	dw 80;weapon regular attack frame 6 base velocity x
	dw 30;weapon regular attack frame 6 base velocity y
	dw 0  ;weapon regular attack frame 6 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 6 self inflicted velocity y
	dw 0  ;weapon regular attack frame 6 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 6 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 6 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 6 stun
	dw 8  ;weapon regular attack frame 6 damage
	dw 0  ;weapon regular attack frame 6 hitable after hit
	;Frame 7
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 7 file name
	dw 5 ;weapon regular attack frame 7 hight
	dw 3 ;weapon regular attack frame 7 width
	dw 4  ;weapon regular attack frame 7 relative x
	dw 7  ;weapon regular attack frame 7 relative y
	dw 80;weapon regular attack frame 7 base velocity x
	dw 30;weapon regular attack frame 7 base velocity y
	dw 0  ;weapon regular attack frame 7 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 7 self inflicted velocity y
	dw 0  ;weapon regular attack frame 7 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 7 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 7 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 7 stun
	dw 8  ;weapon regular attack frame 7 damage
	dw 0  ;weapon regular attack frame 7 hitable after hit
	;Frame 8
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 8 file name
	dw 5 ;weapon regular attack frame 8 hight
	dw 3 ;weapon regular attack frame 8 width
	dw 4  ;weapon regular attack frame 8 relative x
	dw 7  ;weapon regular attack frame 8 relative y
	dw 80;weapon regular attack frame 8 base velocity x
	dw 30;weapon regular attack frame 8 base velocity y
	dw 0  ;weapon regular attack frame 8 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 8 self inflicted velocity y
	dw 0  ;weapon regular attack frame 8 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 8 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 8 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 8 stun
	dw 8  ;weapon regular attack frame 8 damage
	dw 0  ;weapon regular attack frame 8 hitable after hit
	;Frame 9
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 9 file name
	dw 5 ;weapon regular attack frame 9 hight
	dw 3 ;weapon regular attack frame 9 width
	dw 4  ;weapon regular attack frame 9 relative x
	dw 7  ;weapon regular attack frame 9 relative y
	dw 80;weapon regular attack frame 9 base velocity x
	dw 30;weapon regular attack frame 9 base velocity y
	dw 0  ;weapon regular attack frame 9 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 9 self inflicted velocity y
	dw 0  ;weapon regular attack frame 9 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 9 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 9 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 9 stun
	dw 8  ;weapon regular attack frame 9 damage
	dw 0  ;weapon regular attack frame 9 hitable after hit
	;Frame 10
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 10 file name
	dw 5 ;weapon regular attack frame 10 hight
	dw 3 ;weapon regular attack frame 10 width
	dw 4  ;weapon regular attack frame 10 relative x
	dw 7  ;weapon regular attack frame 10 relative y
	dw 80;weapon regular attack frame 10 base velocity x
	dw 30;weapon regular attack frame 10 base velocity y
	dw 0  ;weapon regular attack frame 10 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 10 self inflicted velocity y
	dw 0  ;weapon regular attack frame 10 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 10 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 10 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 10 stun
	dw 8  ;weapon regular attack frame 10 damage
	dw 0  ;weapon regular attack frame 10 hitable after hit
	;Frame 11
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 11 file name
	dw 5 ;weapon regular attack frame 11 hight
	dw 3 ;weapon regular attack frame 11 width
	dw 4  ;weapon regular attack frame 11 relative x
	dw 7  ;weapon regular attack frame 11 relative y
	dw 80;weapon regular attack frame 11 base velocity x
	dw 30;weapon regular attack frame 11 base velocity y
	dw 0  ;weapon regular attack frame 11 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 11 self inflicted velocity y
	dw 0  ;weapon regular attack frame 11 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 11 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 11 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 11 stun
	dw 8  ;weapon regular attack frame 11 damage
	dw 0  ;weapon regular attack frame 11 hitable after hit
	;Frame 12
	db 'images\chars\Gn\GnPlaceH.bmp',0 ;weapon regular attack frame 12 file name
	dw 5 ;weapon regular attack frame 12 hight
	dw 3 ;weapon regular attack frame 12 width
	dw 4  ;weapon regular attack frame 12 relative x
	dw 7  ;weapon regular attack frame 12 relative y
	dw 80;weapon regular attack frame 12 base velocity x
	dw 30;weapon regular attack frame 12 base velocity y
	dw 0  ;weapon regular attack frame 12 self inflicted velocity x ;relative to direction
	dw 0  ;weapon regular attack frame 12 self inflicted velocity y
	dw 0  ;weapon regular attack frame 12 self self velocity reset bool (0-no reset, 1-reset)
	dw 3  ;weapon regular attack frame 12 velocity scale to damage parameter 1  --- 
	dw 0  ;weapon regular attack frame 12 is startup (only for animation) bool
	dw 12 ;weapon regular attack frame 12 stun
	dw 8  ;weapon regular attack frame 12 damage
	dw 0  ;weapon regular attack frame 12 hitable after hit
	
	
	
	
	; Frame Amount
	dw 5 ;Character regular attack frames max
	dw 8 ;Lag amount from useing regular attack
	dw 2 ;Character run frames max
	
	; character physics parameters
	dw 50 ;character stage horizontal acceleration
	dw 180 ;character stage horizontal max speed
	dw 1 ;character stage friction rate divider
	dw 1;character stage momentum shift divider
	
	dw 25 ;character air horizontal acceleration
	dw 160;character air horizontal max speed
	dw 12;character air friction rate divider
	dw 4;character air momentum shift divider
	
	dw 2;character hit friction x divider rate max
	dw 2;character hit friction y divider rate max
	
	dw 21;character gravity acceleration
	dw 210;character gravity max speed
	
	dw 3;character jump squat max
	dw 160;character short stage jump power
	dw 200;character high stage jump power
	dw 285;character air jump power
	dw 10;character time between jumps;was 10
	
	dw 2;character max jumps
	
	dw 100;character weight(the less weight the heavyer, if the weight is smaller then the character flies less from hits)
GnomeCharacterEnd=$
	
	
	
	
	
	
	
	
	;KEYBOARD KEYS
	
	MoveLeftPlayer1Key db 0
	PrevAkey db 0
	Dkey db 0
	PrevDkey db 0
	MoveLeftPlayer2Key db 0
	MoveRightPlayer2Key db 0
	Player2RegularAttackKey db 0
	Player2JumpKey db 0
	RightArrowkey db 0
	Ckey db 0
	Fkey db 0
	;Slashkey db 0
	;Dotkey db 0
	Pkey db 0
	SpaceBar db 0
	Esckey db 0
	
	
	;STAGE VARIABLES
	StageFileName db STAGENAME,0
	StageBitMap db STAGEHIGHT*STAGEWIDTH dup (?)
	StagePositionX dw ?
	StagePositionY dw ?
	
	;PALETTE
	PaletteFileName db 'images\misc\Palette.bmp',0
	FullPalette db 400h dup (?)
	InvisibleColorPlace dw ?
	
	;SELECTION SCREEN
	SelectionScreenName db 'images\misc\ChSelect.bmp',0
	
	;Battle Screens
	Player1WinsTextName db 'images\misc\P1Wins.bmp',0
	Player2WinsTextName db 'images\misc\P2Wins.bmp',0
	DrawTextName db 'images\misc\Draw.bmp',0
	PauseTextName db 'images\misc\Pause.bmp',0
	SpaceConTextName db 'images\misc\SpaceCon.bmp',0
	
	;Player Tags Files
	P1TagName db 'images\misc\P1Tag.bmp',0
	P1TagBitmap db PLAYERTAGHIGHT*PLAYERTAGWIDTH dup (?)
	P2TagName db 'images\misc\P2Tag.bmp',0
	P2TagBitmap db PLAYERTAGHIGHT*PLAYERTAGWIDTH dup (?)
	
	
	;Digits files
	Digit0Name db 'images\numbers\0.bmp',0
	Digit0Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit1Name db 'images\numbers\1.bmp',0
	Digit1Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit2Name db 'images\numbers\2.bmp',0
	Digit2Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit3Name db 'images\numbers\3.bmp',0
	Digit3Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit4Name db 'images\numbers\4.bmp',0
	Digit4Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit5Name db 'images\numbers\5.bmp',0
	Digit5Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit6Name db 'images\numbers\6.bmp',0
	Digit6Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit7Name db 'images\numbers\7.bmp',0
	Digit7Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit8Name db 'images\numbers\8.bmp',0
	Digit8Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	Digit9Name db 'images\numbers\9.bmp',0
	Digit9Bitmap db DIGITHIGHT*DIGITWIDTH dup (?)
	
	;Heart file
	HeartName db 'images\misc\Heart.bmp',0
	HeartBitmap db HEARTHIGHT*HEARTWIDTH dup (?)
	

	
	
	
	;Player 1 variables start
	;CHARACTER FILES 
	
	
	;CHARACTER FRAMES, NEEDS TO BE UP TO DATE WITH THE LONGEST RUN FRAMES, ATTACK FRAMES AND CHARACTER SIZE
	;when more characters are added and they dont have the same amount of frames, a placeholder is needed do make the bitmap reading work 
Player1Start =$
	Player1Hight dw ?
	Player1Width dw ?
	
	;Standing Frame
	;character
	Player1StandFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player1WeaponStandFrameFileName db FILE_NAME_LEN dup (?)
	Player1WeaponStandFrameHight dw ?
	Player1WeaponStandFrameWidth dw ?
	Player1WeaponStandFrameRelativeXPos dw ?
	Player1WeaponStandFrameRelativeYPos dw ?
	
	
	;Running Frames
	;character
	Player1RunFrame1FileName db FILE_NAME_LEN dup (?)
	
	Player1RunFrame2FileName db FILE_NAME_LEN dup (?)
	
	Player1RunFrame3FileName db FILE_NAME_LEN dup (?)
	
	;weapon
	
	;frame 1
	Player1WeaponRunFrame1FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRunFrame1Hight dw ?
	Player1WeaponRunFrame1Width dw ?
	Player1WeaponRunFrame1RelativeXPos dw ?
	Player1WeaponRunFrame1RelativeYPos dw ?
	
	;frame 2
	Player1WeaponRunFrame2FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRunFrame2Hight dw ?
	Player1WeaponRunFrame2Width dw ?
	Player1WeaponRunFrame2RelativeXPos dw ?
	Player1WeaponRunFrame2RelativeYPos dw ?
	
	;frame 3
	Player1WeaponRunFrame3FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRunFrame3Hight dw ?
	Player1WeaponRunFrame3Width dw ?
	Player1WeaponRunFrame3RelativeXPos dw ?
	Player1WeaponRunFrame3RelativeYPos dw ?
	
	;Hit Frame
	;character
	Player1HitFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player1WeaponHitFrameFileName db FILE_NAME_LEN dup (?)
	Player1WeaponHitFrameHight dw ?
	Player1WeaponHitFrameWidth dw ?
	Player1WeaponHitFrameRelativeXPos dw ?
	Player1WeaponHitFrameRelativeYPos dw ?
	
	
	;Air Frame
	;character
	Player1AirFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player1WeaponAirFrameFileName db FILE_NAME_LEN dup (?)
	Player1WeaponAirFrameHight dw ?
	Player1WeaponAirFrameWidth dw ?
	Player1WeaponAirFrameRelativeXPos dw ?
	Player1WeaponAirFrameRelativeYPos dw ?
	
	
	
	;Regular Attack Frames
	;character
	Player1RegularAttackFrame1FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame2FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame3FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame4FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame5FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame6FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame7FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame8FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame9FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame10FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame11FileName db FILE_NAME_LEN dup (?)
	Player1RegularAttackFrame12FileName db FILE_NAME_LEN dup (?)
	
	;weapon
	
	;frame 1
	Player1WeaponRegularAttackFrame1FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame1Hight dw ?
	Player1WeaponRegularAttackFrame1Width dw ?
	Player1WeaponRegularAttackFrame1RelativeXPos dw ?
	Player1WeaponRegularAttackFrame1RelativeYPos dw ?
	Player1WeaponRegularAttackFrame1BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame1BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame1SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame1SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame1SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame1VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame1IsOnlyAnimation dw ?
	Player1WeaponRegularAttackFrame1Stun dw ?
	Player1WeaponRegularAttackFrame1Damage dw ?
	Player1WeaponRegularAttackFrame1HitableAfterHit dw ?
	
	
	;frame 2
	Player1WeaponRegularAttackFrame2FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame2Hight dw ?
	Player1WeaponRegularAttackFrame2Width dw ?
	Player1WeaponRegularAttackFrame2RelativeXPos dw ?
	Player1WeaponRegularAttackFrame2RelativeYPos dw ?
	Player1WeaponRegularAttackFrame2BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame2BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame2SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame2SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame2SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame2VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame2IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame2Stun dw ?
	Player1WeaponRegularAttackFrame2Damage dw ?
	Player1WeaponRegularAttackFrame2HitableAfterHit dw ?
	
	
	;frame 3
	Player1WeaponRegularAttackFrame3FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame3Hight dw ?
	Player1WeaponRegularAttackFrame3Width dw ?
	Player1WeaponRegularAttackFrame3RelativeXPos dw ?
	Player1WeaponRegularAttackFrame3RelativeYPos dw ?
	Player1WeaponRegularAttackFrame3BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame3BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame3SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame3SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame3SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame3VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame3IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame3Stun dw ?
	Player1WeaponRegularAttackFrame3Damage dw ?
	Player1WeaponRegularAttackFrame3HitableAfterHit dw ?
	
	
	;frame 4
	Player1WeaponRegularAttackFrame4FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame4Hight dw ?
	Player1WeaponRegularAttackFrame4Width dw ?
	Player1WeaponRegularAttackFrame4RelativeXPos dw ?
	Player1WeaponRegularAttackFrame4RelativeYPos dw ?
	Player1WeaponRegularAttackFrame4BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame4BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame4SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame4SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame4SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame4VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame4IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame4Stun dw ?
	Player1WeaponRegularAttackFrame4Damage dw ?
	Player1WeaponRegularAttackFrame4HitableAfterHit dw ?
	
	
	;frame 5
	Player1WeaponRegularAttackFrame5FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame5Hight dw ?
	Player1WeaponRegularAttackFrame5Width dw ?
	Player1WeaponRegularAttackFrame5RelativeXPos dw ?
	Player1WeaponRegularAttackFrame5RelativeYPos dw ?
	Player1WeaponRegularAttackFrame5BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame5BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame5SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame5SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame5SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame5VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame5IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame5Stun dw ?
	Player1WeaponRegularAttackFrame5Damage dw ?
	Player1WeaponRegularAttackFrame5HitableAfterHit dw ?
	
	
;frame 6
	Player1WeaponRegularAttackFrame6FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame6Hight dw ?
	Player1WeaponRegularAttackFrame6Width dw ?
	Player1WeaponRegularAttackFrame6RelativeXPos dw ?
	Player1WeaponRegularAttackFrame6RelativeYPos dw ?
	Player1WeaponRegularAttackFrame6BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame6BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame6SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame6SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame6SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame6VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame6IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame6Stun dw ?
	Player1WeaponRegularAttackFrame6Damage dw ?
	Player1WeaponRegularAttackFrame6HitableAfterHit dw ?
	
	
;frame 7
	Player1WeaponRegularAttackFrame7FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame7Hight dw ?
	Player1WeaponRegularAttackFrame7Width dw ?
	Player1WeaponRegularAttackFrame7RelativeXPos dw ?
	Player1WeaponRegularAttackFrame7RelativeYPos dw ?
	Player1WeaponRegularAttackFrame7BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame7BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame7SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame7SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame7SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame7VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame7IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame7Stun dw ?
	Player1WeaponRegularAttackFrame7Damage dw ?
	Player1WeaponRegularAttackFrame7HitableAfterHit dw ?
	
	
;frame 8
	Player1WeaponRegularAttackFrame8FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame8Hight dw ?
	Player1WeaponRegularAttackFrame8Width dw ?
	Player1WeaponRegularAttackFrame8RelativeXPos dw ?
	Player1WeaponRegularAttackFrame8RelativeYPos dw ?
	Player1WeaponRegularAttackFrame8BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame8BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame8SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame8SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame8SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame8VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame8IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame8Stun dw ?
	Player1WeaponRegularAttackFrame8Damage dw ?
	Player1WeaponRegularAttackFrame8HitableAfterHit dw ?
	
	
;frame 9
	Player1WeaponRegularAttackFrame9FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame9Hight dw ?
	Player1WeaponRegularAttackFrame9Width dw ?
	Player1WeaponRegularAttackFrame9RelativeXPos dw ?
	Player1WeaponRegularAttackFrame9RelativeYPos dw ?
	Player1WeaponRegularAttackFrame9BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame9BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame9SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame9SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame9SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame9VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame9IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame9Stun dw ?
	Player1WeaponRegularAttackFrame9Damage dw ?
	Player1WeaponRegularAttackFrame9HitableAfterHit dw ?
	
	
	
;frame 10
	Player1WeaponRegularAttackFrame10FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame10Hight dw ?
	Player1WeaponRegularAttackFrame10Width dw ?
	Player1WeaponRegularAttackFrame10RelativeXPos dw ?
	Player1WeaponRegularAttackFrame10RelativeYPos dw ?
	Player1WeaponRegularAttackFrame10BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame10BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame10SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame10SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame10SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame10VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame10IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame10Stun dw ?
	Player1WeaponRegularAttackFrame10Damage dw ?
	Player1WeaponRegularAttackFrame10HitableAfterHit dw ?
	
	
;frame 11
	Player1WeaponRegularAttackFrame11FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame11Hight dw ?
	Player1WeaponRegularAttackFrame11Width dw ?
	Player1WeaponRegularAttackFrame11RelativeXPos dw ?
	Player1WeaponRegularAttackFrame11RelativeYPos dw ?
	Player1WeaponRegularAttackFrame11BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame11BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame11SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame11SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame11SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame11VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame11IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame11Stun dw ?
	Player1WeaponRegularAttackFrame11Damage dw ?
	Player1WeaponRegularAttackFrame11HitableAfterHit dw ?
	
	
;frame 12
	Player1WeaponRegularAttackFrame12FileName db FILE_NAME_LEN dup (?)
	Player1WeaponRegularAttackFrame12Hight dw ?
	Player1WeaponRegularAttackFrame12Width dw ?
	Player1WeaponRegularAttackFrame12RelativeXPos dw ?
	Player1WeaponRegularAttackFrame12RelativeYPos dw ?
	Player1WeaponRegularAttackFrame12BaseVelocityX dw ?
	Player1WeaponRegularAttackFrame12BaseVelocityY dw ?
	Player1WeaponRegularAttackFrame12SelfInflictedVelocityX dw ?
	Player1WeaponRegularAttackFrame12SelfInflictedVelocityY dw ?
	Player1WeaponRegularAttackFrame12SelfVelocityReset dw ?
	Player1WeaponRegularAttackFrame12VelocityScaleParameterSmall dw ?
	Player1WeaponRegularAttackFrame12IsOnlyAnimation dw ?
	
	Player1WeaponRegularAttackFrame12Stun dw ?
	Player1WeaponRegularAttackFrame12Damage dw ?
	Player1WeaponRegularAttackFrame12HitableAfterHit dw ?
	
	
	
	NumberOfFramesInRegularAttackP1 dw ?
	LagOfRegularAttackP1 dw ?
	NumberOfFramesInRunP1 dw ?
	
	
	HorizontalStageSpeedP1 dw ?
	MaxHorizontalStageSpeedP1 dw ?
	StageFrictionRateDividerMaxP1 dw ?
	StageMomentumShiftDividerP1 dw ?
	
	HorizontalAirSpeedP1 dw ?
	MaxHorizontalAirSpeedP1 dw ?
	AirFrictionRateDividerMaxP1 dw ?
	AirMomentumShiftDividerP1 dw ?
	
	HitFrictionRateDividerMaxXP1 dw ?
	HitFrictionRateDividerMaxYP1 dw ?
	
	GravityAccelerationP1 dw ?
	GravityMaxSpeedP1 dw ?
	
	JumpSquatMaxP1 dw ?
	ShortStageJumpPowerP1 dw ?
	HighStageJumpPowerP1 dw ?
	AirJumpPowerP1 dw ?
	
	TimeBetweenJumpsMaxP1 dw ?
	MaxNumberOfJumpsP1 dw ?
	
	WeightP1 dw ?
Player1End =$
	
	
	
	;Player1 bitmaps
	;stand
	Player1StandFrameBitMap db 25*15 dup (?)
	Player1WeaponStandFrameBitMap db 25*15 dup (?)
	
	;run
	Player1RunFrame1BitMap db 25*15 dup (?)
	Player1RunFrame2BitMap db 25*15 dup (?)
	Player1RunFrame3BitMap db 25*15 dup (?)
	
	Player1WeaponRunFrame1BitMap db 25*15 dup (?)
	Player1WeaponRunFrame2BitMap db 25*15 dup (?)
	Player1WeaponRunFrame3BitMap db 25*15 dup (?)
	
	;air
	Player1AirFrameBitMap db 25*15 dup (?)
	
	Player1WeaponAirFrameBitMap db 25*15 dup (?)
	
	;hit
	Player1HitFrameBitMap db 25*15 dup (?)
	
	Player1WeaponHitFrameBitMap db 25*15 dup (?)
	
	;regular attack
	Player1RegularAttackFrame1BitMap db 25*15 dup (?)
	Player1RegularAttackFrame2BitMap db 25*15 dup (?)
	Player1RegularAttackFrame3BitMap db 25*15 dup (?)
	Player1RegularAttackFrame4BitMap db 25*15 dup (?)
	Player1RegularAttackFrame5BitMap db 25*15 dup (?)
	Player1RegularAttackFrame6BitMap db 25*15 dup (?)
	Player1RegularAttackFrame7BitMap db 25*15 dup (?)
	Player1RegularAttackFrame8BitMap db 25*15 dup (?)
	Player1RegularAttackFrame9BitMap db 25*15 dup (?)
	Player1RegularAttackFrame10BitMap db 25*15 dup (?)
	Player1RegularAttackFrame11BitMap db 25*15 dup (?)
	Player1RegularAttackFrame12BitMap db 25*15 dup (?)
	
	Player1WeaponRegularAttackFrame1BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame2BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame3BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame4BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame5BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame6BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame7BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame8BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame9BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame10BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame11BitMap db 25*15 dup (?)
	Player1WeaponRegularAttackFrame12BitMap db 25*15 dup (?)
	
	
	
	;PLAYER 1 VARIABLES
	
	
	LivesLeftP1 dw ?
	PrevLivesLeftP1 dw ?
	DamageTakenP1 dw ?
	PrevDamageTakenP1 dw ?
	
	IsAttackingP1 dw ?
	InitiatingJumpP1 dw ? ;0 is no jump, 1 is on stage jump
	JumpSquatCounterP1 dw ?
	
	TimeBetweenJumpsCounterP1 dw ?
	
	NumberOfJumpsLeftP1 dw ?
	
	StageFrictionRateDividerCounterP1 dw ?
	
	AirFrictionRateDividerCounterP1 dw ?
	
	HitFrictionRateDividerCounterXP1 dw ?
	HitFrictionRateDividerCounterYP1 dw ?
	
	DirectionFacingP1 dw ?
	PrevDirectionFacingP1 dw ?
	
	MovementDirectionP1 dw ?
	
	IsHitableP1 dw ?
	RegularAttackCanHitP1 dw ?
	
	RegularAttackFrameP1 dw ?
	PrevRegularAttackFrameP1 dw ?
	
	RunFrameP1 dw ?
	PrevRunFrameP1 dw ?
	
	PrevFrameP1 dw ? ;1-stand   2-run   3-air   4-hit   5-regular attack
	CurrentFrameP1 dw ?
	
	StunedAmountP1 dw ?
	LagAmountP1 dw ?
	
	InTumbleP1 dw ?
	
	NeedDrawP1 dw ?
	
	NeedStageFixP1 dw ?
	StageFixXP1 dw ?
	StageFixYP1 dw ?
	StageFixHightP1 dw ?
	StageFixWidthP1 dw ?
	
	
	PositionXP1 dw ?
	PositionYP1 dw ?
	
	PrevPositionXP1 dw ?
	PrevPositionYP1 dw ?
	
	PositionVectorXP1 dw ?;first 6 bits are for sub pixles, one pixle is 64
	PositionVectorYP1 dw ?
	
	
	TempPrevPositionVectorXP1 dw ?
	TempPrevPositionVectorYP1 dw ?
	
	
	
	VelocityVectorXP1 dw ?;first 6 bits are for sub pixles, one pixle is 64
	VelocityVectorYP1 dw ?
	
	
	CharacterP1 dw ?
	Player1IconFileName db FILE_NAME_LEN dup (?)
	;end of player 1 variables
	
	
	
	
	
	;Player 2 variables start
	;CHARACTER FILES 
	
	
	;CHARACTER FRAMES, NEEDS TO BE UP TO DATE WITH THE LONGEST RUN FRAMES, ATTACK FRAMES AND CHARACTER SIZE
	;when more characters are added and they dont have the same amount of frames, a 1 on 1 placeholder is needed do make the bitmap reading work 
Player2Start =$
	Player2Hight dw ?
	Player2Width dw ?
	
	;Standing Frame
	;character
	Player2StandFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player2WeaponStandFrameFileName db FILE_NAME_LEN dup (?)
	Player2WeaponStandFrameHight dw ?
	Player2WeaponStandFrameWidth dw ?
	Player2WeaponStandFrameRelativeXPos dw ?
	Player2WeaponStandFrameRelativeYPos dw ?
	
	
	;Running Frames
	;character
	Player2RunFrame1FileName db FILE_NAME_LEN dup (?)
	
	Player2RunFrame2FileName db FILE_NAME_LEN dup (?)
	
	Player2RunFrame3FileName db FILE_NAME_LEN dup (?)
	
	;weapon
	
	;frame 1
	Player2WeaponRunFrame1FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRunFrame1Hight dw ?
	Player2WeaponRunFrame1Width dw ?
	Player2WeaponRunFrame1RelativeXPos dw ?
	Player2WeaponRunFrame1RelativeYPos dw ?
	
	;frame 2
	Player2WeaponRunFrame2FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRunFrame2Hight dw ?
	Player2WeaponRunFrame2Width dw ?
	Player2WeaponRunFrame2RelativeXPos dw ?
	Player2WeaponRunFrame2RelativeYPos dw ?
	
	;frame 3
	Player2WeaponRunFrame3FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRunFrame3Hight dw ?
	Player2WeaponRunFrame3Width dw ?
	Player2WeaponRunFrame3RelativeXPos dw ?
	Player2WeaponRunFrame3RelativeYPos dw ?
	
	;Hit Frame
	;character
	Player2HitFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player2WeaponHitFrameFileName db FILE_NAME_LEN dup (?)
	Player2WeaponHitFrameHight dw ?
	Player2WeaponHitFrameWidth dw ?
	Player2WeaponHitFrameRelativeXPos dw ?
	Player2WeaponHitFrameRelativeYPos dw ?
	
	
	;Air Frame
	;character
	Player2AirFrameFileName db FILE_NAME_LEN dup (?)
	
	;weapon
	Player2WeaponAirFrameFileName db FILE_NAME_LEN dup (?)
	Player2WeaponAirFrameHight dw ?
	Player2WeaponAirFrameWidth dw ?
	Player2WeaponAirFrameRelativeXPos dw ?
	Player2WeaponAirFrameRelativeYPos dw ?
	
	
	
	;Regular Attack Frames
	;character
	Player2RegularAttackFrame1FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame2FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame3FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame4FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame5FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame6FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame7FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame8FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame9FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame10FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame11FileName db FILE_NAME_LEN dup (?)
	Player2RegularAttackFrame12FileName db FILE_NAME_LEN dup (?)
	
	;weapon
	
	;frame 1
	Player2WeaponRegularAttackFrame1FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame1Hight dw ?
	Player2WeaponRegularAttackFrame1Width dw ?
	Player2WeaponRegularAttackFrame1RelativeXPos dw ?
	Player2WeaponRegularAttackFrame1RelativeYPos dw ?
	Player2WeaponRegularAttackFrame1BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame1BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame1SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame1SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame1SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame1VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame1IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame1Stun dw ?
	Player2WeaponRegularAttackFrame1Damage dw ?
	Player2WeaponRegularAttackFrame1HitableAfterHit dw ?
	
	
	;frame 2
	Player2WeaponRegularAttackFrame2FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame2Hight dw ?
	Player2WeaponRegularAttackFrame2Width dw ?
	Player2WeaponRegularAttackFrame2RelativeXPos dw ?
	Player2WeaponRegularAttackFrame2RelativeYPos dw ?
	Player2WeaponRegularAttackFrame2BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame2BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame2SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame2SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame2SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame2VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame2IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame2Stun dw ?
	Player2WeaponRegularAttackFrame2Damage dw ?
	Player2WeaponRegularAttackFrame2HitableAfterHit dw ?
	
	
	;frame 3
	Player2WeaponRegularAttackFrame3FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame3Hight dw ?
	Player2WeaponRegularAttackFrame3Width dw ?
	Player2WeaponRegularAttackFrame3RelativeXPos dw ?
	Player2WeaponRegularAttackFrame3RelativeYPos dw ?
	Player2WeaponRegularAttackFrame3BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame3BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame3SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame3SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame3SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame3VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame3IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame3Stun dw ?
	Player2WeaponRegularAttackFrame3Damage dw ?
	Player2WeaponRegularAttackFrame3HitableAfterHit dw ?
	
	
	;frame 4
	Player2WeaponRegularAttackFrame4FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame4Hight dw ?
	Player2WeaponRegularAttackFrame4Width dw ?
	Player2WeaponRegularAttackFrame4RelativeXPos dw ?
	Player2WeaponRegularAttackFrame4RelativeYPos dw ?
	Player2WeaponRegularAttackFrame4BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame4BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame4SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame4SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame4SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame4VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame4IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame4Stun dw ?
	Player2WeaponRegularAttackFrame4Damage dw ?
	Player2WeaponRegularAttackFrame4HitableAfterHit dw ?
	
	
	;frame 5
	Player2WeaponRegularAttackFrame5FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame5Hight dw ?
	Player2WeaponRegularAttackFrame5Width dw ?
	Player2WeaponRegularAttackFrame5RelativeXPos dw ?
	Player2WeaponRegularAttackFrame5RelativeYPos dw ?
	Player2WeaponRegularAttackFrame5BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame5BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame5SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame5SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame5SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame5VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame5IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame5Stun dw ?
	Player2WeaponRegularAttackFrame5Damage dw ?
	Player2WeaponRegularAttackFrame5HitableAfterHit dw ?
	
	
;frame 6
	Player2WeaponRegularAttackFrame6FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame6Hight dw ?
	Player2WeaponRegularAttackFrame6Width dw ?
	Player2WeaponRegularAttackFrame6RelativeXPos dw ?
	Player2WeaponRegularAttackFrame6RelativeYPos dw ?
	Player2WeaponRegularAttackFrame6BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame6BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame6SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame6SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame6SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame6VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame6IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame6Stun dw ?
	Player2WeaponRegularAttackFrame6Damage dw ?
	Player2WeaponRegularAttackFrame6HitableAfterHit dw ?
	
	
;frame 7
	Player2WeaponRegularAttackFrame7FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame7Hight dw ?
	Player2WeaponRegularAttackFrame7Width dw ?
	Player2WeaponRegularAttackFrame7RelativeXPos dw ?
	Player2WeaponRegularAttackFrame7RelativeYPos dw ?
	Player2WeaponRegularAttackFrame7BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame7BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame7SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame7SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame7SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame7VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame7IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame7Stun dw ?
	Player2WeaponRegularAttackFrame7Damage dw ?
	Player2WeaponRegularAttackFrame7HitableAfterHit dw ?
	
	
;frame 8
	Player2WeaponRegularAttackFrame8FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame8Hight dw ?
	Player2WeaponRegularAttackFrame8Width dw ?
	Player2WeaponRegularAttackFrame8RelativeXPos dw ?
	Player2WeaponRegularAttackFrame8RelativeYPos dw ?
	Player2WeaponRegularAttackFrame8BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame8BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame8SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame8SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame8SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame8VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame8IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame8Stun dw ?
	Player2WeaponRegularAttackFrame8Damage dw ?
	Player2WeaponRegularAttackFrame8HitableAfterHit dw ?
	
	
;frame 9
	Player2WeaponRegularAttackFrame9FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame9Hight dw ?
	Player2WeaponRegularAttackFrame9Width dw ?
	Player2WeaponRegularAttackFrame9RelativeXPos dw ?
	Player2WeaponRegularAttackFrame9RelativeYPos dw ?
	Player2WeaponRegularAttackFrame9BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame9BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame9SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame9SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame9SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame9VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame9IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame9Stun dw ?
	Player2WeaponRegularAttackFrame9Damage dw ?
	Player2WeaponRegularAttackFrame9HitableAfterHit dw ?
	
	
	
;frame 10
	Player2WeaponRegularAttackFrame10FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame10Hight dw ?
	Player2WeaponRegularAttackFrame10Width dw ?
	Player2WeaponRegularAttackFrame10RelativeXPos dw ?
	Player2WeaponRegularAttackFrame10RelativeYPos dw ?
	Player2WeaponRegularAttackFrame10BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame10BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame10SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame10SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame10SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame10VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame10IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame10Stun dw ?
	Player2WeaponRegularAttackFrame10Damage dw ?
	Player2WeaponRegularAttackFrame10HitableAfterHit dw ?
	
	
;frame 11
	Player2WeaponRegularAttackFrame11FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame11Hight dw ?
	Player2WeaponRegularAttackFrame11Width dw ?
	Player2WeaponRegularAttackFrame11RelativeXPos dw ?
	Player2WeaponRegularAttackFrame11RelativeYPos dw ?
	Player2WeaponRegularAttackFrame11BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame11BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame11SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame11SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame11SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame11VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame11IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame11Stun dw ?
	Player2WeaponRegularAttackFrame11Damage dw ?
	Player2WeaponRegularAttackFrame11HitableAfterHit dw ?
	
	
;frame 12
	Player2WeaponRegularAttackFrame12FileName db FILE_NAME_LEN dup (?)
	Player2WeaponRegularAttackFrame12Hight dw ?
	Player2WeaponRegularAttackFrame12Width dw ?
	Player2WeaponRegularAttackFrame12RelativeXPos dw ?
	Player2WeaponRegularAttackFrame12RelativeYPos dw ?
	Player2WeaponRegularAttackFrame12BaseVelocityX dw ?
	Player2WeaponRegularAttackFrame12BaseVelocityY dw ?
	Player2WeaponRegularAttackFrame12SelfInflictedVelocityX dw ?
	Player2WeaponRegularAttackFrame12SelfInflictedVelocityY dw ?
	Player2WeaponRegularAttackFrame12SelfVelocityReset dw ?
	Player2WeaponRegularAttackFrame12VelocityScaleParameterSmall dw ?
	Player2WeaponRegularAttackFrame12IsOnlyAnimation dw ?
		  
	Player2WeaponRegularAttackFrame12Stun dw ?
	Player2WeaponRegularAttackFrame12Damage dw ?
	Player2WeaponRegularAttackFrame12HitableAfterHit dw ?
	
	
	
	NumberOfFramesInRegularAttackP2 dw ?
	LagOfRegularAttackP2 dw ?
	NumberOfFramesInRunP2 dw ?
	
	
	HorizontalStageSpeedP2 dw ?
	MaxHorizontalStageSpeedP2 dw ?
	StageFrictionRateDividerMaxP2 dw ?
	StageMomentumShiftDividerP2 dw ?
	
	HorizontalAirSpeedP2 dw ?
	MaxHorizontalAirSpeedP2 dw ?
	AirFrictionRateDividerMaxP2 dw ?
	AirMomentumShiftDividerP2 dw ?
	
	HitFrictionRateDividerMaxXP2 dw ?
	HitFrictionRateDividerMaxYP2 dw ?
	
	GravityAccelerationP2 dw ?
	GravityMaxSpeedP2 dw ?
	
	JumpSquatMaxP2 dw ?
	ShortStageJumpPowerP2 dw ?
	HighStageJumpPowerP2 dw ?
	AirJumpPowerP2 dw ?
	
	TimeBetweenJumpsMaxP2 dw ?
	MaxNumberOfJumpsP2 dw ?
	
	WeightP2 dw ?
Player2End =$
	
	
	
	;Player2 bitmaps
	;stand
	Player2StandFrameBitMap db 25*15 dup (?)
	Player2WeaponStandFrameBitMap db 25*15 dup (?)
		  
	;run  
	Player2RunFrame1BitMap db 25*15 dup (?)
	Player2RunFrame2BitMap db 25*15 dup (?)
	Player2RunFrame3BitMap db 25*15 dup (?)
		  
	Player2WeaponRunFrame1BitMap db 25*15 dup (?)
	Player2WeaponRunFrame2BitMap db 25*15 dup (?)
	Player2WeaponRunFrame3BitMap db 25*15 dup (?)
		  
	;air  
	Player2AirFrameBitMap db 25*15 dup (?)
		  
	Player2WeaponAirFrameBitMap db 25*15 dup (?)
		  
	;hit  
	Player2HitFrameBitMap db 25*15 dup (?)
		  
	Player2WeaponHitFrameBitMap db 25*15 dup (?)
	
	;regular attack
	Player2RegularAttackFrame1BitMap db 25*15 dup (?)
	Player2RegularAttackFrame2BitMap db 25*15 dup (?)
	Player2RegularAttackFrame3BitMap db 25*15 dup (?)
	Player2RegularAttackFrame4BitMap db 25*15 dup (?)
	Player2RegularAttackFrame5BitMap db 25*15 dup (?)
	Player2RegularAttackFrame6BitMap db 25*15 dup (?)
	Player2RegularAttackFrame7BitMap db 25*15 dup (?)
	Player2RegularAttackFrame8BitMap db 25*15 dup (?)
	Player2RegularAttackFrame9BitMap db 25*15 dup (?)
	Player2RegularAttackFrame10BitMap db 25*15 dup (?)
	Player2RegularAttackFrame11BitMap db 25*15 dup (?)
	Player2RegularAttackFrame12BitMap db 25*15 dup (?)
		  
	Player2WeaponRegularAttackFrame1BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame2BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame3BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame4BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame5BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame6BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame7BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame8BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame9BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame10BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame11BitMap db 25*15 dup (?)
	Player2WeaponRegularAttackFrame12BitMap db 25*15 dup (?)
	
	
	
	;PLAYER 2 VARIABLES
	
	
	LivesLeftP2 dw ?
	PrevLivesLeftP2 dw ?
	DamageTakenP2 dw ?
	PrevDamageTakenP2 dw ?
	
	IsAttackingP2 dw ?
	InitiatingJumpP2 dw ? ;0 is no jump, 1 is on stage jump
	JumpSquatCounterP2 dw ?
	
	TimeBetweenJumpsCounterP2 dw ?
	
	NumberOfJumpsLeftP2 dw ?
	
	StageFrictionRateDividerCounterP2 dw ?
	
	AirFrictionRateDividerCounterP2 dw ?
	
	HitFrictionRateDividerCounterXP2 dw ?
	HitFrictionRateDividerCounterYP2 dw ?
	
	DirectionFacingP2 dw ?
	PrevDirectionFacingP2 dw ?
	
	MovementDirectionP2 dw ?
	
	IsHitableP2 dw ?
	
	RegularAttackCanHitP2 dw ?
	
	RegularAttackFrameP2 dw ?
	PrevRegularAttackFrameP2 dw ?
	
	RunFrameP2 dw ?
	PrevRunFrameP2 dw ?
	
	PrevFrameP2 dw ?;1-stand   2-run   3-air   4-hit   5-regular attack
	CurrentFrameP2 dw ?
	
	StunedAmountP2 dw ?
	LagAmountP2 dw ?
	InTumbleP2 dw ?
	
	NeedDrawP2 dw ?
	
	NeedStageFixP2 dw ?
	StageFixXP2 dw ?
	StageFixYP2 dw ?
	StageFixHightP2 dw ?
	StageFixWidthP2 dw ?
	
	
	PositionXP2 dw ?
	PositionYP2 dw ?
	
	PrevPositionXP2 dw ?
	PrevPositionYP2 dw ?
	
	PositionVectorXP2 dw ?;first 6 bits are for sub pixles, one pixle is 64
	PositionVectorYP2 dw ?
	
	TempPrevPositionVectorXP2 dw ?
	TempPrevPositionVectorYP2 dw ?
	
	
	
	VelocityVectorXP2 dw ?;first 6 bits are for sub pixles, one pixle is 64
	VelocityVectorYP2 dw ?
	
	CharacterP2 dw ?
	Player2IconFileName db FILE_NAME_LEN dup (?)
	;end of player 2 variables
	
	
	
	
	
	
CODESEG
    ORG 100h
start:
	 
	  
	  mov ax,@data
	  mov ds,ax
	  
	  call SetGraphic
	  call setKeyboradInterrupt
	  
	  call FullPaletteSetUp
	  call StageBitmapSetUp
	  mov [StagePositionX],110
	  mov [StagePositionY],110
	  call SetUpAllAllBattleStatsBitmaps
	  call ChooseGnomeP1
	  call ChooseHammerP2
SelectionScreen:
	  call ResetKeys
	  
	  call RenderEmptySelectScreen;draw screen
	  call ShowMouse;show mouse
UpdateCharacters:
	  call HideMouse;hide so mouse won't disturb screen rendering
	  call RenderPlayer1IconSelectionScreen;render player1 character choice
	  call RenderPlayer2IconSelectionScreen;render plyaer2 character choice
	  call ShowMouse;reactivate mouse
WaitForClick:
	  push ax
	  call MouseClickCheck;check for clicks and button clicks
	  pop ax
	  cmp ax,2
	  je UpdateCharacters
	  cmp ax,1
	  je EndOfSelectionScreen
	  cmp [Esckey],1
	  je EXIT
	  jmp WaitForClick
	  
	  
EndOfSelectionScreen:
	  call HideMouse
	  call EraseScreen
	  call SetPlayer1Character
	  
	  call SetPlayer2Character
	  
	  call SetPlayer1VariablesToSpawn
	  call SetPlayer2VariablesToSpawn
	  
	  call StartAllBattleStats
	  
	  mov cx,0
	  call RenderStage
main:
	  
	  call GravityWMaxSpeedP1
	  call GravityWMaxSpeedP2
	  call P1Movement
	  call P2Movement
	  
	  call UpdatePositionVectorWVelocityP1
	  call UpdatePositionVectorWVelocityP2
	  push ax
	  call StageCollisionCheckAndUpdateP1
	  pop ax
	  push ax
	  call StageCollisionCheckAndUpdateP2
	  pop ax
	  call UpdatePositionP1
	  call UpdatePositionP2
	  call HitFrictionP1
	  call HitFrictionP2
	  call UpdateStunP1
	  call UpdateStunP2
	  call UpdateTumbleP1
	  call UpdateTumbleP2
	  call DirectionFacingUpdateP1
	  call UpdateLagP1
	  call DirectionFacingUpdateP2
	  call UpdateLagP2
	  
	  push ax
	  call Player1OutOfBoundsCheck
	  pop ax
	  cmp ax,0
	  je P1AfterOutOfBounds
	  call SetPlayer1VariablesToRespawn
P1AfterOutOfBounds:
	  push ax
	  call Player2OutOfBoundsCheck
	  pop ax
	  cmp ax,0
	  je P2AfterOutOfBounds
	  call SetPlayer2VariablesToRespawn
P2AfterOutOfBounds:
	  call Player1RegularAttack
	  call Player2RegularAttack
	  call Player1ChooseFrame
	  call Player2ChooseFrame
	  call Player1NeedDrawUpdate
	  call Player2NeedDrawUpdate
	  call EraseAndRenderBothPlayers
	  call Player1WeaponStageFix
	  call Player2WeaponStageFix
	  call UpdatePlayer1BattleStats
	  call UpdatePlayer2BattleStats
	  call Player1UpdatePrevVariables
	  call Player2UpdatePrevVariables
	  inc cx
	  call LoopDelayQSec
	  cmp [LivesLeftP1],0
	  je Player2WinsScreen
	  cmp [LivesLeftP2],0
	  je Player1WinsScreen
	  cmp [Pkey],1
	  je PauseScreen
ContinueAfterPause:
	  jmp main
	  
PauseScreen:
	  call RenderPauseText
	  call LoopDelayQSec
	  call LoopDelayQSec
	  ;call ResetKeys
	  mov [NeedDrawP1],1
	  mov [NeedDrawP2],2
	  mov [Pkey],0
NextCheck2:
	  cmp [Esckey],1
	  jne NextCheck1
	  call ErasePauseText
	  jmp DrawScreen
NextCheck1:
	  cmp [Pkey],1
	  jne NextCheck2
	  call ErasePauseText
	  mov [Pkey],0
	  jmp ContinueAfterPause
	  
DrawScreen:
	  call RenderDrawScreen
	  jmp SpaceContinueCheck
	  
Player1WinsScreen:
	  cmp [LivesLeftP1],0
	  je DrawScreen
	  call RenderPlayer1WinScreen
	  jmp SpaceContinueCheck
	  
Player2WinsScreen:
	  cmp [LivesLeftP2],0
	  je DrawScreen
	  call RenderPlayer2WinScreen
	  jmp SpaceContinueCheck
	  
SpaceContinueCheck:
	  cmp [SpaceBar],1
	  jne SpaceContinueCheck
	  jmp SelectionScreen
	  
	  
	  
EXIT:
		call restoreKeyboradInterrupt
		call ExitGraphic
	MOV AX,4C00H ; returns control to dos
    INT 21H





;START OF PLAYER 1------------------------------------------------------------------------------------------------------------------

;Input: none
;Output: none
proc SetPlayer1VariablesToRespawn
	push ax
	
	dec [LivesLeftP1]
	mov [DamageTakenP1],0
	
	mov [IsAttackingP1],0
	mov [InitiatingJumpP1],0
	mov [JumpSquatCounterP1],0
	mov [TimeBetweenJumpsCounterP1],0
	
	mov ax,[MaxNumberOfJumpsP1]
	mov [NumberOfJumpsLeftP1],ax
	mov [StageFrictionRateDividerCounterP1],0
	mov [AirFrictionRateDividerCounterP1],0
	
	
	mov [DirectionFacingP1],1
	mov [MovementDirectionP1],1
	
	mov [IsHitableP1],1
	mov [RegularAttackCanHitP1],1
	
	mov [RegularAttackFrameP1],0
	mov [CurrentFrameP1],1
	
	mov [StunedAmountP1],0
	mov [LagAmountP1],0
	mov [InTumbleP1],0
	mov [NeedDrawP1],1
	
	
	mov [PositionXP1],PLAYER1_STARTING_X_POSITION
	mov ax,[StagePositionY]
	sub ax,[Player1Hight]
	mov [PositionYP1],ax
	mov ax,PLAYER1_STARTING_X_POSITION
	sal ax,6
	mov [PositionVectorXP1],ax
	mov ax,[PositionYP1]
	sal ax,6
	mov [PositionVectorYP1],ax
	
	
	mov [VelocityVectorXP1],0
	mov [VelocityVectorYP1],0
	
	pop ax
	ret
endp SetPlayer1VariablesToRespawn


;Input: none
;Output: none
proc SetPlayer1VariablesToSpawn
	push ax
	
	mov [LivesLeftP1],PLAYER1MAXLIVES
	mov [PrevLivesLeftP1],PLAYER1MAXLIVES
	mov [DamageTakenP1],0
	mov [PrevDamageTakenP1],0
	
	mov [IsAttackingP1],0
	mov [InitiatingJumpP1],0
	mov [JumpSquatCounterP1],0
	mov [TimeBetweenJumpsCounterP1],0
	
	mov ax,[MaxNumberOfJumpsP1]
	mov [NumberOfJumpsLeftP1],ax
	mov [StageFrictionRateDividerCounterP1],0
	mov [AirFrictionRateDividerCounterP1],0
	mov [HitFrictionRateDividerCounterXP1],0
	mov [HitFrictionRateDividerCounterYP1],0
	
	mov [DirectionFacingP1],1
	mov [PrevDirectionFacingP1],1
	mov [MovementDirectionP1],1
	
	mov [IsHitableP1],1
	
	mov [RegularAttackCanHitP1],1
	
	mov [RegularAttackFrameP1],0
	mov [PrevRegularAttackFrameP1],0
	
	mov [RunFrameP1],1
	mov [PrevRunFrameP1],1
	
	
	mov [StunedAmountP1],0
	mov [LagAmountP1],0
	mov [InTumbleP1],0
	
	mov [NeedDrawP1],1
	
	mov [NeedStageFixP1],0
	mov [StageFixXP1],0
	mov [StageFixYP1],0
	mov [StageFixHightP1],0
	mov [StageFixWidthP1],0
	
	mov [CurrentFrameP1],1
	mov [PrevFrameP1],1
	
	
	mov [PositionXP1],PLAYER1_STARTING_X_POSITION
	mov [PrevPositionXP1],PLAYER1_STARTING_X_POSITION
	mov ax,[StagePositionY]
	sub ax,[Player1Hight]
	mov [PositionYP1],ax
	mov [PrevPositionYP1],ax
	mov ax,PLAYER1_STARTING_X_POSITION
	sal ax,6
	mov [PositionVectorXP1],ax
	mov [TempPrevPositionVectorXP1],ax
	mov ax,[PositionYP1]
	sal ax,6
	mov [PositionVectorYP1],ax
	mov [TempPrevPositionVectorYP1],ax
	
	
	mov [VelocityVectorXP1],0
	mov [VelocityVectorYP1],0
	
	pop ax
	ret
endp SetPlayer1VariablesToSpawn


proc ChooseHorseP1
	push ax
	
	mov ax,HORSECHARNUM
	push ax
	mov ax,offset HorseIconFileName
	push ax
	call ChooseCharacterP1
	
	pop ax
	ret
endp ChooseHorseP1


proc ChooseHammerP1
	push ax
	
	mov ax,HAMMERCHARNUM
	push ax
	mov ax,offset HammerIconFileName
	push ax
	call ChooseCharacterP1
	
	pop ax
	ret
endp ChooseHammerP1


proc ChooseGreenGnomeP1
	push ax
	
	mov ax,GREENGNOMECHARNUM
	push ax
	mov ax,offset GreenGnomeIconFileName
	push ax
	call ChooseCharacterP1
	
	pop ax
	ret
endp ChooseGreenGnomeP1


proc ChooseGnomeP1
	push ax
	
	mov ax,GNOMECHARNUM
	push ax
	mov ax,offset GnomeIconFileName
	push ax
	call ChooseCharacterP1
	
	pop ax
	ret
endp ChooseGnomeP1


;Input: character number, character icon file name offset
;Output: updates icon and character number of player1
proc ChooseCharacterP1
	push bp
	mov bp,sp
	push ax
	push si
	push di
	push cx
	push es
	
	mov cx,[bp+6]
	mov [CharacterP1],cx
	mov ax,ds
	mov es,ax
	mov cx,FILE_NAME_LEN
	mov di,offset Player1IconFileName
	mov si,[bp+4]
	rep movsb
	
	pop es
	pop cx
	pop di
	pop si
	pop ax
	pop bp
	ret 4
endp ChooseCharacterP1

proc SetPlayer1Character
	
	cmp [CharacterP1],GNOMECHARNUM
	je @@Gnome
	cmp [CharacterP1],GREENGNOMECHARNUM
	je @@GreenGnome
	cmp [CharacterP1],HAMMERCHARNUM
	je @@Hammer
	cmp [CharacterP1],HORSECHARNUM
	je @@Horse
	
@@Gnome:
	call SetPlayer1AsGnome
	jmp @@EndOfMethod
@@GreenGnome:
	call SetPlayer1AsGreenGnome
	jmp @@EndOfMethod
@@Hammer:
	call SetPlayer1AsHammer
	jmp @@EndOfMethod
@@Horse:
	call SetPlayer1AsHorse
	jmp @@EndOfMethod
@@EndOfMethod:
	
	ret
endp SetPlayer1Character







proc RenderPlayer1WinScreen
	
	call RenderPlayer1WinText
	call RenderPlayer1IconWinScreen
	call RenderSpaceConText
	
	ret
endp RenderPlayer1WinScreen





proc RenderPlayer1WinText
	push ax
	
	mov ax,offset Player1WinsTextName
	push ax
	mov ax,PLAYER1WINTEXTX
	push ax
	mov ax,PLAYER1WINTEXTY
	push ax
	mov ax,PLAYER1WINTEXTHIGHT
	push ax
	mov ax,PLAYER1WINTEXTWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderPlayer1WinText



proc RenderPlayer1IconWinScreen
	push ax
	
	mov ax,PLAYER1WINSICONX
	push ax
	mov ax,PLAYER1WINSICONY
	push ax
	call RenderPlayer1Icon
	
	pop ax
	ret
endp RenderPlayer1IconWinScreen


proc RenderPlayer1IconSelectionScreen
	push ax
	
	mov ax,PLAYER1SELECTICONX
	push ax
	mov ax,PLAYER1SELECTICONY
	push ax
	call RenderPlayer1Icon
	
	pop ax
	ret
endp RenderPlayer1IconSelectionScreen


;Input: x position, y position
;Output: none
proc RenderPlayer1Icon
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Player1IconFileName
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	pop bp
	ret 4
endp RenderPlayer1Icon



;Input: none
;Output: none
proc Player1UpdatePrevVariables
	push ax
	
	mov ax,[LivesLeftP1]
	mov [PrevLivesLeftP1],ax
	mov ax,[DamageTakenP1]
	mov [PrevDamageTakenP1],ax
	mov ax,[DirectionFacingP1]
	mov [PrevDirectionFacingP1],ax
	mov ax,[CurrentFrameP1]
	mov [PrevFrameP1],ax
	mov ax,[PositionXP1]
	mov [PrevPositionXP1],ax
	mov ax,[PositionYP1]
	mov [PrevPositionYP1],ax
	mov ax,[RunFrameP1]
	mov [PrevRunFrameP1],ax
	mov ax,[RegularAttackFrameP1]
	mov [PrevRegularAttackFrameP1],ax
	
	pop ax
	ret
endp Player1UpdatePrevVariables


;erases player1 character in prev position
;Input: none
;Output: none
proc Player1ErasePrevCharacter
	push ax
	
	mov ax,[Player1Width]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[PrevPositionXP1]
	push ax
	mov ax,[PrevPositionYP1]
	push ax
	call EraseWBlack
	
	
	pop ax
	ret
endp Player1ErasePrevCharacter


;Input: none
;Output: none
proc Player1NeedDrawUpdate
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[PrevFrameP1]
	cmp ax,[CurrentFrameP1]
	jne @@Draw
	mov ax,[PrevPositionXP1]
	cmp ax,[PositionXP1]
	jne @@Draw
	mov ax,[PrevPositionYP1]
	cmp ax,[PositionYP1]
	jne @@Draw
	mov ax,[PrevDirectionFacingP1]
	cmp ax,[DirectionFacingP1]
	jne @@Draw
	mov ax,[PrevRunFrameP1]
	cmp ax,[RunFrameP1]
	jne @@Draw
	mov ax,[PrevRegularAttackFrameP1]
	cmp ax,[RegularAttackFrameP1]
	jne @@Draw
	push ax
	call HitboxCollisionCheckPrevPlayer1WithPrevPlayer2
	pop ax
	cmp ax,0
	jne @@Draw
	cmp [PrevFrameP1],2
	je @@Player1Run
	cmp [PrevFrameP1],3
	je @@Player1Air
	cmp [PrevFrameP1],4
	je @@Player1Hit
	cmp [PrevFrameP1],5
	je @@Player1RegularAttack
@@Player1Stands:
	mov bx,[Player1WeaponStandFrameHight]
	mov dx,[Player1WeaponStandFrameWidth]
	mov cx,[Player1WeaponStandFrameRelativeXPos]
	mov si,[Player1WeaponStandFrameRelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1Run:
	cmp [PrevRunFrameP1],2
	je @@Player1RunFrame2
	cmp [PrevRunFrameP1],3
	je @@Player1RunFrame3
@@Player1RunFrame1:
	mov bx,[Player1WeaponRunFrame1Hight]
	mov dx,[Player1WeaponRunFrame1Width]
	mov cx,[Player1WeaponRunFrame1RelativeXPos]
	mov si,[Player1WeaponRunFrame1RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RunFrame2:
	mov bx,[Player1WeaponRunFrame2Hight]
	mov dx,[Player1WeaponRunFrame2Width]
	mov cx,[Player1WeaponRunFrame2RelativeXPos]
	mov si,[Player1WeaponRunFrame2RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RunFrame3:
	mov bx,[Player1WeaponRunFrame3Hight]
	mov dx,[Player1WeaponRunFrame3Width]
	mov cx,[Player1WeaponRunFrame3RelativeXPos]
	mov si,[Player1WeaponRunFrame3RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1Air:
	mov bx,[Player1WeaponAirFrameHight]
	mov dx,[Player1WeaponAirFrameWidth]
	mov cx,[Player1WeaponAirFrameRelativeXPos]
	mov si,[Player1WeaponAirFrameRelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1Hit:
	mov bx,[Player1WeaponHitFrameHight]
	mov dx,[Player1WeaponHitFrameWidth]
	mov cx,[Player1WeaponHitFrameRelativeXPos]
	mov si,[Player1WeaponHitFrameRelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttack:
	cmp [PrevRegularAttackFrameP1],2
	je @@Player1RegularAttackFrame2
	cmp [PrevRegularAttackFrameP1],3
	je @@Player1RegularAttackFrame3
	cmp [PrevRegularAttackFrameP1],4
	je @@Player1RegularAttackFrame4
	cmp [PrevRegularAttackFrameP1],5
	je @@Player1RegularAttackFrame5
	cmp [PrevRegularAttackFrameP1],6
	je @@Player1RegularAttackFrame6
	cmp [PrevRegularAttackFrameP1],7
	je @@Player1RegularAttackFrame7
	cmp [PrevRegularAttackFrameP1],8
	je @@Player1RegularAttackFrame8
	cmp [PrevRegularAttackFrameP1],9
	je @@Player1RegularAttackFrame9
	cmp [PrevRegularAttackFrameP1],10
	je @@Player1RegularAttackFrame10
	cmp [PrevRegularAttackFrameP1],11
	je @@Player1RegularAttackFrame11
	cmp [PrevRegularAttackFrameP1],12
	je @@Player1RegularAttackFrame12
@@Player1RegularAttackFrame1:
	mov bx,[Player1WeaponRegularAttackFrame1Hight]
	mov dx,[Player1WeaponRegularAttackFrame1Width]
	mov cx,[Player1WeaponRegularAttackFrame1RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame1RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame2:
	mov bx,[Player1WeaponRegularAttackFrame2Hight]
	mov dx,[Player1WeaponRegularAttackFrame2Width]
	mov cx,[Player1WeaponRegularAttackFrame2RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame2RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame3:
	mov bx,[Player1WeaponRegularAttackFrame3Hight]
	mov dx,[Player1WeaponRegularAttackFrame3Width]
	mov cx,[Player1WeaponRegularAttackFrame3RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame3RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame4:
	mov bx,[Player1WeaponRegularAttackFrame4Hight]
	mov dx,[Player1WeaponRegularAttackFrame4Width]
	mov cx,[Player1WeaponRegularAttackFrame4RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame4RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame5:
	mov bx,[Player1WeaponRegularAttackFrame5Hight]
	mov dx,[Player1WeaponRegularAttackFrame5Width]
	mov cx,[Player1WeaponRegularAttackFrame5RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame5RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame6:
	mov bx,[Player1WeaponRegularAttackFrame6Hight]
	mov dx,[Player1WeaponRegularAttackFrame6Width]
	mov cx,[Player1WeaponRegularAttackFrame6RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame6RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame7:
	mov bx,[Player1WeaponRegularAttackFrame7Hight]
	mov dx,[Player1WeaponRegularAttackFrame7Width]
	mov cx,[Player1WeaponRegularAttackFrame7RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame7RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame8:
	mov bx,[Player1WeaponRegularAttackFrame8Hight]
	mov dx,[Player1WeaponRegularAttackFrame8Width]
	mov cx,[Player1WeaponRegularAttackFrame8RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame8RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame9:
	mov bx,[Player1WeaponRegularAttackFrame9Hight]
	mov dx,[Player1WeaponRegularAttackFrame9Width]
	mov cx,[Player1WeaponRegularAttackFrame9RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame9RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame10:
	mov bx,[Player1WeaponRegularAttackFrame10Hight]
	mov dx,[Player1WeaponRegularAttackFrame10Width]
	mov cx,[Player1WeaponRegularAttackFrame10RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame10RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame11:
	mov bx,[Player1WeaponRegularAttackFrame11Hight]
	mov dx,[Player1WeaponRegularAttackFrame11Width]
	mov cx,[Player1WeaponRegularAttackFrame11RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame11RelativeYPos]
	jmp @@AfterPlayer1Frame
@@Player1RegularAttackFrame12:
	mov bx,[Player1WeaponRegularAttackFrame12Hight]
	mov dx,[Player1WeaponRegularAttackFrame12Width]
	mov cx,[Player1WeaponRegularAttackFrame12RelativeXPos]
	mov si,[Player1WeaponRegularAttackFrame12RelativeYPos]
	jmp @@AfterPlayer1Frame
@@AfterPlayer1Frame:
	push ax
	push bx
	push dx
	push cx
	push si
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[PrevFrameP2]
	cmp ax,2
	je @@RunWeaponCheck
	cmp ax,3
	je @@AirWeaponCheck
	cmp ax,4
	je @@HitWeaponCheck
	cmp ax,5
	je @@RegularAttackWeaponCheck
@@StandWeaponCheck:
	
	mov ax,[Player2WeaponStandFrameHight]
	push ax       
	mov ax,[Player2WeaponStandFrameWidth]
	push ax       
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax       
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponStandFrameHight]
	push ax       
	mov ax,[Player2WeaponStandFrameWidth]
	push ax       
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax       
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,1
	jne @@EndOfMethod
	jmp @@Draw
	
@@RunWeaponCheck:
	mov ax,[PrevRunFrameP1]
	cmp ax,2
	je @@RunFrame2WeaponCheck
	cmp ax,3
	je @@RunFrame3WeaponCheck
@@RunFrame1WeaponCheck:
	
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax       
	mov ax,[Player2WeaponRunFrame1Width]
	push ax       
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax       
	mov ax,[Player2WeaponRunFrame1Width]
	push ax       
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
@@RunFrame2WeaponCheck:
	
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax       
	mov ax,[Player2WeaponRunFrame2Width]
	push ax       
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax                      
	mov ax,[Player2WeaponRunFrame2Width]
	push ax                      
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax                      
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RunFrame3WeaponCheck:
	
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax       
	mov ax,[Player2WeaponRunFrame3Width]
	push ax       
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax                      
	mov ax,[Player2WeaponRunFrame3Width]
	push ax                      
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax                      
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@AirWeaponCheck:
	
	mov ax,[Player2WeaponAirFrameHight]
	push ax       
	mov ax,[Player2WeaponAirFrameWidth]
	push ax       
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax       
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponAirFrameHight]
	push ax       
	mov ax,[Player2WeaponAirFrameWidth]
	push ax       
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax       
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@HitWeaponCheck:
	
	mov ax,[Player2WeaponHitFrameHight]
	push ax       
	mov ax,[Player2WeaponHitFrameWidth]
	push ax       
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax       
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponHitFrameHight]
	push ax             
	mov ax,[Player2WeaponHitFrameWidth]
	push ax             
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax             
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackWeaponCheck:
	mov ax,[PrevRegularAttackFrameP2]
	cmp ax,2
	je @@RegularAttackFrame2WeaponCheck
	cmp ax,3
	je @@RegularAttackFrame3WeaponCheck
	cmp ax,4
	je @@RegularAttackFrame4WeaponCheck
	cmp ax,5
	je @@RegularAttackFrame5WeaponCheck
	cmp ax,6
	je @@RegularAttackFrame6WeaponCheck
	cmp ax,7
	je @@RegularAttackFrame7WeaponCheck
	cmp ax,8
	je @@RegularAttackFrame8WeaponCheck
	cmp ax,9
	je @@RegularAttackFrame9WeaponCheck
	cmp ax,10
	je @@RegularAttackFrame10WeaponCheck
	cmp ax,11
	je @@RegularAttackFrame11WeaponCheck
	cmp ax,12
	je @@RegularAttackFrame12WeaponCheck
@@RegularAttackFrame1WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame2WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame3WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame4WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame5WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame6WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame7WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame8WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame9WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame10WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame11WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame12WeaponCheck:
	
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax       
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@Draw:
	mov [NeedDrawP1],1
	;call ErasePlayer1
	;call RenderPlayer1
@@EndOfMethod:
	
	
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	ret 
endp Player1NeedDrawUpdate





;Erases player1 character and weapon according to the frames in data seg
;Input: none
;Output: none
proc ErasePlayer1
	push ax
	
	call Player1ErasePrevCharacter
	
	mov ax,[PrevFrameP1]
	cmp ax,2
	je @@RenderRun
	cmp ax,3
	je @@RenderAir
	cmp ax,4
	je @@RenderHit
	cmp ax,5
	je @@RenderRegularAttack
	
@@RenderStanding:
	;call Player1ErasePrevCharacter
	call Player1ErasePrevWeaponStandFrame
	jmp @@EndOfMethod
	
@@RenderRun:
	mov ax,[PrevRunFrameP1]
	cmp ax,2
	je @@RenderRunFrame2
	cmp ax,3
	je @@RenderRunFrame3
@@RenderRunFrame1:
	;call Player1ErasePrevCharacter
	call Player1ErasePrevWeaponRunFrame1
	jmp @@EndOfMethod
@@RenderRunFrame2:
	;call Player1ErasePrevCharacter
	call Player1ErasePrevWeaponRunFrame2
	jmp @@EndOfMethod
@@RenderRunFrame3:
	;call Player1ErasePrevCharacter
	call Player1ErasePrevWeaponRunFrame3
	jmp @@EndOfMethod
	
@@RenderAir:
	;call Player1RenderCharacterAirFrame
	call Player1ErasePrevWeaponAirFrame
	jmp @@EndOfMethod
	
@@RenderHit:
	;call Player1RenderCharacterHitFrame
	call Player1ErasePrevWeaponHitFrame
	jmp @@EndOfMethod
@@RenderRegularAttack:
	mov ax,[PrevRegularAttackFrameP1]
	cmp ax,2
	je @@RenderRegularAttackFrame2
	cmp ax,3
	je @@RenderRegularAttackFrame3
	cmp ax,4
	je @@RenderRegularAttackFrame4
	cmp ax,5
	je @@RenderRegularAttackFrame5
	cmp ax,6
	je @@RenderRegularAttackFrame6
	cmp ax,7
	je @@RenderRegularAttackFrame7
	cmp ax,8
	je @@RenderRegularAttackFrame8
	cmp ax,9
	je @@RenderRegularAttackFrame9
	cmp ax,10
	je @@RenderRegularAttackFrame10
	cmp ax,11
	je @@RenderRegularAttackFrame11
	cmp ax,12
	je @@RenderRegularAttackFrame12
@@RenderRegularAttackFrame1:
	;call Player1RenderCharacterRegularAttackFrame1
	call Player1ErasePrevWeaponRegularAttackFrame1
	jmp @@EndOfMethod
@@RenderRegularAttackFrame2:
	;call Player1RenderCharacterRegularAttackFrame2
	call Player1ErasePrevWeaponRegularAttackFrame2
	jmp @@EndOfMethod
@@RenderRegularAttackFrame3:
	;call Player1RenderCharacterRegularAttackFrame3
	call Player1ErasePrevWeaponRegularAttackFrame3
	jmp @@EndOfMethod
@@RenderRegularAttackFrame4:
	;call Player1RenderCharacterRegularAttackFrame4
	call Player1ErasePrevWeaponRegularAttackFrame4
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame5:
	call Player1ErasePrevWeaponRegularAttackFrame5
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame6:
	call Player1ErasePrevWeaponRegularAttackFrame6
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame7:
	call Player1ErasePrevWeaponRegularAttackFrame7
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame8:
	call Player1ErasePrevWeaponRegularAttackFrame8
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame9:
	call Player1ErasePrevWeaponRegularAttackFrame9
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame10:
	call Player1ErasePrevWeaponRegularAttackFrame10
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame11:
	call Player1ErasePrevWeaponRegularAttackFrame11
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame12:
	call Player1ErasePrevWeaponRegularAttackFrame12
	jmp @@EndOfMethod
	
@@EndOfMethod:
	
	pop ax
	ret
endp ErasePlayer1



;renders player1 character and weapon according to the frames in data seg
;Input: none
;Output: none
proc RenderPlayer1
	push ax
	
	mov ax,[CurrentFrameP1]
	cmp ax,2
	je @@RenderRun
	cmp ax,3
	je @@RenderAir
	cmp ax,4
	je @@RenderHit
	cmp ax,5
	je @@RenderRegularAttack
	
@@RenderStanding:
	call Player1RenderCharacterStandFrame
	call Player1RenderWeaponStandFrame
	jmp @@EndOfMethod
	
@@RenderRun:
	mov ax,[RunFrameP1]
	cmp ax,2
	je @@RenderRunFrame2
	cmp ax,3
	je @@RenderRunFrame3
@@RenderRunFrame1:
	call Player1RenderCharacterRunFrame1
	call Player1RenderWeaponRunFrame1
	jmp @@EndOfMethod
@@RenderRunFrame2:
	call Player1RenderCharacterRunFrame2
	call Player1RenderWeaponRunFrame2
	jmp @@EndOfMethod
@@RenderRunFrame3:
	call Player1RenderCharacterRunFrame3
	call Player1RenderWeaponRunFrame3
	jmp @@EndOfMethod
	
@@RenderAir:
	call Player1RenderCharacterAirFrame
	call Player1RenderWeaponAirFrame
	jmp @@EndOfMethod
	
@@RenderHit:
	call Player1RenderCharacterHitFrame
	call Player1RenderWeaponHitFrame
	jmp @@EndOfMethod
@@RenderRegularAttack:
	mov ax,[RegularAttackFrameP1]
	cmp ax,2
	je @@RenderRegularAttackFrame2
	cmp ax,3
	je @@RenderRegularAttackFrame3
	cmp ax,4
	je @@RenderRegularAttackFrame4
	cmp ax,5
	je @@RenderRegularAttackFrame5
	cmp ax,6
	je @@RenderRegularAttackFrame6
	cmp ax,7
	je @@RenderRegularAttackFrame7
	cmp ax,8
	je @@RenderRegularAttackFrame8
	cmp ax,9
	je @@RenderRegularAttackFrame9
	cmp ax,10
	je @@RenderRegularAttackFrame10
	cmp ax,11
	je @@RenderRegularAttackFrame11
	cmp ax,12
	je @@RenderRegularAttackFrame12
@@RenderRegularAttackFrame1:
	call Player1RenderCharacterRegularAttackFrame1
	call Player1RenderWeaponRegularAttackFrame1
	jmp @@EndOfMethod
@@RenderRegularAttackFrame2:
	call Player1RenderCharacterRegularAttackFrame2
	call Player1RenderWeaponRegularAttackFrame2
	jmp @@EndOfMethod
@@RenderRegularAttackFrame3:
	call Player1RenderCharacterRegularAttackFrame3
	call Player1RenderWeaponRegularAttackFrame3
	jmp @@EndOfMethod
@@RenderRegularAttackFrame4:
	call Player1RenderCharacterRegularAttackFrame4
	call Player1RenderWeaponRegularAttackFrame4
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame5:
	call Player1RenderCharacterRegularAttackFrame5
	call Player1RenderWeaponRegularAttackFrame5
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame6:
	call Player1RenderCharacterRegularAttackFrame6
	call Player1RenderWeaponRegularAttackFrame6
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame7:
	call Player1RenderCharacterRegularAttackFrame7
	call Player1RenderWeaponRegularAttackFrame7
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame8:
	call Player1RenderCharacterRegularAttackFrame8
	call Player1RenderWeaponRegularAttackFrame8
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame9:
	call Player1RenderCharacterRegularAttackFrame9
	call Player1RenderWeaponRegularAttackFrame9
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame10:
	call Player1RenderCharacterRegularAttackFrame10
	call Player1RenderWeaponRegularAttackFrame10
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame11:
	call Player1RenderCharacterRegularAttackFrame11
	call Player1RenderWeaponRegularAttackFrame11
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame12:
	call Player1RenderCharacterRegularAttackFrame12
	call Player1RenderWeaponRegularAttackFrame12
	jmp @@EndOfMethod
	
@@EndOfMethod:
	
	pop ax
	ret
endp RenderPlayer1


;Input: none
;Output: none
proc Player1ChooseFrame
	push ax
	
	
	cmp [StunedAmountP1],0
	jne @@Hit
	cmp [InTumbleP1],0
	jne @@Hit
	cmp [IsAttackingP1],0
	jne @@RegularAttacking
	push ax
	call OnStageCheckP1
	pop ax
	cmp ax,0
	je @@Air
	cmp [VelocityVectorXP1],16
	ja @@Run
	cmp [VelocityVectorXP1],-16
	ja @@Run
@@Stand:
	mov [RunFrameP1],1
	mov [IsAttackingP1],0
	mov [RegularAttackFrameP1],0
	mov [RegularAttackCanHitP1],1
	mov [CurrentFrameP1],1
	
	jmp @@EndOfMethod
@@Run:
	mov [RegularAttackFrameP1],0
	mov [IsAttackingP1],0
	mov [RegularAttackCanHitP1],1
	mov [CurrentFrameP1],2
	mov ax,[RunFrameP1]
	cmp ax,[NumberOfFramesInRunP1]
	je @@ResetRun
	inc [RunFrameP1]
	jmp @@EndOfRun
@@ResetRun:
	mov [RunFrameP1],1
@@EndOfRun:
	jmp @@EndOfMethod
@@Air:
	mov [RunFrameP1],1
	mov [IsAttackingP1],0
	mov [RegularAttackFrameP1],0
	mov [RegularAttackCanHitP1],1
	mov [CurrentFrameP1],3
	
	jmp @@EndOfMethod
@@Hit:
	mov [RunFrameP1],1
	mov [IsAttackingP1],0
	mov [RegularAttackFrameP1],0
	mov [RegularAttackCanHitP1],1
	mov [CurrentFrameP1],4
	jmp @@EndOfMethod
@@RegularAttacking:
	mov [RunFrameP1],1
	mov [CurrentFrameP1],5
	
@@EndOfMethod:
	
	pop ax
	ret
endp Player1ChooseFrame



;Input: none
;Output: none
proc Player1RegularAttack
	push ax
	
	mov ax,[LagAmountP1]
	cmp ax,0
	jne @@NotAttacking
	mov ax,[StunedAmountP1]
	cmp ax,0
	jne @@NotAttacking
	mov ax,[RegularAttackFrameP1]
	cmp ax,1
	jae @@NextAttackFrame
	mov al,[Fkey]
	cmp ax,0
	je @@EndOfMethod
	mov [InTumbleP1],0
	mov [RegularAttackFrameP1],0
@@NextAttackFrame:
	mov [IsAttackingP1],1
	mov ax,[RegularAttackFrameP1]
	inc ax
	mov [RegularAttackFrameP1],ax
	cmp ax,[NumberOfFramesInRegularAttackP1]
	ja @@DoneAttacking
	
	;check which frame is currently and call the correct Player1AttacksPlayer2RegularAttack
	cmp ax,2
	je @@RegularAttackFrame2
	cmp ax,3
	je @@RegularAttackFrame3
	cmp ax,4
	je @@RegularAttackFrame4
	cmp ax,5
	je @@RegularAttackFrame5
	cmp ax,6
	je @@RegularAttackFrame6
	cmp ax,7
	je @@RegularAttackFrame7
	cmp ax,8
	je @@RegularAttackFrame8
	cmp ax,9
	je @@RegularAttackFrame9
	cmp ax,10
	je @@RegularAttackFrame10
	cmp ax,11
	je @@RegularAttackFrame11
	cmp ax,12
	je @@RegularAttackFrame12
	
@@RegularAttackFrame1:
	call Player1AttacksPlayer2RegularAttackFrame1
	jmp @@EndOfMethod
@@RegularAttackFrame2:
	call Player1AttacksPlayer2RegularAttackFrame2
	jmp @@EndOfMethod
@@RegularAttackFrame3:
	call Player1AttacksPlayer2RegularAttackFrame3
	jmp @@EndOfMethod
@@RegularAttackFrame4:
	call Player1AttacksPlayer2RegularAttackFrame4
	jmp @@EndOfMethod
@@RegularAttackFrame5:
	call Player1AttacksPlayer2RegularAttackFrame5
	jmp @@EndOfMethod
@@RegularAttackFrame6:
	call Player1AttacksPlayer2RegularAttackFrame6
	jmp @@EndOfMethod
@@RegularAttackFrame7:
	call Player1AttacksPlayer2RegularAttackFrame7
	jmp @@EndOfMethod
@@RegularAttackFrame8:
	call Player1AttacksPlayer2RegularAttackFrame8
	jmp @@EndOfMethod
@@RegularAttackFrame9:
	call Player1AttacksPlayer2RegularAttackFrame9
	jmp @@EndOfMethod
@@RegularAttackFrame10:
	call Player1AttacksPlayer2RegularAttackFrame10
	jmp @@EndOfMethod
@@RegularAttackFrame11:
	call Player1AttacksPlayer2RegularAttackFrame11
	jmp @@EndOfMethod
@@RegularAttackFrame12:
	call Player1AttacksPlayer2RegularAttackFrame12
	jmp @@EndOfMethod
@@DoneAttacking:
	mov [IsAttackingP1],0
	mov [RegularAttackCanHitP1],1
	mov [IsAttackingP1],0
	mov [RegularAttackFrameP1],0
	mov ax,[LagOfRegularAttackP1]
	mov [LagAmountP1],ax
	jmp @@EndOfMethod
@@NotAttacking:
	mov [RegularAttackCanHitP1],1
	mov [RegularAttackFrameP1],0
	mov [IsAttackingP1],0
@@EndOfMethod:
	
	pop ax
	ret
endp Player1RegularAttack





;Input: none
;Output: none
proc Player1AttacksPlayer2RegularAttackFrame1
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame1




proc Player1AttacksPlayer2RegularAttackFrame2
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame2




proc Player1AttacksPlayer2RegularAttackFrame3
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame3






proc Player1AttacksPlayer2RegularAttackFrame4
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame4






proc Player1AttacksPlayer2RegularAttackFrame5
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame5






proc Player1AttacksPlayer2RegularAttackFrame6
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame6





proc Player1AttacksPlayer2RegularAttackFrame7
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame7







proc Player1AttacksPlayer2RegularAttackFrame8
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame8







proc Player1AttacksPlayer2RegularAttackFrame9
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame9







proc Player1AttacksPlayer2RegularAttackFrame10
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame10







proc Player1AttacksPlayer2RegularAttackFrame11
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame11







proc Player1AttacksPlayer2RegularAttackFrame12
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP1]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12BaseVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12BaseVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12SelfInflictedVelocityX]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12SelfInflictedVelocityY]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12SelfVelocityReset]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12VelocityScaleParameterSmall]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12IsOnlyAnimation]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Stun]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Damage]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12HitableAfterHit]
	push ax
	call Player1AttacksPlayer2
	pop ax
	mov [RegularAttackCanHitP1],ax
	
	pop ax
	ret
endp Player1AttacksPlayer2RegularAttackFrame12











;Input: empty push (all of the variables are of the attack) hight, width, RelativeXPos, RelativeYPos, BaseVelocityX, BaseVelocityY, SelfInflictedVelocityX, SelfInflictedVelocityY, velocity reset, velocity scale 1, is only animation, Stun, Damage, HitableAfterHit
;Output: returns if the attack can still hit
;
;[bp+4] = if can hit after hit
;[bp+6] = Damage
;[bp+8] = Stun
;[bp+10] = is only animation
;[bp+12] = velocity scale parameter 1 ;small (Neg means sub, pos means add)
;[bp+14] = self velocity reset
;[bp+16] = SelfInflictedVelocityY
;[bp+18] = SelfInflictedVelocityX
;[bp+20] = BaseVelocityY
;[bp+22] = BaseVelocityX
;[bp+24] = RelativeYPos
;[bp+26] = RelativeXPos
;[bp+28] = Width
;[bp+30] = Hight
;[bp+32] = if attack can hit
;[bp+34] = returns if the attack can still hit after this frame
proc Player1AttacksPlayer2
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[bp+32]
	mov [word bp+34],ax
	
	cmp [word bp+14],0
	je @@AfterVelocityReset
	mov [VelocityVectorXP1],0
	mov [VelocityVectorYP1],0
@@AfterVelocityReset:
	
	mov ax,[bp+18]
	cmp [DirectionFacingP1],0
	je @@LeftFacing
	add [VelocityVectorXP1],ax
	jmp @@AfterSelfVelocityX
@@LeftFacing:
	sub [VelocityVectorXP1],ax
@@AfterSelfVelocityX:
	mov ax,[bp+16]
	add [VelocityVectorYP1],ax
	
	mov ax,[bp+32]
	cmp ax,0
	je @@CantHitAfter
	
	cmp [word bp+10],1
	je @@EndOfMethod
	
	mov ax,[IsHitableP2]
	cmp ax,0
	je @@EndOfMethod
	
	
	push ax
	push ax
	mov ax,[bp+26]
	push ax
	mov ax,[bp+24]
	push ax
	mov ax,[bp+28]
	push ax
	call Player1WeaponPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+30]
	push ax
	mov ax,[bp+28]
	push ax
	call HitboxCollisionCheckWithPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	
	mov ax,[bp+8]
	mov [StunedAmountP2],ax
	mov [InTumbleP2],1
	
	mov [VelocityVectorXP2],0
	mov [VelocityVectorYP2],0
	
	
	
	
	mov ax,[DamageTakenP2]
	;shl ax,2
	mov cx,[bp+12]
	;shl cx,2
	shr ax,cl
	;shr ax,2
	mov si,ax
	
	mov ax,[bp+22]
	;sal ax,2
	imul si
	;sar ax,2
	
	mov bx,ax
	mov dx,[bp+22]
	add bx,dx
	cmp dx,0
	jl @@XBaseVIsNeg
@@XBaseVIsPos:
	
	cmp bx,0
	jl @@XFixSize
	jmp @@XAfterSizeCheck
@@XBaseVIsNeg:
	
	cmp bx,0
	jg @@XFixSize
	jmp @@XAfterSizeCheck
@@XFixSize:
	cmp dx,0
	jl @@XMaxNeg
@@MaxPos:
	mov ax,8191
	sub ax,dx
	jmp @@XAfterSizeCheck
@@XMaxNeg:
	mov ax,-8191
	add ax,dx
@@XAfterSizeCheck:
	
	
	
	cmp [DirectionFacingP1],0
	je @@FaceingLeft
@@FaceingRight:
	mov dx,ax
	add dx,[bp+22]
	mov [VelocityVectorXP2],dx
	jmp @@AfterXVelocityCalc
@@FaceingLeft:
	mov bx,0
	sub bx,ax
	sub bx,[bp+22]
	mov [VelocityVectorXP2],bx
@@AfterXVelocityCalc:
	
	mov ax,[bp+20]
	;sal ax,2
	imul si
	;sar ax,2
	
	mov bx,ax
	mov dx,[bp+20]
	add bx,dx
	cmp dx,0
	jl @@YBaseVIsNeg
@@YBaseVIsPos:
	
	cmp bx,0
	jl @@YFixSize
	jmp @@YAfterSizeCheck
@@YBaseVIsNeg:
	
	cmp bx,0
	jg @@YFixSize
	jmp @@YAfterSizeCheck
@@YFixSize:
	cmp dx,0
	jl @@YMaxNeg
@@YMaxPos:
	mov ax,8191
	sub ax,dx
	jmp @@YAfterSizeCheck
@@YMaxNeg:
	mov ax,-8191
	add ax,dx
@@YAfterSizeCheck:
	
	mov [VelocityVectorYP2],ax
	mov bx,[bp+20]
	add [VelocityVectorYP2],bx
	
	mov bx,[VelocityVectorXP2]
	;sal bx,2
	mov dx,bx
	mov cx,[WeightP2]
	sar dx,cl
	sub bx,dx
	;sar bx,2
	mov [VelocityVectorXP2],bx
	
	mov bx,[VelocityVectorYP2]
	;sal bx,2
	mov dx,bx
	mov cx,[WeightP2]
	sar dx,cl
	sub bx,dx
	;sar bx,2
	mov [VelocityVectorYP2],bx
	
	mov ax,[bp+6]
	add [DamageTakenP2],ax
	cmp [DamageTakenP2],1000
	jb @@NotMax
	mov [DamageTakenP2],999
@@NotMax:
	
	
	mov ax,[bp+4]
	mov [bp+34],ax
	jmp @@EndOfMethod
	
	
@@CantHitAfter:
	mov [word bp+34],0
@@EndOfMethod:
	
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 30
endp Player1AttacksPlayer2







;Input: empty push for return
;Output: if out of bounds returns 1, 0 if not out of bounds
proc Player1OutOfBoundsCheck
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[Player1Hight]
	push ax
	call OutOfBoundsCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp Player1OutOfBoundsCheck

;this set all of player1's variables according to Horse character constant
;Input: none
;Output: none
proc SetPlayer1AsHorse
	push si
	
	mov si,offset HorseCharacterStart
	push si
	call SetPlayer1AsCharacter
	
	pop si
	ret
endp SetPlayer1AsHorse

;this set all of player1's variables according to Hammer character constant
;Input: none
;Output: none
proc SetPlayer1AsHammer
	push si
	
	mov si,offset HammerCharacterStart
	push si
	call SetPlayer1AsCharacter
	
	pop si
	ret
endp SetPlayer1AsHammer


;this set all of player1's variables according to GreenGnome character constant
;Input: none
;Output: none
proc SetPlayer1AsGreenGnome
	push si
	
	mov si,offset GreenGnomeCharacterStart
	push si
	call SetPlayer1AsCharacter
	
	pop si
	ret
endp SetPlayer1AsGreenGnome


;this set all of player1's variables according to gnome character constant
;Input: none
;Output: none
proc SetPlayer1AsGnome
	push si
	
	mov si,offset GnomeCharacterStart
	push si
	call SetPlayer1AsCharacter
	
	pop si
	ret
endp SetPlayer1AsGnome
	
;Input: offset of character start
;Output: sets player 1 as a specific character given in input
proc SetPlayer1AsCharacter
	push bp
	mov bp,sp
	push cx
	push di
	push si
	push es
	
	push ds
	pop es
	mov si,[bp+4]
	mov di,offset Player1Start
	mov cx,offset Player1End
	sub cx,offset Player1Start
	rep movsb
	call ReadAllBitMapsIntoPlayer1
	
	pop es
	pop si
	pop di
	pop cx
	pop bp
	ret 2
endp SetPlayer1AsCharacter
	

;Input: none
;Output: none
proc Player1RenderCharacterStandFrame
	push ax
	
	mov ax,offset Player1StandFrameBitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterStandFrame

proc Player1RenderCharacterRunFrame1
	push ax
	
	mov ax,offset Player1RunFrame1BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRunFrame1

proc Player1RenderCharacterRunFrame2
	push ax
	
	mov ax,offset Player1RunFrame2BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRunFrame2

proc Player1RenderCharacterRunFrame3
	push ax
	
	mov ax,offset Player1RunFrame3BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRunFrame3

proc Player1RenderCharacterHitFrame
	push ax
	
	mov ax,offset Player1HitFrameBitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterHitFrame

proc Player1RenderCharacterAirFrame
	push ax
	
	mov ax,offset Player1AirFrameBitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterAirFrame


proc Player1RenderCharacterRegularAttackFrame1
	push ax
	
	mov ax,offset Player1RegularAttackFrame1BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame1


proc Player1RenderCharacterRegularAttackFrame2
	push ax
	
	mov ax,offset Player1RegularAttackFrame2BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame2



proc Player1RenderCharacterRegularAttackFrame3
	push ax
	
	mov ax,offset Player1RegularAttackFrame3BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame3



proc Player1RenderCharacterRegularAttackFrame4
	push ax
	
	mov ax,offset Player1RegularAttackFrame4BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame4


proc Player1RenderCharacterRegularAttackFrame5
	push ax
	
	mov ax,offset Player1RegularAttackFrame5BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame5


proc Player1RenderCharacterRegularAttackFrame6
	push ax
	
	mov ax,offset Player1RegularAttackFrame6BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame6


proc Player1RenderCharacterRegularAttackFrame7
	push ax
	
	mov ax,offset Player1RegularAttackFrame7BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame7


proc Player1RenderCharacterRegularAttackFrame8
	push ax
	
	mov ax,offset Player1RegularAttackFrame8BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame8


proc Player1RenderCharacterRegularAttackFrame9
	push ax
	
	mov ax,offset Player1RegularAttackFrame9BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame9


proc Player1RenderCharacterRegularAttackFrame10
	push ax
	
	mov ax,offset Player1RegularAttackFrame10BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame10


proc Player1RenderCharacterRegularAttackFrame11
	push ax
	
	mov ax,offset Player1RegularAttackFrame11BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame11


proc Player1RenderCharacterRegularAttackFrame12
	push ax
	
	mov ax,offset Player1RegularAttackFrame12BitMap
	push ax
	call Player1RenderCharacterFrame
	
	pop ax
	ret
endp Player1RenderCharacterRegularAttackFrame12



;Input: empty push,Hight, Width, RelativeXPos, RelativeYPos
;Output: returns 0 if no collision, 1 if collision
;[bp+4] = RelativeYPos
;[bp+6] = RelativeXPos
;[bp+8] = Width
;[bp+10] = Hight
;[bp+12] = return value
proc Player1WeaponCollisionWithPlayer2
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player1WeaponPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	call HitboxCollisionCheckWithPlayer2
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp Player1WeaponCollisionWithPlayer2



;Input: empty push,Hight, Width, RelativeXPos, RelativeYPos
;Output: returns 0 if no collision, 1 if collision
;[bp+4] = RelativeYPos
;[bp+6] = RelativeXPos
;[bp+8] = Width
;[bp+10] = Hight
;[bp+12] = return value
proc PrevPlayer1WeaponCollisionWithPrevPlayer2
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	call HitboxCollisionCheckWithPrevPlayer2
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp PrevPlayer1WeaponCollisionWithPrevPlayer2




;renders the frame in the input with Player1 Variables
;Input: bit map offset
;Output: renders the bit map with Player 1 Variables
proc Player1RenderCharacterFrame
	push bp
	mov bp,sp
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	
	cmp [DirectionFacingP1],1
	je @@FacingRight
	call ShowBitMapInvisColorMirror
	jmp @@EndOfMethod
@@FacingRight:
	call ShowBitMapInvisColor
	
@@EndOfMethod:
	
	
	pop ax
	pop bp
	ret 2
endp Player1RenderCharacterFrame



;Input: none
;Output: none
proc Player1RenderWeaponStandFrame
	push ax
	
	mov ax,offset Player1WeaponStandFrameBitMap
	push ax
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponStandFrame



proc Player1RenderWeaponRunFrame1
	push ax
	
	mov ax,offset Player1WeaponRunFrame1BitMap
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRunFrame1



proc Player1RenderWeaponRunFrame2
	push ax
	
	mov ax,offset Player1WeaponRunFrame2BitMap
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRunFrame2


proc Player1RenderWeaponRunFrame3
	push ax
	
	mov ax,offset Player1WeaponRunFrame3BitMap
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRunFrame3


proc Player1RenderWeaponHitFrame
	push ax
	
	mov ax,offset Player1WeaponHitFrameBitMap
	push ax
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponHitFrame


proc Player1RenderWeaponAirFrame
	push ax
	
	mov ax,offset Player1WeaponAirFrameBitMap
	push ax
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponAirFrame


proc Player1RenderWeaponRegularAttackFrame1
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame1BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame1


proc Player1RenderWeaponRegularAttackFrame2
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame2BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame2


proc Player1RenderWeaponRegularAttackFrame3
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame3BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame3



proc Player1RenderWeaponRegularAttackFrame4
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame4BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame4


proc Player1RenderWeaponRegularAttackFrame5
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame5BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame5


proc Player1RenderWeaponRegularAttackFrame6
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame6BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame6


proc Player1RenderWeaponRegularAttackFrame7
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame7BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame7


proc Player1RenderWeaponRegularAttackFrame8
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame8BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame8


proc Player1RenderWeaponRegularAttackFrame9
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame9BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame9


proc Player1RenderWeaponRegularAttackFrame10
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame10BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame10


proc Player1RenderWeaponRegularAttackFrame11
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame11BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame11


proc Player1RenderWeaponRegularAttackFrame12
	push ax
	
	mov ax,offset Player1WeaponRegularAttackFrame12BitMap
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	call Player1RenderWeaponFrame
	
	pop ax
	ret
endp Player1RenderWeaponRegularAttackFrame12




;Input: bit map offset, relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders the weapon bit map given in input with the right facing relative place also given in the input
proc Player1RenderWeaponFrame
	push bp
	mov bp,sp
	sub sp,4
	push ax
	push bx
	push dx
	push cx
	push si
	push di

	mov cx,[bp+6]
	mov [bp-4],cx
	mov cx,[bp+4]
	mov [bp-2],cx
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,[bp+12]
	push ax
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player1WeaponPositionWithRelative
	pop dx
	pop bx
	mov si,dx
	mov di,bx
	
	cmp dx,0
	jge @@AfterLeftCheck
	mov ax,0
	sub ax,dx
	cmp ax,[bp+6]
	jge @@FullOutOfLeft
	mov dx,0
	sub [bp+6],ax
	jmp @@AfterLeftCheck
@@FullOutOfLeft:
	mov [word bp+6],0
@@AfterLeftCheck:
	mov ax,dx
	add ax,[bp+6]
	cmp ax,320
	jle @@AfterRightCheck
	cmp dx,320
	jge @@FullOutOfRight
	sub ax,320
	sub [bp+6],ax
	jmp @@AfterRightCheck
@@FullOutOfRight:
	mov [word bp+6],0
@@AfterRightCheck:
	cmp bx,0
	jge @@AfterTopCheck
	mov ax,0
	sub ax,bx
	cmp ax,[bp+6]
	jge @@FullOutOfTop
	mov bx,0
	sub [bp+4],ax
	jmp @@AfterTopCheck
@@FullOutOfTop:
	mov [word bp+4],0
@@AfterTopCheck:
	mov ax,bx
	add ax,[bp+4]
	cmp ax,200
	jle @@AfterBottomCheck
	cmp bx,200
	jge @@FullOutOfBottom
	sub ax,200
	sub [bp+4],ax
	jmp @@AfterBottomCheck
@@FullOutOfBottom:
	mov [word bp+4],0
@@AfterBottomCheck:
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	push dx
	push bx
	sub si,dx
	mov ax,0
	sub ax,si
	push ax
	sub di,bx
	mov ax,0
	sub ax,di
	push ax
	mov ax,[bp-4]
	push ax
	mov ax,[bp-2]
	push ax
	
	
	cmp [DirectionFacingP1],1
	je @@FacingRight
	call ShowPartialBitMapInvisColorMirror
	jmp @@EndOfMethod
@@FacingRight:
	
	call ShowPartialBitMapInvisColor
	
@@EndOfMethod:
	
	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	add sp,4
	pop bp
	ret 10
endp Player1RenderWeaponFrame


;NOT IN USE------------------------------------------------------------------------------------------------------

;Input: none
;Output: none
proc Player1EraseWeaponStandFrame
	
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponStandFrame



proc Player1EraseWeaponRunFrame1
	
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRunFrame1



proc Player1EraseWeaponRunFrame2
	
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRunFrame2



proc Player1EraseWeaponHitFrame
	
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponHitFrame



proc Player1EraseWeaponAirFrame
	
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponAirFrame



proc Player1EraseWeaponRegularAttackFrame1
	
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRegularAttackFrame1



proc Player1EraseWeaponRegularAttackFrame2
	
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRegularAttackFrame2


proc Player1EraseWeaponRegularAttackFrame3
	
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRegularAttackFrame3



proc Player1EraseWeaponRegularAttackFrame4
	
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRegularAttackFrame4



proc Player1EraseWeaponRegularAttackFrame5
	
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	call Player1EraseWeaponFrame
	
	ret
endp Player1EraseWeaponRegularAttackFrame5



;Input: relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders black on the place given in the input with taking into account the direction facing from input
proc Player1EraseWeaponFrame
	push bp
	mov bp,sp
	push ax
	push bx
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	call EraseWBlack
	
	pop bx
	pop ax
	pop bp
	ret 8
endp Player1EraseWeaponFrame
;NOT IN USE------------------------------------------------------------------------------------------------------



;Input: none
;Output: none
proc Player1ErasePrevWeaponStandFrame
	
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponStandFrame



proc Player1ErasePrevWeaponRunFrame1
	
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRunFrame1



proc Player1ErasePrevWeaponRunFrame2
	
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRunFrame2



proc Player1ErasePrevWeaponRunFrame3
	
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRunFrame3



proc Player1ErasePrevWeaponHitFrame
	
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponHitFrame



proc Player1ErasePrevWeaponAirFrame
	
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponAirFrame



proc Player1ErasePrevWeaponRegularAttackFrame1
	
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame1



proc Player1ErasePrevWeaponRegularAttackFrame2
	
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame2


proc Player1ErasePrevWeaponRegularAttackFrame3
	
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame3



proc Player1ErasePrevWeaponRegularAttackFrame4
	
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame4



proc Player1ErasePrevWeaponRegularAttackFrame5
	
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame5



proc Player1ErasePrevWeaponRegularAttackFrame6
	
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame6



proc Player1ErasePrevWeaponRegularAttackFrame7
	
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame7



proc Player1ErasePrevWeaponRegularAttackFrame8
	
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame8



proc Player1ErasePrevWeaponRegularAttackFrame9
	
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame9



proc Player1ErasePrevWeaponRegularAttackFrame10
	
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame10



proc Player1ErasePrevWeaponRegularAttackFrame11
	
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame11



proc Player1ErasePrevWeaponRegularAttackFrame12
	
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	call Player1ErasePrevWeaponFrame
	
	ret
endp Player1ErasePrevWeaponRegularAttackFrame12



;Input: relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders black on the place given in the input with taking into account the direction facing from input
proc Player1ErasePrevWeaponFrame
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop dx
	pop bx
	
	
	cmp dx,0
	jge @@AfterLeftCheck
	mov ax,0
	sub ax,dx
	cmp ax,[bp+6]
	jge @@FullOutOfLeft
	mov dx,0
	sub [bp+6],ax
	jmp @@AfterLeftCheck
@@FullOutOfLeft:
	mov [word bp+6],0
@@AfterLeftCheck:
	mov ax,dx
	add ax,[bp+6]
	cmp ax,320
	jle @@AfterRightCheck
	cmp dx,320
	jge @@FullOutOfRight
	sub ax,320
	sub [bp+6],ax
	jmp @@AfterRightCheck
@@FullOutOfRight:
	mov [word bp+6],0
@@AfterRightCheck:
	cmp bx,0
	jge @@AfterTopCheck
	mov ax,0
	sub ax,bx
	cmp ax,[bp+6]
	jge @@FullOutOfTop
	mov bx,0
	sub [bp+4],ax
	jmp @@AfterTopCheck
@@FullOutOfTop:
	mov [word bp+4],0
@@AfterTopCheck:
	mov ax,bx
	add ax,[bp+4]
	cmp ax,200
	jle @@AfterBottomCheck
	cmp bx,200
	jge @@FullOutOfBottom
	sub ax,200
	sub [bp+4],ax
	jmp @@AfterBottomCheck
@@FullOutOfBottom:
	mov [word bp+4],0
@@AfterBottomCheck:
	
	
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	push dx
	push bx
	
	
	call EraseWBlack
	
	
	pop dx
	pop bx
	pop ax
	pop bp
	ret 8
endp Player1ErasePrevWeaponFrame



;this returns the position without the sub pixels, the input is also without sub pixels
;Input: 2 empty pushes, relative x, relative y, weapon width
;Output: x position, y position
proc Player1WeaponPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[DirectionFacingP1]
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call WeaponPositionWithRelative
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+10],ax
	
	
	pop ax
	pop bp
	ret 6
endp Player1WeaponPositionWithRelative



;this returns the prev position without the sub pixels, the input is also without sub pixels
;Input: 2 empty pushes, relative x, relative y, weapon width
;Output: x position, y position
proc Player1WeaponPrevPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[PrevDirectionFacingP1]
	push ax
	mov ax,[PrevPositionXP1]
	push ax
	mov ax,[PrevPositionYP1]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call WeaponPositionWithRelative
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+10],ax
	
	
	pop ax
	pop bp
	ret 6
endp Player1WeaponPrevPositionWithRelative




;Renders black on the place of player1 character
;Input: none
;Output: none
proc Player1EraseCharacter
	push ax
	
	mov ax,[Player1Width]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	call EraseWBlack
	
	pop ax
	ret
endp Player1EraseCharacter


;reads the bit maps of the files given in player1 variables
;Input: none
;Output: none
proc ReadAllBitMapsIntoPlayer1
	push ax
	push bx
	push cx
	
	mov bx,[Player1Hight]
	push bx
	mov cx,[Player1Width]
	push cx
	mov ax,offset Player1StandFrameFileName
	push ax
	mov ax,offset Player1StandFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RunFrame1FileName
	push ax
	mov ax,offset Player1RunFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RunFrame2FileName
	push ax
	mov ax,offset Player1RunFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RunFrame3FileName
	push ax
	mov ax,offset Player1RunFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1HitFrameFileName
	push ax
	mov ax,offset Player1HitFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1AirFrameFileName
	push ax
	mov ax,offset Player1AirFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame1FileName
	push ax
	mov ax,offset Player1RegularAttackFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame2FileName
	push ax
	mov ax,offset Player1RegularAttackFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame3FileName
	push ax
	mov ax,offset Player1RegularAttackFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame4FileName
	push ax
	mov ax,offset Player1RegularAttackFrame4BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame5FileName
	push ax
	mov ax,offset Player1RegularAttackFrame5BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame6FileName
	push ax
	mov ax,offset Player1RegularAttackFrame6BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame7FileName
	push ax
	mov ax,offset Player1RegularAttackFrame7BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame8FileName
	push ax
	mov ax,offset Player1RegularAttackFrame8BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame9FileName
	push ax
	mov ax,offset Player1RegularAttackFrame9BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame10FileName
	push ax
	mov ax,offset Player1RegularAttackFrame10BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame11FileName
	push ax
	mov ax,offset Player1RegularAttackFrame11BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player1RegularAttackFrame12FileName
	push ax
	mov ax,offset Player1RegularAttackFrame12BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	mov ax,offset Player1WeaponStandFrameFileName
	push ax
	mov ax,offset Player1WeaponStandFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	mov ax,offset Player1WeaponRunFrame1FileName
	push ax
	mov ax,offset Player1WeaponRunFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	mov ax,offset Player1WeaponRunFrame2FileName
	push ax
	mov ax,offset Player1WeaponRunFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	mov ax,offset Player1WeaponRunFrame3FileName
	push ax
	mov ax,offset Player1WeaponRunFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	mov ax,offset Player1WeaponAirFrameFileName
	push ax
	mov ax,offset Player1WeaponAirFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	mov ax,offset Player1WeaponHitFrameFileName
	push ax
	mov ax,offset Player1WeaponHitFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame1FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame2FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame3FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame4FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame4BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame5FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame5BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame6FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame6BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame7FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame7BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame8FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame8BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame9FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame9BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame10FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame10BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame11FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame11BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame12FileName
	push ax
	mov ax,offset Player1WeaponRegularAttackFrame12BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	
	pop cx
	pop bx
	pop ax
	ret 
endp ReadAllBitMapsIntoPlayer1



;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPlayer1
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPlayer1

;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPrevPlayer1
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[PrevPositionXP1]
	push ax
	mov ax,[PrevPositionYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPrevPlayer1


;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPlayer1Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	cmp [CurrentFrameP1],2
	je @@RunWeapon
	cmp [CurrentFrameP1],3
	je @@AirWeapon
	cmp [CurrentFrameP1],4
	je @@HitWeapon
	cmp [CurrentFrameP1],5
	je @@RegularAttackWeapon
@@StandWeapon:
	
	push ax
	push ax
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	jmp @@CollisionCheck
@@RunWeapon:
	push ax
	push ax
	cmp [RunFrameP1],2
	je @@RunWeaponFrame2
	cmp [RunFrameP1],3
	je @@RunWeaponFrame3
	
@@RunWeaponFrame1:
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame2:
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame3:
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@AirWeapon:
	
	push ax
	push ax
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@HitWeapon:
	
	
	push ax
	push ax
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeapon:
	push ax
	push ax
	cmp [RegularAttackFrameP1],2
	je @@RegularAttackWeaponFrame2
	cmp [RegularAttackFrameP1],3
	je @@RegularAttackWeaponFrame3
	cmp [RegularAttackFrameP1],4
	je @@RegularAttackWeaponFrame4
	cmp [RegularAttackFrameP1],5
	je @@RegularAttackWeaponFrame5
	cmp [RegularAttackFrameP1],6
	je @@RegularAttackWeaponFrame6
	cmp [RegularAttackFrameP1],7
	je @@RegularAttackWeaponFrame7
	cmp [RegularAttackFrameP1],8
	je @@RegularAttackWeaponFrame8
	cmp [RegularAttackFrameP1],9
	je @@RegularAttackWeaponFrame9
	cmp [RegularAttackFrameP1],10
	je @@RegularAttackWeaponFrame10
	cmp [RegularAttackFrameP1],11
	je @@RegularAttackWeaponFrame11
	cmp [RegularAttackFrameP1],12
	je @@RegularAttackWeaponFrame12
	
@@RegularAttackWeaponFrame1:
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame2:
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame3:
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame4:
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame5:
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame6:
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame7:
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame8:
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame9:
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame10:
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame11:
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame12:
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	jmp @@CollisionCheck
	
	
@@CollisionCheck:
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPlayer1Weapon


;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPrevPlayer1Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	cmp [PrevFrameP1],2
	je @@RunWeapon
	cmp [PrevFrameP1],3
	je @@AirWeapon
	cmp [PrevFrameP1],4
	je @@HitWeapon
	cmp [PrevFrameP1],5
	je @@RegularAttackWeapon
@@StandWeapon:
	
	push ax
	push ax
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	jmp @@CollisionCheck
@@RunWeapon:
	push ax
	push ax
	cmp [PrevRunFrameP1],2
	je @@RunWeaponFrame2
	cmp [PrevRunFrameP1],3
	je @@RunWeaponFrame3
	
@@RunWeaponFrame1:
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame2:
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame3:
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@AirWeapon:
	
	push ax
	push ax
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@HitWeapon:
	
	
	push ax
	push ax
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeapon:
	push ax
	push ax
	cmp [PrevRegularAttackFrameP1],2
	je @@RegularAttackWeaponFrame2
	cmp [PrevRegularAttackFrameP1],3
	je @@RegularAttackWeaponFrame3
	cmp [PrevRegularAttackFrameP1],4
	je @@RegularAttackWeaponFrame4
	cmp [PrevRegularAttackFrameP1],5
	je @@RegularAttackWeaponFrame5
	cmp [PrevRegularAttackFrameP1],6
	je @@RegularAttackWeaponFrame6
	cmp [PrevRegularAttackFrameP1],7
	je @@RegularAttackWeaponFrame7
	cmp [PrevRegularAttackFrameP1],8
	je @@RegularAttackWeaponFrame8
	cmp [PrevRegularAttackFrameP1],9
	je @@RegularAttackWeaponFrame9
	cmp [PrevRegularAttackFrameP1],10
	je @@RegularAttackWeaponFrame10
	cmp [PrevRegularAttackFrameP1],11
	je @@RegularAttackWeaponFrame11
	cmp [PrevRegularAttackFrameP1],12
	je @@RegularAttackWeaponFrame12
	
@@RegularAttackWeaponFrame1:
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame2:
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame3:
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame4:
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame5:
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame6:
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame7:
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame8:
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame9:
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame10:
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame11:
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame12:
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	jmp @@CollisionCheck
	
	
@@CollisionCheck:
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPrevPlayer1Weapon



;Input: one empty push
;Output: 0 if no collision with stage, 1 if collided with stage
proc StageCollisionCheckAndUpdateP1
	push bp
	mov bp,sp
	push ax
	push dx
	
	mov [word bp+4],0
	push ax
	call CheckIfP1EnteredStage
	pop ax
	cmp ax,0
	je @@EndOfMethod
	mov [word bp+4],1
	push ax
	call StageEnteredDirectionP1
	pop dx
	
	
	push dx
	call PositionAfterCollisionWStageP1
	
	push dx
	call VelocityVectorsAfterStageCollisionUpdateP1
	
	
@@EndOfMethod:
	
	pop dx
	pop ax
	pop bp
	ret
endp StageCollisionCheckAndUpdateP1


;fixes the stage after it is hit
;Input: none
;Output: none
proc Player1WeaponStageFix
	push ax
	
	
	cmp [NeedStageFixP1],0
	je @@AfterStageFix
	mov ax,[StageFixXP1]
	push ax
	mov ax,[StageFixYP1]
	push ax
	mov ax,[StageFixHightP1]
	push ax
	mov ax,[StageFixWidthP1]
	push ax
	call FixStage
@@AfterStageFix:
	push ax
	push ax
	push ax
	push ax
	push ax
	mov ax,[CurrentFrameP1]
	cmp ax,2
	je @@RunFrames
	cmp ax,3
	je @@AirFrame
	cmp ax,4
	je @@HitFrame
	cmp ax,5
	je @@RegularAttackFrames
	
@@StandFrame:
	call Player1WeaponStandFrameStageIntersectionCheck
	jmp @@EndOfMethod
@@RunFrames:
	mov ax,[RunFrameP1]
	cmp ax,2
	je @@RunFrame2
	cmp ax,3
	je @@RunFrame3
	call Player1WeaponRunFrame1StageIntersectionCheck
	jmp @@EndOfRun
@@RunFrame2:
	call Player1WeaponRunFrame2StageIntersectionCheck
	jmp @@EndOfRun
@@RunFrame3:
	call Player1WeaponRunFrame3StageIntersectionCheck
	jmp @@EndOfRun
@@EndOfRun:
	jmp @@EndOfMethod
@@AirFrame:
	call Player1WeaponAirFrameStageIntersectionCheck
	jmp @@EndOfMethod	
@@HitFrame:
	call Player1WeaponHitFrameStageIntersectionCheck
	jmp @@EndOfMethod
@@RegularAttackFrames:
	mov ax,[RegularAttackFrameP1]
	cmp ax,2
	je @@RegularAttackFrame2
	cmp ax,3
	je @@RegularAttackFrame3
	cmp ax,4
	je @@RegularAttackFrame4
	cmp ax,5
	je @@RegularAttackFrame5
	cmp ax,6
	je @@RegularAttackFrame6
	cmp ax,7
	je @@RegularAttackFrame7
	cmp ax,8
	je @@RegularAttackFrame8
	cmp ax,9
	je @@RegularAttackFrame9
	cmp ax,10
	je @@RegularAttackFrame10
	cmp ax,11
	je @@RegularAttackFrame11
	cmp ax,12
	je @@RegularAttackFrame12
	call Player1WeaponRegularAttackFrame1StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame2:
	call Player1WeaponRegularAttackFrame2StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame3:
	call Player1WeaponRegularAttackFrame3StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame4:
	call Player1WeaponRegularAttackFrame4StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame5:
	call Player1WeaponRegularAttackFrame5StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame6:
	call Player1WeaponRegularAttackFrame6StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame7:
	call Player1WeaponRegularAttackFrame7StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame8:
	call Player1WeaponRegularAttackFrame8StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame9:
	call Player1WeaponRegularAttackFrame9StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame10:
	call Player1WeaponRegularAttackFrame10StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame11:
	call Player1WeaponRegularAttackFrame11StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame12:
	call Player1WeaponRegularAttackFrame12StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@EndOfRegularAttack:
@@EndOfMethod:
	pop ax
	mov [NeedStageFixP1],ax
	pop ax
	mov [StageFixXP1],ax
	pop ax
	mov [StageFixYP1],ax
	pop ax
	mov [StageFixHightP1],ax
	pop ax
	mov [StageFixWidthP1],ax
	
	
	pop ax
	ret
endp Player1WeaponStageFix



;checks if there is collision of player1 weapon stand frame with stage and returns the intersection
;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponStandFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponStandFrameHight]
	push ax
	mov ax,[Player1WeaponStandFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponStandFrameStageIntersectionCheck


;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRunFrame1StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax
	mov ax,[Player1WeaponRunFrame1Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRunFrame1StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRunFrame2StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax
	mov ax,[Player1WeaponRunFrame2Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRunFrame2StageIntersectionCheck






;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRunFrame3StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax
	mov ax,[Player1WeaponRunFrame3Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRunFrame3StageIntersectionCheck



;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponHitFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponHitFrameHight]
	push ax
	mov ax,[Player1WeaponHitFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponHitFrameStageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponAirFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponAirFrameHight]
	push ax
	mov ax,[Player1WeaponAirFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponAirFrameStageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame1StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame1StageIntersectionCheck



;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame2StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame2StageIntersectionCheck






;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame3StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame3StageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame4StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame4StageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame5StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame5StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame6StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame6StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame7StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame7StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame8StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame8StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame9StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame9StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame10StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame10StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame11StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame11StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player1WeaponRegularAttackFrame12StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	call Player1WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player1WeaponRegularAttackFrame12StageIntersectionCheck







;Input:one empty push for return value
;Output: 0 if no, 1 if yes
proc CheckIfP1EnteredStage
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionVectorXP1]
	push ax
	mov ax,[PositionVectorYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	
	push ax
	call CheckIfEnteredStage
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp CheckIfP1EnteredStage






;returns the direction player1 entered the stage
;Input: empty push for return
;Output: 0 if did not enter, 1 for the left side of the stage, 2 for the upper side, 3 for the right side , 4 for the lower side
proc StageEnteredDirectionP1
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[TempPrevPositionVectorXP1]
	push ax
	mov ax,[TempPrevPositionVectorYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	call StageEnteredDirection
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp StageEnteredDirectionP1




;
;Input: stage side entered
;Output: Updates the position of player 1 after collision with stage
proc PositionAfterCollisionWStageP1
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[TempPrevPositionVectorXP1]
	push ax
	mov ax,[TempPrevPositionVectorYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[VelocityVectorXP1]
	push ax
	mov ax,[VelocityVectorYP1]
	push ax
	mov ax,[bp+4]
	push ax
	call PositionAfterCollisionWStage
	pop ax
	mov [PositionVectorXP1],ax
	pop ax
	mov [PositionVectorYP1],ax
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 2
endp PositionAfterCollisionWStageP1



;Works with VelocityVectorsDAfterStageCollisionUpdate
;Input: stage side entered
;Output: Updates the velocity vectors of player 1
proc VelocityVectorsAfterStageCollisionUpdateP1
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+4]
	shr ax,1
	jc @@HorizontalMovement
	
@@VerticalMovement:
	mov bx,1
	;mov dx,[PositionVectorYP1]
	;sub dx,[TempPrevPositionVectorYP1]
	;sub [VelocityVectorYP1],dx
	mov ax,[VelocityVectorYP1]
	push ax
	jmp @@AfterDirectionCheck
@@HorizontalMovement:
	mov bx,2
	mov dx,[PositionVectorXP1]
	sub dx,[TempPrevPositionVectorXP1]
	sub [VelocityVectorXP1],dx
	mov ax,[VelocityVectorXP1]
	push ax
@@AfterDirectionCheck:
	mov ax,[StunedAmountP1]
	push ax
	mov ax,[InTumbleP1]
	push ax
	call VelocityVectorsDAfterStageCollisionUpdate
	pop ax
	cmp bx,1
	je @@VerticalUpdate
@@HorizontalUpdate:
	mov [VelocityVectorXP1],ax
	jmp @@EndOfMethod
@@VerticalUpdate:
	mov [VelocityVectorYP1],ax
@@EndOfMethod:
	
	pop bx
	pop ax
	pop bp
	ret 2
endp VelocityVectorsAfterStageCollisionUpdateP1





;Input: one empty push
;Output: returns if player1 is on the stage, 0 means not on stage and 1 means is on stage
proc OnStageCheckP1
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionVectorXP1]
	push ax
	mov ax,[PositionVectorYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	call OnStageCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp OnStageCheckP1


;updates the stun variable of player1 
;Input: none
;Output: none
proc UpdateStunP1
	
	cmp [StunedAmountP1],0
	je @@EndOfMethod
	dec [StunedAmountP1]
@@EndOfMethod:
	
	ret
endp UpdateStunP1


;this is the friction that is applied when player1 is hit and is in stun
;Input: none
;Output: none
proc HitFrictionP1
	push ax
	cmp [StunedAmountP1],0
	je @@AfterFrictionXCheck
	inc [HitFrictionRateDividerCounterXP1]
	mov ax,[HitFrictionRateDividerMaxXP1]
	cmp [HitFrictionRateDividerCounterXP1],ax
	jne @@AfterFrictionXCheck
	mov [HitFrictionRateDividerCounterXP1],0
	sar [VelocityVectorXP1],1
	cmp [VelocityVectorXP1],-1
	jne @@AfterFrictionXCheck
	mov [VelocityVectorXP1],0
@@AfterFrictionXCheck:
	cmp [StunedAmountP1],0
	je @@AfterFrictionYCheck
	inc [HitFrictionRateDividerCounterYP1]
	mov ax,[HitFrictionRateDividerMaxYP1]
	cmp [HitFrictionRateDividerCounterYP1],ax
	jne @@AfterFrictionYCheck
	mov [HitFrictionRateDividerCounterYP1],0
	sar [VelocityVectorYP1],1
	cmp [VelocityVectorYP1],-1
	jne @@AfterFrictionYCheck
	mov [VelocityVectorYP1],0
@@AfterFrictionYCheck:
	pop ax
	ret
endp HitFrictionP1



;this is the friction that is applied to player1 when on stage and is not in stun
;Input: none
;Output: updates velocity vectors of player 1 according to stage friction
proc StageFrictionP1
	push ax
	inc [StageFrictionRateDividerCounterP1]
	mov ax,[StageFrictionRateDividerMaxP1]
	cmp [StageFrictionRateDividerCounterP1],ax
	jne @@AfterFrictionCheck
	mov [StageFrictionRateDividerCounterP1],0
	sar [VelocityVectorXP1],1
	cmp [VelocityVectorXP1],-1
	jne @@AfterFrictionCheck
	mov [VelocityVectorXP1],0
@@AfterFrictionCheck:
	pop ax
	ret
endp StageFrictionP1


;this is the friction that is applied to player1 when he is in the air and is not in stun
;Input: none
;Output: updates velocity vectors of player 1 according to stage friction
proc AirFrictionP1
	push ax
	inc [AirFrictionRateDividerCounterP1]
	mov ax,[AirFrictionRateDividerMaxP1]
	cmp [AirFrictionRateDividerCounterP1],ax
	jne @@AfterFrictionCheck
	mov [AirFrictionRateDividerCounterP1],0
	sar [VelocityVectorXP1],1
	cmp [VelocityVectorXP1],-1
	jne @@AfterFrictionCheck
	mov [VelocityVectorXP1],0
@@AfterFrictionCheck:
	pop ax
	ret
endp AirFrictionP1



;this makes player1 stage jump(with the short and high stage jump)
;Input: none
;Output: makes player 1 jump if he meets the criteria for stage jump, short press is a short jump and full press is a high jump
proc StageJumpP1
	push ax
	
	
	cmp [TimeBetweenJumpsCounterP1],0
	jne @@EndOfMethod
	cmp [InitiatingJumpP1],1
	jne @@CheckIfWantsToJump
	inc [JumpSquatCounterP1]
	mov ax,[JumpSquatMaxP1]
	cmp [JumpSquatCounterP1],ax
	jae @@HighJump
	
	cmp [Ckey],0
	je @@LowJump
	
@@CheckIfWantsToJump:
	cmp [Ckey],0
	je @@EndOfMethod
	mov [InitiatingJumpP1],1
	jmp @@EndOfMethod
@@HighJump:
	push ax
	mov ax,[VelocityVectorYP1]
	push ax
	mov ax,[HighStageJumpPowerP1]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP1],ax
	mov [InitiatingJumpP1],0
	inc [TimeBetweenJumpsCounterP1]
	mov [JumpSquatCounterP1],0
	jmp @@EndOfMethod
	
@@LowJump:
	push ax
	mov ax,[VelocityVectorYP1]
	push ax
	mov ax,[ShortStageJumpPowerP1]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP1],ax
	mov [InitiatingJumpP1],0
	inc [TimeBetweenJumpsCounterP1]
	mov [JumpSquatCounterP1],0
	
@@EndOfMethod:
	
	pop ax
	ret
endp StageJumpP1


;makes player1 air jump
;Input: none
;Output: makes player 1 air jump if he meets the criteria for air jump
proc AirJumpP1
	push ax
	
	cmp [TimeBetweenJumpsCounterP1],0
	jne @@EndOfMethod
@@CheckIfWantsToJump:
	cmp [Ckey],0
	je @@EndOfMethod
@@AirJump:
	push ax
	mov ax,[VelocityVectorYP1]
	push ax
	mov ax,[AirJumpPowerP1]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP1],ax
	inc [TimeBetweenJumpsCounterP1]
	dec [NumberOfJumpsLeftP1]
	
@@EndOfMethod:
	
	pop ax
	ret
endp AirJumpP1


;handles all of player1 movement(running, jumping in the air and on the stag and friction that is not hit friction)
;Input: none
;Output: updates the movement of player 1 according to the key presses and the situation
proc P1Movement
	push ax
	push bx
	push dx
	push cx
	
	mov ax,[TimeBetweenJumpsCounterP1]
	cmp ax,0
	je @@NoJumpTimer
	inc [TimeBetweenJumpsCounterP1]
	inc ax
	cmp ax,[TimeBetweenJumpsMaxP1]
	jb @@NoJumpTimer
	mov [TimeBetweenJumpsCounterP1],0
@@NoJumpTimer:
	
	mov ax,[StunedAmountP1]
	cmp ax,0
	ja @@InStun
	
	mov al,[Dkey]
	mov bl,[MoveLeftPlayer1Key]
	cmp al,0
	jne @@MoveOrFriction
	cmp bl,0
	je @@Nothing
@@MoveROrL:
	mov dx,1
	jmp @@AfterLeftRightCheck
@@MoveOrFriction:
	cmp bl,0
	je @@MoveROrL
	mov dx,2
	jmp @@AfterLeftRightCheck
@@Nothing:
	mov dx,0
@@AfterLeftRightCheck:


	push ax
	call OnStageCheckP1
	pop ax
	cmp ax,0
	je @@OffStage
@@OnStage:
	mov ax,[MaxNumberOfJumpsP1]
	mov [NumberOfJumpsLeftP1],ax
	
	cmp dx,0
	je @@StageFriction
	cmp dx,2
	je @@AfterStageFriction



	mov al,[Dkey]
	cmp al,0
	je @@AfterStageRightMovement
	mov ax,[VelocityVectorXP1]
	cmp ax,0
	jge @@AfterStageMomentumShiftRight
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP1]
	mov cx,[StageMomentumShiftDividerP1]
	sar ax,cl
	sub [VelocityVectorXP1],ax
@@AfterStageMomentumShiftRight:
	mov ax,[VelocityVectorXP1]
	cmp ax,[MaxHorizontalStageSpeedP1]
	jg @@AfterStageRightMovement
	mov ax,[HorizontalStageSpeedP1]
	add [VelocityVectorXP1],ax
	mov [MovementDirectionP1],1
	mov [InTumbleP1],0
	jmp @@AfterStageFriction
@@AfterStageRightMovement:
	
	mov al,[MoveLeftPlayer1Key]
	cmp al,0
	je @@AfterStageFriction
	mov ax,[VelocityVectorXP1]
	cmp ax,0
	jle @@AfterStageMomentumShiftLeft
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP1]
	mov cx,[StageMomentumShiftDividerP1]
	sar ax,cl
	sub [VelocityVectorXP1],ax
@@AfterStageMomentumShiftLeft:
	mov ax,[VelocityVectorXP1]
	mov bx,1
	sub bx,[MaxHorizontalStageSpeedP1]
	cmp ax,bx
	jl @@AfterStageFriction
	mov ax,[HorizontalStageSpeedP1]
	sub [VelocityVectorXP1],ax
	mov [MovementDirectionP1],0
	mov [InTumbleP1],0
	jmp @@AfterStageFriction
@@StageFriction:
	call StageFrictionP1
@@AfterStageFriction:
	call StageJumpP1
@@AfterStageJump:
	
	jmp @@EndOfMethod
@@OffStage:
	mov [JumpSquatCounterP1],0
	mov [InitiatingJumpP1],0
	
	cmp dx,0
	je @@AirFriction
	cmp dx,2
	je @@AfterAirFriction
	
	mov al,[Dkey]
	cmp al,0
	je @@AfterAirRightMovement
	mov ax,[VelocityVectorXP1]
	cmp ax,0
	jge @@AfterAirMomentumShiftRight
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP1]
	mov cx,[StageMomentumShiftDividerP1]
	sar ax,cl
	sub [VelocityVectorXP1],ax
@@AfterAirMomentumShiftRight:
	mov ax,[VelocityVectorXP1]
	cmp ax,[MaxHorizontalAirSpeedP1]
	jg @@AfterAirRightMovement
	mov ax,[HorizontalAirSpeedP1]
	add [VelocityVectorXP1],ax
	mov [MovementDirectionP1],1
	mov [InTumbleP1],0
	jmp @@AfterAirFriction
@@AfterAirRightMovement:
	
	mov al,[MoveLeftPlayer1Key]
	cmp al,0
	je @@AfterAirFriction
	mov ax,[VelocityVectorXP1]
	cmp ax,0
	jle @@AfterAirMomentumShiftLeft
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP1]
	mov cx,[StageMomentumShiftDividerP1]
	sar ax,cl
	sub [VelocityVectorXP1],ax
@@AfterAirMomentumShiftLeft:
	mov ax,[VelocityVectorXP1]
	mov bx,1
	sub bx,[MaxHorizontalAirSpeedP1]
	cmp ax,bx
	jl @@AfterAirFriction
	mov ax,[HorizontalAirSpeedP1]
	sub [VelocityVectorXP1],ax
	mov [MovementDirectionP1],0
	mov [InTumbleP1],0
	jmp @@AfterAirFriction
@@AirFriction:
	call AirFrictionP1
@@AfterAirFriction:
	cmp [NumberOfJumpsLeftP1],0
	je @@AfterAirJump
	call AirJumpP1

@@AfterAirJump:
	jmp @@EndOfMethod
@@InStun:
	mov [InitiatingJumpP1],0
@@EndOfMethod:
	
	pop cx
	pop dx
	pop bx
	pop ax
	ret
endp P1Movement



;Input: none
;Output: updates the velocity vectors according to the gravity
proc GravityWMaxSpeedP1
	push ax
	
	push ax
	mov ax,[VelocityVectorYP1]
	push ax
	mov ax,[GravityAccelerationP1]
	push ax
	mov ax,[GravityMaxSpeedP1]
	push ax
	call GravityWMaxSpeed
	pop ax
	mov [VelocityVectorYP1],ax
	
	pop ax
	ret
endp GravityWMaxSpeedP1
	



;Updates the precise position vectors with the velocity vectors
;Input: none
;Output: none
proc UpdatePositionVectorWVelocityP1
	push ax
	
	mov ax,[PositionVectorXP1]
	mov [TempPrevPositionVectorXP1],ax
	mov ax,[PositionVectorYP1]
	mov [TempPrevPositionVectorYP1],ax
	
	mov ax,[VelocityVectorXP1]
	add [PositionVectorXP1],ax
	mov ax,[VelocityVectorYP1]
	add [PositionVectorYP1],ax
	
	pop ax
	ret
endp UpdatePositionVectorWVelocityP1



;updates the position variable with the vector position
;Input: none
;Output: none
proc UpdatePositionP1
	push ax
	
	mov ax,[PositionVectorXP1]
	sar ax,6
	mov [PositionXP1],ax
	mov ax,[PositionVectorYP1]
	sar ax,6
	mov [PositionYP1],ax
	
	pop ax
	ret
endp UpdatePositionP1



;Updates DirectionFacingP1 variable
;Input: none
;Output: none
proc DirectionFacingUpdateP1
	push ax
	
	push ax
	mov ax,[DirectionFacingP1]
	push ax
	mov ax,[MovementDirectionP1]
	push ax
	mov ax,[IsAttackingP1]
	push ax
	call DirectionFacingUpdate
	pop ax
	mov [DirectionFacingP1],ax
	
	pop ax
	ret
endp DirectionFacingUpdateP1


;Updates lag
;Input: none
;Output: none
proc UpdateLagP1
	push ax
	
	cmp [LagAmountP1],0
	je @@EndOfMethod
	;push ax
	;call OnStageCheckP1
	;pop ax
	;cmp ax,0
	;je @@ReduceLag
	;mov [LagAmountP1],0
	;jmp @@EndOfMethod
@@ReduceLag:
	dec [LagAmountP1]
@@EndOfMethod:
	
	pop ax
	ret
endp UpdateLagP1


;updates tumble variable
;Input: none
;Output: none
proc UpdateTumbleP1
	push ax
	
	cmp [StunedAmountP1],0
	jne @@EndOfMethod
	push ax
	call OnStageCheckP1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	mov [InTumbleP1],0
	
@@EndOfMethod:
	pop ax
	ret
endp UpdateTumbleP1




;END OF PLAYER 1--------------------------------------------------------------------------------------------------------------------------------------------



;START OF PLAYER 2----------------------------------------------------------------------------------------------------------------------------------------------------------------

proc SetPlayer2VariablesToRespawn
	push ax
	
	dec [LivesLeftP2]
	mov [DamageTakenP2],0
	
	mov [IsAttackingP2],0
	mov [InitiatingJumpP2],0
	mov [JumpSquatCounterP2],0
	mov [TimeBetweenJumpsCounterP2],0
	
	mov ax,[MaxNumberOfJumpsP2]
	mov [NumberOfJumpsLeftP2],ax
	mov [StageFrictionRateDividerCounterP2],0
	mov [AirFrictionRateDividerCounterP2],0
	
	
	mov [DirectionFacingP2],0
	mov [MovementDirectionP2],0
	
	mov [IsHitableP2],1
	mov [RegularAttackCanHitP2],1
	
	mov [RegularAttackFrameP2],0
	mov [CurrentFrameP2],1
	
	mov [StunedAmountP2],0
	mov [LagAmountP2],0
	mov [InTumbleP2],0
	mov [NeedDrawP2],1
	
	
	mov [PositionXP2],PLAYER2_STARTING_X_POSITION
	mov ax,[StagePositionY]
	sub ax,[Player2Hight]
	mov [PositionYP2],ax
	mov ax,PLAYER2_STARTING_X_POSITION
	sal ax,6
	mov [PositionVectorXP2],ax
	mov ax,[PositionYP2]
	sal ax,6
	mov [PositionVectorYP2],ax
	
	
	mov [VelocityVectorXP2],0
	mov [VelocityVectorYP2],0
	
	pop ax
	ret
endp SetPlayer2VariablesToRespawn


proc SetPlayer2VariablesToSpawn
	push ax
	
	mov [LivesLeftP2],PLAYER2MAXLIVES
	mov [PrevLivesLeftP2],0
	mov [DamageTakenP2],0
	mov [PrevDamageTakenP2],0
	
	mov [IsAttackingP2],0
	mov [InitiatingJumpP2],0
	mov [JumpSquatCounterP2],0
	mov [TimeBetweenJumpsCounterP2],0
	
	mov ax,[MaxNumberOfJumpsP2]
	mov [NumberOfJumpsLeftP2],ax
	mov [StageFrictionRateDividerCounterP2],0
	mov [AirFrictionRateDividerCounterP2],0
	mov [HitFrictionRateDividerCounterXP2],0
	mov [HitFrictionRateDividerCounterYP2],0
	
	mov [DirectionFacingP2],0
	mov [PrevDirectionFacingP2],0
	mov [MovementDirectionP2],0
	
	mov [IsHitableP2],1
	
	mov [RegularAttackCanHitP2],1
	
	mov [RegularAttackFrameP2],0
	mov [PrevRegularAttackFrameP2],0
	
	mov [RunFrameP2],1
	mov [PrevRunFrameP2],1
	
	mov [StunedAmountP2],0
	mov [LagAmountP2],0
	mov [InTumbleP2],0
	
	mov [NeedDrawP2],1
	
	mov [NeedStageFixP2],0
	mov [StageFixXP2],0
	mov [StageFixYP2],0
	mov [StageFixHightP2],0
	mov [StageFixWidthP2],0
	
	mov [CurrentFrameP2],1
	mov [PrevFrameP2],1
	
	
	mov [PositionXP2],PLAYER2_STARTING_X_POSITION
	mov ax,[StagePositionY]
	sub ax,[Player2Hight]
	mov [PositionYP2],ax
	mov [PrevPositionYP2],ax
	mov ax,PLAYER2_STARTING_X_POSITION
	sal ax,6
	mov [PositionVectorXP2],ax
	mov [TempPrevPositionVectorXP2],ax
	mov ax,[PositionYP2]
	sal ax,6
	mov [PositionVectorYP2],ax
	mov [TempPrevPositionVectorYP2],ax
	
	
	mov [VelocityVectorXP2],0
	mov [VelocityVectorYP2],0
	
	pop ax
	ret
endp SetPlayer2VariablesToSpawn

proc ChooseHorseP2
	push ax
	
	mov ax,HORSECHARNUM
	push ax
	mov ax,offset HorseIconFileName
	push ax
	call ChooseCharacterP2
	
	pop ax
	ret
endp ChooseHorseP2

proc ChooseHammerP2
	push ax
	
	mov ax,HAMMERCHARNUM
	push ax
	mov ax,offset HammerIconFileName
	push ax
	call ChooseCharacterP2
	
	pop ax
	ret
endp ChooseHammerP2


proc ChooseGreenGnomeP2
	push ax
	
	mov ax,GREENGNOMECHARNUM
	push ax
	mov ax,offset GreenGnomeIconFileName
	push ax
	call ChooseCharacterP2
	
	pop ax
	ret
endp ChooseGreenGnomeP2


proc ChooseGnomeP2
	push ax
	
	mov ax,GNOMECHARNUM
	push ax
	mov ax,offset GnomeIconFileName
	push ax
	call ChooseCharacterP2
	
	pop ax
	ret
endp ChooseGnomeP2



;Input: character number, character icon file name offset
;Output: updates icon and character number of player2
proc ChooseCharacterP2
	push bp
	mov bp,sp
	push ax
	push si
	push di
	push cx
	push es
	
	mov cx,[bp+6]
	mov [CharacterP2],cx
	mov cx,FILE_NAME_LEN
	mov ax,ds
	mov es,ax
	mov di,offset Player2IconFileName
	mov si,[bp+4]
	rep movsb
	
	pop es
	pop cx
	pop di
	pop si
	pop ax
	pop bp
	ret 4
endp ChooseCharacterP2


proc SetPlayer2Character
	
	cmp [CharacterP2],GNOMECHARNUM
	je @@Gnome
	cmp [CharacterP2],GREENGNOMECHARNUM
	je @@GreenGnome
	cmp [CharacterP2],HAMMERCHARNUM
	je @@Hammer
	cmp [CharacterP2],HORSECHARNUM
	je @@Horse
	
@@Gnome:
	call SetPlayer2AsGnome
	jmp @@EndOfMethod
@@GreenGnome:
	call SetPlayer2AsGreenGnome
	jmp @@EndOfMethod
@@Hammer:
	call SetPlayer2AsHammer
	jmp @@EndOfMethod
@@Horse:
	call SetPlayer2AsHorse
	jmp @@EndOfMethod
@@EndOfMethod:
	
	ret
endp SetPlayer2Character




proc RenderPlayer2WinScreen
	
	call RenderPlayer2WinText
	call RenderPlayer2IconWinScreen
	call RenderSpaceConText
	
	ret
endp RenderPlayer2WinScreen




proc RenderPlayer2WinText
	push ax
	
	mov ax,offset Player2WinsTextName
	push ax
	mov ax,PLAYER2WINTEXTX
	push ax
	mov ax,PLAYER2WINTEXTY
	push ax
	mov ax,PLAYER2WINTEXTHIGHT
	push ax
	mov ax,PLAYER2WINTEXTWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderPlayer2WinText




proc RenderPlayer2IconWinScreen
	push ax
	
	mov ax,PLAYER2WINSICONX
	push ax
	mov ax,PLAYER2WINSICONY
	push ax
	call RenderPlayer2Icon
	
	pop ax
	ret
endp RenderPlayer2IconWinScreen


proc RenderPlayer2IconSelectionScreen
	push ax
	
	mov ax,PLAYER2SELECTICONX
	push ax
	mov ax,PLAYER2SELECTICONY
	push ax
	call RenderPlayer2Icon
	
	pop ax
	ret
endp RenderPlayer2IconSelectionScreen


;Input: x position, y position
;Output: none
proc RenderPlayer2Icon
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Player2IconFileName
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	pop bp
	ret 4
endp RenderPlayer2Icon




proc Player2UpdatePrevVariables
	push ax
	
	mov ax,[LivesLeftP2]
	mov [PrevLivesLeftP2],ax
	mov ax,[DamageTakenP2]
	mov [PrevDamageTakenP2],ax
	mov ax,[DirectionFacingP2]
	mov [PrevDirectionFacingP2],ax
	mov ax,[CurrentFrameP2]
	mov [PrevFrameP2],ax
	mov ax,[PositionXP2]
	mov [PrevPositionXP2],ax
	mov ax,[PositionYP2]
	mov [PrevPositionYP2],ax
	mov ax,[RunFrameP2]
	mov [PrevRunFrameP2],ax
	mov ax,[RegularAttackFrameP2]
	mov [PrevRegularAttackFrameP2],ax
	
	pop ax
	ret
endp Player2UpdatePrevVariables


;erases player1 character in prev position
proc Player2ErasePrevCharacter
	push ax
	
	mov ax,[Player2Width]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[PrevPositionXP2]
	push ax
	mov ax,[PrevPositionYP2]
	push ax
	call EraseWBlack
	
	
	pop ax
	ret
endp Player2ErasePrevCharacter



proc Player2NeedDrawUpdate
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[PrevFrameP2]
	cmp ax,[CurrentFrameP2]
	jne @@Draw
	mov ax,[PrevPositionXP2]
	cmp ax,[PositionXP2]
	jne @@Draw
	mov ax,[PrevPositionYP2]
	cmp ax,[PositionYP2]
	jne @@Draw
	mov ax,[PrevDirectionFacingP2]
	cmp ax,[DirectionFacingP2]
	jne @@Draw
	mov ax,[PrevRunFrameP2]
	cmp ax,[RunFrameP2]
	jne @@Draw
	mov ax,[PrevRegularAttackFrameP2]
	cmp ax,[RegularAttackFrameP2]
	jne @@Draw
	push ax
	call HitboxCollisionCheckPrevPlayer1WithPrevPlayer2
	pop ax
	cmp ax,0
	jne @@Draw
	cmp [PrevFrameP2],2
	je @@Player2Run
	cmp [PrevFrameP2],3
	je @@Player2Air
	cmp [PrevFrameP2],4
	je @@Player2Hit
	cmp [PrevFrameP2],5
	je @@Player2RegularAttack
@@Player2Stands:
	mov bx,[Player2WeaponStandFrameHight]
	mov dx,[Player2WeaponStandFrameWidth]
	mov cx,[Player2WeaponStandFrameRelativeXPos]
	mov si,[Player2WeaponStandFrameRelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2Run:
	cmp [PrevRunFrameP2],2
	je @@Player2RunFrame2
	cmp [PrevRunFrameP2],3
	je @@Player2RunFrame3
@@Player2RunFrame1:
	mov bx,[Player2WeaponRunFrame1Hight]
	mov dx,[Player2WeaponRunFrame1Width]
	mov cx,[Player2WeaponRunFrame1RelativeXPos]
	mov si,[Player2WeaponRunFrame1RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RunFrame2:
	mov bx,[Player2WeaponRunFrame2Hight]
	mov dx,[Player2WeaponRunFrame2Width]
	mov cx,[Player2WeaponRunFrame2RelativeXPos]
	mov si,[Player2WeaponRunFrame2RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RunFrame3:
	mov bx,[Player2WeaponRunFrame3Hight]
	mov dx,[Player2WeaponRunFrame3Width]
	mov cx,[Player2WeaponRunFrame3RelativeXPos]
	mov si,[Player2WeaponRunFrame3RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2Air:
	mov bx,[Player2WeaponAirFrameHight]
	mov dx,[Player2WeaponAirFrameWidth]
	mov cx,[Player2WeaponAirFrameRelativeXPos]
	mov si,[Player2WeaponAirFrameRelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2Hit:
	mov bx,[Player2WeaponHitFrameHight]
	mov dx,[Player2WeaponHitFrameWidth]
	mov cx,[Player2WeaponHitFrameRelativeXPos]
	mov si,[Player2WeaponHitFrameRelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttack:
	cmp [PrevRegularAttackFrameP2],2
	je @@Player2RegularAttackFrame2
	cmp [PrevRegularAttackFrameP2],3
	je @@Player2RegularAttackFrame3
	cmp [PrevRegularAttackFrameP2],4
	je @@Player2RegularAttackFrame4
	cmp [PrevRegularAttackFrameP2],5
	je @@Player2RegularAttackFrame5
	cmp [PrevRegularAttackFrameP2],6
	je @@Player2RegularAttackFrame6
	cmp [PrevRegularAttackFrameP2],7
	je @@Player2RegularAttackFrame7
	cmp [PrevRegularAttackFrameP2],8
	je @@Player2RegularAttackFrame8
	cmp [PrevRegularAttackFrameP2],9
	je @@Player2RegularAttackFrame9
	cmp [PrevRegularAttackFrameP2],10
	je @@Player2RegularAttackFrame10
	cmp [PrevRegularAttackFrameP2],11
	je @@Player2RegularAttackFrame11
	cmp [PrevRegularAttackFrameP2],12
	je @@Player2RegularAttackFrame12
@@Player2RegularAttackFrame1:
	mov bx,[Player2WeaponRegularAttackFrame1Hight]
	mov dx,[Player2WeaponRegularAttackFrame1Width]
	mov cx,[Player2WeaponRegularAttackFrame1RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame1RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame2:
	mov bx,[Player2WeaponRegularAttackFrame2Hight]
	mov dx,[Player2WeaponRegularAttackFrame2Width]
	mov cx,[Player2WeaponRegularAttackFrame2RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame2RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame3:
	mov bx,[Player2WeaponRegularAttackFrame3Hight]
	mov dx,[Player2WeaponRegularAttackFrame3Width]
	mov cx,[Player2WeaponRegularAttackFrame3RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame3RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame4:
	mov bx,[Player2WeaponRegularAttackFrame4Hight]
	mov dx,[Player2WeaponRegularAttackFrame4Width]
	mov cx,[Player2WeaponRegularAttackFrame4RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame4RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame5:
	mov bx,[Player2WeaponRegularAttackFrame5Hight]
	mov dx,[Player2WeaponRegularAttackFrame5Width]
	mov cx,[Player2WeaponRegularAttackFrame5RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame5RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame6:
	mov bx,[Player2WeaponRegularAttackFrame6Hight]
	mov dx,[Player2WeaponRegularAttackFrame6Width]
	mov cx,[Player2WeaponRegularAttackFrame6RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame6RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame7:
	mov bx,[Player2WeaponRegularAttackFrame7Hight]
	mov dx,[Player2WeaponRegularAttackFrame7Width]
	mov cx,[Player2WeaponRegularAttackFrame7RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame7RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame8:
	mov bx,[Player2WeaponRegularAttackFrame8Hight]
	mov dx,[Player2WeaponRegularAttackFrame8Width]
	mov cx,[Player2WeaponRegularAttackFrame8RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame8RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame9:
	mov bx,[Player2WeaponRegularAttackFrame9Hight]
	mov dx,[Player2WeaponRegularAttackFrame9Width]
	mov cx,[Player2WeaponRegularAttackFrame9RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame9RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame10:
	mov bx,[Player2WeaponRegularAttackFrame10Hight]
	mov dx,[Player2WeaponRegularAttackFrame10Width]
	mov cx,[Player2WeaponRegularAttackFrame10RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame10RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame11:
	mov bx,[Player2WeaponRegularAttackFrame11Hight]
	mov dx,[Player2WeaponRegularAttackFrame11Width]
	mov cx,[Player2WeaponRegularAttackFrame11RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame11RelativeYPos]
	jmp @@AfterPlayer2Frame
@@Player2RegularAttackFrame12:
	mov bx,[Player2WeaponRegularAttackFrame12Hight]
	mov dx,[Player2WeaponRegularAttackFrame12Width]
	mov cx,[Player2WeaponRegularAttackFrame12RelativeXPos]
	mov si,[Player2WeaponRegularAttackFrame12RelativeYPos]
	jmp @@AfterPlayer2Frame
@@AfterPlayer2Frame:
	push ax
	push bx
	push dx
	push cx
	push si
	call PrevPlayer2WeaponCollisionWithPrevPlayer1
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[PrevFrameP1]
	cmp ax,2
	je @@RunWeaponCheck
	cmp ax,3
	je @@AirWeaponCheck
	cmp ax,4
	je @@HitWeaponCheck
	cmp ax,5
	je @@RegularAttackWeaponCheck
@@StandWeaponCheck:
	
	mov ax,[Player1WeaponStandFrameHight]
	push ax       
	mov ax,[Player1WeaponStandFrameWidth]
	push ax       
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax       
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponStandFrameHight]
	push ax       
	mov ax,[Player1WeaponStandFrameWidth]
	push ax       
	mov ax,[Player1WeaponStandFrameRelativeXPos]
	push ax       
	mov ax,[Player1WeaponStandFrameRelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,1
	jne @@EndOfMethod
	jmp @@Draw
	
@@RunWeaponCheck:
	mov ax,[PrevRunFrameP1]
	cmp ax,2
	je @@RunFrame2WeaponCheck
	cmp ax,3
	je @@RunFrame3WeaponCheck
@@RunFrame1WeaponCheck:
	
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax       
	mov ax,[Player1WeaponRunFrame1Width]
	push ax       
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRunFrame1Hight]
	push ax       
	mov ax,[Player1WeaponRunFrame1Width]
	push ax       
	mov ax,[Player1WeaponRunFrame1RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRunFrame1RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
@@RunFrame2WeaponCheck:
	
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax       
	mov ax,[Player1WeaponRunFrame2Width]
	push ax       
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRunFrame2Hight]
	push ax                      
	mov ax,[Player1WeaponRunFrame2Width]
	push ax                      
	mov ax,[Player1WeaponRunFrame2RelativeXPos]
	push ax                      
	mov ax,[Player1WeaponRunFrame2RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RunFrame3WeaponCheck:
	
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax       
	mov ax,[Player1WeaponRunFrame3Width]
	push ax       
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRunFrame3Hight]
	push ax                      
	mov ax,[Player1WeaponRunFrame3Width]
	push ax                      
	mov ax,[Player1WeaponRunFrame3RelativeXPos]
	push ax                      
	mov ax,[Player1WeaponRunFrame3RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@AirWeaponCheck:
	
	mov ax,[Player1WeaponAirFrameHight]
	push ax       
	mov ax,[Player1WeaponAirFrameWidth]
	push ax       
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax       
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponAirFrameHight]
	push ax       
	mov ax,[Player1WeaponAirFrameWidth]
	push ax       
	mov ax,[Player1WeaponAirFrameRelativeXPos]
	push ax       
	mov ax,[Player1WeaponAirFrameRelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@HitWeaponCheck:
	
	mov ax,[Player1WeaponHitFrameHight]
	push ax       
	mov ax,[Player1WeaponHitFrameWidth]
	push ax       
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax       
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponHitFrameHight]
	push ax             
	mov ax,[Player1WeaponHitFrameWidth]
	push ax             
	mov ax,[Player1WeaponHitFrameRelativeXPos]
	push ax             
	mov ax,[Player1WeaponHitFrameRelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackWeaponCheck:
	mov ax,[PrevRegularAttackFrameP1]
	cmp ax,2
	je @@RegularAttackFrame2WeaponCheck
	cmp ax,3
	je @@RegularAttackFrame3WeaponCheck
	cmp ax,4
	je @@RegularAttackFrame4WeaponCheck
	cmp ax,5
	je @@RegularAttackFrame5WeaponCheck
	cmp ax,6
	je @@RegularAttackFrame6WeaponCheck
	cmp ax,7
	je @@RegularAttackFrame7WeaponCheck
	cmp ax,8
	je @@RegularAttackFrame8WeaponCheck
	cmp ax,9
	je @@RegularAttackFrame9WeaponCheck
	cmp ax,10
	je @@RegularAttackFrame10WeaponCheck
	cmp ax,11
	je @@RegularAttackFrame11WeaponCheck
	cmp ax,12
	je @@RegularAttackFrame12WeaponCheck
@@RegularAttackFrame1WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame1RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame2WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame2RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame3WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player1WeaponRegularAttackFrame3RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame4WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame4Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame4RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame5WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame5Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame5RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame6WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame6Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame6RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame7WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame7Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame7RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame8WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame8Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame8RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame9WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame9Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame9RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame10WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame10Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame10RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame11WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame11Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame11RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@RegularAttackFrame12WeaponCheck:
	
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	call HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Draw
	
	push ax
	mov ax,[Player1WeaponRegularAttackFrame12Hight]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12Width]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12RelativeXPos]
	push ax       
	mov ax,[Player1WeaponRegularAttackFrame12RelativeYPos]
	push ax
	call PrevPlayer1WeaponCollisionWithPrevPlayer2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	jmp @@Draw
	
@@Draw:
	mov [NeedDrawP2],1
	;call ErasePlayer1
	;call RenderPlayer1
@@EndOfMethod:
	
	
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	ret 
endp Player2NeedDrawUpdate





;Erases player2 character and weapon according to the frames in data seg
proc ErasePlayer2
	push ax
	
	call Player2ErasePrevCharacter
	
	mov ax,[PrevFrameP2]
	cmp ax,2
	je @@RenderRun
	cmp ax,3
	je @@RenderAir
	cmp ax,4
	je @@RenderHit
	cmp ax,5
	je @@RenderRegularAttack
	
@@RenderStanding:
	call Player2ErasePrevWeaponStandFrame
	jmp @@EndOfMethod
	
@@RenderRun:
	mov ax,[PrevRunFrameP2]
	cmp ax,2
	je @@RenderRunFrame2
	cmp ax,3
	je @@RenderRunFrame3
@@RenderRunFrame1:
	call Player2ErasePrevWeaponRunFrame1
	jmp @@EndOfMethod
@@RenderRunFrame2:
	call Player2ErasePrevWeaponRunFrame2
	jmp @@EndOfMethod
@@RenderRunFrame3:
	call Player2ErasePrevWeaponRunFrame3
	jmp @@EndOfMethod
	
@@RenderAir:

	call Player2ErasePrevWeaponAirFrame
	jmp @@EndOfMethod
	
@@RenderHit:
	;call Player1RenderCharacterHitFrame
	call Player2ErasePrevWeaponHitFrame
	jmp @@EndOfMethod
@@RenderRegularAttack:
	mov ax,[PrevRegularAttackFrameP2]
	cmp ax,2
	je @@RenderRegularAttackFrame2
	cmp ax,3
	je @@RenderRegularAttackFrame3
	cmp ax,4
	je @@RenderRegularAttackFrame4
	cmp ax,5
	je @@RenderRegularAttackFrame5
	cmp ax,6
	je @@RenderRegularAttackFrame6
	cmp ax,7
	je @@RenderRegularAttackFrame7
	cmp ax,8
	je @@RenderRegularAttackFrame8
	cmp ax,9
	je @@RenderRegularAttackFrame9
	cmp ax,10
	je @@RenderRegularAttackFrame10
	cmp ax,11
	je @@RenderRegularAttackFrame11
	cmp ax,12
	je @@RenderRegularAttackFrame12
@@RenderRegularAttackFrame1:
	;call Player1RenderCharacterRegularAttackFrame1
	call Player2ErasePrevWeaponRegularAttackFrame1
	jmp @@EndOfMethod
@@RenderRegularAttackFrame2:
	;call Player1RenderCharacterRegularAttackFrame2
	call Player2ErasePrevWeaponRegularAttackFrame2
	jmp @@EndOfMethod
@@RenderRegularAttackFrame3:
	;call Player1RenderCharacterRegularAttackFrame3
	call Player2ErasePrevWeaponRegularAttackFrame3
	jmp @@EndOfMethod
@@RenderRegularAttackFrame4:
	;call Player1RenderCharacterRegularAttackFrame4
	call Player2ErasePrevWeaponRegularAttackFrame4
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame5:
	call Player2ErasePrevWeaponRegularAttackFrame5
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame6:
	call Player2ErasePrevWeaponRegularAttackFrame6
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame7:
	call Player2ErasePrevWeaponRegularAttackFrame7
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame8:
	call Player2ErasePrevWeaponRegularAttackFrame8
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame9:
	call Player2ErasePrevWeaponRegularAttackFrame9
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame10:
	call Player2ErasePrevWeaponRegularAttackFrame10
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame11:
	call Player2ErasePrevWeaponRegularAttackFrame11
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame12:
	call Player2ErasePrevWeaponRegularAttackFrame12
	jmp @@EndOfMethod
	
@@EndOfMethod:
	
	pop ax
	ret
endp ErasePlayer2



;renders player2 character and weapon according to the frames in data seg
proc RenderPlayer2
	push ax
	
	mov ax,[CurrentFrameP2]
	cmp ax,2
	je @@RenderRun
	cmp ax,3
	je @@RenderAir
	cmp ax,4
	je @@RenderHit
	cmp ax,5
	je @@RenderRegularAttack
	
@@RenderStanding:
	call Player2RenderCharacterStandFrame
	call Player2RenderWeaponStandFrame
	jmp @@EndOfMethod
	
@@RenderRun:
	mov ax,[RunFrameP2]
	cmp ax,2
	je @@RenderRunFrame2
	cmp ax,3
	je @@RenderRunFrame3
@@RenderRunFrame1:
	call Player2RenderCharacterRunFrame1
	call Player2RenderWeaponRunFrame1
	jmp @@EndOfMethod
@@RenderRunFrame2:
	call Player2RenderCharacterRunFrame2
	call Player2RenderWeaponRunFrame2
	jmp @@EndOfMethod
@@RenderRunFrame3:
	call Player2RenderCharacterRunFrame3
	call Player2RenderWeaponRunFrame3
	jmp @@EndOfMethod
	
@@RenderAir:
	call Player2RenderCharacterAirFrame
	call Player2RenderWeaponAirFrame
	jmp @@EndOfMethod
	
@@RenderHit:
	call Player2RenderCharacterHitFrame
	call Player2RenderWeaponHitFrame
	jmp @@EndOfMethod
@@RenderRegularAttack:
	mov ax,[RegularAttackFrameP2]
	cmp ax,2
	je @@RenderRegularAttackFrame2
	cmp ax,3
	je @@RenderRegularAttackFrame3
	cmp ax,4
	je @@RenderRegularAttackFrame4
	cmp ax,5
	je @@RenderRegularAttackFrame5
	cmp ax,6
	je @@RenderRegularAttackFrame6
	cmp ax,7
	je @@RenderRegularAttackFrame7
	cmp ax,8
	je @@RenderRegularAttackFrame8
	cmp ax,9
	je @@RenderRegularAttackFrame9
	cmp ax,10
	je @@RenderRegularAttackFrame10
	cmp ax,11
	je @@RenderRegularAttackFrame11
	cmp ax,12
	je @@RenderRegularAttackFrame12
@@RenderRegularAttackFrame1:
	call Player2RenderCharacterRegularAttackFrame1
	call Player2RenderWeaponRegularAttackFrame1
	jmp @@EndOfMethod
@@RenderRegularAttackFrame2:
	call Player2RenderCharacterRegularAttackFrame2
	call Player2RenderWeaponRegularAttackFrame2
	jmp @@EndOfMethod
@@RenderRegularAttackFrame3:
	call Player2RenderCharacterRegularAttackFrame3
	call Player2RenderWeaponRegularAttackFrame3
	jmp @@EndOfMethod
@@RenderRegularAttackFrame4:
	call Player2RenderCharacterRegularAttackFrame4
	call Player2RenderWeaponRegularAttackFrame4
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame5:
	call Player2RenderCharacterRegularAttackFrame5
	call Player2RenderWeaponRegularAttackFrame5
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame6:
	call Player2RenderCharacterRegularAttackFrame6
	call Player2RenderWeaponRegularAttackFrame6
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame7:
	call Player2RenderCharacterRegularAttackFrame7
	call Player2RenderWeaponRegularAttackFrame7
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame8:
	call Player2RenderCharacterRegularAttackFrame8
	call Player2RenderWeaponRegularAttackFrame8
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame9:
	call Player2RenderCharacterRegularAttackFrame9
	call Player2RenderWeaponRegularAttackFrame9
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame10:
	call Player2RenderCharacterRegularAttackFrame10
	call Player2RenderWeaponRegularAttackFrame10
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame11:
	call Player2RenderCharacterRegularAttackFrame11
	call Player2RenderWeaponRegularAttackFrame11
	jmp @@EndOfMethod
	
@@RenderRegularAttackFrame12:
	call Player2RenderCharacterRegularAttackFrame12
	call Player2RenderWeaponRegularAttackFrame12
	jmp @@EndOfMethod
	
@@EndOfMethod:
	
	pop ax
	ret
endp RenderPlayer2


proc Player2ChooseFrame
	push ax
	
	
	cmp [StunedAmountP2],0
	jne @@Hit
	cmp [InTumbleP2],0
	jne @@Hit
	cmp [IsAttackingP2],0
	jne @@RegularAttacking
	push ax
	call OnStageCheckP2
	pop ax
	cmp ax,0
	je @@Air
	cmp [VelocityVectorXP2],16
	ja @@Run
	cmp [VelocityVectorXP2],-16;run minimum
	ja @@Run
@@Stand:
	mov [RunFrameP2],1
	mov [IsAttackingP2],0
	mov [RegularAttackFrameP2],0
	mov [RegularAttackCanHitP2],1
	mov [CurrentFrameP2],1
	
	jmp @@EndOfMethod
@@Run:
	mov [RegularAttackFrameP2],0
	mov [IsAttackingP2],0
	mov [RegularAttackCanHitP2],1
	mov [CurrentFrameP2],2
	mov ax,[RunFrameP2]
	cmp ax,[NumberOfFramesInRunP2]
	je @@ResetRun
	inc [RunFrameP2]
	jmp @@EndOfRun
@@ResetRun:
	mov [RunFrameP2],1
@@EndOfRun:
	jmp @@EndOfMethod
@@Air:
	mov [RunFrameP2],1
	mov [IsAttackingP2],0
	mov [RegularAttackFrameP2],0
	mov [RegularAttackCanHitP2],1
	mov [CurrentFrameP2],3
	
	jmp @@EndOfMethod
@@Hit:
	mov [RunFrameP2],1
	mov [IsAttackingP2],0
	mov [RegularAttackFrameP2],0
	mov [RegularAttackCanHitP2],1
	mov [CurrentFrameP2],4
	jmp @@EndOfMethod
@@RegularAttacking:
	mov [RunFrameP2],1
	mov [CurrentFrameP2],5
	
@@EndOfMethod:
	
	pop ax
	ret
endp Player2ChooseFrame



proc Player2RegularAttack
	push ax
	
	mov ax,[LagAmountP2]
	cmp ax,0
	jne @@NotAttacking
	mov ax,[StunedAmountP2]
	cmp ax,0
	jne @@NotAttacking
	mov ax,[RegularAttackFrameP2]
	cmp ax,1
	jae @@NextAttackFrame
	mov al,[Player2RegularAttackKey]
	cmp ax,0
	je @@EndOfMethod
	mov [InTumbleP2],0
	mov [RegularAttackFrameP2],0
@@NextAttackFrame:
	mov [IsAttackingP2],1
	mov ax,[RegularAttackFrameP2]
	inc ax
	mov [RegularAttackFrameP2],ax
	cmp ax,[NumberOfFramesInRegularAttackP2]
	ja @@DoneAttacking
	
	;check which frame is currently and call the correct Player1AttacksPlayer2RegularAttack
	cmp ax,2
	je @@RegularAttackFrame2
	cmp ax,3
	je @@RegularAttackFrame3
	cmp ax,4
	je @@RegularAttackFrame4
	cmp ax,5
	je @@RegularAttackFrame5
	cmp ax,6
	je @@RegularAttackFrame6
	cmp ax,7
	je @@RegularAttackFrame7
	cmp ax,8
	je @@RegularAttackFrame8
	cmp ax,9
	je @@RegularAttackFrame9
	cmp ax,10
	je @@RegularAttackFrame10
	cmp ax,11
	je @@RegularAttackFrame11
	cmp ax,12
	je @@RegularAttackFrame12
	
@@RegularAttackFrame1:
	call Player2AttacksPlayer1RegularAttackFrame1
	jmp @@EndOfMethod
@@RegularAttackFrame2:
	call Player2AttacksPlayer1RegularAttackFrame2
	jmp @@EndOfMethod
@@RegularAttackFrame3:
	call Player2AttacksPlayer1RegularAttackFrame3
	jmp @@EndOfMethod
@@RegularAttackFrame4:
	call Player2AttacksPlayer1RegularAttackFrame4
	jmp @@EndOfMethod
@@RegularAttackFrame5:
	call Player2AttacksPlayer1RegularAttackFrame5
	jmp @@EndOfMethod
@@RegularAttackFrame6:
	call Player2AttacksPlayer1RegularAttackFrame6
	jmp @@EndOfMethod
@@RegularAttackFrame7:
	call Player2AttacksPlayer1RegularAttackFrame7
	jmp @@EndOfMethod
@@RegularAttackFrame8:
	call Player2AttacksPlayer1RegularAttackFrame8
	jmp @@EndOfMethod
@@RegularAttackFrame9:
	call Player2AttacksPlayer1RegularAttackFrame9
	jmp @@EndOfMethod
@@RegularAttackFrame10:
	call Player2AttacksPlayer1RegularAttackFrame10
	jmp @@EndOfMethod
@@RegularAttackFrame11:
	call Player2AttacksPlayer1RegularAttackFrame11
	jmp @@EndOfMethod
@@RegularAttackFrame12:
	call Player2AttacksPlayer1RegularAttackFrame12
	jmp @@EndOfMethod
@@DoneAttacking:
	mov [IsAttackingP2],0
	mov [RegularAttackCanHitP2],1
	mov [RegularAttackFrameP2],0
	mov [IsAttackingP2],0
	mov ax,[LagOfRegularAttackP2]
	mov [LagAmountP2],ax
	jmp @@EndOfMethod
@@NotAttacking:
	mov [RegularAttackCanHitP2],1
	mov [RegularAttackFrameP2],0
	mov [IsAttackingP2],0
@@EndOfMethod:
	
	pop ax
	ret
endp Player2RegularAttack


proc Player2AttacksPlayer1RegularAttackFrame1
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame1




proc Player2AttacksPlayer1RegularAttackFrame2
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame2




proc Player2AttacksPlayer1RegularAttackFrame3
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame3






proc Player2AttacksPlayer1RegularAttackFrame4
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame4






proc Player2AttacksPlayer1RegularAttackFrame5
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame5








proc Player2AttacksPlayer1RegularAttackFrame6
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame6








proc Player2AttacksPlayer1RegularAttackFrame7
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame7








proc Player2AttacksPlayer1RegularAttackFrame8
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame8








proc Player2AttacksPlayer1RegularAttackFrame9
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame9








proc Player2AttacksPlayer1RegularAttackFrame10
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame10








proc Player2AttacksPlayer1RegularAttackFrame11
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame11








proc Player2AttacksPlayer1RegularAttackFrame12
	push ax
	
	push ax
	mov ax,[RegularAttackCanHitP2]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12BaseVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12BaseVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12SelfInflictedVelocityX]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12SelfInflictedVelocityY]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12SelfVelocityReset]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12VelocityScaleParameterSmall]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12IsOnlyAnimation]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Stun]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Damage]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12HitableAfterHit]
	push ax
	call Player2AttacksPlayer1
	pop ax
	mov [RegularAttackCanHitP2],ax
	
	pop ax
	ret
endp Player2AttacksPlayer1RegularAttackFrame12













;Input: empty push (all of the variables are of the attack) hight, width, RelativeXPos, RelativeYPos, BaseVelocityX, BaseVelocityY, SelfInflictedVelocityX, SelfInflictedVelocityY, self velocity reset, velocity scale 1, is only animation, Stun, Damage, HitableAfterHit
;Output: returns if the attack can still hit
;
;[bp+4] = if can hit after hit
;[bp+6] = Damage
;[bp+8] = Stun
;[bp+10] = IsOnlyAnimation bool
;[bp+12] = velocity scale parameter 1 ;small (Neg means sub, pos means add)
;[bp+14] = self velocity reset
;[bp+16] = SelfInflictedVelocityY
;[bp+18] = SelfInflictedVelocityX
;[bp+20] = BaseVelocityY
;[bp+22] = BaseVelocityX
;[bp+24] = RelativeYPos
;[bp+26] = RelativeXPos
;[bp+28] = Width
;[bp+30] = Hight
;[bp+32] = if attack can hit
;[bp+34] = returns if the attack can sill hit after this frame
proc Player2AttacksPlayer1
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	
	mov ax,[bp+32]
	mov [word bp+34],ax
	
	cmp [word bp+14],0
	je @@AfterVelocityReset
	mov [VelocityVectorXP2],0
	mov [VelocityVectorYP2],0
@@AfterVelocityReset:
	
	mov ax,[bp+18]
	cmp [DirectionFacingP2],0
	je @@LeftFacing
	add [VelocityVectorXP2],ax
	jmp @@AfterSelfVelocityX
@@LeftFacing:
	sub [VelocityVectorXP2],ax
@@AfterSelfVelocityX:
	mov ax,[bp+16]
	add [VelocityVectorYP2],ax
	
	mov ax,[bp+32]
	cmp ax,0
	je @@CantHitAfter
	
	cmp [word bp+10],1
	je @@EndOfMethod
	
	mov ax,[IsHitableP1]
	cmp ax,0
	je @@EndOfMethod
	
	
	push ax
	push ax
	mov ax,[bp+26]
	push ax
	mov ax,[bp+24]
	push ax
	mov ax,[bp+28]
	push ax
	call Player2WeaponPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+30]
	push ax
	mov ax,[bp+28]
	push ax
	call HitboxCollisionCheckWithPlayer1
	pop ax
	cmp ax,0
	je @@EndOfMethod
	
	mov ax,[bp+8]
	mov [StunedAmountP1],ax
	mov [InTumbleP1],1
	
	mov [VelocityVectorXP1],0
	mov [VelocityVectorYP1],0
	
	
	
	
	mov ax,[DamageTakenP1]
	;shl ax,2
	mov cx,[bp+12]
	;shl cx,2
	shr ax,cl
	;shr ax,2
	mov si,ax
	
	mov ax,[bp+22]
	;sal ax,2
	imul si
	;sar ax,2
	
	mov bx,ax
	mov dx,[bp+22]
	add bx,dx
	cmp dx,0
	jl @@XBaseVIsNeg
@@XBaseVIsPos:
	
	cmp bx,0
	jl @@XFixSize
	jmp @@XAfterSizeCheck
@@XBaseVIsNeg:
	
	cmp bx,0
	jg @@XFixSize
	jmp @@XAfterSizeCheck
@@XFixSize:
	cmp dx,0
	jl @@XMaxNeg
@@MaxPos:
	mov ax,8191
	sub ax,dx
	jmp @@XAfterSizeCheck
@@XMaxNeg:
	mov ax,-8191
	add ax,dx
@@XAfterSizeCheck:
	
	
	
	cmp [DirectionFacingP2],0
	je @@FaceingLeft
@@FaceingRight:
	mov dx,ax
	add dx,[bp+22]
	mov [VelocityVectorXP1],dx
	jmp @@AfterXVelocityCalc
@@FaceingLeft:
	mov bx,0
	sub bx,ax
	sub bx,[bp+22]
	mov [VelocityVectorXP1],bx
@@AfterXVelocityCalc:
	
	mov ax,[bp+20]
	;sal ax,2
	imul si
	;sar ax,2
	
	mov bx,ax
	mov dx,[bp+20]
	add bx,dx
	cmp dx,0
	jl @@YBaseVIsNeg
@@YBaseVIsPos:
	
	cmp bx,0
	jl @@YFixSize
	jmp @@YAfterSizeCheck
@@YBaseVIsNeg:
	
	cmp bx,0
	jg @@YFixSize
	jmp @@YAfterSizeCheck
@@YFixSize:
	cmp dx,0
	jl @@YMaxNeg
@@YMaxPos:
	mov ax,8191
	sub ax,dx
	jmp @@YAfterSizeCheck
@@YMaxNeg:
	mov ax,-8191
	add ax,dx
@@YAfterSizeCheck:
	
	mov [VelocityVectorYP1],ax
	mov bx,[bp+20]
	add [VelocityVectorYP1],bx
	
	mov bx,[VelocityVectorXP1]
	;sal bx,2
	mov dx,bx
	mov cx,[WeightP1]
	sar dx,cl
	sub bx,dx
	;sar bx,2
	mov [VelocityVectorXP1],bx
	
	mov bx,[VelocityVectorYP1]
	;sal bx,2
	mov dx,bx
	mov cx,[WeightP1]
	sar dx,cl
	sub bx,dx
	;sar bx,2
	mov [VelocityVectorYP1],bx
	
	mov ax,[bp+6]
	add [DamageTakenP1],ax
	cmp [DamageTakenP1],1000
	jb @@NotMax
	mov [DamageTakenP1],999
@@NotMax:
	
	
	mov ax,[bp+4]
	mov [bp+34],ax
	jmp @@EndOfMethod
	
	
@@CantHitAfter:
	mov [word bp+34],0
@@EndOfMethod:
	
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 30
endp Player2AttacksPlayer1







;Input: empty push for return
;Output: 1 if out of bounds returns 1, 0 if not out of bounds
proc Player2OutOfBoundsCheck
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[Player2Hight]
	push ax
	call OutOfBoundsCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp Player2OutOfBoundsCheck

;this set all of player2's variables according to Horse character constant
;Input: none
;Output: none
proc SetPlayer2AsHorse
	push si
	
	mov si,offset HorseCharacterStart
	push si
	call SetPlayer2AsCharacter
	
	pop si
	ret
endp SetPlayer2AsHorse

;this set all of player2's variables according to Hammer character constant
proc SetPlayer2AsHammer
	push si
	
	mov si,offset HammerCharacterStart
	push si
	call SetPlayer2AsCharacter
	
	pop si
	ret
endp SetPlayer2AsHammer


;this set all of player2's variables according to Green gnome character constant
proc SetPlayer2AsGreenGnome
	push si
	
	mov si,offset GreenGnomeCharacterStart
	push si
	call SetPlayer2AsCharacter
	
	pop si
	ret
endp SetPlayer2AsGreenGnome


;this set all of player2's variables according to gnome character constant
proc SetPlayer2AsGnome
	push si
	
	mov si,offset GnomeCharacterStart
	push si
	call SetPlayer2AsCharacter
	
	pop si
	ret
endp SetPlayer2AsGnome

;Input: offset of character start
;Output: sets player 2 as a specific character given in input
proc SetPlayer2AsCharacter
	push bp
	mov bp,sp
	push cx
	push di
	push si
	push es
	
	push ds
	pop es
	mov si,[bp+4]
	mov di,offset Player2Start
	mov cx,offset Player2End
	sub cx,offset Player2Start
	rep movsb
	call ReadAllBitMapsIntoPlayer2
	
	pop es
	pop si
	pop di
	pop cx
	pop bp
	ret 2
endp SetPlayer2AsCharacter



proc Player2RenderCharacterStandFrame
	push ax
	
	mov ax,offset Player2StandFrameBitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterStandFrame

proc Player2RenderCharacterRunFrame1
	push ax
	
	mov ax,offset Player2RunFrame1BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRunFrame1

proc Player2RenderCharacterRunFrame2
	push ax
	
	mov ax,offset Player2RunFrame2BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRunFrame2

proc Player2RenderCharacterRunFrame3
	push ax
	
	mov ax,offset Player2RunFrame3BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRunFrame3

proc Player2RenderCharacterHitFrame
	push ax
	
	mov ax,offset Player2HitFrameBitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterHitFrame

proc Player2RenderCharacterAirFrame
	push ax
	
	mov ax,offset Player2AirFrameBitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterAirFrame


proc Player2RenderCharacterRegularAttackFrame1
	push ax
	
	mov ax,offset Player2RegularAttackFrame1BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame1


proc Player2RenderCharacterRegularAttackFrame2
	push ax
	
	mov ax,offset Player2RegularAttackFrame2BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame2



proc Player2RenderCharacterRegularAttackFrame3
	push ax
	
	mov ax,offset Player2RegularAttackFrame3BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame3



proc Player2RenderCharacterRegularAttackFrame4
	push ax
	
	mov ax,offset Player2RegularAttackFrame4BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame4


proc Player2RenderCharacterRegularAttackFrame5
	push ax
	
	mov ax,offset Player2RegularAttackFrame5BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame5


proc Player2RenderCharacterRegularAttackFrame6
	push ax
	
	mov ax,offset Player2RegularAttackFrame6BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame6


proc Player2RenderCharacterRegularAttackFrame7
	push ax
	
	mov ax,offset Player2RegularAttackFrame7BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame7


proc Player2RenderCharacterRegularAttackFrame8
	push ax
	
	mov ax,offset Player2RegularAttackFrame8BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame8


proc Player2RenderCharacterRegularAttackFrame9
	push ax
	
	mov ax,offset Player2RegularAttackFrame9BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame9


proc Player2RenderCharacterRegularAttackFrame10
	push ax
	
	mov ax,offset Player2RegularAttackFrame10BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame10


proc Player2RenderCharacterRegularAttackFrame11
	push ax
	
	mov ax,offset Player2RegularAttackFrame11BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame11


proc Player2RenderCharacterRegularAttackFrame12
	push ax
	
	mov ax,offset Player2RegularAttackFrame12BitMap
	push ax
	call Player2RenderCharacterFrame
	
	pop ax
	ret
endp Player2RenderCharacterRegularAttackFrame12



;Input: empty push,Hight, Width, RelativeXPos, RelativeYPos
;Output: returns 0 if no collision, 1 if collision
;[bp+4] = RelativeYPos
;[bp+6] = RelativeXPos
;[bp+8] = Width
;[bp+10] = Hight
;[bp+12] = return value
proc Player2WeaponCollisionWithPlayer1
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player2WeaponPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	call HitboxCollisionCheckWithPlayer1
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp Player2WeaponCollisionWithPlayer1




;Input: empty push,Hight, Width, RelativeXPos, RelativeYPos
;Output: returns 0 if no collision, 1 if collision
;[bp+4] = RelativeYPos
;[bp+6] = RelativeXPos
;[bp+8] = Width
;[bp+10] = Hight
;[bp+12] = return value
proc PrevPlayer2WeaponCollisionWithPrevPlayer1
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	call HitboxCollisionCheckWithPrevPlayer1
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp PrevPlayer2WeaponCollisionWithPrevPlayer1





;Input: empty push,Hight, Width, RelativeXPos, RelativeYPos
;Output: returns 0 if no collision, 1 if collision
;[bp+4] = RelativeYPos
;[bp+6] = RelativeXPos
;[bp+8] = Width
;[bp+10] = Hight
;[bp+12] = return value
proc PrevPlayer2WeaponCollisionWithPrevPlayer1Weapon
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push ax
	push bx
	push dx
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	call HitboxCollisionCheckWithPrevPlayer1Weapon
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp PrevPlayer2WeaponCollisionWithPrevPlayer1Weapon




;renders the frame in the input with Player1 Variables
;Input: bit map offset
;Output: renders the bit map with Player 1 Variables
proc Player2RenderCharacterFrame
	push bp
	mov bp,sp
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	
	cmp [DirectionFacingP2],1
	je @@FacingRight
	call ShowBitMapInvisColorMirror
	jmp @@EndOfMethod
@@FacingRight:
	call ShowBitMapInvisColor
	
@@EndOfMethod:
	
	
	pop ax
	pop bp
	ret 2
endp Player2RenderCharacterFrame



proc Player2RenderWeaponStandFrame
	push ax
	
	mov ax,offset Player2WeaponStandFrameBitMap
	push ax
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponStandFrame



proc Player2RenderWeaponRunFrame1
	push ax
	
	mov ax,offset Player2WeaponRunFrame1BitMap
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRunFrame1



proc Player2RenderWeaponRunFrame2
	push ax
	
	mov ax,offset Player2WeaponRunFrame2BitMap
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRunFrame2


proc Player2RenderWeaponRunFrame3
	push ax
	
	mov ax,offset Player2WeaponRunFrame3BitMap
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRunFrame3


proc Player2RenderWeaponHitFrame
	push ax
	
	mov ax,offset Player2WeaponHitFrameBitMap
	push ax
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponHitFrame


proc Player2RenderWeaponAirFrame
	push ax
	
	mov ax,offset Player2WeaponAirFrameBitMap
	push ax
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponAirFrame


proc Player2RenderWeaponRegularAttackFrame1
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame1BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame1


proc Player2RenderWeaponRegularAttackFrame2
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame2BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame2


proc Player2RenderWeaponRegularAttackFrame3
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame3BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame3



proc Player2RenderWeaponRegularAttackFrame4
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame4BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame4


proc Player2RenderWeaponRegularAttackFrame5
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame5BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame5


proc Player2RenderWeaponRegularAttackFrame6
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame6BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame6


proc Player2RenderWeaponRegularAttackFrame7
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame7BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame7


proc Player2RenderWeaponRegularAttackFrame8
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame8BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame8


proc Player2RenderWeaponRegularAttackFrame9
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame9BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame9


proc Player2RenderWeaponRegularAttackFrame10
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame10BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame10


proc Player2RenderWeaponRegularAttackFrame11
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame11BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame11


proc Player2RenderWeaponRegularAttackFrame12
	push ax
	
	mov ax,offset Player2WeaponRegularAttackFrame12BitMap
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	call Player2RenderWeaponFrame
	
	pop ax
	ret
endp Player2RenderWeaponRegularAttackFrame12




;Input: bit map offset, relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders the weapon bit map given in input with the right facing relative place also given in the input
proc Player2RenderWeaponFrame
	push bp
	mov bp,sp
	sub sp,4
	push ax
	push bx
	push dx
	push cx
	push si
	push di

	mov cx,[bp+6]
	mov [bp-4],cx
	mov cx,[bp+4]
	mov [bp-2],cx
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,[bp+12]
	push ax
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player2WeaponPositionWithRelative
	pop dx
	pop bx
	mov si,dx
	mov di,bx
	
	cmp dx,0
	jge @@AfterLeftCheck
	mov ax,0
	sub ax,dx
	cmp ax,[bp+6]
	jge @@FullOutOfLeft
	mov dx,0
	sub [bp+6],ax
	jmp @@AfterLeftCheck
@@FullOutOfLeft:
	mov [word bp+6],0
@@AfterLeftCheck:
	mov ax,dx
	add ax,[bp+6]
	cmp ax,320
	jle @@AfterRightCheck
	cmp dx,320
	jge @@FullOutOfRight
	sub ax,320
	sub [bp+6],ax
	jmp @@AfterRightCheck
@@FullOutOfRight:
	mov [word bp+6],0
@@AfterRightCheck:
	cmp bx,0
	jge @@AfterTopCheck
	mov ax,0
	sub ax,bx
	cmp ax,[bp+6]
	jge @@FullOutOfTop
	mov bx,0
	sub [bp+4],ax
	jmp @@AfterTopCheck
@@FullOutOfTop:
	mov [word bp+4],0
@@AfterTopCheck:
	mov ax,bx
	add ax,[bp+4]
	cmp ax,200
	jle @@AfterBottomCheck
	cmp bx,200
	jge @@FullOutOfBottom
	sub ax,200
	sub [bp+4],ax
	jmp @@AfterBottomCheck
@@FullOutOfBottom:
	mov [word bp+4],0
@@AfterBottomCheck:
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	push dx
	push bx
	sub si,dx
	mov ax,0
	sub ax,si
	push ax
	sub di,bx
	mov ax,0
	sub ax,di
	push ax
	mov ax,[bp-4]
	push ax
	mov ax,[bp-2]
	push ax
	
	
	cmp [DirectionFacingP2],1
	je @@FacingRight
	call ShowPartialBitMapInvisColorMirror
	jmp @@EndOfMethod
@@FacingRight:
	
	call ShowPartialBitMapInvisColor
	
@@EndOfMethod:
	
	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	add sp,4
	pop bp
	ret 10
endp Player2RenderWeaponFrame



proc Player2EraseWeaponStandFrame
	
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponStandFrame



proc Player2EraseWeaponRunFrame1
	
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRunFrame1



proc Player2EraseWeaponRunFrame2
	
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRunFrame2



proc Player2EraseWeaponHitFrame
	
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponHitFrame



proc Player2EraseWeaponAirFrame
	
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponAirFrame



proc Player2EraseWeaponRegularAttackFrame1
	
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRegularAttackFrame1



proc Player2EraseWeaponRegularAttackFrame2
	
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRegularAttackFrame2


proc Player2EraseWeaponRegularAttackFrame3
	
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRegularAttackFrame3



proc Player2EraseWeaponRegularAttackFrame4
	
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRegularAttackFrame4



proc Player2EraseWeaponRegularAttackFrame5
	
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	call Player2EraseWeaponFrame
	
	ret
endp Player2EraseWeaponRegularAttackFrame5



;Input: relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders black on the place given in the input with taking into account the direction facing from input
proc Player2EraseWeaponFrame
	push bp
	mov bp,sp
	push ax
	push bx
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	call EraseWBlack
	
	pop bx
	pop ax
	pop bp
	ret 8
endp Player2EraseWeaponFrame




proc Player2ErasePrevWeaponStandFrame
	
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponStandFrame



proc Player2ErasePrevWeaponRunFrame1
	
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRunFrame1



proc Player2ErasePrevWeaponRunFrame2
	
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRunFrame2



proc Player2ErasePrevWeaponRunFrame3
	
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRunFrame3



proc Player2ErasePrevWeaponHitFrame
	
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponHitFrame



proc Player2ErasePrevWeaponAirFrame
	
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponAirFrame



proc Player2ErasePrevWeaponRegularAttackFrame1
	
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame1



proc Player2ErasePrevWeaponRegularAttackFrame2
	
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame2


proc Player2ErasePrevWeaponRegularAttackFrame3
	
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame3



proc Player2ErasePrevWeaponRegularAttackFrame4
	
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame4



proc Player2ErasePrevWeaponRegularAttackFrame5
	
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame5



proc Player2ErasePrevWeaponRegularAttackFrame6
	
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame6



proc Player2ErasePrevWeaponRegularAttackFrame7
	
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame7



proc Player2ErasePrevWeaponRegularAttackFrame8
	
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame8



proc Player2ErasePrevWeaponRegularAttackFrame9
	
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame9



proc Player2ErasePrevWeaponRegularAttackFrame10
	
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame10



proc Player2ErasePrevWeaponRegularAttackFrame11
	
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame11



proc Player2ErasePrevWeaponRegularAttackFrame12
	
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	call Player2ErasePrevWeaponFrame
	
	ret
endp Player2ErasePrevWeaponRegularAttackFrame12



;Input: relative x facing right, relative y facing right, weapon width, weapon hight
;Ouput: renders black on the place given in the input with taking into account the direction facing from input
proc Player2ErasePrevWeaponFrame
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop dx
	pop bx
	
	
	cmp dx,0
	jge @@AfterLeftCheck
	mov ax,0
	sub ax,dx
	cmp ax,[bp+6]
	jge @@FullOutOfLeft
	mov dx,0
	sub [bp+6],ax
	jmp @@AfterLeftCheck
@@FullOutOfLeft:
	mov [word bp+6],0
@@AfterLeftCheck:
	mov ax,dx
	add ax,[bp+6]
	cmp ax,320
	jle @@AfterRightCheck
	cmp dx,320
	jge @@FullOutOfRight
	sub ax,320
	sub [bp+6],ax
	jmp @@AfterRightCheck
@@FullOutOfRight:
	mov [word bp+6],0
@@AfterRightCheck:
	cmp bx,0
	jge @@AfterTopCheck
	mov ax,0
	sub ax,bx
	cmp ax,[bp+6]
	jge @@FullOutOfTop
	mov bx,0
	sub [bp+4],ax
	jmp @@AfterTopCheck
@@FullOutOfTop:
	mov [word bp+4],0
@@AfterTopCheck:
	mov ax,bx
	add ax,[bp+4]
	cmp ax,200
	jle @@AfterBottomCheck
	cmp bx,200
	jge @@FullOutOfBottom
	sub ax,200
	sub [bp+4],ax
	jmp @@AfterBottomCheck
@@FullOutOfBottom:
	mov [word bp+4],0
@@AfterBottomCheck:
	
	
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	push dx
	push bx
	
	
	call EraseWBlack
	
	
	pop dx
	pop bx
	pop ax
	pop bp
	ret 8
endp Player2ErasePrevWeaponFrame



;this returns the position without the sub pixels, the input is also without sub pixels
;Input: 2 empty pushes, relative x, relative y, weapon width
;Output: x position, y position
proc Player2WeaponPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[DirectionFacingP2]
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call WeaponPositionWithRelative
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+10],ax
	
	
	pop ax
	pop bp
	ret 6
endp Player2WeaponPositionWithRelative




;this returns the position without the sub pixels, the input is also without sub pixels
;Input: 2 empty pushes, relative x, relative y, weapon width
;Output: x position, y position
proc Player2WeaponPrevPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[PrevDirectionFacingP2]
	push ax
	mov ax,[PrevPositionXP2]
	push ax
	mov ax,[PrevPositionYP2]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call WeaponPositionWithRelative
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+10],ax
	
	
	pop ax
	pop bp
	ret 6
endp Player2WeaponPrevPositionWithRelative




;this returns the prev position without the sub pixels, the input is also without sub pixels
;Input: 2 empty pushes, relative x, relative y, weapon width
;Output: x position, y position
proc Player2PrevWeaponPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[PrevDirectionFacingP2]
	push ax
	mov ax,[PrevPositionXP2]
	push ax
	mov ax,[PrevPositionYP2]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call WeaponPositionWithRelative
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+10],ax
	
	
	pop ax
	pop bp
	ret 6
endp Player2PrevWeaponPositionWithRelative





proc Player2EraseCharacter
	push ax
	
	mov ax,[Player2Width]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	call EraseWBlack
	
	pop ax
	ret
endp Player2EraseCharacter


proc ReadAllBitMapsIntoPlayer2
	push ax
	push bx
	push cx
	
	mov bx,[Player2Hight]
	push bx
	mov cx,[Player2Width]
	push cx
	mov ax,offset Player2StandFrameFileName
	push ax
	mov ax,offset Player2StandFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RunFrame1FileName
	push ax
	mov ax,offset Player2RunFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RunFrame2FileName
	push ax
	mov ax,offset Player2RunFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RunFrame3FileName
	push ax
	mov ax,offset Player2RunFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2HitFrameFileName
	push ax
	mov ax,offset Player2HitFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2AirFrameFileName
	push ax
	mov ax,offset Player2AirFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame1FileName
	push ax
	mov ax,offset Player2RegularAttackFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame2FileName
	push ax
	mov ax,offset Player2RegularAttackFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame3FileName
	push ax
	mov ax,offset Player2RegularAttackFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame4FileName
	push ax
	mov ax,offset Player2RegularAttackFrame4BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame5FileName
	push ax
	mov ax,offset Player2RegularAttackFrame5BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame6FileName
	push ax
	mov ax,offset Player2RegularAttackFrame6BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame7FileName
	push ax
	mov ax,offset Player2RegularAttackFrame7BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame8FileName
	push ax
	mov ax,offset Player2RegularAttackFrame8BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame9FileName
	push ax
	mov ax,offset Player2RegularAttackFrame9BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame10FileName
	push ax
	mov ax,offset Player2RegularAttackFrame10BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame11FileName
	push ax
	mov ax,offset Player2RegularAttackFrame11BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	push bx
	push cx
	mov ax,offset Player2RegularAttackFrame12FileName
	push ax
	mov ax,offset Player2RegularAttackFrame12BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	mov ax,offset Player2WeaponStandFrameFileName
	push ax
	mov ax,offset Player2WeaponStandFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	mov ax,offset Player2WeaponRunFrame1FileName
	push ax
	mov ax,offset Player2WeaponRunFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	mov ax,offset Player2WeaponRunFrame2FileName
	push ax
	mov ax,offset Player2WeaponRunFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	mov ax,offset Player2WeaponRunFrame3FileName
	push ax
	mov ax,offset Player2WeaponRunFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	mov ax,offset Player2WeaponAirFrameFileName
	push ax
	mov ax,offset Player2WeaponAirFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	mov ax,offset Player2WeaponHitFrameFileName
	push ax
	mov ax,offset Player2WeaponHitFrameBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame1FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame1BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame2FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame2BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame3FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame3BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame4FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame4BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame5FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame5BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame6FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame6BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame7FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame7BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame8FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame8BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame9FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame9BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame10FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame10BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame11FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame11BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame12FileName
	push ax
	mov ax,offset Player2WeaponRegularAttackFrame12BitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	
	pop cx
	pop bx
	pop ax
	ret 
endp ReadAllBitMapsIntoPlayer2



;Input: empty push, hitbox x position, hitbox y position, hitbox high, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPlayer2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPlayer2




;Input: empty push, hitbox x position, hitbox y position, hitbox high, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPrevPlayer2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[PrevPositionXP2]
	push ax
	mov ax,[PrevPositionYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPrevPlayer2



;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPlayer2Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	cmp [word CurrentFrameP2],2
	je @@RunWeapon
	cmp [word CurrentFrameP2],3
	je @@AirWeapon
	cmp [word CurrentFrameP2],4
	je @@HitWeapon
	cmp [word CurrentFrameP2],5
	je @@RegularAttackWeapon
@@StandWeapon:
	
	push ax
	push ax
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	jmp @@CollisionCheck
@@RunWeapon:
	push ax
	push ax
	cmp [word RunFrameP2],2
	je @@RunWeaponFrame2
	cmp [word RunFrameP2],3
	je @@RunWeaponFrame3
	
@@RunWeaponFrame1:
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame2:
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame3:
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@AirWeapon:
	
	push ax
	push ax
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@HitWeapon:
	
	
	push ax
	push ax
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeapon:
	push ax
	push ax
	cmp [word RegularAttackFrameP2],2
	je @@RegularAttackWeaponFrame2
	cmp [word RegularAttackFrameP2],3
	je @@RegularAttackWeaponFrame3
	cmp [RegularAttackFrameP2],4
	je @@RegularAttackWeaponFrame4
	cmp [RegularAttackFrameP2],5
	je @@RegularAttackWeaponFrame5
	cmp [RegularAttackFrameP2],6
	je @@RegularAttackWeaponFrame6
	cmp [RegularAttackFrameP2],7
	je @@RegularAttackWeaponFrame7
	cmp [RegularAttackFrameP2],8
	je @@RegularAttackWeaponFrame8
	cmp [RegularAttackFrameP2],9
	je @@RegularAttackWeaponFrame9
	cmp [RegularAttackFrameP2],10
	je @@RegularAttackWeaponFrame10
	cmp [RegularAttackFrameP2],11
	je @@RegularAttackWeaponFrame11
	cmp [RegularAttackFrameP2],12
	je @@RegularAttackWeaponFrame12
	
@@RegularAttackWeaponFrame1:
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame2:
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame3:
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame4:
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame5:
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame6:
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame7:
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame8:
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame9:
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame10:
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame11:
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame12:
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	jmp @@CollisionCheck
	
	
@@CollisionCheck:
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPlayer2Weapon



;Input: empty push, hitbox x position, hitbox y position, hitbox hight, hitbox width
;Output: returns 0 if no collision, 1 if collision
proc HitboxCollisionCheckWithPrevPlayer2Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	
	cmp [PrevFrameP2],2
	je @@RunWeapon
	cmp [PrevFrameP2],3
	je @@AirWeapon
	cmp [PrevFrameP2],4
	je @@HitWeapon
	cmp [PrevFrameP2],5
	je @@RegularAttackWeapon
@@StandWeapon:
	
	push ax
	push ax
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	jmp @@CollisionCheck
@@RunWeapon:
	push ax
	push ax
	cmp [PrevRunFrameP2],2
	je @@RunWeaponFrame2
	cmp [PrevRunFrameP2],3
	je @@RunWeaponFrame3
	
@@RunWeaponFrame1:
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame2:
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RunWeaponFrame3:
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@AirWeapon:
	
	push ax
	push ax
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@HitWeapon:
	
	
	push ax
	push ax
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeapon:
	push ax
	push ax
	cmp [PrevRegularAttackFrameP2],2
	je @@RegularAttackWeaponFrame2
	cmp [PrevRegularAttackFrameP2],3
	je @@RegularAttackWeaponFrame3
	cmp [PrevRegularAttackFrameP2],4
	je @@RegularAttackWeaponFrame4
	cmp [PrevRegularAttackFrameP2],5
	je @@RegularAttackWeaponFrame5
	cmp [PrevRegularAttackFrameP2],6
	je @@RegularAttackWeaponFrame6
	cmp [PrevRegularAttackFrameP2],7
	je @@RegularAttackWeaponFrame7
	cmp [PrevRegularAttackFrameP2],8
	je @@RegularAttackWeaponFrame8
	cmp [PrevRegularAttackFrameP2],9
	je @@RegularAttackWeaponFrame9
	cmp [PrevRegularAttackFrameP2],10
	je @@RegularAttackWeaponFrame10
	cmp [PrevRegularAttackFrameP2],11
	je @@RegularAttackWeaponFrame11
	cmp [PrevRegularAttackFrameP2],12
	je @@RegularAttackWeaponFrame12
	
@@RegularAttackWeaponFrame1:
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame2:
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame3:
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	jmp @@CollisionCheck
	
	
@@RegularAttackWeaponFrame4:
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame5:
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame6:
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame7:
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame8:
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame9:
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame10:
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame11:
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	jmp @@CollisionCheck
	
	
	
@@RegularAttackWeaponFrame12:
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop ax
	pop bx
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	jmp @@CollisionCheck
	
	
@@CollisionCheck:
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPrevPlayer2Weapon




;Input: one empty push
;Output: 0 if no collision with stage, 1 if collided with stage
proc StageCollisionCheckAndUpdateP2
	push bp
	mov bp,sp
	push ax
	push dx
	
	mov [word bp+4],0
	push ax
	call CheckIfP2EnteredStage
	pop ax
	cmp ax,0
	je @@EndOfMethod
	mov [word bp+4],1
	push ax
	call StageEnteredDirectionP2
	pop dx
	
	
	push dx
	call PositionAfterCollisionWStageP2
	
	push dx
	call VelocityVectorsAfterStageCollisionUpdateP2
	
	
@@EndOfMethod:
	
	pop dx
	pop ax
	pop bp
	ret
endp StageCollisionCheckAndUpdateP2


proc Player2WeaponStageFix
	push ax
	
	
	cmp [NeedStageFixP2],0
	je @@AfterStageFix
	mov ax,[StageFixXP2]
	push ax
	mov ax,[StageFixYP2]
	push ax
	mov ax,[StageFixHightP2]
	push ax
	mov ax,[StageFixWidthP2]
	push ax
	call FixStage
@@AfterStageFix:
	push ax
	push ax
	push ax
	push ax
	push ax
	mov ax,[CurrentFrameP2]
	cmp ax,2
	je @@RunFrames
	cmp ax,3
	je @@AirFrame
	cmp ax,4
	je @@HitFrame
	cmp ax,5
	je @@RegularAttackFrames
	
@@StandFrame:
	call Player2WeaponStandFrameStageIntersectionCheck
	jmp @@EndOfMethod
@@RunFrames:
	mov ax,[RunFrameP2]
	cmp ax,2
	je @@RunFrame2
	cmp ax,3
	je @@RunFrame3
	call Player2WeaponRunFrame1StageIntersectionCheck
	jmp @@EndOfRun
@@RunFrame2:
	call Player2WeaponRunFrame2StageIntersectionCheck
	jmp @@EndOfRun
@@RunFrame3:
	call Player2WeaponRunFrame3StageIntersectionCheck
	jmp @@EndOfRun
@@EndOfRun:
	jmp @@EndOfMethod
	
@@AirFrame:
	call Player2WeaponAirFrameStageIntersectionCheck
	jmp @@EndOfMethod
@@HitFrame:
	call Player2WeaponHitFrameStageIntersectionCheck
	jmp @@EndOfMethod
@@RegularAttackFrames:
	mov ax,[RegularAttackFrameP2]
	cmp ax,2
	je @@RegularAttackFrame2
	cmp ax,3
	je @@RegularAttackFrame3
	cmp ax,4
	je @@RegularAttackFrame4
	cmp ax,5
	je @@RegularAttackFrame5
	cmp ax,6
	je @@RegularAttackFrame6
	cmp ax,7
	je @@RegularAttackFrame7
	cmp ax,8
	je @@RegularAttackFrame8
	cmp ax,9
	je @@RegularAttackFrame9
	cmp ax,10
	je @@RegularAttackFrame10
	cmp ax,11
	je @@RegularAttackFrame11
	cmp ax,12
	je @@RegularAttackFrame12
	call Player2WeaponRegularAttackFrame1StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame2:
	call Player2WeaponRegularAttackFrame2StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame3:
	call Player2WeaponRegularAttackFrame3StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame4:
	call Player2WeaponRegularAttackFrame4StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame5:
	call Player2WeaponRegularAttackFrame5StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame6:
	call Player2WeaponRegularAttackFrame6StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame7:
	call Player2WeaponRegularAttackFrame7StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame8:
	call Player2WeaponRegularAttackFrame8StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame9:
	call Player2WeaponRegularAttackFrame9StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame10:
	call Player2WeaponRegularAttackFrame10StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame11:
	call Player2WeaponRegularAttackFrame11StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@RegularAttackFrame12:
	call Player2WeaponRegularAttackFrame12StageIntersectionCheck
	jmp @@EndOfRegularAttack
@@EndOfRegularAttack:
@@EndOfMethod:
	pop ax
	mov [NeedStageFixP2],ax
	pop ax
	mov [StageFixXP2],ax
	pop ax
	mov [StageFixYP2],ax
	pop ax
	mov [StageFixHightP2],ax
	pop ax
	mov [StageFixWidthP2],ax
	
	
	pop ax
	ret
endp Player2WeaponStageFix




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponStandFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponStandFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponStandFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponStandFrameHight]
	push ax
	mov ax,[Player2WeaponStandFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponStandFrameStageIntersectionCheck


;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRunFrame1StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame1Hight]
	push ax
	mov ax,[Player2WeaponRunFrame1Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRunFrame1StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRunFrame2StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame2Hight]
	push ax
	mov ax,[Player2WeaponRunFrame2Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRunFrame2StageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRunFrame3StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRunFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRunFrame3Hight]
	push ax
	mov ax,[Player2WeaponRunFrame3Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRunFrame3StageIntersectionCheck



;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponHitFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponHitFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponHitFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponHitFrameHight]
	push ax
	mov ax,[Player2WeaponHitFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponHitFrameStageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponAirFrameStageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponAirFrameRelativeXPos]
	push ax
	mov ax,[Player2WeaponAirFrameRelativeYPos]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponAirFrameHight]
	push ax
	mov ax,[Player2WeaponAirFrameWidth]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponAirFrameStageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame1StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame1Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame1Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame1StageIntersectionCheck



;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame2StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame2Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame2Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame2StageIntersectionCheck






;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame3StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame3Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame3Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame3StageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame4StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame4Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame4Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame4StageIntersectionCheck




;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame5StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame5Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame5Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame5StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame6StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame6Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame6Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame6StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame7StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame7Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame7Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame7StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame8StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame8Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame8Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame8StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame9StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame9Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame9Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame9StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame10StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame10Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame10Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame10StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame11StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame11Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame11Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame11StageIntersectionCheck





;Input: 5 empty pushes
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
proc Player2WeaponRegularAttackFrame12StageIntersectionCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeXPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12RelativeYPos]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	call Player2WeaponPositionWithRelative
	pop ax
	pop bx
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	push ax
	push bx
	mov ax,[Player2WeaponRegularAttackFrame12Hight]
	push ax
	mov ax,[Player2WeaponRegularAttackFrame12Width]
	push ax
	call CheckIfEnteredStageAndReturnIntersectionRectangle
	pop ax
	mov [bp+4],ax
	pop ax
	mov [bp+6],ax
	pop ax
	mov [bp+8],ax
	pop ax
	mov [bp+10],ax
	pop ax
	mov [bp+12],ax
	
	pop bx
	pop ax
	pop bp
	ret 
endp Player2WeaponRegularAttackFrame12StageIntersectionCheck







;Input:one empty push for return value
;Output: 0 if no, 1 if yes
proc CheckIfP2EnteredStage
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionVectorXP2]
	push ax
	mov ax,[PositionVectorYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	
	push ax
	call CheckIfEnteredStage
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp CheckIfP2EnteredStage







;Input: empty push for return
;Output: 0 if did not enter, 1 for the left side of the stage, 2 for thr upper side, 3 for the right side , 4 for the lower side
proc StageEnteredDirectionP2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[TempPrevPositionVectorXP2]
	push ax
	mov ax,[TempPrevPositionVectorYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax
	call StageEnteredDirection
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp StageEnteredDirectionP2





;Input: stage side entered
;Output: Updates the position of player 1 after collision with stage
proc PositionAfterCollisionWStageP2
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	mov ax,[TempPrevPositionVectorXP2]
	push ax
	mov ax,[TempPrevPositionVectorYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax
	mov ax,[VelocityVectorXP2]
	push ax
	mov ax,[VelocityVectorYP2]
	push ax
	mov ax,[bp+4]
	push ax
	call PositionAfterCollisionWStage
	pop ax
	mov [PositionVectorXP2],ax
	pop ax
	mov [PositionVectorYP2],ax
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 2
endp PositionAfterCollisionWStageP2



;Works with VelocityVectorsDAfterStageCollisionUpdate
;Input: stage side entered
;Output: Updates the velocity vectors of player 2
proc VelocityVectorsAfterStageCollisionUpdateP2
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	mov ax,[bp+4]
	shr ax,1
	jc @@HorizontalMovement
	
@@VerticalMovement:
	mov bx,1
	;mov dx,[PositionVectorYP1]
	;sub dx,[TempPrevPositionVectorYP1]
	;sub [VelocityVectorYP1],dx
	mov ax,[VelocityVectorYP2]
	push ax
	jmp @@AfterDirectionCheck
@@HorizontalMovement:
	mov bx,2
	mov dx,[PositionVectorXP2]
	sub dx,[TempPrevPositionVectorXP2]
	sub [VelocityVectorXP2],dx
	mov ax,[VelocityVectorXP2]
	push ax
@@AfterDirectionCheck:
	mov ax,[StunedAmountP2]
	push ax
	mov ax,[InTumbleP2]
	push ax
	call VelocityVectorsDAfterStageCollisionUpdate
	pop ax
	cmp bx,1
	je @@VerticalUpdate
@@HorizontalUpdate:
	mov [VelocityVectorXP2],ax
	jmp @@EndOfMethod
@@VerticalUpdate:
	mov [VelocityVectorYP2],ax
@@EndOfMethod:
	
	pop bx
	pop ax
	pop bp
	ret 2
endp VelocityVectorsAfterStageCollisionUpdateP2





;Input: one empty push
;Output: returns if player 1 is on the stage, 0 means not on stage and 1 means is on stage
proc OnStageCheckP2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionVectorXP2]
	push ax
	mov ax,[PositionVectorYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax
	call OnStageCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp OnStageCheckP2




proc UpdateStunP2
	
	cmp [StunedAmountP2],0
	je @@EndOfMethod
	dec [StunedAmountP2]
@@EndOfMethod:
	
	ret
endp UpdateStunP2





proc HitFrictionP2
	push ax
	cmp [StunedAmountP2],0
	je @@AfterFrictionXCheck
	inc [HitFrictionRateDividerCounterXP2]
	mov ax,[HitFrictionRateDividerMaxXP2]
	cmp [HitFrictionRateDividerCounterXP2],ax
	jne @@AfterFrictionXCheck
	mov [HitFrictionRateDividerCounterXP2],0
	sar [VelocityVectorXP2],1
	cmp [VelocityVectorXP2],-1
	jne @@AfterFrictionXCheck
	mov [VelocityVectorXP2],0
@@AfterFrictionXCheck:
	cmp [StunedAmountP2],0
	je @@AfterFrictionCheck
	inc [HitFrictionRateDividerCounterYP2]
	mov ax,[HitFrictionRateDividerMaxYP2]
	cmp [HitFrictionRateDividerCounterYP2],ax
	jne @@AfterFrictionCheck
	mov [HitFrictionRateDividerCounterYP2],0
	sar [VelocityVectorYP2],1
	cmp [VelocityVectorYP2],-1
	jne @@AfterFrictionCheck
	mov [VelocityVectorYP2],0
@@AfterFrictionCheck:
	pop ax
	ret
endp HitFrictionP2




;Input: none
;Output: updates velocity vectors of player 1 according to stage friction
proc StageFrictionP2
	push ax
	inc [StageFrictionRateDividerCounterP2]
	mov ax,[StageFrictionRateDividerMaxP2]
	cmp [StageFrictionRateDividerCounterP2],ax
	jne @@AfterFrictionCheck
	mov [StageFrictionRateDividerCounterP2],0
	sar [VelocityVectorXP2],1
	cmp [VelocityVectorXP2],-1
	jne @@AfterFrictionCheck
	mov [VelocityVectorXP2],0
@@AfterFrictionCheck:
	pop ax
	ret
endp StageFrictionP2


;Input: none
;Output: updates velocity vectors of player 1 according to stage friction
proc AirFrictionP2
	push ax
	inc [AirFrictionRateDividerCounterP2]
	mov ax,[AirFrictionRateDividerMaxP2]
	cmp [AirFrictionRateDividerCounterP2],ax
	jne @@AfterFrictionCheck
	mov [AirFrictionRateDividerCounterP2],0
	sar [VelocityVectorXP2],1
	cmp [VelocityVectorXP2],-1
	jne @@AfterFrictionCheck
	mov [VelocityVectorXP2],0
@@AfterFrictionCheck:
	pop ax
	ret
endp AirFrictionP2




;Input: none
;Output: makes player 1 jump if he meets the criteria for stage jump, short press is a short jump and full press is a high jump
proc StageJumpP2
	push ax
	
	
	cmp [TimeBetweenJumpsCounterP2],0
	jne @@EndOfMethod
	cmp [InitiatingJumpP2],1
	jne @@CheckIfWantsToJump
	inc [JumpSquatCounterP2]
	mov ax,[JumpSquatMaxP2]
	cmp [JumpSquatCounterP2],ax
	jae @@HighJump
	
	cmp [Player2JumpKey],0
	je @@LowJump
	
@@CheckIfWantsToJump:
	cmp [Player2JumpKey],0
	je @@EndOfMethod
	mov [InitiatingJumpP2],1
	jmp @@EndOfMethod
@@HighJump:
	push ax
	mov ax,[VelocityVectorYP2]
	push ax
	mov ax,[HighStageJumpPowerP2]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP2],ax
	mov [InitiatingJumpP2],0
	inc [TimeBetweenJumpsCounterP2]
	mov [JumpSquatCounterP2],0
	jmp @@EndOfMethod
	
@@LowJump:
	push ax
	mov ax,[VelocityVectorYP2]
	push ax
	mov ax,[ShortStageJumpPowerP2]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP2],ax
	mov [InitiatingJumpP2],0
	inc [TimeBetweenJumpsCounterP2]
	mov [JumpSquatCounterP2],0
	
@@EndOfMethod:
	
	pop ax
	ret
endp StageJumpP2

;Input: none
;Output: makes player 2 air jump if he meets the criteria for air jump
proc AirJumpP2
	push ax
	
	cmp [TimeBetweenJumpsCounterP2],0
	jne @@EndOfMethod
@@CheckIfWantsToJump:
	cmp [Player2JumpKey],0
	je @@EndOfMethod
@@AirJump:
	push ax
	mov ax,[VelocityVectorYP2]
	push ax
	mov ax,[AirJumpPowerP2]
	push ax
	call Jump
	pop ax
	mov [VelocityVectorYP2],ax
	inc [TimeBetweenJumpsCounterP2]
	dec [NumberOfJumpsLeftP2]
	
@@EndOfMethod:
	
	pop ax
	ret
endp AirJumpP2


;Input: none
;Output: updates the movement of player 1 according to the key presses and the situation
proc P2Movement
	push ax
	push bx
	push dx
	push cx
	
	mov ax,[TimeBetweenJumpsCounterP2]
	cmp ax,0
	je @@NoJumpTimer
	inc [TimeBetweenJumpsCounterP2]
	inc ax
	cmp ax,[TimeBetweenJumpsMaxP2]
	jb @@NoJumpTimer
	mov [TimeBetweenJumpsCounterP2],0
@@NoJumpTimer:
	
	mov ax,[StunedAmountP2]
	cmp ax,0
	ja @@InStun
	
	mov al,[MoveRightPlayer2Key]
	mov bl,[MoveLeftPlayer2Key]
	cmp al,0
	jne @@MoveOrFriction
	cmp bl,0
	je @@Nothing
@@MoveROrL:
	mov dx,1
	jmp @@AfterLeftRightCheck
@@MoveOrFriction:
	cmp bl,0
	je @@MoveROrL
	mov dx,2
	jmp @@AfterLeftRightCheck
@@Nothing:
	mov dx,0
@@AfterLeftRightCheck:


	push ax
	call OnStageCheckP2
	pop ax
	cmp ax,0
	je @@OffStage
@@OnStage:
	mov ax,[MaxNumberOfJumpsP2]
	mov [NumberOfJumpsLeftP2],ax
	
	cmp dx,0
	je @@StageFriction
	cmp dx,2
	je @@AfterStageFriction



	mov al,[MoveRightPlayer2Key]
	cmp al,0
	je @@AfterStageRightMovement
	mov ax,[VelocityVectorXP2]
	cmp ax,0
	jge @@AfterStageMomentumShiftRight
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP2]
	mov cx,[StageMomentumShiftDividerP2]
	sar ax,cl
	sub [VelocityVectorXP2],ax
@@AfterStageMomentumShiftRight:
	mov ax,[VelocityVectorXP2]
	cmp ax,[MaxHorizontalStageSpeedP2]
	jg @@AfterStageRightMovement
	mov ax,[HorizontalStageSpeedP2]
	add [VelocityVectorXP2],ax
	mov [MovementDirectionP2],1
	mov [InTumbleP2],0
	jmp @@AfterStageFriction
@@AfterStageRightMovement:
	
	mov al,[MoveLeftPlayer2Key]
	cmp al,0
	je @@AfterStageFriction
	mov ax,[VelocityVectorXP2]
	cmp ax,0
	jle @@AfterStageMomentumShiftLeft
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP2]
	mov cx,[StageMomentumShiftDividerP2]
	sar ax,cl
	sub [VelocityVectorXP2],ax
@@AfterStageMomentumShiftLeft:
	mov ax,[VelocityVectorXP2]
	mov bx,1
	sub bx,[MaxHorizontalStageSpeedP2]
	cmp ax,bx
	jl @@AfterStageFriction
	mov ax,[HorizontalStageSpeedP2]
	sub [VelocityVectorXP2],ax
	mov [MovementDirectionP2],0
	mov [InTumbleP2],0
	jmp @@AfterStageFriction
@@StageFriction:
	call StageFrictionP2
@@AfterStageFriction:
	call StageJumpP2
@@AfterStageJump:
	
	jmp @@EndOfMethod
@@OffStage:
	mov [JumpSquatCounterP2],0
	mov [InitiatingJumpP2],0
	
	cmp dx,0
	je @@AirFriction
	cmp dx,2
	je @@AfterAirFriction
	
	mov al,[MoveRightPlayer2Key]
	cmp al,0
	je @@AfterAirRightMovement
	mov ax,[VelocityVectorXP2]
	cmp ax,0
	jge @@AfterAirMomentumShiftRight
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP2]
	mov cx,[StageMomentumShiftDividerP2]
	sar ax,cl
	sub [VelocityVectorXP2],ax
@@AfterAirMomentumShiftRight:
	mov ax,[VelocityVectorXP2]
	cmp ax,[MaxHorizontalAirSpeedP2]
	jg @@AfterAirRightMovement
	mov ax,[HorizontalAirSpeedP2]
	add [VelocityVectorXP2],ax
	mov [MovementDirectionP2],1
	mov [InTumbleP2],0
	jmp @@AfterAirFriction
@@AfterAirRightMovement:
	
	mov al,[MoveLeftPlayer2Key]
	cmp al,0
	je @@AfterAirFriction
	mov ax,[VelocityVectorXP2]
	cmp ax,0
	jle @@AfterAirMomentumShiftLeft
	;mov [VelocityVectorXP1],0
	mov ax,[VelocityVectorXP2]
	mov cx,[StageMomentumShiftDividerP2]
	sar ax,cl
	sub [VelocityVectorXP2],ax
@@AfterAirMomentumShiftLeft:
	mov ax,[VelocityVectorXP2]
	mov bx,1
	sub bx,[MaxHorizontalAirSpeedP2]
	cmp ax,bx
	jl @@AfterAirFriction
	mov ax,[HorizontalAirSpeedP2]
	sub [VelocityVectorXP2],ax
	mov [MovementDirectionP2],0
	mov [InTumbleP2],0
	jmp @@AfterAirFriction
@@AirFriction:
	call AirFrictionP2
@@AfterAirFriction:
	cmp [NumberOfJumpsLeftP2],0
	je @@AfterAirJump
	call AirJumpP2

@@AfterAirJump:
	jmp @@EndOfMethod
@@InStun:
	mov [InitiatingJumpP2],0
@@EndOfMethod:
	
	pop cx
	pop dx
	pop bx
	pop ax
	ret
endp P2Movement

;Input: none
;Output: updates the velocity vectors according to the gravity
proc GravityWMaxSpeedP2
	push ax
	
	push ax
	mov ax,[VelocityVectorYP2]
	push ax
	mov ax,[GravityAccelerationP2]
	push ax
	mov ax,[GravityMaxSpeedP2]
	push ax
	call GravityWMaxSpeed
	pop ax
	mov [VelocityVectorYP2],ax
	
	pop ax
	ret
endp GravityWMaxSpeedP2
	



;Updates the precise position vectors with the velocity vectors
proc UpdatePositionVectorWVelocityP2
	push ax
	
	mov ax,[PositionVectorXP2]
	mov [TempPrevPositionVectorXP2],ax
	mov ax,[PositionVectorYP2]
	mov [TempPrevPositionVectorYP2],ax
	
	mov ax,[VelocityVectorXP2]
	add [PositionVectorXP2],ax
	mov ax,[VelocityVectorYP2]
	add [PositionVectorYP2],ax
	
	pop ax
	ret
endp UpdatePositionVectorWVelocityP2

;updates the position variable with the vector position
proc UpdatePositionP2
	push ax
	
	mov ax,[PositionVectorXP2]
	sar ax,6
	mov [PositionXP2],ax
	mov ax,[PositionVectorYP2]
	sar ax,6
	mov [PositionYP2],ax
	
	pop ax
	ret
endp UpdatePositionP2



;Updates DirectionFacingP2 variable
proc DirectionFacingUpdateP2
	push ax
	
	push ax
	mov ax,[DirectionFacingP2]
	push ax
	mov ax,[MovementDirectionP2]
	push ax
	mov ax,[IsAttackingP2]
	push ax
	call DirectionFacingUpdate
	pop ax
	mov [DirectionFacingP2],ax
	
	pop ax
	ret
endp DirectionFacingUpdateP2


;Updates lag
proc UpdateLagP2
	push ax
	
	cmp [LagAmountP2],0
	je @@EndOfMethod
	;push ax
	;call OnStageCheckP2
	;pop ax
	;cmp ax,0
	;je @@ReduceLag
	;mov [LagAmountP2],0
	;jmp @@EndOfMethod
@@ReduceLag:
	dec [LagAmountP2]
@@EndOfMethod:
	
	pop ax
	ret
endp UpdateLagP2



proc UpdateTumbleP2
	push ax
	
	cmp [StunedAmountP2],0
	jne @@EndOfMethod
	push ax
	call OnStageCheckP2
	pop ax
	cmp ax,0
	je @@EndOfMethod
	mov [InTumbleP2],0
	
@@EndOfMethod:
	pop ax
	ret
endp UpdateTumbleP2





;END OF PLAYER 2--------------------------------------------------------------------------------------------------------------------------------------------


;Input: empty push
;Output: 0-nothing, 1-start battle, 2-update characters
proc MouseClickCheck
	push bp
	mov bp,sp
	push ax
	push cx
	push dx
	push bx
	
	mov [word bp+4],0
	mov ax,3
	int 33h
	test bl,00000011b
	jz @@EndOfMethod
	shr cx,1
	
	push ax
	push cx
	push dx
	call InStartButton
	pop ax
	mov [bp+4],ax
	
	test bl,00000010b
	jz @@LeftClick
@@RightClick:
	push ax
	push cx
	push dx
	call InGnomeButton
	pop ax
	cmp ax,0
	je @@AfterRCGnomeButtonCheck
	mov [word bp+4],2
	call ChooseGnomeP2
	
@@AfterRCGnomeButtonCheck:
	push ax
	push cx
	push dx
	call InGreenGnomeButton
	pop ax
	cmp ax,0
	je @@AfterRCGreenGnomeButtonCheck
	mov [word bp+4],2
	call ChooseGreenGnomeP2
	
@@AfterRCGreenGnomeButtonCheck:
	push ax
	push cx
	push dx
	call InHammerButton
	pop ax
	cmp ax,0
	je @@AfterRCHammerButtonCheck
	mov [word bp+4],2
	call ChooseHammerP2
@@AfterRCHammerButtonCheck:
	push ax
	push cx
	push dx
	call InHorseButton
	pop ax
	cmp ax,0
	je @@AfterRCHorseButtonCheck
	mov [word bp+4],2
	call ChooseHorseP2
@@AfterRCHorseButtonCheck:
	
	
	
	jmp @@EndOfMethod
@@LeftClick:
	push ax
	push cx
	push dx
	call InGnomeButton
	pop ax
	cmp ax,0
	je @@AfterLCGnomeButtonCheck
	mov [word bp+4],2
	call ChooseGnomeP1
	
@@AfterLCGnomeButtonCheck:
	push ax
	push cx
	push dx
	call InGreenGnomeButton
	pop ax
	cmp ax,0
	je @@AfterLCGreenGnomeButtonCheck
	mov [word bp+4],2
	call ChooseGreenGnomeP1
	
@@AfterLCGreenGnomeButtonCheck:
	push ax
	push cx
	push dx
	call InHammerButton
	pop ax
	cmp ax,0
	je @@AfterLCHammerButtonCheck
	mov [word bp+4],2
	call ChooseHammerP1
	
@@AfterLCHammerButtonCheck:
	push ax
	push cx
	push dx
	call InHorseButton
	pop ax
	cmp ax,0
	je @@AfterLCHorseButtonCheck
	mov [word bp+4],2
	call ChooseHorseP1
@@AfterLCHorseButtonCheck:
	
	
@@EndOfMethod:
	
	pop bx
	pop dx
	pop cx
	pop ax
	pop bp
	ret
endp MouseClickCheck


proc ShowMouse
	push ax
	
	mov ax,1
	int 33h
	
	pop ax
	ret
endp ShowMouse



proc HideMouse
	push ax
	
	mov ax,2
	int 33h
	
	pop ax
	ret
endp HideMouse


;Input: empty push , x mouse position, y mouse position
;Output: 0-out , 1-in button
proc InHorseButton
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,1
	push ax
	push ax
	mov ax,HORSEICONX
	push ax
	mov ax,HORSEICONY
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp InHorseButton


;Input: empty push , x mouse position, y mouse position
;Output: 0-out , 1-in button
proc InHammerButton
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,1
	push ax
	push ax
	mov ax,HAMMERICONX
	push ax
	mov ax,HAMMERICONY
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp InHammerButton


;Input: empty push , x mouse position, y mouse position
;Output: 0-out , 1-in button
proc InGreenGnomeButton
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,1
	push ax
	push ax
	mov ax,GREENGNOMEICONX
	push ax
	mov ax,GREENGNOMEICONY
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp InGreenGnomeButton



;Input: empty push , x mouse position, y mouse position
;Output: 0-out , 1-in button
proc InGnomeButton
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,1
	push ax
	push ax
	mov ax,GNOMEICONX
	push ax
	mov ax,GNOMEICONY
	push ax
	mov ax,ICONHIGHT
	push ax
	mov ax,ICONWIDTH
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp InGnomeButton



;Input: empty push , x mouse position, y mouse position
;Output: 0-out , 1-in button
proc InStartButton
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,1
	push ax
	push ax
	mov ax,STARTBUTTONX
	push ax
	mov ax,STARTBUTTONY
	push ax
	mov ax,STARTBUTTONHIGHT
	push ax
	mov ax,STARTBUTTONWIDTH
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp InStartButton



proc EraseScreen
	push ax
	
	mov ax,320
	push ax
	mov ax,200
	push ax
	mov ax,0
	push ax
	push ax
	call EraseWBlack
	
	pop ax
	ret
endp EraseScreen






;renders the players according to NeedDrawP1 and NeedDrawP2
;Input: none
;Output: none
proc EraseAndRenderBothPlayers
	push ax
	
	mov ax,[NeedDrawP1]
	add ax,[NeedDrawP2]
	cmp ax,2
	jne @@AfterBoth
	call ErasePlayer1
	call ErasePlayer2
	call RenderPlayer1
	call RenderPlayer2
	mov [NeedDrawP1],0
	mov [NeedDrawP2],0
	jmp @@EndOfMethod
@@AfterBoth:
@@Player1Check:
	cmp [NeedDrawP1],1
	jne @@Player2Check
	call ErasePlayer1
	call RenderPlayer1
	mov [NeedDrawP1],0
	jmp @@EndOfMethod
@@Player2Check:
	cmp [NeedDrawP2],1
	jne @@EndOfMethod
	call ErasePlayer2
	call RenderPlayer2
	mov [NeedDrawP2],0
@@EndOfMethod:
	
	pop ax
	ret
endp EraseAndRenderBothPlayers




;Input: empty push, current direction facing, movement direction, is attacking
;Output: returns direction facing
proc DirectionFacingUpdate
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+8]
	mov [bp+10],ax
	mov ax,[bp+4]
	cmp ax,1
	je @@EndOfMethod
	mov ax,[bp+6]
	mov [bp+10],ax
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 6
endp DirectionFacingUpdate


;checks if there is collision between player1 character and player2 character(not with the weapon)
;Input: one empty push
;Output: 0 if no collision, 1 if collision
proc HitboxCollisionCheckPlayer1WithPlayer2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PositionXP1]
	push ax
	mov ax,[PositionYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[PositionXP2]
	push ax
	mov ax,[PositionYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax	
	call HitboxCollisionCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp HitboxCollisionCheckPlayer1WithPlayer2



;checks if there is collision between the prev player1 character and prev player2 character(not with the weapon)
;Input: one empty push
;Output: 0 if no collision, 1 if collision
proc HitboxCollisionCheckPrevPlayer1WithPrevPlayer2
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[PrevPositionXP1]
	push ax
	mov ax,[PrevPositionYP1]
	push ax
	mov ax,[Player1Hight]
	push ax
	mov ax,[Player1Width]
	push ax
	mov ax,[PrevPositionXP2]
	push ax
	mov ax,[PrevPositionYP2]
	push ax
	mov ax,[Player2Hight]
	push ax
	mov ax,[Player2Width]
	push ax	
	call HitboxCollisionCheck
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp HitboxCollisionCheckPrevPlayer1WithPrevPlayer2





; check if there is collision of prev player1 weapon with prev player2 weapon
;Input: empty push, player1 weapon hight, player1 weapon width, player1 weapon relative x, player1 weapon relative y, player2 weapon hight, player2 weapon width, player2 weapon relative x, player2 weapon relative y
;Output: 0-no collision, 1-collision
;[bp+4] = player2 weapon relative y
;[bp+6] = player2 weapon relative x
;[bp+8] = player2 weapon width
;[bp+10] = player2 weapon hight
;[bp+12] = player1 relative y
;[bp+14] = player1 relative x
;[bp+16] = player1 weapon width
;[bp+18] = player1 weapon hight
;[bp+20] = returning value
proc HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	
	push ax
	
	push ax
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	mov ax,[bp+16]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push bx
	push dx
	mov ax,[bp+18]
	push ax
	mov ax,[bp+16]
	push ax
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push bx
	push dx
	
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	
	call HitboxCollisionCheck
	pop ax
	mov [bp+20],ax
	
	pop dx
	pop bx
	pop ax
	pop bp
	ret 16
endp HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon



;same as HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon just gets the input of player2 first, can be replaced with a call to HitboxCollisionCheckPrevPlayer1WeaponWithPrevPlayer2Weapon with the input in the right order
;Input: empty push, player1 weapon hight, player1 weapon width, player1 weapon relative x, player1 weapon relative y, player2 weapon hight, player2 weapon width, player2 weapon relative x, player2 weapon relative y
;Output: 0-no collision, 1-collision
;[bp+4] = player1 weapon relative y
;[bp+6] = player1 weapon relative x
;[bp+8] = player1 weapon width
;[bp+10] = player1 weapon hight
;[bp+12] = player2 relative y
;[bp+14] = player2 relative x
;[bp+16] = player2 weapon width
;[bp+18] = player2 weapon hight
;[bp+20] = returning value
proc HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	
	push ax
	
	push ax
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	mov ax,[bp+16]
	push ax
	call Player2WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push bx
	push dx
	mov ax,[bp+18]
	push ax
	mov ax,[bp+16]
	push ax
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	call Player1WeaponPrevPositionWithRelative
	pop bx
	pop dx
	
	push bx
	push dx
	
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	
	call HitboxCollisionCheck
	pop ax
	mov [bp+20],ax
	
	pop dx
	pop bx
	pop ax
	pop bp
	ret 16
endp HitboxCollisionCheckPrevPlayer2WeaponWithPrevPlayer1Weapon



;Input: empty push, x position, y position, width, hight
;Output: 0-no collision, 1-collision 
proc HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push si
	push di
	
	mov [word bp+12],0
	mov bx,[bp+10]
	mov dx,[bp+8]
	mov si,[bp+6]
	mov di,[bp+4]
	
	push ax
	push bx
	push dx
	push di
	push si
	call HitboxCollisionCheckWithPrevPlayer1
	pop ax
	cmp ax,1
	je @@Collision
	
	push ax
	push bx
	push dx
	push di
	push si
	call HitboxCollisionCheckWithPrevPlayer2
	pop ax
	cmp ax,1
	je @@Collision
	
	push ax
	push bx
	push dx
	push di
	push si
	call HitboxCollisionCheckWithPrevPlayer1Weapon
	pop ax
	cmp ax,1
	je @@Collision
	
	push ax
	push bx
	push dx
	push di
	push si
	call HitboxCollisionCheckWithPrevPlayer2Weapon
	pop ax
	cmp ax,1
	je @@Collision
	
	jmp @@EndOfMethod
@@Collision:
	mov [word bp+12],1
@@EndOfMethod:
	
	pop di
	pop si
	pop dx
	pop bx
	pop ax
	pop bp
	ret 8
endp HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W





;repairs the stage with the part given in the input
;Input: position x (on screen), position y, hight, width (all of the part needed to repair)
;Output: renders the part of the stage needed from the stage bit map
proc FixStage
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	push cx
	

	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,offset StageBitMap
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+10]
	sub ax,[StagePositionX]
	push ax
	mov ax,[bp+8]
	sub ax,[StagePositionY]
	push ax
	mov ax,STAGEWIDTH
	push ax
	mov ax,STAGEHIGHT
	push ax
	call ShowPartialBitMapInvisColor
	
	
	pop cx
	pop bx
	pop dx
	pop ax
	pop bp
	ret 8
endp FixStage


;checks if the input is out of the screen
;Input: empty push, x position(no sub pixels), y position, width, hight
;Output: 1 if out of bounds returns 1, 0 if not out of bounds
proc OutOfBoundsCheck
	push bp
	mov bp,sp
	push ax
	
	mov [word bp+12],0
	cmp [word bp+10],0
	jl @@OutOfBounds
	cmp [word bp+8],0
	jl @@OutOfBounds
	mov ax,[word bp+10]
	add ax,[word bp+6]
	dec ax
	cmp ax,320
	jge @@OutOfBounds
	mov ax,[word bp+8]
	add ax,[word bp+4]
	dec ax
	cmp ax,200
	jge @@OutOfBounds
	jmp @@EndOfMethod
@@OutOfBounds:
	mov [word bp+12],1
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 8
endp OutOfBoundsCheck


;returns the position of the weapon relative to the screen
;Input: 2 empty pushes, direction facing, x position, y position, player width, relative x, relative y, weapon width
;Output: returns weapon x position, y position
;[bp+4] = weapon width
;[bp+6] = relative y
;[bp+8] = relative x
;[bp+10] = player width
;[bp+12] = position y
;[bp+14] = position x
;[bp+16] = direction facing
;[bp+18] = return y
;[bp+20] = return x
proc WeaponPositionWithRelative
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+12]
	add ax,[bp+6]
	mov [bp+18],ax
	
	cmp [word bp+16],1
	je @@FacingRight
	mov ax,[bp+14]
	add ax,[bp+10]
	sub ax,[bp+8]
	sub ax,[bp+4]
	mov [bp+20],ax
	jmp @@EndOfMethod
@@FacingRight:
	mov ax,[bp+14]
	add ax,[bp+8]
	mov [bp+20],ax
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 14
endp WeaponPositionWithRelative



;checks collision and intersection of input with stage
;Input: 5 empty pushes, x position(not vectorial), y position, hight, width
;Output: returns if the weapon entered the stage(0 is no, 1 is yes), x position of IntersectionRectangle, y position, hight, width
;[bp+4] = width
;[bp+6] = hight
;[bp+8] = y position
;[bp+10] = x position
;[bp+12] = returning width
;[bp+14] = returning hight
;[bp+16] = returning y position
;[bp+18] = returning x position
;[bp+20] = if there is any intersection
proc CheckIfEnteredStageAndReturnIntersectionRectangle
	push bp
	mov bp,sp
	push ax
	
	push ax
	push ax
	push ax
	push ax
	push ax
	
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[StagePositionX]
	push ax
	mov ax,[StagePositionY]
	push ax
	mov ax,STAGEHIGHT
	push ax
	mov ax,STAGEWIDTH
	push ax
	call HitboxCollisionCheckReturnIntersection
	pop ax
	mov [bp+12],ax
	pop ax
	mov [bp+14],ax
	pop ax
	mov [bp+16],ax
	pop ax
	mov [bp+18],ax
	pop ax
	mov [bp+20],ax
	
	
	
	
	pop ax
	pop bp
	ret 8
endp CheckIfEnteredStageAndReturnIntersectionRectangle




;this checks all the possible intersections of two rectangles
;Input: 5 empty pushes, x position 1, y position 1,hight 1, width 1, x position 2, y position 2,hight 2, width 2
;Output: returns if there is any intersection, intersection x position, y position, hight, width
;[bp-8] = short width
;[bp-6] = short hight
;[bp-4] = long width
;[bp-2] = long hight
;[bp+4] = width 2
;[bp+6] = hight 2
;[bp+8] = y position 2
;[bp+10] = x position 2
;[bp+12] = width 1
;[bp+14] = hight 1
;[bp+16] = y position 1
;[bp+18] = x position 1
;[bp+20] = returning width - if there is any intersection
;[bp+22] = returning hight  - returning x position
;[bp+24] = returning y position - 
;[bp+26] = returning x position - returning hight
;[bp+28] = if there is any intersection - returning width
proc HitboxCollisionCheckReturnIntersection
	push bp
	mov bp,sp
	sub sp,8
	push ax
	push bx
	push dx
	push si
	push di
	push cx
	
	mov [word bp+26],-1
	mov [word bp+24],-1
	mov [word bp+22],-1
	mov [word bp+20],-1
	
	push ax
	mov ax,[bp+18]
	push ax
	mov ax,[bp+16]
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call HitboxCollisionCheck;checks if there is any collision
	pop ax
	mov [bp+20],ax
	cmp ax,0
	je @@EndOfCheck
	
	
	
	
	;this make it so that bx,dx rectangle is in si,di and not the other way
	mov bx,[bp+18];x 1
	mov dx,[bp+16];y 1
	mov ax,[bp+14]
	mov [bp-6],ax
	mov ax,[bp+12]
	mov [bp-8],ax
	mov si,[bp+10];x 2
	mov di,[bp+8];y 2
	mov ax,[bp+6]
	mov [bp-2],ax
	mov ax,[bp+4]
	mov [bp-4],ax
	
	mov ax,[bp+14]
	cmp ax,[bp+6]
	jb @@CorrectSizesInPlace
	mov ax,[bp+12]
	cmp ax,[bp+4]
	jb @@CorrectSizesInPlace
	mov bx,[bp+10];x 1
	mov dx,[bp+8];y 1
	mov ax,[bp+6]
	mov [bp-6],ax
	mov ax,[bp+4]
	mov [bp-8],ax
	mov si,[bp+18];x 2
	mov di,[bp+16];y 2
	mov ax,[bp+14]
	mov [bp-2],ax
	mov ax,[bp+12]
	mov [bp-4],ax
@@CorrectSizesInPlace:
	;checks if one is totally inside the other
	mov ax,bx
	mov cx,si
	cmp ax,cx
	jb @@NotTotallyInside
	add ax,[bp-8]
	add cx,[bp-4]
	cmp ax,cx
	ja @@NotTotallyInside
	mov ax,dx
	mov cx,di
	cmp ax,cx
	jb @@NotTotallyInside
	add ax,[bp-6]
	add ax,[bp-2]
	cmp ax,cx
	ja @@NotTotallyInside
	mov [bp+22],bx
	mov [bp+24],dx
	mov ax,[bp-8]
	mov [bp+28],ax
	mov ax,[bp-6]
	mov [bp+26],ax
	jmp @@EndOfCheck
	
@@NotTotallyInside:
	cmp bx,si
	jb @@OtherXPosWidthOfRectangle
	mov [bp+22],bx
	mov ax,bx
	add ax,[bp-8]
	mov cx,si
	add cx,[bp-4]
	cmp ax,cx
	jb @@InsideX
	mov ax,si
	add ax,[bp-4]
	sub ax,bx
@@WidthLeftDone:
	mov [bp+28],ax
	jmp @@AfterXPosWidthOfRectangle
@@InsideX:
	mov ax,[bp-8]
	mov [bp+28],ax
	jmp @@AfterXPosWidthOfRectangle
@@OtherXPosWidthOfRectangle:
	mov [bp+22],si
	mov ax,bx
	add ax,[bp-8]
	sub ax,si
@@WidthRightDone:
	mov [bp+28],ax
@@AfterXPosWidthOfRectangle:
	cmp dx,di
	jb @@OtherYPosHightOfRectangle
	mov [bp+24],dx
	mov ax,dx
	add ax,[bp-6]
	mov cx,di
	add cx,[bp-2]
	cmp ax,cx
	jb @@InsideY
	mov ax,di
	add ax,[bp-2]
	sub ax,dx
@@HightTopDone:
	mov [bp+26],ax
	jmp @@AfterYPosHightOfRectangle
@@InsideY:
	mov ax,[bp-6]
	mov [bp+26],ax
	jmp @@AfterYPosHightOfRectangle
@@OtherYPosHightOfRectangle:
	mov [bp+24],di
	mov ax,dx
	add ax,[bp-6]
	sub ax,di
@@HightBottomDone:
	mov [bp+26],ax
@@AfterYPosHightOfRectangle:
	
	
	
@@EndOfCheck:
	
	pop cx
	pop di
	pop si
	pop dx
	pop bx
	pop ax
	add sp,8
	pop bp
	ret 16
endp HitboxCollisionCheckReturnIntersection



;this checks if the input has collided with the stage
;hight and width are bmp hight and width(with starting point)
;Input: empty push, precise x position, precise y position, hight, width
;Output: 0 if not in stage, 1 if in stage
proc CheckIfEnteredStage
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+10]
	;sar ax,6

	push ax
	mov ax,[bp+8]
	;sar ax,6
	push ax
	mov ax,[bp+6]
	sal ax,6
	push ax
	mov ax,[bp+4]
	sal ax,6
	push ax
	mov ax,[StagePositionX]
	sal ax,6
	push ax
	mov ax,[StagePositionY]
	sal ax,6
	push ax
	mov ax,STAGEHIGHT
	sal ax,6
	push ax
	mov ax,STAGEWIDTH
	sal ax,6
	push ax
	call HitboxCollisionCheck
	pop ax
	mov [bp+12],ax
	
	pop ax
	pop bp
	ret 8
endp CheckIfEnteredStage



;checks if two rectangles have an intersection
;Input: empty push, hitbox1 x position, hitbox1 y position, hitbox1 hight, hitbox1 width, hitbox2 x position, hitbox2 y position, hitbox2 hight, hitbox2 width
;Output: returns if the hitboxes collide or not (0 is no, 1 is yes) in stack
;[bp+4]= hitbox2 width
;[bp+6]= hitbox2 hight
;[bp+8]= hitbox2 y position
;[bp+10]= hitbox2 x position
;[bp+12]= hitbox1 width
;[bp+14]= hitbox1 hight
;[bp+16]= hitbox1 y position
;[bp+18]= hitbox1 x position
;[bp+20]= return value
proc HitboxCollisionCheck
	push bp
	mov bp,sp
	push ax

	
	push ax
	mov ax,[bp+18]
	push ax
	mov ax,[bp+16]
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call HitboxCollisionCheckHalf
	pop ax
	cmp ax,0
	je @@SecondCheck
	mov [bp+20],ax
	jmp @@EndOfMethod
@@SecondCheck:
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+18]
	push ax
	mov ax,[bp+16]
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	call HitboxCollisionCheckHalf
	pop ax
	mov [bp+20],ax
@@EndOfMethod:

	pop ax
	pop bp
	ret 16
endp HitboxCollisionCheck



;Info: used by HitboxCollisionCheck, this method checks if one of the rectangles corners is in the other
;DOESN'T FULLY CHECK, ONLY FOR HitboxCollisionCheck
;Input: empty push, hitbox1 x position, hitbox1 y position, hitbox1 hight, hitbox1 width, hitbox2 x position, hitbox2 y position, hitbox2 hight, hitbox2 width
;Output:  checks if one of the rectangles corners is in the other (0 is no, 1 is yes) in stack
;[bp+4]= hitbox2 width
;[bp+6]= hitbox2 hight
;[bp+8]= hitbox2 y position
;[bp+10]= hitbox2 x position
;[bp+12]= hitbox1 width
;[bp+14]= hitbox1 hight
;[bp+16]= hitbox1 y position
;[bp+18]= hitbox1 x position
;[bp+20]= return value
proc HitboxCollisionCheckHalf
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	
	mov [word bp+20],0
	mov ax,[bp+18];corner 1 x 
	mov bx,[bp+16];corner 2 y
	mov dx,[bp+10];corner 2 checked x
	mov cx,[bp+8];corner 2 checked y
	
@@Corner1:
	cmp ax,dx
	jb @@Corner2
	add dx,[bp+4]
	cmp ax,dx
	jae @@Corner2
	cmp bx,cx
	jb @@Corner2
	add cx,[bp+6]
	cmp bx,cx
	jae @@Corner2
	
	mov [word bp+20],1
	jmp @@DoneChecking
@@Corner2:
	mov dx,[bp+10]
	mov cx,[bp+8]
	add ax,[bp+12]
	cmp ax,dx
	jbe @@Corner3
	add dx,[bp+4]
	cmp ax,dx
	jae @@Corner3
	cmp bx,cx
	jb @@Corner3
	add cx,[bp+6]
	cmp bx,cx
	jae @@Corner3
	
	mov [word bp+20],1
	jmp @@DoneChecking
@@Corner3:
	mov dx,[bp+10]
	mov cx,[bp+8]
	add bx,[bp+14]
	cmp ax,dx
	jbe @@Corner4
	add dx,[bp+4]
	cmp ax,dx
	jae @@Corner4
	cmp bx,cx
	jbe @@Corner4
	add cx,[bp+6]
	cmp bx,cx
	jae @@Corner4
	
	mov [word bp+20],1
	jmp @@DoneChecking
@@Corner4:
	mov dx,[bp+10]
	mov cx,[bp+8]
	mov ax,[bp+18]
	cmp ax,dx
	jb @@DoneChecking
	add dx,[bp+4]
	cmp ax,dx
	jae @@DoneChecking
	cmp bx,cx
	jbe @@DoneChecking
	add cx,[bp+6]
	cmp bx,cx
	jae @@DoneChecking
	
	mov [word bp+20],1

@@DoneChecking:
	
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 16
endp HitboxCollisionCheckHalf






;Info: this method is for after checking if the player went into the stage and if the return is positive
;Input: empty push for return value, player x position befor movement, player y position befor movement, player hight, player width
;Output:0 if did not enter, 1 for the left side of the stage, 2 for thr upper side, 3 for the right side, 4 for the lower side
;[bp+4] = player width
;[bp+6] = player hight
;[bp+8] = player y prev position
;[bp+10] = player x prev position
;[bp+12] = return value
proc StageEnteredDirection
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push si
	push di
	
	mov bx,[bp+10]
	mov dx,[bp+8];
	mov si,[bp+6];player width
	dec si
	sal si,6
	mov di,[bp+4]
	dec di
	sal di,6
	
	mov [word bp+12],0
@@LeftSideCheck:
	push ax
	xor ax,ax
	push ax
	mov ax,[StagePositionY]
	sal ax,6
	push ax
	mov ax,STAGEHIGHT
	sal ax,6
	push ax
	mov ax,[StagePositionX]
	dec ax
	sal ax,6
	push ax
	push bx
	push dx
	push si
	push di
	call HitboxCollisionCheck
	pop ax
	cmp ax,0
	je @@RightSideCheck
	mov [word bp+12],1
	jmp @@EndOfCheck
@@RightSideCheck:
	push ax
	mov ax,[StagePositionX]
	add ax,STAGEWIDTH
	inc ax
	sal ax,6
	push ax
	mov ax,[StagePositionY]
	sal ax,6
	push ax
	mov ax,STAGEHIGHT
	sal ax,6
	push ax
	mov ax,320
	sub ax,[StagePositionX]
	sub ax,STAGEWIDTH
	dec ax
	sal ax,6
	push ax
	push bx
	push dx
	push si
	push di
	call HitboxCollisionCheck
	pop ax
	cmp ax,0
	je @@UpperSideCheck
	mov [word bp+12],3
	jmp @@EndOfCheck
@@UpperSideCheck:
	push ax
	xor ax,ax
	push ax
	xor ax,ax
	push ax
	mov ax,[StagePositionY]
	sal ax,6
	push ax
	mov ax,320
	sal ax,6
	push ax
	push bx
	push dx
	push si
	push di
	call HitboxCollisionCheck
	pop ax
	cmp ax,0
	je @@LowerSideCheck
	mov [word bp+12],2
	jmp @@EndOfCheck
@@LowerSideCheck:
	push ax
	xor ax,ax
	push ax
	mov ax,[StagePositionY]
	add ax, STAGEHIGHT
	sal ax,6
	push ax
	mov ax,200
	sub ax,[StagePositionY]
	sub ax,STAGEHIGHT
	sal ax,6
	push ax
	mov ax,320
	sal ax,6
	push ax
	push bx
	push dx
	push si
	push di
	call HitboxCollisionCheck
	pop ax
	cmp ax,0
	je @@EndOfCheck
	mov [word bp+12],4
	
@@EndOfCheck:
	
	pop di
	pop si
	pop dx
	pop bx
	pop ax
	pop bp
	ret 8
endp StageEnteredDirection




;returns the new position after collision with stage
;Input:  two empty pushes ,precise x position in stage(current position), precise y position in stage(current position), player hight, player width, precise prev x position, precise prev y position, side from StageEnteredDirection
;Output: returns the new x position and new y position of the player
;[bp+4] = side of stage
;[bp+6] = velocity y vector
;[bp+8] = velocity x vector
;[bp+10] = player width
;[bp+12] = player hight
;[bp+14] = prev y position
;[bp+16] = prev x position
;[bp+18] = returning x value
;[bp+20] = returning y value
proc PositionAfterCollisionWStage
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+4]
	cmp ax,1
	je @@HorizontalCollisionLeft
	cmp ax,2
	je @@VerticalCollisionUpper
	cmp ax,3
	je @@HorizontalCollisionRight
	cmp ax,4
	je @@VerticalCollisionLower
	jmp @@EndOfMethod
@@HorizontalCollisionLeft:
	mov ax,[StagePositionX]
	sub ax,[bp+10]
	sal ax,6
	mov [bp+18],ax
	mov ax,[bp+14]
	add ax,[bp+6]
	mov [bp+20],ax
	jmp @@EndOfMethod
@@VerticalCollisionUpper:
	mov ax,[StagePositionY]
	sub ax,[bp+12]
	sal ax,6
	mov [bp+20],ax
	mov ax,[bp+16]
	add ax,[bp+8]
	mov [bp+18],ax
	jmp @@EndOfMethod
@@HorizontalCollisionRight:
	mov ax,[StagePositionX]
	add ax,STAGEWIDTH
	sal ax,6
	mov [bp+18],ax
	mov ax,[bp+14]
	add ax,[bp+6]
	mov [bp+20],ax
	jmp @@EndOfMethod
@@VerticalCollisionLower:
	mov ax,[StagePositionY]
	add ax,STAGEHIGHT
	sal ax,6
	mov [bp+20],ax
	mov ax,[bp+16]
	add ax,[bp+8]
	mov [bp+18],ax
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 14
endp PositionAfterCollisionWStage


;returns the new velocity vector after stage collision
;Input: empty push , velocity vector, stun variable, tumble variable
;Output: velocity vector after stage collision
proc VelocityVectorsDAfterStageCollisionUpdate
	push bp
	mov bp,sp
	push ax
	
	
	mov ax,[bp+4]
	cmp ax,0
	je @@NoBounce
	mov ax,[bp+6]
	cmp ax,0
	jne @@HitBounce
@@TumbleBounce:
	xor ax,ax
	sub ax,[bp+8]
	sar ax,2
	mov [bp+10],ax
	jmp @@EndOfMethod
@@HitBounce:
	xor ax,ax
	sub ax,[bp+8]
	mov [bp+10],ax
	jmp @@EndOfMethod
@@NoBounce:
	mov [word bp+10],0
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 6
endp VelocityVectorsDAfterStageCollisionUpdate



;checks if input is on stage
;Input: empty push, x position, y position, character hight, character length
;Output: returns 0 if not on stage, 1 if on stage (in stack)
proc OnStageCheck
	push bp
	mov bp,sp
	push ax
	push bx
	
	mov [word bp+12],0
	mov ax,[StagePositionY]
	sub ax,[bp+6]
	sal ax,6
	cmp ax,[bp+8]
	jne @@EndOfCheck
	mov ax,[StagePositionX]
	sub ax,[bp+4]
	sal ax,6
	cmp ax,[bp+10]
	ja @@EndOfCheck
	mov ax,[StagePositionX]
	add ax,STAGEWIDTH
	sal ax,6
	cmp ax,[bp+10]
	jb @@EndOfCheck
	mov [word bp+12],1
@@EndOfCheck:
	
	pop bx
	pop ax
	pop bp
	ret 8
endp OnStageCheck




;Input: empty push , velocity vector y, jump power
;Output: returns new velocity vector
proc Jump
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+6]
	mov [bp+8],ax
	cmp ax,0
	jbe @@AfterStoppedFalling
	mov [word bp+8],0
@@AfterStoppedFalling:
	mov ax,[bp+4]
	sub [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp Jump



;applies gravity with max speed
;Input: empty push, velocity vector y, gravity acceleration, gravity max speed
;Output: returns the velocity vectors
;[bp+4] = max speed
;[bp+6] = gravity acceleration
;[bp+8] = velocity vector
;[bp+10] = returning velocity vector
proc GravityWMaxSpeed
	push bx
	mov bp,sp
	
	mov ax,[bp+8]
	mov [bp+10],ax
	cmp ax,[bp+4]
	jge @@AllReadyAtMaxSpeed
	add ax,[bp+6]
	cmp ax,[bp+4]
	jg @@AtMaxSpeed
	mov [bp+10],ax
	jmp @@AllReadyAtMaxSpeed
@@AtMaxSpeed:
	mov ax,[bp+4]
	mov [bp+10],ax
@@AllReadyAtMaxSpeed:
	
	pop bp
	ret 6
endp GravityWMaxSpeed


;renders the stage
proc RenderStage
	push ax
	mov ax, [InvisibleColorPlace]
	push ax
	mov ax,offset StageBitMap
	push ax
	mov ax, STAGEWIDTH
	push ax
	mov ax, STAGEHIGHT
	push ax
	mov ax,[StagePositionX]
	push ax
	mov ax,[StagePositionY]
	push ax
	call ShowBitMapInvisColor
	pop ax
	ret
endp RenderStage



;renders black on the place given
;Requirements: none
;Methods required: none
;Input: length, hight, left up x position, left up y position
;Output: draws a black rectangle with the sizes given in the input with its top left corner at the  x,y coordinate given
proc EraseWBlack
	push bp
	mov bp,sp
	push ax
	push cx
	push di
	push dx
	
	cmp [word bp+10],0
	jle @@EndOfMethod
	cmp [word bp+8],0
	jle @@EndOfMethod
	
	mov ax, 0A000h
	mov es, ax
	mov cx,[bp+8]
	mov dx,[bp+6]
	
@@nextline:
	push cx
	mov di,cx  ; Current Row at the small bmp (each time -1)
	add di,[bp+4] ; add the Y on entire screen


	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx
	mov cx,[bp+10]
@@nextpix:
	mov [byte es:di],0
	inc di
	loop @@nextpix
	
	pop cx
	loop @@nextline
@@EndOfMethod:
	
	pop dx
	pop di
	pop cx
	pop ax
	pop bp
	ret 8
endp EraseWBlack


;reads a bmp file bit map and syncs the palette so the bit map is ready to render
;Requirements: bmp file
;Methods required: ReadFromFile, ReadBMPHeader, ReadBMPPalette, SyncBmpPaletteInvisColor, OpenFileForRead, CloseFile, ReadBMPBitMap
;Input: (one empty push for the invisible color place), image width, image hight , R of invisible color, G of invisible color, B of invisible color , BMP file name in ASCIZ, header offset, palette offset, bit map offset
;Output: reads the header, palette and the bit map into the arrays and returns the invisible color place in the palette 
;
;[bp+4] = bit map
;[bp+6] = palette
;[bp+8] = header
;[bp+10] = file name ASCIZ
;[bp+12] = blue value
;[bp+14] = green value
;[bp+16] = red value
;[bp+18] = image width
;[bp+20] = image hight
;[bp+22] = return value
proc BMPRenderSetUpWithPalette
	push bp
	mov bp,sp
	sub sp,2
	push ax
	
	
	push ax
	push ax
	mov ax,[bp+10]
	push ax
	call OpenFileForRead
	pop ax
	pop ax
	mov [bp-2],ax
	
	mov ax,[bp-2]
	push ax
	mov ax,[bp+8]
	push ax
	call ReadBMPHeader
	
	mov ax,[bp-2]
	push ax
	mov ax,[bp+6]
	push ax
	call ReadBMPPalette
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+16]
	push ax
	mov ax,[bp+14]
	push ax
	mov ax,[bp+12]
	push ax
	call SyncBmpPaletteInvisColor
	pop ax
	mov [bp+22],ax
	
	mov ax,[bp-2]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+18]
	push ax
	mov ax,[bp+20]
	push ax
	call ReadBMPBitMap
	
	mov ax,[bp-2]
	push ax
	call CloseFile
	
	pop ax
	add sp,2
	pop bp
	ret 18
endp BMPRenderSetUpWithPalette



;sets up the palette of the whole game
;Input: none
;Output: none
proc FullPaletteSetUp
	push ax
	
	push ax
	mov ax,offset PaletteFileName
	push ax
	mov ax,offset FullPalette
	push ax
	mov ax,NOCOLORR
	push ax
	mov ax,NOCOLORG
	push ax
	mov ax,NOCOLORB
	push ax
	call BMPPaletteSetUp
	pop ax
	mov [InvisibleColorPlace],ax
	
	pop ax
	ret
endp FullPaletteSetUp



;this is for the procedure that makes all of the colors of the images be in the screen palette
;Info: this procedure is for a palette with all of the colors of the game
;Input: empty push, File Asciz, palette array offset , red value of the invisible color, green value of the invisible color, blue value of invisible color
;Output: syncs the palette of the screen with the file palette and returns the position of the invisible color
;[bp-2] = file handle
;[bp+4] = blue invisible color value
;[bp+6] = green invisible color value
;[bp+8] = red invisible color value
;[bp+10] = palette offset
;[bp+12] = file name
;[bp+14] = return value
proc BMPPaletteSetUp
	push bp
	mov bp,sp
	sub sp,2
	push ax
	
	push ax
	push ax
	mov ax,[bp+12]
	push ax
	call OpenFileForRead
	pop ax
	pop ax
	mov [bp-2],ax
	
	mov ax,[bp-2]
	push ax
	call SkipBMPFileHeader
	
	mov ax,[bp-2]
	push ax
	mov ax,[bp+10]
	push ax
	call ReadBMPPalette
	
	push ax
	mov ax,[bp+10]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call SyncBmpPaletteInvisColor
	pop ax
	mov [bp+14],ax
	
	
	pop ax
	add sp,2
	pop bp
	ret 10
endp BMPPaletteSetUp


;reads the bit map of the stage into the stage bit map array
;Input: none
;Output: none
proc StageBitmapSetUp
	push ax
	
	mov ax, STAGEHIGHT
	push ax
	mov ax,STAGEWIDTH
	push ax
	mov ax,offset StageFileName
	push ax
	mov ax,offset StageBitMap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	pop ax
	ret
endp StageBitmapSetUp

proc SetUpAllAllBattleStatsBitmaps
	
	call SetUpP1TagBitmap
	call SetUpP2TagBitmap
	call SetUpHeartBitmap
	call SetUpAllDigitsBitmap
	
	ret
endp SetUpAllAllBattleStatsBitmaps



proc UpdatePlayer2BattleStats
	push ax
	push dx
	push bx
	push cx
	
@@StartLives:
	mov ax,[LivesLeftP2]
	cmp ax,[PrevLivesLeftP2]
	jne @@EraseHeart
@@AfterAmountUpdate:
	cmp ax,0
	je @@EndLives
	mov bx,PLAYER2HEARTSX
	mov dx,PLAYER2HEARTSY
	mov cx,[LivesLeftP2]
@@NextHeartCollisionCheck:
	push ax
	push bx
	push dx
	call HitboxCollisionCheckHeartWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,1
	je @@ReRenderHeart
@@NextHeart:
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NextHeartCollisionCheck
	jmp @@EndLives
@@ReRenderHeart:
	push bx
	push dx
	call RenderHeart
	jmp @@NextHeart
@@EraseHeart:
	mov bx,PLAYER2HEARTSX
	mov dx,PLAYER2HEARTSY
	mov cx,[LivesLeftP2]
	cmp cx,0
	je @@AfterLastHeartX
@@NotLastHeart:
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NotLastHeart
@@AfterLastHeartX:
	push bx
	push dx
	call EraseHeart
	jmp @@AfterAmountUpdate
@@EndLives:
	
@@StartDamage:
	mov ax,[PrevDamageTakenP2]
	cmp ax,[DamageTakenP2]
	jne @@RenderDamage
	mov cx,3
	mov bx,PLAYER2DAMAGEX
	mov dx,PLAYER2DAMAGEY
	
@@NextDigitCheck:
	push ax
	push bx
	push dx
	call HitboxCollisionCheckDigitWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,1
	je @@RenderDamage
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDigitCheck
	jmp @@EndDamage
@@RenderDamage:
	mov cx,3
	mov bx,PLAYER2DAMAGEX
	mov dx,PLAYER2DAMAGEY
	push ax
	push ax
	push ax
	mov ax,[DamageTakenP2]
	push ax
	call BinaryToDecimal
@@NextDigit:
	pop ax
	push ax
	push bx
	push dx
	call RenderANumber
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDigit
@@EndDamage:
	
@@StartTag:
	push ax
	call HitboxCollisionCheckP2TagWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,0
	je @@EndTag
	call RenderP2Tag
@@EndTag:
	
	
	pop cx
	pop bx
	pop dx
	pop ax
	ret
endp UpdatePlayer2BattleStats


proc UpdatePlayer1BattleStats
	push ax
	push dx
	push bx
	push cx
	
@@StartLives:
	mov ax,[LivesLeftP1]
	cmp ax,[PrevLivesLeftP1]
	jne @@EraseHeart
@@AfterAmountUpdate:
	cmp ax,0
	je @@EndLives
	mov bx,PLAYER1HEARTSX
	mov dx,PLAYER1HEARTSY
	mov cx,[LivesLeftP1]
@@NextHeartCollisionCheck:
	push ax
	push bx
	push dx
	call HitboxCollisionCheckHeartWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,1
	je @@ReRenderHeart
@@NextHeart:
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NextHeartCollisionCheck
	jmp @@EndLives
@@ReRenderHeart:
	push bx
	push dx
	call RenderHeart
	jmp @@NextHeart
@@EraseHeart:
	mov bx,PLAYER1HEARTSX
	mov dx,PLAYER1HEARTSY
	mov cx,[LivesLeftP1]
	cmp cx,0
	je @@AfterLastHeartX
@@NotLastHeart:
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NotLastHeart
@@AfterLastHeartX:
	push bx
	push dx
	call EraseHeart
	jmp @@AfterAmountUpdate
@@EndLives:
	
@@StartDamage:
	mov ax,[PrevDamageTakenP1]
	cmp ax,[DamageTakenP1]
	jne @@RenderDamage
	mov cx,3
	mov bx,PLAYER1DAMAGEX
	mov dx,PLAYER1DAMAGEY
	
@@NextDigitCheck:
	push ax
	push bx
	push dx
	call HitboxCollisionCheckDigitWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,1
	je @@RenderDamage
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDigitCheck
	jmp @@EndDamage
@@RenderDamage:
	mov cx,3
	mov bx,PLAYER1DAMAGEX
	mov dx,PLAYER1DAMAGEY
	push ax
	push ax
	push ax
	mov ax,[DamageTakenP1]
	push ax
	call BinaryToDecimal
@@NextDigit:
	pop ax
	push ax
	push bx
	push dx
	call RenderANumber
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDigit
@@EndDamage:
	
@@StartTag:
	push ax
	call HitboxCollisionCheckP1TagWithPrevP1PrevP1WPrevP2PrevP2W
	pop ax
	cmp ax,0
	je @@EndTag
	call RenderP1Tag
@@EndTag:
	
	
	pop cx
	pop bx
	pop dx
	pop ax
	ret
endp UpdatePlayer1BattleStats



proc StartAllBattleStats
	
	call StartPlayer1BattleStats
	call StartPlayer2BattleStats
	
	ret
endp StartAllBattleStats



proc StartPlayer2BattleStats
	push ax
	push bx
	push dx
	push cx
	
	call RenderP2Tag
	mov ax,0
	mov bx,PLAYER2DAMAGEX
	mov dx,PLAYER2DAMAGEY
	mov cx,3
@@NextDamageDigit:
	push ax
	push bx
	push dx
	call RenderANumber
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDamageDigit
	
	mov bx,PLAYER2HEARTSX
	mov dx,PLAYER2HEARTSY
	mov cx,[LivesLeftP2]
@@NextHeart:
	push bx
	push dx
	call RenderHeart
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NextHeart
	
	pop cx
	pop dx
	pop bx
	pop ax
endp StartPlayer2BattleStats



proc StartPlayer1BattleStats
	push ax
	push bx
	push dx
	push cx
	
	call RenderP1Tag
	mov ax,0
	mov bx,PLAYER1DAMAGEX
	mov dx,PLAYER1DAMAGEY
	mov cx,3
@@NextDamageDigit:
	push ax
	push bx
	push dx
	call RenderANumber
	add bx,DISTANCEBETWEENDIGITS
	add bx,DIGITWIDTH
	loop @@NextDamageDigit
	
	mov bx,PLAYER1HEARTSX
	mov dx,PLAYER1HEARTSY
	mov cx,[LivesLeftP1]
@@NextHeart:
	push bx
	push dx
	call RenderHeart
	add bx,HEARTWIDTH
	add bx,DISTANCEBETWEENHEARTS
	loop @@NextHeart
	
	pop cx
	pop dx
	pop bx
	pop ax
endp StartPlayer1BattleStats





proc SetUpP2TagBitmap
	push ax
	
	mov ax,PLAYERTAGHIGHT
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,offset P2TagName
	push ax
	mov ax,offset P2TagBitmap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	pop ax
	ret
endp SetUpP2TagBitmap


proc SetUpP1TagBitmap
	push ax
	
	mov ax,PLAYERTAGHIGHT
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,offset P1TagName
	push ax
	mov ax,offset P1TagBitmap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	pop ax
	ret
endp SetUpP1TagBitmap

proc RenderP2Tag
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,offset P2TagBitmap
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,PLAYERTAGHIGHT
	push ax
	mov ax,PLAYER2TAGX
	push ax
	mov ax,PLAYER2TAGY
	push ax
	call ShowBitMapInvisColor
	
	pop ax
	ret
endp RenderP2Tag

;Input: empty push
;Output: 0-no collision, 1-collision
proc HitboxCollisionCheckP2TagWithPrevP1PrevP1WPrevP2PrevP2W
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,PLAYER2TAGX
	push ax
	mov ax,PLAYER2TAGY
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,PLAYERTAGHIGHT
	push ax
	call HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp HitboxCollisionCheckP2TagWithPrevP1PrevP1WPrevP2PrevP2W

proc RenderP1Tag
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,offset P1TagBitmap
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,PLAYERTAGHIGHT
	push ax
	mov ax,PLAYER1TAGX
	push ax
	mov ax,PLAYER1TAGY
	push ax
	call ShowBitMapInvisColor
	
	pop ax
	ret
endp RenderP1Tag

;Input: empty push
;Output: 0-no collision, 1-collision
proc HitboxCollisionCheckP1TagWithPrevP1PrevP1WPrevP2PrevP2W
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,PLAYER1TAGX
	push ax
	mov ax,PLAYER1TAGY
	push ax
	mov ax,PLAYERTAGWIDTH
	push ax
	mov ax,PLAYERTAGHIGHT
	push ax
	call HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W
	pop ax
	mov [bp+4],ax
	
	pop ax
	pop bp
	ret
endp HitboxCollisionCheckP1TagWithPrevP1PrevP1WPrevP2PrevP2W



;Input: 3 empty pushes, number smaller then 1000
;Output: hundredes digit, tens digit, singles digit
proc BinaryToDecimal
	push bp
	mov bp,sp
	push ax
	push dx
	push bx
	
	mov bx,10
	mov ax,[bp+4]
	xor dx,dx
	div bx
	mov [word bp+10],dx
	xor dx,dx
	div bx
	mov [word bp+8],dx
	xor dx,dx
	div bx
	mov [word bp+6],dx
	
	pop bx
	pop dx
	pop ax
	pop bp
	ret 2
endp BinaryToDecimal

;Input: empty push, x position, y position
;Output: 0-no collision, 1-collision
proc HitboxCollisionCheckDigitWithPrevP1PrevP1WPrevP2PrevP2W
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,DIGITWIDTH
	push ax
	mov ax,DIGITHIGHT
	push ax
	call HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp HitboxCollisionCheckDigitWithPrevP1PrevP1WPrevP2PrevP2W



;Input: number, x position, y position
;Output: none
proc RenderANumber
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	cmp [word bp+8],1
	je @@1
	cmp [word bp+8],2
	je @@2
	cmp [word bp+8],3
	je @@3
	cmp [word bp+8],4
	je @@4
	cmp [word bp+8],5
	je @@5
	cmp [word bp+8],6
	je @@6
	cmp [word bp+8],7
	je @@7
	cmp [word bp+8],8
	je @@8
	cmp [word bp+8],9
	je @@9
@@0:
	call RenderDigit0
	jmp @@EndOfMethod
@@1:
	call RenderDigit1
	jmp @@EndOfMethod
@@2:
	call RenderDigit2
	jmp @@EndOfMethod
@@3:
	call RenderDigit3
	jmp @@EndOfMethod
@@4:
	call RenderDigit4
	jmp @@EndOfMethod
@@5:
	call RenderDigit5
	jmp @@EndOfMethod
@@6:
	call RenderDigit6
	jmp @@EndOfMethod
@@7:
	call RenderDigit7
	jmp @@EndOfMethod
@@8:
	call RenderDigit8
	jmp @@EndOfMethod
@@9:
	call RenderDigit9
	jmp @@EndOfMethod
@@EndOfMethod:
	
	pop ax
	pop bp
	ret 6
endp RenderANumber



;Input: x position, y position
;Output: renders digit 9
proc RenderDigit9
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit9Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit9



;Input: x position, y position
;Output: renders digit 8
proc RenderDigit8
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit8Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit8




;Input: x position, y position
;Output: renders digit 7
proc RenderDigit7
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit7Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit7




;Input: x position, y position
;Output: renders digit 6
proc RenderDigit6
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit6Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit6




;Input: x position, y position
;Output: renders digit 5
proc RenderDigit5
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit5Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit5



;Input: x position, y position
;Output: renders digit 4
proc RenderDigit4
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit4Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit4



;Input: x position, y position
;Output: renders digit 3
proc RenderDigit3
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit3Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit3


;Input: x position, y position
;Output: renders digit 2
proc RenderDigit2
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit2Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit2




;Input: x position, y position
;Output: renders digit 1
proc RenderDigit1
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit1Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit1


;Input: x position, y position
;Output: renders digit 0
proc RenderDigit0
	push bp
	mov bp,sp
	push ax
	
	mov ax,offset Digit0Bitmap
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call RenderDigit
	
	pop ax
	pop bp
	ret 4
endp RenderDigit0





;Input: digit bit map offset , x position, y position
;Output: renders digit
proc RenderDigit
	push bp
	mov bp,sp
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,DIGITWIDTH
	push ax
	mov ax,DIGITHIGHT
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call ShowBitMapInvisColor
	
	pop ax
	pop bp
	ret 6
endp RenderDigit



proc SetUpAllDigitsBitmap
	
	call SetUpDigit0Bitmap
	call SetUpDigit1Bitmap
	call SetUpDigit2Bitmap
	call SetUpDigit3Bitmap
	call SetUpDigit4Bitmap
	call SetUpDigit5Bitmap
	call SetUpDigit6Bitmap
	call SetUpDigit7Bitmap
	call SetUpDigit8Bitmap
	call SetUpDigit9Bitmap
	
	ret
endp SetUpAllDigitsBitmap


proc SetUpDigit9Bitmap
	push ax
	
	mov ax,offset Digit9Name
	push ax
	mov ax,offset Digit9Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit9Bitmap

proc SetUpDigit8Bitmap
	push ax
	
	mov ax,offset Digit8Name
	push ax
	mov ax,offset Digit8Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit8Bitmap

proc SetUpDigit7Bitmap
	push ax
	
	mov ax,offset Digit7Name
	push ax
	mov ax,offset Digit7Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit7Bitmap

proc SetUpDigit6Bitmap
	push ax
	
	mov ax,offset Digit6Name
	push ax
	mov ax,offset Digit6Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit6Bitmap

proc SetUpDigit5Bitmap
	push ax
	
	mov ax,offset Digit5Name
	push ax
	mov ax,offset Digit5Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit5Bitmap

proc SetUpDigit4Bitmap
	push ax
	
	mov ax,offset Digit4Name
	push ax
	mov ax,offset Digit4Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit4Bitmap

proc SetUpDigit3Bitmap
	push ax
	
	mov ax,offset Digit3Name
	push ax
	mov ax,offset Digit3Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit3Bitmap

proc SetUpDigit2Bitmap
	push ax
	
	mov ax,offset Digit2Name
	push ax
	mov ax,offset Digit2Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit2Bitmap

proc SetUpDigit1Bitmap
	push ax
	
	mov ax,offset Digit1Name
	push ax
	mov ax,offset Digit1Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit1Bitmap

proc SetUpDigit0Bitmap
	push ax
	
	mov ax,offset Digit0Name
	push ax
	mov ax,offset Digit0Bitmap
	push ax
	call SetUpDigitBitmap
	
	pop ax
	ret
endp SetUpDigit0Bitmap


;Input: digit file name offset, digit bitmap offset
;Output: none
proc SetUpDigitBitmap
	push bp
	mov bp,sp
	push ax
	
	mov ax,DIGITHIGHT
	push ax
	mov ax,DIGITWIDTH
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	pop ax
	pop bp
	ret 4
endp SetUpDigitBitmap

;Input: empty push, x position, y position
;Output: 0-no collision, 1-collision
proc HitboxCollisionCheckHeartWithPrevP1PrevP1WPrevP2PrevP2W
	push bp
	mov bp,sp
	push ax
	
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,HEARTWIDTH
	push ax
	mov ax,HEARTHIGHT
	push ax
	call HitboxCollisionCheckWithPrevPlayer1PrevPlayer1WPrevPlayer2PrevPlayer2W
	pop ax
	mov [bp+8],ax
	
	pop ax
	pop bp
	ret 4
endp HitboxCollisionCheckHeartWithPrevP1PrevP1WPrevP2PrevP2W


;Input: x position, y position
;Output: renders heart
proc RenderHeart
	push bp
	mov bp,sp
	push ax
	
	mov ax,[InvisibleColorPlace]
	push ax
	mov ax,offset HeartBitmap
	push ax
	mov ax,HEARTWIDTH
	push ax
	mov ax,HEARTHIGHT
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call ShowBitMapInvisColor
	
	pop ax
	pop bp
	ret 4
endp RenderHeart


;Input: x position, y position
;Output: none
proc EraseHeart
	push bp
	mov bp,sp
	push ax
	
	;Input: length, hight, left up x position, left up y position
	mov ax,HEARTWIDTH
	push ax
	mov ax,HEARTHIGHT
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,[bp+4]
	push ax
	call EraseWBlack
	
	pop ax
	pop bp
	ret 4
endp EraseHeart



proc SetUpHeartBitmap
	push ax
	
	mov ax,HEARTHIGHT
	push ax
	mov ax,HEARTWIDTH
	push ax
	mov ax,offset HeartName
	push ax
	mov ax,offset HeartBitmap
	push ax
	call OpenAndReadOnlyBMPBitMap
	
	pop ax
	ret
endp SetUpHeartBitmap



proc RenderDrawScreen
	
	call RenderDrawText
	call RenderSpaceConText
	
	ret
endp RenderDrawScreen



proc RenderDrawText
	push ax
	
	mov ax,offset DrawTextName
	push ax
	mov ax,DRAWTEXTX
	push ax
	mov ax,DRAWTEXTY
	push ax
	mov ax,DRAWTEXTHIGHT
	push ax
	mov ax,DRAWTEXTWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderDrawText




proc RenderSpaceConText
	push ax
	
	mov ax,offset SpaceConTextName
	push ax
	mov ax,SPACECONTEXTX
	push ax
	mov ax,SPACECONTEXTY
	push ax
	mov ax,SPACECONTEXTHIGHT
	push ax
	mov ax,SPACECONTEXTWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderSpaceConText



proc RenderPauseText
	push ax
	
	mov ax,offset PauseTextName
	push ax
	mov ax,PAUSETEXTX
	push ax
	mov ax,PAUSETEXTY
	push ax
	mov ax,PAUSETEXTHIGHT
	push ax
	mov ax,PAUSETEXTWIDTH
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderPauseText




proc ErasePauseText
	push ax
	
	mov ax,PAUSETEXTWIDTH
	push ax
	mov ax,PAUSETEXTHIGHT
	push ax
	mov ax,PAUSETEXTX
	push ax
	mov ax,PAUSETEXTY
	push ax
	call EraseWBlack
	
	pop ax
	ret
endp ErasePauseText




proc RenderEmptySelectScreen
	push ax
	
	mov ax,offset SelectionScreenName
	push ax
	mov ax,0
	push ax
	push ax
	mov ax,200
	push ax
	mov ax,320
	push ax
	mov ax,[InvisibleColorPlace]
	push ax
	call OpenShowBMPInvisColorNoPalette
	
	pop ax
	ret
endp RenderEmptySelectScreen


;reads the bit map of the bmp file
;Requirements: none
;Methods required: ReadFromFile, OpenFileForRead, CloseFile, ReadBMPBitMap
;Input: image width, image hight,  BMP file name in ASCIZ, bit map offset
;Output: reads the bit map into the array given 
;[bp-2] = file handle
;[bp+4] = bit map
;[bp+6] = file name ASCIZ
;[bp+8] = image width
;[bp+10] = image hight
proc OpenAndReadOnlyBMPBitMap
	push bp
	mov bp,sp
	sub sp,2
	push ax
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	call OpenFileForRead
	pop ax
	pop ax
	mov [bp-2],ax
	
	mov ax,[bp-2]
	push ax
	call SkipBMPFileHeader
	
	mov ax,[bp-2]
	push ax
	call SkipBMPFilePalette
	
	
	mov ax,[bp-2]
	push ax
	mov ax,[bp+4]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+10]
	push ax
	call ReadBMPBitMap
	
	mov ax,[bp-2]
	push ax
	call CloseFile
	
	pop ax
	add sp,2
	pop bp
	ret 8
endp OpenAndReadOnlyBMPBitMap


;reads the header of the bmp file in input
;Requirements: BMP file needs to be open for reading , the file pointer needs to be at 0
;Methods required: ReadFromFile
;Input: BMP file handle, header data array offset (the array needs to be 54 bytes)
;Output: reads the header of the BMP file into the array given in the input
proc ReadBMPHeader
	push bp
	mov bp,sp
	push ax

	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,54
	push ax
	mov ax,[bp+4]
	push ax
	call ReadFromFile
	pop ax
	pop ax

	pop ax
	pop bp
	ret 4
endp ReadBMPHeader


;reads the palette of the bmp file in input
;Requirements: BMP file needs to be open for reading,(the file pointer need to be after 54)
;Methods required: ReadFromFile
;Input: BMP file handle, palette data array offset (the array needs to be 400h bytes)
;Output: reads the palette of the BMP file into the array given in the input
proc ReadBMPPalette
	push bp
	mov bp,sp
	push ax
	
	
	
	push ax
	push ax
	mov ax,[bp+6]
	push ax
	mov ax,400h
	push ax
	mov ax,[bp+4]
	push ax
	call ReadFromFile
	pop ax
	pop ax

	pop ax
	pop bp
	ret 4
endp ReadBMPPalette



;same as CopyBmpPalette but gives the place of the invisible color in the screen memory
;Requirements: a full BMP file palette
;Methods required: none
;Input:one empty push, palette offset, red value of the invisible color, green value of the invisible color, blue value of invisible color
;Output: puts the palette in the screen memory, returns the place of the invisible in screen memory
proc SyncBmpPaletteInvisColor		near

	push bp
	mov bp,sp
	push cx
	push dx
	push ax
	push si
	push bx
	push di

	xor di,di
	mov si,[bp+10]
	mov cx,256
	mov dx,3C8h
	mov al,0  ; black first
	out dx,al ;3C8h
	inc dx	  ;3C9h
@@CopyNextColor:
	mov al,[si+2] 		; Red
	mov bx,[bp+8]
	cmp al,bl
	jnz @@notRinvis
	inc di
@@notRinvis:
	shr al,2 			; divide by 4 Max (cos max is 63 and we have here max 255 ) (loosing color resolution).
	out dx,al
	mov al,[si+1] 		; Green.
	mov bx,[bp+6]
	cmp al,bl
	jnz @@notGinvis
	inc di
@@notGinvis:
	shr al,2
	out dx,al
	mov al,[si] 		; Blue.
	mov bx,[bp+4]
	cmp al,bl
	jnz @@notBinvis
	inc di
@@notBinvis:
	shr al,2
	out dx,al
	add si,4 			; Point to next color.  (4 bytes for each color BGR + null)
	
	cmp di,3
	jnz @@notInviscolor
	mov [bp+12],cx
@@notInviscolor:
	xor di,di
	loop @@CopyNextColor
	mov ax,256
	sub ax,[bp+12]
	mov [bp+12],ax


	pop di
	pop bx
	pop si
	pop ax
	pop dx
	pop cx
	pop bp
	ret 8
endp SyncBmpPaletteInvisColor



;renders the bit map in the input mirrored with an invisible color
;Requirements: the invisible color place in the palette given by SyncBmpPaletteInvisColor
;Methods required: none
;Input: invisible color place in screen given by SyncBmpPaletteInvisColor ,bit map offset, image length, image hight, image x position, image y position
;Output: renders the bit map mirrored given in the input in the given coordinate(they act as the position of the top left part of the image) 
proc ShowBitMapInvisColorMirror
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	cmp [word bp+8],0
	jbe @@EndOfMethod
	cmp [word bp+10],0
	jbe @@EndOfMethod
	
	mov ax, 0A000h
	mov es, ax


	mov si,[bp+12]
	mov cx,[bp+8]
	mov dx,[bp+6]
	cld
@@nextline:
	push cx
	push dx

	mov di,cx  ; Current Row at the small bmp (each time -1)
	add di,[bp+4] ; add the Y on entire screen


	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx
	
	add di,[bp+10];makes di point to right
	dec di;bp+10 is width, width+x position is 1 more then the right side 
	
	mov cx,[bp+10]
	
	mov al,[bp+14]
	
@@next:
	
	cmp [si],al
	jz @@Invis
	movsb
	sub di,2
	loop @@next
	jmp @@afterline
@@Invis:
	inc si
	dec di
	loop @@next
@@afterline:

	pop dx
	pop cx
	loop @@nextline
@@EndOfMethod:


	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 12
endp ShowBitMapInvisColorMirror






;renders the bit map in the input mirrored with an invisible color
;Requirements: the invisible color place in the palette given by SyncBmpPaletteInvisColor
;Methods required: none
;Input: invisible color place in screen given by SyncBmpPaletteInvisColor ,bit map offset, image length, image hight, image x position, image y position, relative x in bitmap(from top left), relative y in bitmap(from top left) , full bitmap width, full bitmap hight
;Output: renders the bit map mirrored given in the input in the given coordinate(they act as the position of the top left part of the image) 
;[bp+4] = full bitmap hight
;[bp+6] = full bitmap width
;[bp+8] = relative y in bitmap(from top left)
;[bp+10] = relative x in bitmap(from top left)
;[bp+12] = image y position
;[bp+14] = image x position
;[bp+16] = image hight
;[bp+18] = image width
;[bp+20] = bitmap offset
;[bp+22] = invisible color place
proc ShowPartialBitMapInvisColorMirror
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	cmp [word bp+16],0
	jbe @@EndOfMethod
	cmp [word bp+18],0
	jbe @@EndOfMethod
	
	
	mov si,[bp+20]
	mov ax,[bp+8]
	add ax,[bp+16]
	mov bx,[bp+4]
	sub bx,ax
	mov ax,[bp+6]
	mul bx
	add si,ax
	;add si,[bp+4]
	sub si,[bp+10]
	;add si,[bp+10]
	;cmp [word bp+14],160
	;jl @@AfterFix
	;mov ax,[bp+14]
	;add ax,[bp+18]
	;sub ax,320
	;sub si,ax
	;add si,ax
@@AfterFix:
	
	mov dx,[bp+22]
	mov cx,[bp+16]
	mov bx,[bp+12]
	add bx,cx
	dec bx
	
	
@@NextLine:
	mov ax,[bp+6]
	push ax
	push dx
	push si
	mov ax,[bp+18]
	push ax
	mov ax,1
	push ax
	mov ax,[bp+14]
	push ax
	push bx
	call ShowBitMapInvisColorMirrorRunBack
	
	add si,[bp+6]
	dec bx
	loop @@NextLine
	
@@EndOfMethod:


	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 20
endp ShowPartialBitMapInvisColorMirror





;this is for ShowPartialBitMapInvisColorMirror
;renders the bit map in the input mirrored with an invisible color
;Requirements: the invisible color place in the palette given by SyncBmpPaletteInvisColor
;Methods required: none
;Input: invisible color place in screen given by SyncBmpPaletteInvisColor ,bit map offset, image length, image hight, image x position, image y position
;Output: renders the bit map mirrored given in the input in the given coordinate(they act as the position of the top left part of the image) 
proc ShowBitMapInvisColorMirrorRunBack
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	cmp [word bp+8],0
	jbe @@EndOfMethod
	cmp [word bp+10],0
	jbe @@EndOfMethod
	
	mov ax, 0A000h
	mov es, ax


	mov si,[bp+12]
	add si,[bp+16]
	dec si
	mov cx,[bp+8]
	mov dx,[bp+6]
	std
@@nextline:
	push cx
	push dx

	mov di,cx  ; Current Row at the small bmp (each time -1)
	add di,[bp+4] ; add the Y on entire screen


	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx
	
	;add di,[bp+10];makes di point to right
	;dec di;bp+10 is width, width+x position is 1 more then the right side 
	
	mov cx,[bp+10]
	
	mov al,[bp+14]
	push si
	
@@next:
	
	cmp [si],al
	jz @@Invis
	movsb
	add di,2
	loop @@next
	jmp @@afterline
@@Invis:
	dec si
	inc di
	loop @@next
@@afterline:
	pop si
	add si,[bp+16]
	dec si

	pop dx
	pop cx
	loop @@nextline
@@EndOfMethod:


	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 14
endp ShowBitMapInvisColorMirrorRunBack








;renders the bit map in the input with an invisible color
;Requirements: the invisible color place in the palette given by SyncBmpPaletteInvisColor
;Methods required: none
;Input: invisible color place in screen given by SyncBmpPaletteInvisColor ,bit map offset, image length, image hight, image x position, image y position
;Output: renders the bit map given in the input in the given coordinate(they act as the position of the top left part of the image) 
proc ShowBitMapInvisColor
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	cmp [word bp+8],0
	jbe @@EndOfMethod
	cmp [word bp+10],0
	jbe @@EndOfMethod

	mov ax, 0A000h
	mov es, ax


	mov si,[bp+12]
	mov cx,[bp+8]
	mov dx,[bp+6]
	cld
@@nextline:
	push cx
	push dx

	mov di,cx  ; Current Row at the small bmp (each time -1)
	add di,[bp+4] ; add the Y on entire screen


	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx
	
	
	mov cx,[bp+10]
	
	mov al,[bp+14]
	
@@next:
	
	cmp [si],al
	jz @@Invis
	movsb
	loop @@next
	jmp @@afterline
@@Invis:
	inc si
	inc di
	loop @@next
@@afterline:

	pop dx
	pop cx
	loop @@nextline
@@EndOfMethod:

	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 12
endp ShowBitMapInvisColor






;renders a part of the bit map (can be all) in the input with an invisible color
;Requirements: the invisible color place in the palette given by SyncBmpPaletteInvisColor
;Methods required: none
;Input: invisible color place in screen given by SyncBmpPaletteInvisColor ,bit map offset, image length, image hight, image x position, image y position, relative x in bitmap(from top left), relative y in bitmap(from top left) , full bitmap width, full bitmap hight
;Output: renders the part bit map given in the input in the given coordinate(they act as the position of the top left part of the image)
;[bp+4] = full bitmap hight
;[bp+6] = full bitmap width
;[bp+8] = relative y in bitmap(from top left)
;[bp+10] = relative x in bitmap(from top left)
;[bp+12] = image y position
;[bp+14] = image x position
;[bp+16] = image hight
;[bp+18] = image width
;[bp+20] = bitmap offset
;[bp+22] = invisible color place
;
proc ShowPartialBitMapInvisColor
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push si
	push di
	
	
	cmp [word bp+16],0
	jbe @@EndOfMethod
	cmp [word bp+18],0
	jbe @@EndOfMethod
	
	
	mov si,[bp+20]
	mov ax,[bp+8]
	add ax,[bp+16]
	mov bx,[bp+4]
	sub bx,ax
	mov ax,[bp+6]
	mul bx
	add si,ax
	add si,[bp+10]
	
	
	mov dx,[bp+22]
	mov cx,[bp+16]
	mov bx,[bp+12]
	add bx,cx
	dec bx
	
	
@@NextLine:
	push dx
	push si
	mov ax,[bp+18]
	push ax
	mov ax,1
	push ax
	mov ax,[bp+14]
	push ax
	push bx
	call ShowBitMapInvisColor
	
	add si,[bp+6]
	dec bx
	loop @@NextLine
	
@@EndOfMethod:

	pop di
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 20;20
endp ShowPartialBitMapInvisColor






; BMP graphics are saved upside-down.
; Read the graphic line by line (BmpRowSize lines in VGA format),
; displaying the lines from bottom to top.

;same as CopyBmpPalette but gives the place of the invisible color in the screen memory
;Requirements: an open bmp file for reading
;Methods required: ReadFromFile
;Input: invisible color place in screen givin by CopyBmpPaletteInvisColor ,file handle, image length, image hight, image x position, image y position
;Output: shows the BMP file in the position givin

proc ShowBMPInvisColor
	push bp
	mov bp,sp
	
	sub sp,8
	sub sp,[bp+10]
	push cx
	push bx
	push ax
	push dx
	push di
	push si
	push ds
	
	mov ax,ss
	mov ds,ax

	mov ax, 0A000h
	mov es, ax

	mov cx,[bp+8]


	mov ax,[bp+10] ; row size must dived by 4 so if it less we must calculate the extra padding bytes
	xor dx,dx
	mov si,4
	div si
	cmp dx,0
	mov [word bp-2],0
	jz @@row_ok
	mov [word bp-2],4
	sub [word bp-2],dx

@@row_ok:
	mov dx,[bp+6]

@@NextLine:
	push cx
	push dx

	mov di,cx  ; Current Row at the small bmp (each time -1)
	add di,[bp+4] ; add the Y on entire screen


	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx

	; small Read one line
	mov ah,3fh
	mov bx,[bp+12]
	mov cx,[bp+10]
	add cx,[bp-2]  ; extra  bytes to each row must be divided by 4
	mov dx,bp
	sub dx,[bp+10]
	sub dx,8
	int 21h
	; Copy one line into video memory
	cld ; Clear direction flag, for movsb
	mov cx,[bp+10]
	mov si,bp
	sub si,[bp+10]
	sub si,8
	mov al,[bp+14]

@@next:
	
	cmp [si],al
	jz @@Invis
	movsb
	loop @@next
	jmp @@afterline
@@Invis:
	inc si
	inc di
	loop @@next
@@afterline:

	pop dx
	pop cx

	loop @@NextLine

	pop ds
	pop si
	pop di
	pop dx
	pop ax
	pop bx
	pop cx
	add sp,[bp+10]
	add sp,8
	pop bp
	ret 12
endp ShowBMPInvisColor






;Input: file name offset, x position, y position, image hight, image width, invisible color place
;Output: renders image
;[bp+4] = invisible color
;[bp+6] = width
;[bp+8] = hight
;[bp+10] = y position
;[bp+12] = x position
;[bp+14] = file name offset

proc OpenShowBMPInvisColorNoPalette
	push bp
	mov bp,sp
	push ax
	push bx
	
	push ax
	push ax
	mov ax,[bp+14]
	push ax
	call OpenFileForRead
	pop ax
	pop bx
	
	push bx
	call SkipBMPFileHeader
	
	push bx
	call SkipBMPFilePalette
	
	mov ax,[bp+4]
	push ax
	push bx
	mov ax,[bp+6]
	push ax
	mov ax,[bp+8]
	push ax
	mov ax,[bp+12]
	push ax
	mov ax,[bp+10]
	push ax
	call ShowBMPInvisColor
	
	push bx
	call CloseFile
	
	pop bx
	pop ax
	pop bp
	ret 12
endp OpenShowBMPInvisColorNoPalette

;Input: file handle
;Output: changes the position in the file to after the header




;reads the bit map of the file
;Requirements: BMP file needs to be open for reading , the file pointer needs to be at the start of the bit map
;Methods required: ReadFromFile, SetFilePositionFromCurrentPosition
;Input: file handle, bit map offset, image width, image hight
;Output: reads the bit map into the array WITHOUT THE WORTHLESS BYTES FROM THE ROUND UP TO 4
proc ReadBMPBitMap
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push di
	push si
	
	mov ax,[bp+6]
	mov bx ,4
	xor dx,dx
	div bx
	xor ax,ax
	cmp dx,0
	je @@afterextracheck
	mov ax,4
	sub ax,dx
@@afterextracheck:
	mov cx,[bp+4]
	mov si,[bp+10]
	mov di,[bp+8]
	mov dx,[bp+6]
	xor bx,bx
	
@@nextline:
	
	push ax
	
	push ax
	push ax
	
	push si
	push dx
	push di
	
	call ReadFromFile
	pop ax
	pop ax
	
	pop ax
	
	push si
	push bx; bx ax   0000ax 
	push ax;
	call SetFilePositionFromCurrentPosition
	
	add di,dx
	
	loop @@nextline
	
	pop si
	pop di
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	ret 8
endp ReadBMPBitMap


;Requirements: a file
;Methods required: none
;Input:(needs 2 empty pushes for return values) file name in ASCIZ offset(through the stack)
;Output: 1.returns if it was successful (0 if yes 1 if no) 
;		 2.the handle/error code 
;(all in stack)
proc OpenFileForRead	near						 
	push bp
	mov bp,sp
	push ax
	push dx
	
	mov dx,[bp+4]
	mov ah, 3Dh
	xor al, al
	int 21h
	jc @@ErrorAtOpen
	mov [word bp+6], 0000
	jmp @@ExitProc
@@ErrorAtOpen:
	mov [word bp +6],0001
@@ExitProc:
	mov [bp+8],ax
	
	pop dx
	pop ax
	pop bp
	ret 2
endp OpenFileForRead



;Requirements: file needs to be open
;Methods required: none
;Input:(no need for empty pushes) file handle (through the stack)
;Output: closes the file
proc CloseFile
	push bp
	mov bp,sp
	push bx
	push ax
	
	mov bx,[bp+4];the handle  
	mov ah, 3eh
	int 21h

	pop ax
	pop bx
	pop bp
	ret 2
endp CloseFile

;Requirements: file needs to be open for reading
;Methods required: none
;Input:(needs 2 empty pushes for return values) file handle , amount of bytes to read, data buffer offset
;Output: 1. if it was successful (0 if yes 1 if no)
;		 2. the amount of bytes actually read
;(all in stack)
proc ReadFromFile
	push bp
	mov bp,sp
	push bx
	push cx
	push dx
	push ax

	mov dx,[bp+4];data buffer offset
	mov cx,[bp+6];number of bytes to read
	mov bx,[bp+8]; file handle
	mov ah,3fh
	int 21h
	jc @@ErrorAtRead
	mov [word bp+10],0000
	jmp @@ExitProc
@@ErrorAtRead:
	mov [word bp+10],0001
@@ExitProc:	
	mov [bp+12],ax
	
	pop ax
	pop dx
	pop cx
	pop bx
	pop bp
	ret 6
endp ReadFromFile

;moves the position in the file to after the header
;Info: needs SetFilePositionFromCurrentPosition and an open file
;Input: file handle
;Output: changes the position in the file to after the header
proc SkipBMPFileHeader
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+4]
	push ax
	xor ax,ax
	push ax

	mov ax,54
	push ax
	call SetFilePositionFromCurrentPosition
	
	pop ax
	pop bp
	ret 2
endp SkipBMPFileHeader

;moves the position int the file to after the palette 
;Info: needs SetFilePositionFromCurrentPosition and an open file
;Input: file handle
;Output: changes the position in the file to after the palette
proc SkipBMPFilePalette
	push bp
	mov bp,sp
	push ax
	
	mov ax,[bp+4]
	push ax
	xor ax,ax
	push ax
	mov ax,400h
	push ax
	call SetFilePositionFromCurrentPosition
	
	pop ax
	pop bp
	ret 2
endp SkipBMPFilePalette


;Requirements: open file
;Methods required: none
;Input:file handle , offset from current position in file(2 words) big endian
;Output: moves file pointer
;(all in stack) 
proc SetFilePositionFromCurrentPosition
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push dx
	
	mov ah,42h
	mov al,1
	mov bx,[bp+8]
	mov cx,[bp+6]
	mov dx,[bp+4]
	int 21h
	
	pop dx
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
endp SetFilePositionFromCurrentPosition
 



;sets the mode to graphic
;doesn't save ax
proc  SetGraphic
	mov ax,13h   ; 320 X 200 
				 ;Mode 13h is an IBM VGA BIOS mode. It is the specific standard 256-color mode 
	int 10h
	ret
endp 	SetGraphic

;exits graphic mode
;doesn't save ax
proc ExitGraphic
	mov ax,2
	int 10h
	ret

endp ExitGraphic



;delays the program without doing anything
proc LoopDelayQSec
	push cx
	
	mov cx ,200
@@Self1:
	
	push cx
	mov cx,490 ;1500

@@Self2:	
	loop @@Self2
	
	pop cx
	loop @@Self1
	
	pop cx
	ret
endp LoopDelayQSec



proc ResetKeys
	
	mov [MoveLeftPlayer1Key],0
	mov [Dkey],0
	mov [Ckey],0
	mov [Fkey],0
	mov [MoveLeftPlayer2Key],0
	mov [MoveRightPlayer2Key],0
	mov [Player2RegularAttackKey],0
	mov [Player2JumpKey],0
	mov [Pkey],0
	mov [SpaceBar],0
	mov [Esckey],0
	
	ret
endp ResetKeys



;new keyboard event interrupt
proc KeyboardInterrupt  far
	pusha
	push ds
	;mov ax,@data
	;mov ds,ax
	in al,60h
	

	cmp al,020h
	je DkeyDown
	cmp al,0a0h
	je DkeyUp
	cmp al,1eh
	je AkeyDown
	cmp al,9eh
	je AkeyUp
	cmp al,2eh
	je CkeyDown
	cmp al,0aeh
	je CkeyUp
	cmp al,21h
	je FkeyDown
	cmp al,0a1h
	je FkeyUp
	cmp al,4Dh
	je RightArrowDown
	cmp al,0CDh
	je RightArrowUp
	cmp al,4Bh
	je LeftArrowDown
	cmp al,0CBh
	je LeftArrowUp
	cmp al,35h
	je SlashDown
	cmp al,0B5h
	je SlashUp
	cmp al,34h
	je DotDown
	cmp al,0B4h
	je DotUp
	cmp al,39h
	je SpaceBarDown
	cmp al,0b9h
	je SpaceBarUp
	cmp al,19h
	je PkeyDown
	cmp al,99h
	je PkeyUp
	cmp al,01h
	je EsckeyDown
	cmp al,81h
	je EsckeyUp
	jmp NoImportantkey
	

	
DkeyDown:
	mov bl,[Dkey]
	mov [PrevDkey],bl
	mov [Dkey],1
	jmp exitKeyboardInt

DkeyUp:
	mov bl,[Dkey]
	mov [PrevDkey],bl
	mov [Dkey],0
	jmp exitKeyboardInt

AkeyDown:
	mov bl,[MoveLeftPlayer1Key]
	mov [PrevAkey],bl
	mov [MoveLeftPlayer1Key],1
	jmp exitKeyboardInt

AkeyUp:
	mov bl,[MoveLeftPlayer1Key]
	mov [PrevAkey],bl
	mov [MoveLeftPlayer1Key],0
	jmp exitKeyboardInt

CkeyDown:
	mov [Ckey],1
	jmp exitKeyboardInt

CkeyUp:
	mov [Ckey],0
	jmp exitKeyboardInt
	
FkeyDown:
	mov [Fkey],1
	jmp exitKeyboardInt
	
FkeyUp:
	mov [Fkey],0
	jmp exitKeyboardInt
	
RightArrowDown:
	mov [MoveRightPlayer2Key],1
	jmp exitKeyboardInt
	
RightArrowUp:
	mov [MoveRightPlayer2Key],0
	jmp exitKeyboardInt
	
LeftArrowDown:
	mov [MoveLeftPlayer2Key],1
	jmp exitKeyboardInt
	
LeftArrowUp:
	mov [MoveLeftPlayer2Key],0
	jmp exitKeyboardInt
	
DotDown:
	mov [Player2JumpKey],1
	jmp exitKeyboardInt
	
DotUp:
	mov [Player2JumpKey],0
	jmp exitKeyboardInt
	
SlashDown:
	mov [Player2RegularAttackKey],1
	jmp exitKeyboardInt
	
SlashUp:
	mov [Player2RegularAttackKey],0
	jmp exitKeyboardInt
	
SpaceBarDown:
	mov [SpaceBar],1
	jmp exitKeyboardInt
	
SpaceBarUp:
	mov [SpaceBar],0
	jmp exitKeyboardInt
	
PkeyDown:
	mov [Pkey],1
	jmp exitKeyboardInt
	
PkeyUp:
	mov [Pkey],0
	jmp exitKeyboardInt
	
EsckeyDown:
	mov [Esckey],1
	jmp exitKeyboardInt	

EsckeyUp:
	mov [Esckey],0
	jmp exitKeyboardInt

NoImportantkey:
	jmp exitKeyboardInt

exitKeyboardInt:
	
	push ax        
	mov al,20h  ; EOI end  of interupt
	out 20h,AL                
	pop ax
	sti	
	pop ds
	popa
	iret
endp KeyboardInterrupt
 

;sets the keaboard event interrupt to new interrupt
proc setKeyboradInterrupt
	mov ax,keyboardInterruptPOS
	mov bx,offset currentInterruptPOS
	mov [word ptr bx],ax
	mov bx,offset currentInterruptOFFSET
	mov ax,offset KeyboardInterrupt
	mov [word ptr bx],ax
	call SetInterrupt          
	mov bx,offset CurrentOldInterruptOffset
	mov ax,[word ptr bx]
	mov bx,offset OldKeyboardInterruptOffset
	mov [word ptr bx],ax
	mov bx,offset CurrentOldInterruptSegment
	mov ax,[word ptr bx]
	mov bx,offset OldKeyboardInterruptSegment
	mov [word ptr bx],ax 
	ret 
endp 	setKeyboradInterrupt


;restores the old keayborad even interrupt
proc restoreKeyboradInterrupt
	mov bx,offset OldKeyboardInterruptOffset
	mov ax,[word ptr bx]
	mov bx,offset CurrentOldInterruptOffset
	mov [word ptr bx],ax
	mov bx,offset OldKeyboardInterruptSegment
	mov ax,[word ptr bx]
	mov bx,offset CurrentOldInterruptSegment
	mov [word ptr bx],ax 
	mov ax,keyboardInterruptPOS
	mov bx,offset currentInterruptPOS
	mov [word ptr bx],ax
	call RestoreOldInterrupt	
	ret
endp 	restoreKeyboradInterrupt
	

;sets a new interrupt
proc SetInterrupt
	pusha
	push es
	push si
	xor ax,ax
	mov es,ax
	
	xor ax,ax
	mov bx,offset currentInterruptPOS 
	mov al,[byte ptr bx]
	mov si,ax
	mov dx,[word ptr es:si]
	mov cx,[word ptr es:si+2]
	
	mov bx,offset CurrentOldInterruptOffset
	mov [word ptr bx],dx       
	mov bx,offset CurrentOldInterruptSegment  
	mov [word ptr bx],cx       
	cli       
	mov bx,offset currentInterruptOFFSET	       
	mov ax,[word ptr bx]
	xor cx,cx
	mov es,cx	
	mov [word ptr es:si],ax
	mov ax,cs
	mov [word ptr es:si+2],ax
	pop si
	pop es
	sti                ; set interrupt flag        
	popa
ret
endp SetInterrupt

;restores an old interrupt
proc RestoreOldInterrupt
	pusha
	push es
	xor ax,ax
	mov es,ax
	
	cli     ; clear interupt flag
	mov bx,offset CurrentOldInterruptOffset    
	mov ax,[word ptr bx]
	mov bx,offset currentInterruptPOS 	
	xor cx,cx
	mov cl,[byte ptr bx]
	mov si,cx
	mov [word ptr es: si],ax
	mov bx,offset CurrentOldInterruptSegment     
	mov ax,[word ptr bx]
	mov [word ptr es: si+2],ax
	sti     ; set interrupt flag
	pop es
	popa
 ret
endp RestoreOldInterrupt
 
  



END start