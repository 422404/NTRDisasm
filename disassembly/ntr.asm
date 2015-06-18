; ---------------------------------------------------------------------------

RT_LOCK		struc ;	(sizeof=0x4)	; XREF:	_NS_CONFIGr
value		DCD ?
RT_LOCK		ends

; ---------------------------------------------------------------------------

FS_archive	struc ;	(sizeof=0x18, standard type) ; XREF: FSUSER_OpenFileDirectlyr
id		DCD ?
lowPath		FS_path	?		; XREF:	FSUSER_OpenFileDirectly+74r
handleLow	DCD ?			; XREF:	FSUSER_OpenFileDirectly+4Cr
handleHigh	DCD ?			; XREF:	FSUSER_OpenFileDirectly+10r
FS_archive	ends

; ---------------------------------------------------------------------------

FS_path		struc ;	(sizeof=0xC, standard type) ; XREF: FS_archiver
type		DCD ?			; enum FS_pathType
size		DCD ?
data		DCD ?			; offset
FS_path		ends

; ---------------------------------------------------------------------------

_PLGLOADER_INFO	struc ;	(sizeof=0x114, align=0x4)
plgCount	DCD ?
plgBufferPtr	DCD 32 dup(?)
plgSize		DCD 32 dup(?)
arm11BinStart	DCD ?
arm11BinSize	DCD ?
tid		DCD 2 dup(?)
_PLGLOADER_INFO	ends

; ---------------------------------------------------------------------------

hostent		struc ;	(sizeof=0x14, align=0x4)
h_name		DCD ?			; offset
h_aliases	DCD ?			; offset
h_addrtype	DCD ?
h_length	DCD ?
h_addr_list	DCD ?			; offset
hostent		ends

; ---------------------------------------------------------------------------

DVLB_s		struc ;	(sizeof=0x18, align=0x4)
numDVLE		DCD ?
DVLP		DVLP_s ?
DVLE		DCD ?			; offset
DVLB_s		ends

; ---------------------------------------------------------------------------

DVLP_s		struc ;	(sizeof=0x10, align=0x4, standard type)	; XREF:	DVLB_sr
codeSize	DCD ?
codeData	DCD ?			; offset
opdescSize	DCD ?
opcdescData	DCD ?			; offset
DVLP_s		ends

; ---------------------------------------------------------------------------

DVLE_s		struc ;	(sizeof=0x28, align=0x4)
type		DCD ?			; enum SHDR_type
mainOffset	DCD ?
endmainOffset	DCD ?
constTableSize	DCD ?
constTableData	DCD ?			; offset
outTableSize	DCD ?
outTableData	DCD ?			; offset
uniformTableSize DCD ?
uniformTableData DCD ?			; offset
symbolTableData	DCD ?			; offset
DVLE_s		ends

; ---------------------------------------------------------------------------

DVLE_uniformEntry_s struc ; (sizeof=0x8, align=0x4)
symbolOffset	DCD ?
startReg	DCW ?
endReg		DCW ?
DVLE_uniformEntry_s ends

; ---------------------------------------------------------------------------

DVLE_outEntry_s	struc ;	(sizeof=0x8, align=0x4)
type		DCW ?
regID		DCW ?
header		DCD ?
DVLE_outEntry_s	ends

; ---------------------------------------------------------------------------

DVLE_constEntry_s struc	; (sizeof=0x14,	align=0x4)
header		DCD ?
data		DCD 4 dup(?)
DVLE_constEntry_s ends

; ---------------------------------------------------------------------------

GSP_CaptureInfo	struc ;	(sizeof=0x20, align=0x4)
screencapture	GSP_CaptureInfoEntry 2 dup(?)
GSP_CaptureInfo	ends

; ---------------------------------------------------------------------------

GSP_CaptureInfoEntry struc ; (sizeof=0x10, align=0x4, standard type)
					; XREF:	GSP_CaptureInfor
framebuf0_vaddr	DCD ?			; offset
framebuf1_vaddr	DCD ?			; offset
format		DCD ?
framebuf_widthbytesize DCD ?
GSP_CaptureInfoEntry ends

; ---------------------------------------------------------------------------

GSP_FramebufferInfo struc ; (sizeof=0x1C, align=0x4)
active_framebuf	DCD ?
framebuf0_vaddr	DCD ?			; offset
framebuf1_vaddr	DCD ?			; offset
framebuf_widthbytesize DCD ?
format		DCD ?
framebuf_dispselect DCD	?
unk		DCD ?
GSP_FramebufferInfo ends

; ---------------------------------------------------------------------------

PLGLOADER_INFO	struc ;	(sizeof=0x114)
plgCount	DCD ?
plgBufferPtr	DCD 32 dup(?)
plgSize		DCD 32 dup(?)
arm11BinStart	DCD ?
arm11BinSize	DCD ?
tid		DCD 2 dup(?)
PLGLOADER_INFO	ends

; ---------------------------------------------------------------------------

DebugEventInfo	struc ;	(sizeof=0x24, align=0x4)
type		DCD ?
thread_id	DCD ?
unknown		DCD 2 dup(?)
anonymous_0	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366E ?
DebugEventInfo	ends

; ---------------------------------------------------------------------------

$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366E union ; (sizeof=0x14, align=0x4, standard type)
					; XREF:	DebugEventInfor
process		ProcessEvent ?
create_thread	CreateThreadEvent ?
exit_thread	ExitThreadEvent	?
exit_process	ExitProcessEvent ?
exception	ExceptionEvent ?
scheduler	SchedulerInOutEvent ?
syscall		SyscallInOutEvent ?
output_string	OutputStringEvent ?
map		MapEvent ?
$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366E ends

; ---------------------------------------------------------------------------

ProcessEvent	struc ;	(sizeof=0x14, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
program_id	DCD ?
process_name	DCB 8 dup(?)
process_id	DCD ?
reason		DCD ?
ProcessEvent	ends

; ---------------------------------------------------------------------------

CreateThreadEvent struc	; (sizeof=0xC, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
creator_thread_id DCD ?
base_addr	DCD ?
entry_point	DCD ?
CreateThreadEvent ends

; ---------------------------------------------------------------------------

ExitThreadEvent	struc ;	(sizeof=0x4, align=0x4,	standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
reason		DCD ?
ExitThreadEvent	ends

; ---------------------------------------------------------------------------

ExitProcessEvent struc ; (sizeof=0x4, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
reason		DCD ?
ExitProcessEvent ends

; ---------------------------------------------------------------------------

ExceptionEvent	struc ;	(sizeof=0xC, align=0x4,	standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
type		DCD ?
address		DCD ?
argument	DCD ?
ExceptionEvent	ends

; ---------------------------------------------------------------------------

SchedulerInOutEvent struc ; (sizeof=0x4, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
clock_tick	DCD ?
SchedulerInOutEvent ends

; ---------------------------------------------------------------------------

SyscallInOutEvent struc	; (sizeof=0x8, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
clock_tick	DCD ?
syscall		DCD ?
SyscallInOutEvent ends

; ---------------------------------------------------------------------------

OutputStringEvent struc	; (sizeof=0x8, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
string_addr	DCD ?
string_size	DCD ?
OutputStringEvent ends

; ---------------------------------------------------------------------------

MapEvent	struc ;	(sizeof=0x10, align=0x4, standard type)
					; XREF:	$8AA324A4CF3253467AC9A6634CDF8269::$B82C120C411F03FCE493E0E12447366Er
mapped_addr	DCD ?
mapped_size	DCD ?
memperm		DCD ?
memstate	DCD ?
MapEvent	ends

; ---------------------------------------------------------------------------

PageInfo	struc ;	(sizeof=0x4, align=0x4)
flags		DCD ?
PageInfo	ends

; ---------------------------------------------------------------------------

MemInfo		struc ;	(sizeof=0x10, align=0x4)
base_addr	DCD ?
size		DCD ?
perm		DCD ?
state		DCD ?
MemInfo		ends

; ---------------------------------------------------------------------------

NS_CONFIG	struc ;	(sizeof=0x238)
initMode	DCD ?
startupCommand	DCD ?
hSOCU		DCD ?
debugBuf	DCD ?			; offset
debugBufSize	DCD ?
debugPtr	DCD ?
debugReady	DCD ?
debugBufferLock	DCD ?
startupInfo	DCD 32 dup(?)
allowDirectScreenAccess	DCD ?
exitFlag	DCD ?
sharedFunc	DCD 100	dup(?)
NS_CONFIG	ends

; ---------------------------------------------------------------------------

NS_BREAKPOINT	struc ;	(sizeof=0x15C)
type		DCD ?
flag		DCD ?
addr		DCD ?
hook		RT_HOOK	?
stubCode	DCD 32 dup(?)
isEnabled	DCD ?
NS_BREAKPOINT	ends

; ---------------------------------------------------------------------------

RT_HOOK		struc ;	(sizeof=0xCC, standard type) ; XREF: NS_BREAKPOINTr
					; _NS_BREAKPOINTr
model		DCD ?
isEnabled	DCD ?
funcAddr	DCD ?
bakCode		DCD 16 dup(?)
jmpCode		DCD 16 dup(?)
callCode	DCD 16 dup(?)
RT_HOOK		ends

; ---------------------------------------------------------------------------

_NS_CONFIG	struc ;	(sizeof=0x238, align=0x4)
initMode	DCD ?
startupCommand	DCD ?
hSOCU		DCD ?
debugBuf	DCD ?			; offset
debugBufSize	DCD ?
debugPtr	DCD ?
debugReady	DCD ?
debugBufferLock	RT_LOCK	?
startupInfo	DCD 32 dup(?)
allowDirectScreenAccess	DCD ?
exitFlag	DCD ?
sharedFunc	DCD 100	dup(?)
_NS_CONFIG	ends

; ---------------------------------------------------------------------------

_NS_BREAKPOINT	struc ;	(sizeof=0x15C, align=0x4)
type		DCD ?
flag		DCD ?
addr		DCD ?
hook		RT_HOOK	?
stubCode	DCD 32 dup(?)
isEnabled	DCD ?
_NS_BREAKPOINT	ends

; ---------------------------------------------------------------------------

_RT_HOOK	struc ;	(sizeof=0xCC, align=0x4)
model		DCD ?
isEnabled	DCD ?
funcAddr	DCD ?
bakCode		DCD 16 dup(?)
jmpCode		DCD 16 dup(?)
callCode	DCD 16 dup(?)
_RT_HOOK	ends

; ---------------------------------------------------------------------------

_RT_LOCK	struc ;	(sizeof=0x4, align=0x4)
value		DCD ?
_RT_LOCK	ends

; ---------------------------------------------------------------------------

; enum FS_pathType (standard)
PATH_INVALID	 EQU 0
PATH_EMPTY	 EQU 1
PATH_BINARY	 EQU 2
PATH_CHAR	 EQU 3
PATH_WCHAR	 EQU 4

; ---------------------------------------------------------------------------

; enum MemOp (standard)
MEMOP_FREE	 EQU 1
MEMOP_ALLOC	 EQU 3
MEMOP_MAP	 EQU 4
MEMOP_UNMAP	 EQU 5
MEMOP_PROT	 EQU 6
MEMOP_ALLOC_LINEAR  EQU	0x10003

; ---------------------------------------------------------------------------

; enum MemPerm (standard)
MEMPERM_READ	 EQU 1
MEMPERM_WRITE	 EQU 2
MEMPERM_EXECUTE	 EQU 4
MEMPERM_DONTCARE  EQU 0x10000000
MEMPERM_MAX	 EQU 0xFFFFFFFF

; ---------------------------------------------------------------------------

; enum SHDR_type (standard)
VERTEX_SHDR	 EQU 0
GEOMETRY_SHDR	 EQU 1

; ---------------------------------------------------------------------------

; enum SHDR_outType
RESULT_POSITION	 EQU 0
RESULT_COLOR	 EQU 2
RESULT_TEXCOORD0  EQU 3
RESULT_TEXCOORD1  EQU 5
RESULT_TEXCOORD2  EQU 6

; ---------------------------------------------------------------------------

; enum PAD_KEY (bitfield)
PAD_A		 EQU 1
PAD_B		 EQU 2
PAD_SELECT	 EQU 4
PAD_START	 EQU 8
PAD_RIGHT	 EQU 0x10
PAD_LEFT	 EQU 0x20
PAD_UP		 EQU 0x40
PAD_DOWN	 EQU 0x80
PAD_R		 EQU 0x100
PAD_L		 EQU 0x200
PAD_X		 EQU 0x400
PAD_Y		 EQU 0x800

; ---------------------------------------------------------------------------

; enum CSND_ENCODING
CSND_ENCODING_PCM8  EQU	0
CSND_ENCODING_PCM16  EQU 1
CSND_ENCODING_IMA_ADPCM	 EQU 2
CSND_ENCODING_PSG  EQU 3

; ---------------------------------------------------------------------------

; enum CSND_LOOPING
CSND_LOOP_DISABLE  EQU 0
CSND_LOOP_ENABLE  EQU 1

; ---------------------------------------------------------------------------

; enum APP_STATUS
APP_NOTINITIALIZED  EQU	0
APP_RUNNING	 EQU 1
APP_SUSPENDED	 EQU 2
APP_EXITING	 EQU 3
APP_SUSPENDING	 EQU 4
APP_SLEEPMODE	 EQU 5
APP_PREPARE_SLEEPMODE  EQU 6

; ---------------------------------------------------------------------------

; enum NS_APPID
APPID_HOMEMENU	 EQU 0x101
APPID_CAMERA	 EQU 0x110
APPID_WEB	 EQU 0x114
APPID_APPLICATION  EQU 0x300

; ---------------------------------------------------------------------------

; enum GPU_COMBINEFUNC
GPU_REPLACE	 EQU 0
GPU_MODULATE	 EQU 1
GPU_ADD		 EQU 2
GPU_ADD_SIGNED	 EQU 3
GPU_INTERPOLATE	 EQU 4
GPU_SUBTRACT	 EQU 5
GPU_DOT3_RGB	 EQU 6

; ---------------------------------------------------------------------------

; enum GPU_TEVSRC
GPU_PRIMARY_COLOR  EQU 0
GPU_TEXTURE0	 EQU 3
GPU_TEXTURE1	 EQU 4
GPU_TEXTURE2	 EQU 5
GPU_TEXTURE3	 EQU 6
GPU_CONSTANT	 EQU 0xE
GPU_PREVIOUS	 EQU 0xF

; ---------------------------------------------------------------------------

; enum GPU_CULLMODE
GPU_CULL_NONE	 EQU 0
GPU_CULL_FRONT_CCW  EQU	1
GPU_CULL_BACK_CCW  EQU 2

; ---------------------------------------------------------------------------

; enum GPU_FORMATS
GPU_BYTE	 EQU 0
GPU_UNSIGNED_BYTE  EQU 1
GPU_SHORT	 EQU 2
GPU_FLOAT	 EQU 3

; ---------------------------------------------------------------------------

; enum GPU_TESTFUNC
GPU_NEVER	 EQU 0
GPU_ALWAYS	 EQU 1
GPU_EQUAL	 EQU 2
GPU_NOTEQUAL	 EQU 3
GPU_LESS	 EQU 4
GPU_LEQUAL	 EQU 5
GPU_GREATER	 EQU 6
GPU_GEQUAL	 EQU 7

; ---------------------------------------------------------------------------

; enum GPU_TEXCOLOR
GPU_RGBA8	 EQU 0
GPU_RGB8	 EQU 1
GPU_RGBA5551	 EQU 2
GPU_RGB565	 EQU 3
GPU_RGBA4	 EQU 4
GPU_LA8		 EQU 5
GPU_HILO8	 EQU 6
GPU_L8		 EQU 7
GPU_A8		 EQU 8
GPU_LA4		 EQU 9
GPU_L4		 EQU 0xA
GPU_ETC1	 EQU 0xB
GPU_ETC1A4	 EQU 0xC

; ---------------------------------------------------------------------------

; enum ThreadInfoType
THREADINFO_TYPE_UNKNOWN	 EQU 0

; ---------------------------------------------------------------------------

; enum UserBreakType
USERBREAK_PANIC	 EQU 0
USERBREAK_ASSERT  EQU 1
USERBREAK_USER	 EQU 2

; ---------------------------------------------------------------------------

; enum ExceptionEventType
EXC_EVENT_UNDEFINED_INSTRUCTION	 EQU 0
EXC_EVENT_UNKNOWN1  EQU	1
EXC_EVENT_UNKNOWN2  EQU	2
EXC_EVENT_UNKNOWN3  EQU	3
EXC_EVENT_ATTACH_BREAK	EQU 4
EXC_EVENT_BREAKPOINT  EQU 5
EXC_EVENT_USER_BREAK  EQU 6
EXC_EVENT_DEBUGGER_BREAK  EQU 7
EXC_EVENT_UNDEFINED_SYSCALL  EQU 8

; ---------------------------------------------------------------------------

; enum ExitProcessEventReason
EXITPROCESS_EVENT_NONE	EQU 0
EXITPROCESS_EVENT_TERMINATE  EQU 1
EXITPROCESS_EVENT_UNHANDLED_EXCEPTION  EQU 2

; ---------------------------------------------------------------------------

; enum ExitThreadEventReason
EXITTHREAD_EVENT_NONE  EQU 0
EXITTHREAD_EVENT_TERMINATE  EQU	1
EXITTHREAD_EVENT_UNHANDLED_EXC	EQU 2
EXITTHREAD_EVENT_TERMINATE_PROCESS  EQU	3

; ---------------------------------------------------------------------------

; enum ProcessEventReason (bitfield)
REASON_CREATE	 EQU 1
REASON_ATTACH	 EQU 2

; ---------------------------------------------------------------------------

; enum DebugEventType
DBG_EVENT_PROCESS  EQU 0
DBG_EVENT_CREATE_THREAD	 EQU 1
DBG_EVENT_EXIT_THREAD  EQU 2
DBG_EVENT_EXIT_PROCESS	EQU 3
DBG_EVENT_EXCEPTION  EQU 4
DBG_EVENT_DLL_LOAD  EQU	5
DBG_EVENT_DLL_UNLOAD  EQU 6
DBG_EVENT_SCHEDULE_IN  EQU 7
DBG_EVENT_SCHEDULE_OUT	EQU 8
DBG_EVENT_SYSCALL_IN  EQU 9
DBG_EVENT_SYSCALL_OUT  EQU 0xA
DBG_EVENT_OUTPUT_STRING	 EQU 0xB
DBG_EVENT_MAP	 EQU 0xC

; ---------------------------------------------------------------------------

; enum MemState
MEMSTATE_FREE	 EQU 0
MEMSTATE_RESERVED  EQU 1
MEMSTATE_IO	 EQU 2
MEMSTATE_STATIC	 EQU 3
MEMSTATE_CODE	 EQU 4
MEMSTATE_PRIVATE  EQU 5
MEMSTATE_SHARED	 EQU 6
MEMSTATE_CONTINUOUS  EQU 7
MEMSTATE_ALIASED  EQU 8
MEMSTATE_ALIAS	 EQU 9
MEMSTATE_ALIASCODE  EQU	0xA
MEMSTATE_LOCKED	 EQU 0xB

; ---------------------------------------------------------------------------

; enum MEMORY_OPERATION
MEMOP_RESERVE	 EQU 2
MEMOP_COMMIT	 EQU 3
MEMOP_PROTECT	 EQU 6
MEMOP_REGION_APP  EQU 0x100
MEMOP_REGION_SYSTEM  EQU 0x200
MEMOP_REGION_BASE  EQU 0x300
MEMOP_LINEAR	 EQU 0x1000

; ---------------------------------------------------------------------------

; enum mediatypes_enum
mediatype_NAND	 EQU 0
mediatype_SDMC	 EQU 1
mediatype_GAMECARD  EQU	2

;
; +-------------------------------------------------------------------------+
; |   This file	has been generated by The Interactive Disassembler (IDA)    |
; |	      Copyright	(c) 2014 Hex-Rays, <support@hex-rays.com>	    |
; |			 License info: 48-3057-7374-2C			    |
; |	Zhou Tao, Jiangsu Australia Sinuo Network Technology Co., Ltd.	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	3993DDD97E8DC4E6F4A94E416705014B
; Input	CRC32 :	38ECC72B

; File Name   :	D:\STATION\NTR\ntr.bin
; Format      :	Binary file
; Base Address:	0000h Range: 100100h - 10B560h Loaded length: B460h
; File Name   :	ntr.bin
; Format      :	Binary file
; Base Address:	0000h Range: 0000h - B08Ch Loaded length: B08Ch

; Processor	  : ARM
; ARM architecture: ARMv6
; Target assembler: Generic assembler for ARM
; Byte sex	  : Little endian

; ===========================================================================

; Segment type:	Pure code
		AREA ROM, CODE,	READWRITE, ALIGN=0
		; ORG 0x100100
		CODE32

; =============== S U B	R O U T	I N E =======================================


ntrBase					; DATA XREF: ntrEntry+Co ntrEntry+10o	...
		B	ntrEntry
; End of function ntrBase

; ---------------------------------------------------------------------------
nsDbgPrint_	DCD 0xE1A00000		; DATA XREF: inject_ntr_into_home_menu+18o
					; ROM:off_10155Co ...
dword_100108	DCD 0xE1A00000		; DATA XREF: main+28r
nsDbgPrint_0	DCD 0xE1A00000		; DATA XREF: main+34r
dword_100110	DCD 0xE1A00000		; DATA XREF: inject_ntr_into_home_menu+20r
nsDbgPrint_1	DCD 0xE1A00000		; DATA XREF: inject_ntr_into_home_menu+24r
		DCD 0xE1A00000
nsDbgPrint_2	DCD 0xE1A00000
		DCD 0xE1A00000

; =============== S U B	R O U T	I N E =======================================


ntrEntry				; CODE XREF: ntrBasej

anonymous_0	= -0x38

		STMFD	SP!, {R0-R12,LR}
		MRS	R0, CPSR
		STMFD	SP!, {R0}
		LDR	R6, =ntrBase
		ADR	R5, ntrBase
		SUB	R5, R5,	R6
		LDR	R6, =offsets
		LDR	R7, =aUsrLibLd_so_1 ; "/usr/lib/ld.so.1"
		ADD	R6, R6,	R5
		ADD	R7, R7,	R5

loc_10014C				; CODE XREF: ntrEntry+48j
		LDMIA	R6!, {R3,R4}
		CMP	R4, #0x17
		BNE	loc_100168
		ADD	R3, R3,	R5
		LDR	R4, [R3]
		ADD	R4, R4,	R5
		STR	R4, [R3]

loc_100168				; CODE XREF: ntrEntry+30j
		CMP	R6, R7
		BCC	loc_10014C
		LDR	R0, =0xFFFF8001
		ADR	R1, ntrBase
		LDR	R2, =aUsrLibLd_so_1 ; "/usr/lib/ld.so.1"
		SUB	R2, R2,	R1

ntrReinstall				; DATA XREF: ntrResetKProcessRefcount+3Co
					; ROM:off_103550o
		SVC	0x54
		NOP
		NOP
		MOV	R0, SP		; reg
		BL	ntrInstall
		LDMFD	SP!, {R0}
		MSR	CPSR_cf, R0
		LDMFD	SP!, {R0-R12,LR}

locret_1001A0				; DATA XREF: main+184o	main+190o ...
		BX	LR
; End of function ntrEntry

; ---------------------------------------------------------------------------
nsDbgPrint_3	DCD 0xE1A00000
		DCD 0xE1A00000
		DCD 0xE1A00000
		DCD 0xE129F000
off_1001B4	DCD ntrBase		; DATA XREF: ntrEntry+Cr ROM:offsetso
off_1001B8	DCD offsets		; DATA XREF: ntrEntry+18r
off_1001BC	DCD aUsrLibLd_so_1	; DATA XREF: ntrEntry+1Cr ntrEntry+54r
					; "/usr/lib/ld.so.1"
dword_1001C0	DCD 0xFFFF8001		; DATA XREF: ntrEntry+4Cr
nsDbgPrint_4	ALIGN 0x10

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __usercall ntr2dPaintPixel(int x@<R0>, int y@<R1>, unsigned __int8 r@<R2>, unsigned __int8 g@<R3>, unsigned __int8 b, int screen)
ntr2dPaintPixel				; CODE XREF: ntr2dPaintSquare+58p
					; ntr2dPaintLetter+70p

b		=  0
screen		=  4

; FUNCTION CHUNK AT 001018D4 SIZE 00000010 BYTES

		MOV	R12, #0xFFFFFFFD
		ADD	R0, R0,	#1
		MUL	R1, R12, R1
		MOV	R12, #0x2D0
		MLA	R0, R12, R0, R1
		LDR	R1, [SP,#screen]
		ADD	R0, R0,	R1	; address
		MOV	R1, R2		; r
		MOV	R2, R3		; g
		LDRB	R3, [SP,#b]	; b
		B	write_color
; End of function ntr2dPaintPixel


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall ntr2dPaintSquare(int x, int y,	int xs,	int ys)
ntr2dPaintSquare			; CODE XREF: ntr2dBlank+38p
					; ntr2dBlank+5Cp

var_30		= -0x30
var_2C		= -0x2C
b		=  0
w		=  4
h		=  8
screen		=  0xC

		STMFD	SP!, {R0-R2,R4-R11,LR}
		MOV	R8, R1
		LDR	R6, [SP,#0x30+w]
		LDR	R7, [SP,#0x30+h]
		LDRB	R11, [SP,#0x30+b]
		MOV	R9, R2
		MOV	R10, R3
		MOV	R4, R0
		ADD	R6, R0,	R6
		ADD	R7, R1,	R7

loc_100224				; CODE XREF: ntr2dPaintSquare+68j
		CMP	R4, R6
		BGE	loc_100268
		MOV	R5, R8

loc_100230				; CODE XREF: ntr2dPaintSquare+60j
		CMP	R5, R7
		BGE	loc_100260
		LDR	R3, [SP,#0x30+screen]
		MOV	R1, R5		; y
		STR	R3, [SP,#0x30+var_2C] ;	screen
		STR	R11, [SP,#0x30+var_30] ; b
		MOV	R0, R4		; x
		MOV	R2, R9		; r
		MOV	R3, R10		; g
		BL	ntr2dPaintPixel
		ADD	R5, R5,	#1
		B	loc_100230
; ---------------------------------------------------------------------------

loc_100260				; CODE XREF: ntr2dPaintSquare+38j
		ADD	R4, R4,	#1
		B	loc_100224
; ---------------------------------------------------------------------------

loc_100268				; CODE XREF: ntr2dPaintSquare+2Cj
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R11,PC}
; End of function ntr2dPaintSquare


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall ntr2dBlank(int	x, int y, int xs, int ys)
ntr2dBlank				; CODE XREF: ntr2dPrint+34p
					; acquire_video+B0p ...

h		= -0x28
screen		= -0x24

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x14	; b
		LDR	R5, =pa_N3DS
		MOV	R4, #0xFF
		MOV	R7, R2
		MOV	R6, R3
		STR	R3, [SP,#0x30+h] ; h
		LDR	R3, [R5]
		MOV	R2, R4		; r
		STR	R3, [SP,#0x30+screen] ;	screen
		STMEA	SP, {R4,R7}
		MOV	R3, R4		; g
		MOV	R9, R0
		MOV	R8, R1
		BL	ntr2dPaintSquare
		LDR	R3, [R5]
		STMEA	SP, {R4,R7}
		STR	R3, [SP,#0x30+screen] ;	screen
		STR	R6, [SP,#0x30+h] ; h
		MOV	R0, R9		; x
		MOV	R1, R8		; y
		MOV	R2, R4		; r
		MOV	R3, R4		; g
		BL	ntr2dPaintSquare
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4-R9,PC}
; End of function ntr2dBlank

; ---------------------------------------------------------------------------
off_1002D8	DCD pa_N3DS		; DATA XREF: ntr2dBlank+8r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __usercall ntr2dPaintLetter(unsigned __int8 letter@<R0>,	int x@<R1>, int	y@<R2>,	unsigned __int8	r@<R3>,	unsigned __int8	g, unsigned __int8 b, int screen)
ntr2dPaintLetter			; CODE XREF: ntr2dPaintWord+68p

var_40		= -0x40
var_3C		= -0x3C
var_34		= -0x34
var_30		= -0x30
var_2C		= -0x2C
g		=  0
b		=  4
screen		=  8

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x1C
		MOV	R9, R3
		LDRB	R3, [SP,#0x40+g]
		SUB	R0, R0,	#0x20
		MOV	R7, R1
		STR	R3, [SP,#0x40+var_34]
		LDRB	R3, [SP,#0x40+b]
		MOV	R8, R2
		MOV	R4, #0
		STR	R3, [SP,#0x40+var_30]
		LDR	R3, =font
		MOV	R10, #0x80
		ADD	R6, R3,	R0,LSL#3

loc_100314				; CODE XREF: ntr2dPaintLetter+8Cj
		LDRB	R11, [R6,R4]
		MOV	R5, #0
		ADD	R12, R4, R8

loc_100320				; CODE XREF: ntr2dPaintLetter+80j
		ANDS	R3, R11, R10,ASR R5
		BEQ	loc_100354
		LDR	R3, [SP,#0x40+var_30]
		MOV	R1, R12		; y
		STR	R3, [SP,#0x40+var_40] ;	b
		LDR	R3, [SP,#0x40+screen]
		ADD	R0, R5,	R7	; x
		STR	R3, [SP,#0x40+var_3C] ;	screen
		MOV	R2, R9		; r
		LDR	R3, [SP,#0x40+var_34] ;	g
		STR	R12, [SP,#0x40+var_2C]
		BL	ntr2dPaintPixel
		LDR	R12, [SP,#0x40+var_2C]

loc_100354				; CODE XREF: ntr2dPaintLetter+48j
		ADD	R5, R5,	#1
		CMP	R5, #8
		BNE	loc_100320
		ADD	R4, R4,	#1
		CMP	R4, #8
		BNE	loc_100314
		ADD	SP, SP,	#0x1C
		LDMFD	SP!, {R4-R11,PC}
; End of function ntr2dPaintLetter

; ---------------------------------------------------------------------------
off_100374	DCD font		; DATA XREF: ntr2dPaintLetter+2Cr

; =============== S U B	R O U T	I N E =======================================


; void __stdcall ntr2dPaintWord(char *word, int	x, int y, char r, char g, char b, int screen)
ntr2dPaintWord				; CODE XREF: ntr2dPrint+58p
					; ntr2dPrint+7Cp

var_38		= -0x38
var_2C		= -0x2C
g		=  0
b		=  4
screen		=  8

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x1C	; g
		MOV	R8, #0
		LDRB	R10, [SP,#0x40+g]
		LDRB	R11, [SP,#0x40+b]
		MOV	R6, R0
		MOV	R7, R1
		MOV	R9, R3
		MOV	R4, R1
		MOV	R5, R8
		STR	R2, [SP,#0x40+var_2C]

loc_1003A4				; CODE XREF: ntr2dPaintWord+74j
		MOV	R0, R6		; a1
		BL	strlen
		CMP	R5, R0
		BCS	loc_1003F0
		LDR	R3, [SP,#0x40+screen]
		CMP	R4, #0x138
		ADDGT	R8, R8,	#1
		STR	R3, [SP,#0x40+var_38] ;	screen
		LDR	R3, [SP,#0x40+var_2C]
		MOVGT	R4, R7
		LDRB	R0, [R6,R5]	; letter
		MOV	R1, R4		; x
		ADD	R2, R3,	R8,LSL#3 ; y
		STMEA	SP, {R10,R11}
		MOV	R3, R9		; r
		BL	ntr2dPaintLetter
		ADD	R4, R4,	#8
		ADD	R5, R5,	#1
		B	loc_1003A4
; ---------------------------------------------------------------------------

loc_1003F0				; CODE XREF: ntr2dPaintWord+38j
		ADD	SP, SP,	#0x1C
		LDMFD	SP!, {R4-R11,PC}
; End of function ntr2dPaintWord


; =============== S U B	R O U T	I N E =======================================


; void __stdcall ntr2dPrint(char *s, int x, int	y, char	r, char	g, char	b)
ntr2dPrint				; CODE XREF: ntr2dPrintU8+3Cp
					; ntr2dPrintU32+40p ...

var_30		= -0x30
var_2C		= -0x2C
screen		= -0x28
g		=  0
b		=  4

		STMFD	SP!, {R0-R10,LR}
		MOV	R5, R1
		MOV	R4, R2
		MOV	R6, R3
		MOV	R7, R0
		BL	strlen
		LDR	R8, =pa_N3DS
		LDRB	R10, [SP,#0x30+g]
		LDRB	R9, [SP,#0x30+b]
		MOV	R1, R4		; y
		MOV	R3, #0xA	; ys
		MOV	R2, R0,LSL#3	; xs
		MOV	R0, R5		; x
		BL	ntr2dBlank
		LDR	R3, [R8]
		MOV	R0, R7		; word
		STR	R3, [SP,#0x30+screen] ;	screen
		MOV	R1, R5		; x
		MOV	R2, R4		; y
		MOV	R3, R6		; r
		STR	R10, [SP,#0x30+var_30] ; g
		STR	R9, [SP,#0x30+var_2C] ;	b
		BL	ntr2dPaintWord
		LDR	R3, [R8]
		STR	R10, [SP,#0x30+var_30] ; g
		STR	R3, [SP,#0x30+screen] ;	screen
		STR	R9, [SP,#0x30+var_2C] ;	b
		MOV	R0, R7		; word
		MOV	R1, R5		; x
		MOV	R2, R4		; y
		MOV	R3, R6		; r
		BL	ntr2dPaintWord
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R10,PC}
; End of function ntr2dPrint

; ---------------------------------------------------------------------------
off_100480	DCD pa_N3DS		; DATA XREF: ntr2dPrint+18r

; =============== S U B	R O U T	I N E =======================================


; void __stdcall ntr2dPrintU8(u8 sh, int x, int	y, char	r, char	g, char	b)
ntr2dPrintU8

g		= -0x20
b		= -0x1C
ret		= -0x14
arg_0		=  0
arg_4		=  4

		STMFD	SP!, {R0-R6,LR}
		MOV	R6, R1
		MOV	R5, R2
		ADD	R1, SP,	#0x20+ret ; ret
		MOV	R2, #3		; max_len
		MOV	R4, R3
		BL	ntrMemoryByteToString
		LDRB	R3, [SP,#0x20+arg_0]
		ADD	R0, SP,	#0x20+ret ; s
		MOV	R1, R6		; x
		STR	R3, [SP,#0x20+g] ; g
		LDRB	R3, [SP,#0x20+arg_4]
		MOV	R2, R5		; y
		STR	R3, [SP,#0x20+b] ; b
		MOV	R3, R4		; r
		BL	ntr2dPrint
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R6,PC}
; End of function ntr2dPrintU8


; =============== S U B	R O U T	I N E =======================================


; void __stdcall ntr2dPrintU32(u32 sh, int x, int y, char r, char g, char b)
ntr2dPrintU32

g		= -0x30
b		= -0x2C
ret		= -0x24
arg_0		=  0
arg_4		=  4

		STMFD	SP!, {R4-R6,LR}
		SUB	SP, SP,	#0x20
		MOV	R6, R1
		MOV	R5, R2
		ADD	R1, SP,	#0x30+ret ; ret
		MOV	R2, #0x11	; max_len
		MOV	R4, R3
		BL	ntrMemoryU32ToString
		LDRB	R3, [SP,#0x30+arg_0]
		ADD	R0, SP,	#0x30+ret ; s
		MOV	R1, R6		; x
		STR	R3, [SP,#0x30+g] ; g
		LDRB	R3, [SP,#0x30+arg_4]
		MOV	R2, R5		; y
		STR	R3, [SP,#0x30+b] ; b
		MOV	R3, R4		; r
		BL	ntr2dPrint
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R6,PC}
; End of function ntr2dPrintU32


; =============== S U B	R O U T	I N E =======================================


; Result __stdcall acuCmd1(Handle servhandle, u32 *ptr)
acuCmd1
		STMFD	SP!, {R4-R8,LR}
		MOV	R8, R1
		MOV	R7, R0
		BL	svcGetThreadCommandBuffer
		MOV	R3, #0x10000
		STR	R3, [R0]
		LDR	R3, =0x800002
		MOV	R4, R0
		LDR	R6, [R0,#0x100]
		LDR	R5, [R0,#0x104]
		STR	R3, [R0,#0x100]
		STR	R8, [R0,#0x104]
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		STREQ	R6, [R4,#0x100]
		STREQ	R5, [R4,#0x104]
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R4-R8,PC}
; End of function acuCmd1

; ---------------------------------------------------------------------------
dword_100564	DCD 0x800002		; DATA XREF: acuCmd1+18r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall acuCmd26(Handle servhandle, u32 *ptr, u8 val)
acuCmd26
		STMFD	SP!, {R3-R9,LR}
		MOV	R5, R1
		MOV	R9, R2
		MOV	R8, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x260042
		STMIA	R0, {R3,R9}
		LDR	R3, =0x800002
		MOV	R4, R0
		LDR	R7, [R0,#0x100]
		LDR	R6, [R0,#0x104]
		STR	R3, [R0,#0x100]
		STR	R5, [R0,#0x104]
		STR	R3, [R0,#8]
		STR	R5, [R0,#0xC]
		MOV	R0, R8		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		STREQ	R7, [R4,#0x100]
		STREQ	R6, [R4,#0x104]
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R9,PC}
; End of function acuCmd26

; ---------------------------------------------------------------------------
dword_1005C0	DCD 0x260042		; DATA XREF: acuCmd26+14r
dword_1005C4	DCD 0x800002		; DATA XREF: acuCmd26+1Cr

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall acuGetWifiStatus(Handle servhandle,	u32 *out)
acuGetWifiStatus			; CODE XREF: acuWaitInternetConnection+2Cp
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R1
		MOV	R6, R0
		BL	svcGetThreadCommandBuffer
		MOV	R3, #0xD0000
		MOV	R4, R0
		STR	R3, [R0]
		MOV	R0, R6		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R3, [R4,#8]
		STREQ	R3, [R5]
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R4-R6,PC}
; End of function acuGetWifiStatus


; =============== S U B	R O U T	I N E =======================================


; Result acuWaitInternetConnection(void)
acuWaitInternetConnection

handle		= -0x10
out		= -0xC

		STMFD	SP!, {R0,R1,R4,LR}
		MOV	R0, #0		; handleptr
		MOV	R1, SP		; out
		LDR	R2, =aAcU	; "ac:u"
		STR	R0, [SP,#0x10+handle]
		STR	R0, [SP,#0x10+out]
		BL	srvGetServiceHandle
		CMP	R0, #0
		BNE	loc_100650

loc_100624				; CODE XREF: acuWaitInternetConnection+34j
					; acuWaitInternetConnection+40j
		LDR	R0, [SP,#0x10+handle] ;	servhandle
		ADD	R1, SP,	#0x10+out ; out
		BL	acuGetWifiStatus
		SUBS	R4, R0,	#0
		BNE	loc_100624
		LDR	R3, [SP,#0x10+out]
		CMP	R3, #1
		BNE	loc_100624
		LDR	R0, [SP,#0x10+handle] ;	handle
		BL	svcCloseHandle
		MOV	R0, R4

loc_100650				; CODE XREF: acuWaitInternetConnection+20j
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4,PC}
; End of function acuWaitInternetConnection

; ---------------------------------------------------------------------------
; unsigned __int8 *server
server		DCD aAcU		; DATA XREF: acuWaitInternetConnection+Cr
					; "ac:u"

; =============== S U B	R O U T	I N E =======================================


; void __fastcall ntrInstall(uint32_t *reg)
ntrInstall				; CODE XREF: ntrEntry+6Cp
		LDR	R3, =firmware_version_internal ; threadpriority
		LDR	R1, =0x10B560	; argv
		MOV	R0, #0		; argc
		LDR	R3, [R3]

loc_10066C				; CODE XREF: ntrInstall+1Cj
		LDR	R2, [R1]	; envp
		CMP	R3, R2
		STRCC	R0, [R3],#4
		BCC	loc_10066C
		B	main
; End of function ntrInstall

; ---------------------------------------------------------------------------
off_100680	DCD firmware_version_internal ;	DATA XREF: ntrInstallr
; char **DYNAMIC
_DYNAMIC	DCD 0x10B560		; DATA XREF: ntrInstall+4r

; =============== S U B	R O U T	I N E =======================================


; void IRQHandler(void)
IRQHandler
		BX	LR
; End of function IRQHandler


; =============== S U B	R O U T	I N E =======================================


; Result __fastcall FSUSER_Initialize(Handle handle)
FSUSER_Initialize			; CODE XREF: ntrGetFSUserHandle+3Cp
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R2, =0x8010002
		MOV	R3, #0x20
		MOV	R4, R0
		STMIA	R0, {R2,R3}
		MOV	R0, R5		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R5,PC}
; End of function FSUSER_Initialize

; ---------------------------------------------------------------------------
dword_1006BC	DCD 0x8010002		; DATA XREF: FSUSER_Initialize+Cr

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSUSER_OpenFile(Handle handle, Handle *out, FS_archive archive, FS_path fileLowPath,	u32 openflags, u32 attributes)
FSUSER_OpenFile

var_C		= -0xC
anonymous_0	= -8
arg_8		=  8
arg_C		=  0xC
arg_10		=  0x10
arg_14		=  0x14
arg_18		=  0x18
openflags	=  0x1C
attributes	=  0x20

		SUB	SP, SP,	#8
		STMFD	SP!, {R3-R7,LR}
		MOV	R6, R1
		ADD	R1, SP,	#0x20+var_C
		LDR	R5, [SP,#0x20+arg_14]
		STMIB	R1, {R2,R3}
		MOV	R7, R0
		BL	svcGetThreadCommandBuffer
		LDR	R2, =0x80201C2
		MOV	R3, #0
		STMIA	R0, {R2,R3}
		LDR	R3, [SP,#0x20+arg_8]
		STR	R5, [R0,#0x14]
		STR	R3, [R0,#8]
		LDR	R3, [SP,#0x20+arg_C]
		MOV	R5, R5,LSL#14
		STR	R3, [R0,#0xC]
		LDRB	R3, [SP,#0x20+arg_10]
		ORR	R5, R5,	#2
		STR	R5, [R0,#0x20]
		STR	R3, [R0,#0x10]
		LDR	R3, [SP,#0x20+openflags]
		MOV	R4, R0
		STR	R3, [R0,#0x18]
		LDR	R3, [SP,#0x20+attributes]
		STR	R3, [R0,#0x1C]
		LDR	R3, [SP,#0x20+arg_18]
		STR	R3, [R0,#0x24]
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_100750
		CMP	R6, #0
		LDRNE	R3, [R4,#0xC]
		STRNE	R3, [R6]
		LDR	R0, [R4,#4]

loc_100750				; CODE XREF: FSUSER_OpenFile+7Cj
		LDMFD	SP!, {R3-R7,LR}
		ADD	SP, SP,	#8
		BX	LR
; End of function FSUSER_OpenFile

; ---------------------------------------------------------------------------
dword_10075C	DCD 0x80201C2		; DATA XREF: FSUSER_OpenFile+20r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSUSER_OpenFileDirectly(Handle handle, Handle *out, FS_archive archive, FS_path fileLowPath,	u32 openflags, u32 attributes)
FSUSER_OpenFileDirectly			; CODE XREF: sub_1011E4+68p
					; handle_savefile_packet+8Cp ...

var_C		= -0xC
var_8		= -8
archive		=  0
arg_18		=  0x18
openflags	=  0x1C
attributes	=  0x20

		SUB	SP, SP,	#8
		STMFD	SP!, {R4-R8,LR}
		MOV	R8, R1
		ADD	R1, SP,	#0x20+var_C
		LDR	R6, [SP,#0x20+archive.handleHigh]
		STMIB	R1, {R2,R3}
		MOV	R7, R0
		LDR	R5, [SP,#0x20+archive]
		BL	svcGetThreadCommandBuffer
		LDR	R2, =0x8030204
		MOV	R3, #0
		STMIA	R0, {R2,R3}
		LDR	R3, [SP,#0x20+var_8]
		STR	R5, [R0,#0x10]
		STR	R3, [R0,#8]
		LDRB	R3, [SP,#0x20+var_8+4]
		MOV	R5, R5,LSL#14
		STR	R6, [R0,#0x18]
		STR	R3, [R0,#0xC]
		LDRB	R3, [SP,#0x20+archive.handleLow]
		ORR	R5, R5,	#0x800
		MOV	R6, R6,LSL#14
		STR	R3, [R0,#0x14]
		LDR	R3, [SP,#0x20+openflags]
		ORR	R5, R5,	#2
		STR	R3, [R0,#0x1C]
		LDR	R3, [SP,#0x20+attributes]
		ORR	R6, R6,	#2
		STR	R3, [R0,#0x20]
		LDR	R3, [SP,#0x20+archive.lowPath]
		STR	R5, [R0,#0x24]
		STR	R3, [R0,#0x28]
		LDR	R3, [SP,#0x20+arg_18]
		STR	R6, [R0,#0x2C]
		STR	R3, [R0,#0x30]
		MOV	R4, R0
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_100810
		CMP	R8, #0
		LDRNE	R3, [R4,#0xC]
		STRNE	R3, [R8]
		LDR	R0, [R4,#4]

loc_100810				; CODE XREF: FSUSER_OpenFileDirectly+9Cj
		LDMFD	SP!, {R4-R8,LR}
		ADD	SP, SP,	#8
		BX	LR
; End of function FSUSER_OpenFileDirectly

; ---------------------------------------------------------------------------
dword_10081C	DCD 0x8030204		; DATA XREF: FSUSER_OpenFileDirectly+24r

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall FSUSER_OpenArchive(Handle handle, FS_archive *archive)
FSUSER_OpenArchive			; CODE XREF: sub_10111C+44p
					; load_all_plugins_and_inject_ntr_into_pm+4Cp
		CMP	R1, #0
		BEQ	loc_100898
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R1
		MOV	R6, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x80C00C2
		STR	R3, [R0]
		LDR	R3, [R5]
		MOV	R4, R0
		STR	R3, [R0,#4]
		LDRB	R3, [R5,#4]
		STR	R3, [R0,#8]
		LDR	R3, [R5,#8]
		STR	R3, [R0,#0xC]
		LDR	R3, [R5,#8]
		MOV	R3, R3,LSL#14
		ORR	R3, R3,	#2
		STR	R3, [R0,#0x10]
		LDR	R3, [R5,#0xC]
		STR	R3, [R0,#0x14]
		MOV	R0, R6		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R3, [R4,#8]
		STREQ	R3, [R5,#0x10]
		LDREQ	R3, [R4,#0xC]
		STREQ	R3, [R5,#0x14]
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R4-R6,PC}
; ---------------------------------------------------------------------------

loc_100898				; CODE XREF: FSUSER_OpenArchive+4j
		MOV	R0, #0xFFFFFFFE
		BX	LR
; End of function FSUSER_OpenArchive

; ---------------------------------------------------------------------------
dword_1008A0	DCD 0x80C00C2		; DATA XREF: FSUSER_OpenArchive+18r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSUSER_OpenDirectory(Handle handle, Handle *out, FS_archive archive,	FS_path	dirLowPath)
FSUSER_OpenDirectory			; CODE XREF: sub_100F64+88p
					; find_files_+64p

var_C		= -0xC
arg_8		=  8
arg_C		=  0xC
arg_10		=  0x10
arg_14		=  0x14
arg_18		=  0x18

		SUB	SP, SP,	#8
		STMFD	SP!, {R3-R7,LR}
		MOV	R6, R1
		ADD	R1, SP,	#0x20+var_C
		LDR	R5, [SP,#0x20+arg_14]
		STMIB	R1, {R2,R3}
		MOV	R7, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x80B0102
		STR	R3, [R0]
		LDR	R3, [SP,#0x20+arg_8]
		STR	R5, [R0,#0x10]
		STR	R3, [R0,#4]
		LDR	R3, [SP,#0x20+arg_C]
		MOV	R5, R5,LSL#14
		STR	R3, [R0,#8]
		LDRB	R3, [SP,#0x20+arg_10]
		ORR	R5, R5,	#2
		STR	R5, [R0,#0x14]
		STR	R3, [R0,#0xC]
		LDR	R3, [SP,#0x20+arg_18]
		MOV	R4, R0
		STR	R3, [R0,#0x18]
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_100920
		CMP	R6, #0
		LDRNE	R3, [R4,#0xC]
		STRNE	R3, [R6]
		LDR	R0, [R4,#4]

loc_100920				; CODE XREF: FSUSER_OpenDirectory+68j
		LDMFD	SP!, {R3-R7,LR}
		ADD	SP, SP,	#8
		BX	LR
; End of function FSUSER_OpenDirectory

; ---------------------------------------------------------------------------
dword_10092C	DCD 0x80B0102		; DATA XREF: FSUSER_OpenDirectory+20r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSUSER_CloseArchive(Handle handle, FS_archive *archive)
FSUSER_CloseArchive			; CODE XREF: sub_10111C+8Cp
		CMP	R1, #0
		BEQ	loc_100978
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R1
		MOV	R6, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x80E0080
		STR	R3, [R0]
		LDR	R3, [R5,#0x10]
		MOV	R4, R0
		STR	R3, [R0,#4]
		LDR	R3, [R5,#0x14]
		STR	R3, [R0,#8]
		MOV	R0, R6		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R4-R6,PC}
; ---------------------------------------------------------------------------

loc_100978				; CODE XREF: FSUSER_CloseArchive+4j
		MOV	R0, #0xFFFFFFFE
		BX	LR
; End of function FSUSER_CloseArchive

; ---------------------------------------------------------------------------
dword_100980	DCD 0x80E0080		; DATA XREF: FSUSER_CloseArchive+18r

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall FSFILE_Close(Handle	handle)
FSFILE_Close				; CODE XREF: sub_1011E4+7Cp
					; ntrFileClosej ...
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x8080000
		MOV	R4, R0
		STR	R3, [R0]
		MOV	R0, R5		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R5,PC}
; End of function FSFILE_Close

; ---------------------------------------------------------------------------
dword_1009B0	DCD 0x8080000		; DATA XREF: FSFILE_Close+Cr

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSFILE_Read(Handle handle, u32 *bytesRead, u64 offset, u32 *buffer, u32 size)
FSFILE_Read				; CODE XREF: handle_reload_packet+110p
					; rtLoadFileToBuffer+F0p ...

size		=  0
arg_4		=  4

		STMFD	SP!, {R3-R9,LR}
		MOV	R9, R2
		MOV	R8, R3
		LDR	R5, [SP,#0x20+arg_4]
		MOV	R7, R0
		MOV	R6, R1
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x80200C2
		STR	R5, [R0,#0xC]
		STMIA	R0, {R3,R9}
		MOV	R5, R5,LSL#4
		LDR	R3, [SP,#0x20+size]
		ORR	R5, R5,	#0xC
		STR	R8, [R0,#8]
		STR	R5, [R0,#0x10]
		STR	R3, [R0,#0x14]
		MOV	R4, R0
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R9,PC}
		CMP	R6, #0
		LDRNE	R3, [R4,#8]
		STRNE	R3, [R6]
		LDR	R0, [R4,#4]
		LDMFD	SP!, {R3-R9,PC}
; End of function FSFILE_Read

; ---------------------------------------------------------------------------
dword_100A1C	DCD 0x80200C2		; DATA XREF: FSFILE_Read+1Cr

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSFILE_Write(Handle handle, u32 *bytesWritten, u64 offset, u32 *data, u32 size, u32 flushFlags)
FSFILE_Write				; CODE XREF: handle_savefile_packet+FCp
					; dumpProcessToFile+16Cp ...

size		=  0
flushFlags	=  4
arg_8		=  8

		STMFD	SP!, {R3-R9,LR}
		MOV	R9, R2
		MOV	R8, R3
		LDR	R5, [SP,#0x20+flushFlags]
		MOV	R7, R0
		MOV	R6, R1
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x8030102
		STMIA	R0, {R3,R9}
		LDR	R3, [SP,#0x20+arg_8]
		STR	R5, [R0,#0xC]
		STR	R3, [R0,#0x10]
		MOV	R5, R5,LSL#4
		LDR	R3, [SP,#0x20+size]
		ORR	R5, R5,	#0xA
		STR	R8, [R0,#8]
		STR	R5, [R0,#0x14]
		STR	R3, [R0,#0x18]
		MOV	R4, R0
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R9,PC}
		CMP	R6, #0
		LDRNE	R3, [R4,#8]
		STRNE	R3, [R6]
		LDR	R0, [R4,#4]
		LDMFD	SP!, {R3-R9,PC}
; End of function FSFILE_Write

; ---------------------------------------------------------------------------
dword_100A90	DCD 0x8030102		; DATA XREF: FSFILE_Write+1Cr

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall FSFILE_GetSize(Handle handle, u64 *size)
FSFILE_GetSize				; CODE XREF: handle_reload_packet+A8p
					; rtGetFileSize+98p ...
		STMFD	SP!, {R4-R6,LR}
		MOV	R6, R0
		MOV	R5, R1
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x8040000
		MOV	R4, R0
		STR	R3, [R0]
		MOV	R0, R6		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R4-R6,PC}
		CMP	R5, #0
		LDRNED	R2, [R4,#8]
		STRNED	R2, [R5]
		LDR	R0, [R4,#4]
		LDMFD	SP!, {R4-R6,PC}
; End of function FSFILE_GetSize

; ---------------------------------------------------------------------------
dword_100AD4	DCD 0x8040000		; DATA XREF: FSFILE_GetSize+10r

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall FSFILE_SetSize(Handle handle, u64 size)
FSFILE_SetSize
		STMFD	SP!, {R3-R7,LR}
		MOV	R7, R2
		MOV	R6, R3
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x8050080
		MOV	R4, R0
		STMIA	R0, {R3,R7}
		STR	R6, [R0,#8]
		MOV	R0, R5		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R7,PC}
; End of function FSFILE_SetSize

; ---------------------------------------------------------------------------
dword_100B10	DCD 0x8050080		; DATA XREF: FSFILE_SetSize+14r

; =============== S U B	R O U T	I N E =======================================

; There	are some problems with this function which is abnormal.

; Result __stdcall FSDIR_Read(Handle handle, u32 *entriesRead, u32 entrycount, u16 *buffer)
FSDIR_Read				; CODE XREF: sub_100F64+CCp
					; find_files_+CCp
		STMFD	SP!, {R4-R8,LR}
		MOV	R6, R2
		MOV	R8, R3
		MOV	R7, R0
		MOV	R5, R1
		BL	svcGetThreadCommandBuffer
		MOV	R12, #0x228
		LDR	R3, =0x8010042
		MUL	R2, R12, R6
		MOV	R2, R2,LSL#4
		ORR	R2, R2,	#0xC
		STMIA	R0, {R3,R6}
		STR	R2, [R0,#8]
		STR	R8, [R0,#0xC]
		MOV	R4, R0
		MOV	R0, R7		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R4-R8,PC}
		CMP	R5, #0
		LDRNE	R3, [R4,#8]
		STRNE	R3, [R5]
		LDR	R0, [R4,#4]
		LDMFD	SP!, {R4-R8,PC}
; End of function FSDIR_Read

; ---------------------------------------------------------------------------
dword_100B74	DCD 0x8010042		; DATA XREF: FSDIR_Read+1Cr

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall FSDIR_Close(Handle handle)
FSDIR_Close				; CODE XREF: sub_100F64+190p
					; find_files_+ECp
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x8020000
		MOV	R4, R0
		STR	R3, [R0]
		MOV	R0, R5		; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R5,PC}
; End of function FSDIR_Close

; ---------------------------------------------------------------------------
dword_100BA4	DCD 0x8020000		; DATA XREF: FSDIR_Close+Cr

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

callback_return_C821180B		; DATA XREF: threadNtrHomeInjectee+24o
					; ROM:off_1013C0o
		LDR	R0, =0xC821180B
		BX	LR
; End of function callback_return_C821180B

; ---------------------------------------------------------------------------
dword_100BB0	DCD 0xC821180B		; DATA XREF: callback_return_C821180Br

; =============== S U B	R O U T	I N E =======================================


callback_patch_smdh			; DATA XREF: threadNtrHomeInjectee+8o
					; ROM:callbackAddro

arg_0		=  0
arg_4		=  4

		STMFD	SP!, {R0,R1,R4-R6,LR}
		LDR	R5, [SP,#0x18+arg_4]
		LDR	R4, [SP,#0x18+arg_0]
		LDR	R12, =dword_10AE78
		STMEA	SP, {R4,R5}
		BLX	R12 ; dword_10AE78 ; calls original (hooked) function:
					; ---------------------------------
					; 1. executes the two backed up	instructions that have
					;    been overwritten by the function hook mechanism
					;
					; 2. executes a	ldr pc,	orig_func + 8, in order	to execute
					;    the original function
					;
					; 3. waits for the original function to	return (which will
					;    then contain:
					;
					;    R0	= return value of original function
					;    [the following registers are preserved]
					;    R4	= pointer to SMDH
					;    R5	= size of SMDH
					;
					; (for details refer to	the rtInitHook function	in the NTR plugin SDK)
		CMP	R5, #0x36C0	; size of SMDH
		MOV	R6, R0
		BNE	loc_100BFC
		LDR	R2, [R4]
		LDR	R3, =0x48444D53	; magic
		CMP	R2, R3
		BNE	loc_100BFC
		LDR	R0, =aPatchingSmdh ; "patching smdh\n"
		ADD	R4, R4,	#0x2000
		BL	sendMsg
		MOV	R3, #0x7FFFFFFF	; Nintendo defines region free as 0x7fffffff
		STR	R3, [R4,#0x18]	; patch	region lockout (offset 0x2018)

loc_100BFC				; CODE XREF: callback_patch_smdh+20j
					; callback_patch_smdh+30j
		MOV	R0, R6
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4-R6,PC}
; End of function callback_patch_smdh

; ---------------------------------------------------------------------------
off_100C08	DCD dword_10AE78	; DATA XREF: callback_patch_smdh+Cr
dword_100C0C	DCD 0x48444D53		; DATA XREF: callback_patch_smdh+28r
; u8 *msg
msg		DCD aPatchingSmdh	; DATA XREF: callback_patch_smdh+34r
					; "patching smdh\n"

; =============== S U B	R O U T	I N E =======================================


is_BUTTON_DL_pressed			; CODE XREF: main+1F0p
					; inject_into_nintendo_home:loc_103A0Cp
		STMFD	SP!, {R3,LR}
		BL	read_pad
		MOV	R0, R0,LSR#5
		AND	R0, R0,	#1
		LDMFD	SP!, {R3,PC}
; End of function is_BUTTON_DL_pressed


; =============== S U B	R O U T	I N E =======================================


get_kernel_version_info			; CODE XREF: main+6Cp main+1A0p
		LDR	R3, =0x1FF80000	; kernel version register
		LDR	R1, =0x22C0600	; kernel ver x
		LDR	R2, =0x22E0000	; kernel ver y
		LDR	R3, [R3]
		CMP	R3, R1
		CMPNE	R3, R2
		LDR	R2, =firmware_version_internal
		MOVEQ	R1, #1		; is supported
		MOVEQ	R1, #0x5C
		STREQ	R1, [R2]
		LDREQ	R1, =process_manager_patch_addr
		LDREQ	R0, =0x102FEC
		MOVNE	R1, #0
		STRNE	R1, [R2]
		STREQ	R0, [R1]
		LDR	R1, =0x22D0500
		CMP	R3, R1
		MOVEQ	R3, #0x51
		STREQ	R3, [R2]
		LDREQ	R3, =process_manager_patch_addr
		LDREQ	R1, =0x10308C
		LDR	R0, [R2]
		STREQ	R1, [R3]
		BX	LR
; End of function get_kernel_version_info

; ---------------------------------------------------------------------------
dword_100C88	DCD 0x1FF80000		; DATA XREF: get_kernel_version_infor
dword_100C8C	DCD 0x22C0600		; DATA XREF: get_kernel_version_info+4r
dword_100C90	DCD 0x22E0000		; DATA XREF: get_kernel_version_info+8r
off_100C94	DCD firmware_version_internal ;	DATA XREF: get_kernel_version_info+18r
off_100C98	DCD process_manager_patch_addr ; DATA XREF: get_kernel_version_info+28r
					; get_kernel_version_info+4Cr
dword_100C9C	DCD 0x102FEC		; DATA XREF: get_kernel_version_info+2Cr
dword_100CA0	DCD 0x22D0500		; DATA XREF: get_kernel_version_info+3Cr
dword_100CA4	DCD 0x10308C		; DATA XREF: get_kernel_version_info+50r

; =============== S U B	R O U T	I N E =======================================


get_nintendo_home_version_info		; CODE XREF: main+68p main+19Cp

size		= -0x18
dst_addr	= -0x10
process		= -0xC

		STMFD	SP!, {R0-R4,LR}
		MOV	R3, #0
		LDR	R4, =firmware_version_internal
		STR	R3, [SP,#0x18+dst_addr]
		ADD	R0, SP,	#0x18+process ;	process
		STR	R3, [R4,#(dword_10ACF8 - 0x10ACF4)]
		LDR	R3, =pid_of_home_menu
		LDR	R1, [R3]	; processId
		BL	svcOpenProcess
		MOV	R3, #4
		STR	R3, [SP,#0x18+size] ; size
		LDR	R2, [SP,#0x18+process] ; hSrc
		MOV	R3, #0x200000	; src_addr
		LDR	R0, =0xFFFF8001	; hDst
		ADD	R1, SP,	#0x18+dst_addr ; dst_addr
		BL	inter_process_dma_copy
		LDR	R3, [SP,#0x18+dst_addr]
		LDR	R2, =0xE59F80F4
		CMP	R3, R2
		BNE	loc_100D2C
		MOV	R3, #0x5C
		STR	R3, [R4,#(dword_10ACF8 - 0x10ACF4)]
		LDR	R3, =nintendo_home_FlushDataCache_addr
		LDR	R2, =0x131208
		STR	R2, [R3]
		LDR	R3, =rthook
		LDR	R2, =0x12F6EC
		STR	R2, [R3]
		LDR	R3, =nintendo_home_nss_CardUpdateInitialize_addr
		LDR	R2, =0x139900
		STR	R2, [R3]
		LDR	R2, =0x2F0EFC
		B	loc_100D68
; ---------------------------------------------------------------------------

loc_100D2C				; CODE XREF: get_nintendo_home_version_info+4Cj
		LDR	R2, =0xE28DD008
		CMP	R3, R2
		BNE	loc_100D78
		MOV	R3, #0x5B
		STR	R3, [R4,#(dword_10ACF8 - 0x10ACF4)]
		LDR	R3, =nintendo_home_FlushDataCache_addr
		LDR	R2, =0x131208
		STR	R2, [R3]
		LDR	R3, =rthook
		LDR	R2, =0x12F6EC
		STR	R2, [R3]
		LDR	R3, =nintendo_home_nss_CardUpdateInitialize_addr
		LDR	R2, =0x139900
		STR	R2, [R3]
		LDR	R2, =0x2F1EFC

loc_100D68				; CODE XREF: get_nintendo_home_version_info+80j
		LDR	R3, =nintendo_home_ptr_fsuser_handle
		STR	R2, [R3]
		LDR	R2, =0x131C98
		B	loc_100E0C
; ---------------------------------------------------------------------------

loc_100D78				; CODE XREF: get_nintendo_home_version_info+8Cj
		LDR	R2, =0xE1B03F02
		CMP	R3, R2
		BNE	loc_100DC4
		MOV	R3, #0x5A
		STR	R3, [R4,#(dword_10ACF8 - 0x10ACF4)]
		LDR	R3, =nintendo_home_FlushDataCache_addr
		LDR	R2, =0x130CFC
		STR	R2, [R3]
		LDR	R3, =rthook
		LDR	R2, =0x12F224
		STR	R2, [R3]
		LDR	R3, =nintendo_home_nss_CardUpdateInitialize_addr
		LDR	R2, =0x1393F4
		STR	R2, [R3]
		LDR	R3, =nintendo_home_ptr_fsuser_handle
		LDR	R2, =0x2EFEFC
		STR	R2, [R3]
		LDR	R2, =0x13178C
		B	loc_100E0C
; ---------------------------------------------------------------------------

loc_100DC4				; CODE XREF: get_nintendo_home_version_info+D8j
		LDR	R2, =0xE28F2E19
		CMP	R3, R2
		BNE	loc_100E14
		MOV	R3, #0x51
		STR	R3, [R4,#(dword_10ACF8 - 0x10ACF4)]
		LDR	R3, =nintendo_home_FlushDataCache_addr
		LDR	R2, =0x129098
		STR	R2, [R3]
		LDR	R3, =rthook
		LDR	R2, =0x11AAB8
		STR	R2, [R3]
		LDR	R3, =nintendo_home_nss_CardUpdateInitialize_addr
		LDR	R2, =0x13339C
		STR	R2, [R3]
		LDR	R3, =nintendo_home_ptr_fsuser_handle
		LDR	R2, =0x278E4C
		STR	R2, [R3]
		LDR	R2, =0x129BFC

loc_100E0C				; CODE XREF: get_nintendo_home_version_info+CCj
					; get_nintendo_home_version_info+118j
		LDR	R3, =nintendo_home_applet_start_hook_addr
		STR	R2, [R3]

loc_100E14				; CODE XREF: get_nintendo_home_version_info+124j
		LDR	R0, [SP,#0x18+process] ; handle
		BL	svcCloseHandle
		LDR	R0, [R4,#4]
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4,PC}
; End of function get_nintendo_home_version_info

; ---------------------------------------------------------------------------
off_100E28	DCD firmware_version_internal ;	DATA XREF: get_nintendo_home_version_info+8r
off_100E2C	DCD pid_of_home_menu	; DATA XREF: get_nintendo_home_version_info+18r
; Handle hDst
hDst		DCD 0xFFFF8001		; DATA XREF: get_nintendo_home_version_info+34r
dword_100E34	DCD 0xE59F80F4		; DATA XREF: get_nintendo_home_version_info+44r
off_100E38	DCD nintendo_home_FlushDataCache_addr
					; DATA XREF: get_nintendo_home_version_info+58r
					; get_nintendo_home_version_info+98r ...
dword_100E3C	DCD 0x131208		; DATA XREF: get_nintendo_home_version_info+5Cr
					; get_nintendo_home_version_info+9Cr
off_100E40	DCD rthook		; DATA XREF: get_nintendo_home_version_info+64r
					; get_nintendo_home_version_info+A4r ...
dword_100E44	DCD 0x12F6EC		; DATA XREF: get_nintendo_home_version_info+68r
					; get_nintendo_home_version_info+A8r
off_100E48	DCD nintendo_home_nss_CardUpdateInitialize_addr
					; DATA XREF: get_nintendo_home_version_info+70r
					; get_nintendo_home_version_info+B0r ...
dword_100E4C	DCD 0x139900		; DATA XREF: get_nintendo_home_version_info+74r
					; get_nintendo_home_version_info+B4r
dword_100E50	DCD 0x2F0EFC		; DATA XREF: get_nintendo_home_version_info+7Cr
dword_100E54	DCD 0xE28DD008		; DATA XREF: get_nintendo_home_version_info:loc_100D2Cr
dword_100E58	DCD 0x2F1EFC		; DATA XREF: get_nintendo_home_version_info+BCr
off_100E5C	DCD nintendo_home_ptr_fsuser_handle
					; DATA XREF: get_nintendo_home_version_info:loc_100D68r
					; get_nintendo_home_version_info+108r ...
dword_100E60	DCD 0x131C98		; DATA XREF: get_nintendo_home_version_info+C8r
dword_100E64	DCD 0xE1B03F02		; DATA XREF: get_nintendo_home_version_info:loc_100D78r
dword_100E68	DCD 0x130CFC		; DATA XREF: get_nintendo_home_version_info+E8r
dword_100E6C	DCD 0x12F224		; DATA XREF: get_nintendo_home_version_info+F4r
dword_100E70	DCD 0x1393F4		; DATA XREF: get_nintendo_home_version_info+100r
dword_100E74	DCD 0x2EFEFC		; DATA XREF: get_nintendo_home_version_info+10Cr
dword_100E78	DCD 0x13178C		; DATA XREF: get_nintendo_home_version_info+114r
dword_100E7C	DCD 0xE28F2E19		; DATA XREF: get_nintendo_home_version_info:loc_100DC4r
dword_100E80	DCD 0x129098		; DATA XREF: get_nintendo_home_version_info+134r
dword_100E84	DCD 0x11AAB8		; DATA XREF: get_nintendo_home_version_info+140r
dword_100E88	DCD 0x13339C		; DATA XREF: get_nintendo_home_version_info+14Cr
dword_100E8C	DCD 0x278E4C		; DATA XREF: get_nintendo_home_version_info+158r
dword_100E90	DCD 0x129BFC		; DATA XREF: get_nintendo_home_version_info+160r
off_100E94	DCD nintendo_home_applet_start_hook_addr
					; DATA XREF: get_nintendo_home_version_info:loc_100E0Cr

; =============== S U B	R O U T	I N E =======================================


lcd_solid_fill				; CODE XREF: threadSetupNetworkDebugServer+Cp
					; threadSetupNetworkDebugServer+1Cp ...
		STMFD	SP!, {R3-R7,LR}
		MOV	R5, R0
		LDR	R7, =pid_of_home_menu
		MOV	R6, R1
		MOV	R4, #0

loc_100EAC				; CODE XREF: lcd_solid_fill+34j
		CMP	R4, R5
		BEQ	loc_100ED0
		LDR	R3, [R7,#(va_mapped_io_LCD - 0x1085D4)]
		LDR	R0, =0x4C4B40	; nanoseconds
		MOV	R1, #0
		STR	R6, [R3,#0x204]	; offs 0x204 = REG_LCDCOLORFILLMAIN
		BL	svcSleepThread
		ADD	R4, R4,	#1
		B	loc_100EAC
; ---------------------------------------------------------------------------

loc_100ED0				; CODE XREF: lcd_solid_fill+18j
		LDR	R3, =pid_of_home_menu
		MOV	R2, #0
		LDR	R3, [R3,#(va_mapped_io_LCD - 0x1085D4)]
		STR	R2, [R3,#0x204]
		LDMFD	SP!, {R3-R7,PC}
; End of function lcd_solid_fill

; ---------------------------------------------------------------------------
off_100EE4	DCD pid_of_home_menu	; DATA XREF: lcd_solid_fill+8r
					; lcd_solid_fill:loc_100ED0r
; s64 nanoseconds
nanoseconds	DCD 0x4C4B40		; DATA XREF: lcd_solid_fill+20r

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

threadSetupNetworkDebugServer		; DATA XREF: main+228o	ROM:off_1018C8o
		STMFD	SP!, {R3,LR}
		MOV	R0, #0x64
		LDR	R1, =0x1FF0000
		BL	lcd_solid_fill
		BL	ntrSetupNetworkDebugServer
		MOV	R0, #0x64
		LDR	R1, =0x10000FF
		BL	lcd_solid_fill
		MOV	R0, #0
		LDMFD	SP!, {R3,LR}
		B	svcExitThread
; End of function threadSetupNetworkDebugServer

; ---------------------------------------------------------------------------
dword_100F18	DCD 0x1FF0000		; DATA XREF: threadSetupNetworkDebugServer+8r
dword_100F1C	DCD 0x10000FF		; DATA XREF: threadSetupNetworkDebugServer+18r

; =============== S U B	R O U T	I N E =======================================


ntrClosePluginHandle_			; CODE XREF: ntrMenu+E0p
		LDR	R3, =p_config_memory
		MOV	R2, #1
		LDR	R3, [R3]
		STR	R2, [R3,#0xA4]
		LDR	R0, [R3,#8]	; handle
		B	svcCloseHandle
; End of function ntrClosePluginHandle_

; ---------------------------------------------------------------------------
off_100F38	DCD p_config_memory	; DATA XREF: ntrClosePluginHandle_r

; =============== S U B	R O U T	I N E =======================================


fatal_LR
		STMFD	SP!, {R4,LR}
		MOV	R4, R0
		BL	acquire_video
		MOV	R1, R4		; errno
		LDR	R0, =aFatal_Lr08x ; fmt
		MOV	R2, #0		; v2
		BL	showDbg
		LDMFD	SP!, {R4,LR}
		B	release_video
; End of function fatal_LR

; ---------------------------------------------------------------------------
; u8 *fmt
fmt		DCD aFatal_Lr08x	; DATA XREF: fatal_LR+10r
					; "fatal. LR: %08x"

; =============== S U B	R O U T	I N E =======================================


sub_100F64				; CODE XREF: sub_100F64+184p
					; sub_10111C+80p

var_6450	= -0x6450
var_6448	= -0x6448
handle		= -0x6434
entriesRead	= -0x6430
var_642C	= -0x642C
var_6428	= -0x6428
var_6424	= -0x6424
buffer		= -0x6420
var_5FD8	= -0x5FD8
var_5F38	= -0x5F38
var_5058	= -0x5058
var_58		= -0x58

		SUB	SP, SP,	#0x10
		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x6400
		SUB	SP, SP,	#0x28	; archive
		ADD	R4, SP,	#0x6458+var_58
		ADD	R4, R4,	#0x48
		ADD	R6, SP,	#0x6458+var_5058
		STMIA	R4, {R0-R3}
		ADD	R3, SP,	#0x6458+var_58
		ADD	R3, R3,	#0x60
		LDR	R9, [R3]
		ADD	R6, R6,	#0x28
		MOV	R3, #3
		MOV	R5, #0
		MOV	R0, R9
		STRB	R3, [SP,#0x6458+var_642C]
		STRB	R5, [R6]
		BL	strlen
		ADD	R2, SP,	#0x6458+var_642C
		STR	R9, [SP,#0x6458+var_6424]
		ADD	R3, SP,	#0x6458+var_6448
		STR	R5, [SP,#0x6458+handle]
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x6458+var_6428]
		LDMIA	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		ADD	R3, SP,	#0x6458+var_58
		ADD	R3, R3,	#0x50
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =firmware_version_internal
		LDMIA	R4, {R2,R3}
		LDR	R0, [R1,#(hFSUser - 0x10ACF4)] ; handle
		ADD	R1, SP,	#0x6458+handle ; out
		BL	FSUSER_OpenDirectory
		SUBS	R2, R0,	#0
		BEQ	loc_10100C
		MOV	R0, R6		; buff
		LDR	R1, =aFsuser_opendir ; fmt
		BL	xsprintf
		MOV	R0, R6
		B	loc_101094
; ---------------------------------------------------------------------------

loc_10100C				; CODE XREF: sub_100F64+90j
		MOV	R5, R2
		MOV	R7, R2
		MOV	R10, R2
		ADD	R8, SP,	#0x6458+buffer

loc_10101C				; CODE XREF: sub_100F64+120j
		MOV	R3, R8		; buffer
		LDR	R0, [SP,#0x6458+handle]	; handle
		ADD	R1, SP,	#0x6458+entriesRead ; entriesRead
		MOV	R2, #1		; entrycount
		STR	R10, [SP,#0x6458+entriesRead]
		BL	FSDIR_Read	; There	are some problems with this function which is abnormal.
		LDR	R3, [SP,#0x6458+entriesRead]
		CMP	R3, #0
		BEQ	loc_101088
		ADD	R2, SP,	#0x6458+var_5F38
		ADD	R2, R2,	#8
		SUB	R2, R2,	#0xA0
		ADD	R3, R6,	R7
		STR	R3, [R2,R5,LSL#2]
		MOV	R3, #0

loc_101058				; CODE XREF: sub_100F64+110j
		LDRH	R2, [R8,R3]
		CMP	R2, #0
		BEQ	loc_101078
		ADD	R3, R3,	#2
		CMP	R3, #0x450
		STRB	R2, [R6,R7]
		ADD	R7, R7,	#1
		BNE	loc_101058

loc_101078				; CODE XREF: sub_100F64+FCj
		STRB	R10, [R6,R7]
		ADD	R5, R5,	#1
		ADD	R7, R7,	#1
		B	loc_10101C
; ---------------------------------------------------------------------------

loc_101088				; CODE XREF: sub_100F64+D8j
		CMP	R5, #0
		BNE	loc_10109C
		LDR	R0, =aNoFileFound_ ; msg

loc_101094				; CODE XREF: sub_100F64+A4j
		BL	showMsg
		B	loc_1010F8
; ---------------------------------------------------------------------------

loc_10109C				; CODE XREF: sub_100F64+128j
					; sub_100F64+188j
		ADD	R2, SP,	#0x6458+var_5FD8
		MOV	R0, R9		; title
		MOV	R1, R5		; entryCount
		ADD	R2, R2,	#8	; captions
		BL	showMenu
		CMN	R0, #1
		BEQ	loc_1010F0
		ADD	R3, R6,	R0,LSL#2
		MOV	R2, R9
		MOV	R0, R8		; buff
		LDR	R1, =aSS	; "%s%s"
		LDR	R3, [R3,#-0xFA0]
		BL	xsprintf
		ADD	R3, SP,	#0x6458+var_58
		ADD	R3, R3,	#0x58
		STR	R8, [SP,#0x6458+var_6450]
		LDMIA	R3, {R0,R1}
		STMEA	SP, {R0,R1}
		LDMIA	R4, {R0-R3}
		BL	sub_100F64
		B	loc_10109C
; ---------------------------------------------------------------------------

loc_1010F0				; CODE XREF: sub_100F64+150j
		LDR	R0, [SP,#0x6458+handle]	; handle
		BL	FSDIR_Close

loc_1010F8				; CODE XREF: sub_100F64+134j
		ADD	SP, SP,	#0x6400
		ADD	SP, SP,	#0x28
		LDMFD	SP!, {R4-R10,LR}
		ADD	SP, SP,	#0x10
		BX	LR
; End of function sub_100F64

; ---------------------------------------------------------------------------
off_10110C	DCD firmware_version_internal ;	DATA XREF: sub_100F64+78r
; char *off_101110
off_101110	DCD aFsuser_opendir	; DATA XREF: sub_100F64+98r
					; "FSUSER_OpenDirectory failed, ret=%08x"
; u8 *off_101114
off_101114	DCD aNoFileFound_	; DATA XREF: sub_100F64+12Cr
					; "no file found."
; char *off_101118
off_101118	DCD aSS			; DATA XREF: sub_100F64+160r
					; "%s%s"

; =============== S U B	R O U T	I N E =======================================


sub_10111C

var_F8		= -0xF8
var_F0		= -0xF0
var_EC		= -0xEC
var_E8		= -0xE8
var_E4		= -0xE4
var_E0		= -0xE0
buff		= -0xD8

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0xF4
		ADD	R4, SP,	#0x100+var_F0
		MOV	R2, #0x18
		MOV	R1, #0
		MOV	R0, R4
		BL	memset
		LDR	R3, =0x567890AB
		LDR	R5, =firmware_version_internal
		STR	R3, [SP,#0x100+var_F0]
		MOV	R3, #1
		STRB	R3, [SP,#0x100+var_EC]
		STR	R3, [SP,#0x100+var_E8]
		LDR	R3, =0x10A4DD
		LDR	R0, [R5,#(hFSUser - 0x10ACF4)] ; handle
		MOV	R1, R4		; archive
		STR	R3, [SP,#0x100+var_E4]
		BL	FSUSER_OpenArchive
		SUBS	R2, R0,	#0
		BEQ	loc_101184
		ADD	R0, SP,	#0x100+buff ; buff
		LDR	R1, =aOpenarchiveFai ; fmt
		BL	xsprintf
		ADD	R0, SP,	#0x100+buff ; msg
		BL	showMsg
		B	loc_1011AC
; ---------------------------------------------------------------------------

loc_101184				; CODE XREF: sub_10111C+4Cj
		LDR	R3, =asc_109EDC	; "/"
		STR	R3, [SP,#0x100+var_F8]
		ADD	R3, SP,	#0x100+var_E0
		LDMIA	R3, {R0,R1}
		STMEA	SP, {R0,R1}
		LDMIA	R4, {R0-R3}
		BL	sub_100F64
		LDR	R0, [R5,#(hFSUser - 0x10ACF4)] ; handle
		MOV	R1, R4		; archive
		BL	FSUSER_CloseArchive

loc_1011AC				; CODE XREF: sub_10111C+64j
		ADD	SP, SP,	#0xF4
		LDMFD	SP!, {R4,R5,PC}
; End of function sub_10111C

; ---------------------------------------------------------------------------
dword_1011B4	DCD 0x567890AB		; DATA XREF: sub_10111C+1Cr
off_1011B8	DCD firmware_version_internal ;	DATA XREF: sub_10111C+20r
dword_1011BC	DCD 0x10A4DD		; DATA XREF: sub_10111C+34r
; char *off_1011C0
off_1011C0	DCD aOpenarchiveFai	; DATA XREF: sub_10111C+54r
					; "openArchive failed, ret=%08x"
off_1011C4	DCD asc_109EDC		; DATA XREF: sub_10111C:loc_101184r
					; "/"

; =============== S U B	R O U T	I N E =======================================


check_plugin_exit_flag			; CODE XREF: threadNtrHomeInjectee+130p
					; handle_network_client:loc_102F9Cp ...
		LDR	R3, =p_config_memory
		LDR	R3, [R3]
		LDR	R3, [R3,#0xA4]
		CMP	R3, #0
		BXEQ	LR
		B	svcExitThread
; End of function check_plugin_exit_flag

; ---------------------------------------------------------------------------
off_1011E0	DCD p_config_memory	; DATA XREF: check_plugin_exit_flagr

; =============== S U B	R O U T	I N E =======================================


sub_1011E4				; CODE XREF: threadNtrHomeInjectee+B4p

var_38		= -0x38
openflags	= -0x2C
attributes	= -0x28
out		= -0x20
var_1C		= -0x1C
var_18		= -0x18
var_14		= -0x14
var_10		= -0x10

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x3C	; archive
		MOV	R4, #0
		MOV	R3, #3
		MOV	R5, R0
		STRB	R3, [SP,#0x48+var_1C]
		STR	R4, [SP,#0x48+out]
		BL	strlen
		ADD	R2, SP,	#0x48+var_10
		STR	R5, [SP,#0x48+var_14]
		LDR	R12, =cfw_02
		ADD	R3, SP,	#0x48+var_38
		MOV	R5, #1
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x48+var_18]
		LDMDB	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		ADD	R3, R12, #8
		STR	R5, [SP,#0x48+openflags] ; openflags
		STR	R4, [SP,#0x48+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =firmware_version_internal
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1,#(hFSUser - 0x10ACF4)] ; handle
		ADD	R1, SP,	#0x48+out ; out
		BL	FSUSER_OpenFileDirectly
		CMP	R0, R4
		MOVNE	R0, R4
		BNE	loc_101268
		LDR	R0, [SP,#0x48+out] ; handle
		BL	FSFILE_Close
		MOV	R0, R5

loc_101268				; CODE XREF: sub_1011E4+74j
		ADD	SP, SP,	#0x3C
		LDMFD	SP!, {R4,R5,PC}
; End of function sub_1011E4

; ---------------------------------------------------------------------------
off_101270	DCD cfw_02		; DATA XREF: sub_1011E4+28r
off_101274	DCD firmware_version_internal ;	DATA XREF: sub_1011E4+58r

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

threadNtrHomeInjectee			; DATA XREF: main+1D0o	ROM:entrypointo
		STMFD	SP!, {R3-R7,LR}
		LDR	R3, =rthook
		LDR	R2, =callback_patch_smdh ; funcaddr
		LDR	R0, =rthook_patch_smdh ; callback_addr
		LDR	R1, [R3]	; hook
		BL	rtInitHook	; hook FSFile:Read (statically linked into homemenu) in	order to disable region	lock
		LDR	R0, =rthook_patch_smdh ; rthook
		BL	rtEnableHook
		LDR	R3, =nintendo_home_nss_CardUpdateInitialize_addr
		LDR	R2, =callback_return_C821180B ;	callback_addr
		LDR	R0, =rthook_return_C821180B ; hook
		LDR	R1, [R3]	; funcaddr
		BL	rtInitHook	; hook nss:CardUpdateInitialize	(statically linked into	homemenu) in order to bypass mandatory cart updates
		LDR	R0, =rthook_return_C821180B ; rthook
		BL	rtEnableHook
		LDR	R3, =nintendo_home_ptr_fsuser_handle
		LDR	R4, =cfw_02
		LDR	R5, =firmware_version_internal
		LDR	R3, [R3]
		MOV	R1, #0
		MOV	R2, #0x18
		LDR	R3, [R3]
		MOV	R0, R4
		STR	R3, [R5,#(hFSUser - 0x10ACF4)]
		BL	memset
		MOV	R3, #9
		STR	R3, [R4]
		MOV	R3, #1
		STRB	R3, [R4,#(byte_108604 -	0x108600)]
		STR	R3, [R4,#(dword_108608 - 0x108600)]
		LDR	R3, =0x10A4DD
		STR	R3, [R4,#(dword_10860C - 0x108600)]
		BL	assign_rwx_to_0x1F000000
		CMP	R0, #0
		BEQ	loc_101310
		MOV	R0, #0x64
		LDR	R1, =0x10000FF
		BL	lcd_solid_fill

loc_101310				; CODE XREF: threadNtrHomeInjectee+88j
		LDR	R3, =p_config_memory
		MOV	R2, #0
		LDR	R3, [R3]
		STR	R2, [R3]
		BL	srvInit
		BL	init_config_mem
		LDR	R0, =aDebug_flag ; "/debug.flag"
		BL	sub_1011E4
		CMP	R0, #0
		BEQ	loc_10133C
		BL	ntrSetupNetworkDebugServer

loc_10133C				; CODE XREF: threadNtrHomeInjectee+BCj
		LDR	R0, =0x3B9ACA00	; ns
		MOV	R1, #0
		BL	svcSleepThread
		BL	load_all_plugins_and_inject_ntr_into_pm
		BL	ntrScreenShotBuiltinPluginInit
		LDR	R4, =pid_of_home_menu
		LDR	R6, =is_NTR_OSD_requested
		LDR	R7, =firmware_version_internal ; nanoseconds

loc_10135C				; CODE XREF: threadNtrHomeInjectee+134j
		BL	read_pad
		LDR	R3, [R4,#(ntrKeyOpenMenu - 0x1085D4)]
		CMP	R0, R3		; X & Y	pressed?
		BNE	loc_10137C
		LDR	R3, [R6]
		CMP	R3, #0
		BEQ	loc_10137C
		BL	ntrMenu

loc_10137C				; CODE XREF: threadNtrHomeInjectee+F0j
					; threadNtrHomeInjectee+FCj
		LDR	R3, [R5,#0xC]
		CMP	R3, #0
		BEQ	loc_10139C
		BL	read_pad
		LDR	R3, [R7,#0xC]
		CMP	R0, R3
		BNE	loc_10139C
		BL	display_OSD_menu

loc_10139C				; CODE XREF: threadNtrHomeInjectee+10Cj
					; threadNtrHomeInjectee+11Cj
		LDR	R0, =0x5F5E100	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		BL	check_plugin_exit_flag
		B	loc_10135C
; End of function threadNtrHomeInjectee

; ---------------------------------------------------------------------------
off_1013B0	DCD rthook		; DATA XREF: threadNtrHomeInjectee+4r
; uint32_t callbackAddr
callbackAddr	DCD callback_patch_smdh	; DATA XREF: threadNtrHomeInjectee+8r
; RT_HOOK *hook
hook		DCD rthook_patch_smdh	; DATA XREF: threadNtrHomeInjectee+Cr
					; threadNtrHomeInjectee+18r
off_1013BC	DCD nintendo_home_nss_CardUpdateInitialize_addr
					; DATA XREF: threadNtrHomeInjectee+20r
; uint32_t off_1013C0
off_1013C0	DCD callback_return_C821180B ; DATA XREF: threadNtrHomeInjectee+24r
; RT_HOOK *off_1013C4
off_1013C4	DCD rthook_return_C821180B ; DATA XREF:	threadNtrHomeInjectee+28r
					; threadNtrHomeInjectee+34r
off_1013C8	DCD nintendo_home_ptr_fsuser_handle ; DATA XREF: threadNtrHomeInjectee+3Cr
off_1013CC	DCD cfw_02		; DATA XREF: threadNtrHomeInjectee+40r
off_1013D0	DCD firmware_version_internal ;	DATA XREF: threadNtrHomeInjectee+44r
					; threadNtrHomeInjectee+E0r
dword_1013D4	DCD 0x10A4DD		; DATA XREF: threadNtrHomeInjectee+78r
dword_1013D8	DCD 0x10000FF		; DATA XREF: threadNtrHomeInjectee+90r
off_1013DC	DCD p_config_memory	; DATA XREF: threadNtrHomeInjectee:loc_101310r
off_1013E0	DCD aDebug_flag		; DATA XREF: threadNtrHomeInjectee+B0r
					; "/debug.flag"
; s64 ns
ns		DCD 0x3B9ACA00		; DATA XREF: threadNtrHomeInjectee:loc_10133Cr
off_1013E8	DCD pid_of_home_menu	; DATA XREF: threadNtrHomeInjectee+D8r
off_1013EC	DCD is_NTR_OSD_requested ; DATA	XREF: threadNtrHomeInjectee+DCr
; s64 dword_1013F0
dword_1013F0	DCD 0x5F5E100		; DATA XREF: threadNtrHomeInjectee:loc_10139Cr

; =============== S U B	R O U T	I N E =======================================


ntrScreenShotCreate

handle		= -0x18
var_78		= -0x14
var_10		= -0x10

		STMFD	SP!, {R0-R2,R4,R5,LR}
		MOV	R1, R0		; processId
		MOV	R0, SP		; process
		BL	svcOpenProcess
		SUBS	R5, R0,	#0
		BNE	loc_101450
		LDR	R0, [SP,#0x18+handle] ;	handle
		BL	arm11kCmdGetKernelObject
		ADD	R4, SP,	#0x18+var_10
		MOV	R2, #4		; width
		STR	R5, [R4,#-4]!
		ADD	R5, R0,	#4
		MOV	R1, R5		; width
		MOV	R0, R4		; height
		BL	arm11kCmdMemcpy
		MOV	R3, #1
		MOV	R0, R5		; number of pixels
		MOV	R1, R4		; width
		MOV	R2, #4		; height
		STR	R3, [SP,#0x18+var_78]
		BL	arm11kCmdMemcpy
		LDR	R0, [SP,#0x18+handle] ;	handle
		BL	svcCloseHandle

loc_101450				; CODE XREF: ntrScreenShotCreate+14j
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrScreenShotCreate


; =============== S U B	R O U T	I N E =======================================


prepare_config_mem			; CODE XREF: main+154p

operation	= -0x20
permissions	= -0x1C
addr_out	= -0x14

		STMFD	SP!, {R4,R5,LR}
		MOV	R5, #0x6000000
		LDR	R4, =p_config_memory
		SUB	SP, SP,	#0x14
		MOV	R0, R5		; addr
		MOV	R1, #0x1000	; size
		STR	R5, [R4]
		BL	ntrProtectMemory
		CMP	R0, #0
		BEQ	loc_1014CC
; on failure, fall back	to RW only

		MOV	R3, #3		; MEMPERM_READ | MEMPERM_WRITE
		STR	R3, [SP,#0x20+operation] ; operation
		STR	R3, [SP,#0x20+permissions] ; permissions
		MOV	R1, R5		; addr0
		ADD	R0, SP,	#0x20+addr_out ; outaddr
		MOV	R2, #0		; addr1
		MOV	R3, #0x1000	; size
		BL	svcControlMemory
		SUBS	R5, R0,	#0
		BEQ	loc_1014B4
		LDR	R0, =aInitCfgMemoryF ; "init cfg memory failed"
		BL	showMsg
		B	loc_1014CC
; ---------------------------------------------------------------------------

loc_1014B4				; CODE XREF: prepare_config_mem+4Cj
		LDR	R0, [R4]
		MOV	R1, R5
		MOV	R2, #0x238
		BL	memset
		LDR	R3, [R4]
		STR	R5, [R3]

loc_1014CC				; CODE XREF: prepare_config_mem+24j
					; prepare_config_mem+58j
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4,R5,PC}
; End of function prepare_config_mem

; ---------------------------------------------------------------------------
off_1014D4	DCD p_config_memory	; DATA XREF: prepare_config_mem+8r
; u8 *off_1014D8
off_1014D8	DCD aInitCfgMemoryF	; DATA XREF: prepare_config_mem+50r
					; "init cfg memory failed"

; =============== S U B	R O U T	I N E =======================================


inject_ntr_into_home_menu		; CODE XREF: main+140p

handle		= -0x244
buf		= -0x240
var_8		= -8

		STMFD	SP!, {R4,LR}
		SUB	SP, SP,	#0x240
		MOV	R1, #0
		ADD	R0, SP,	#0x248+buf
		MOV	R2, #0x238
		BL	memset
		LDR	R3, =nsDbgPrint_
		LDR	R4, =arm11BinStart
		LDR	R2, [R3,#(dword_100110 - 0x100104)] ; offs 0x0C	= func *
		LDR	R0, [R3,#(nsDbgPrint_1 - 0x100104)] ; size
		STR	R2, [R4]
		BL	rtAlignToPageSize
		LDR	R3, =arm11BinSize
		STR	R0, [R3]
		ADD	R0, SP,	#0x248+var_8
		MOV	R3, #0
		STR	R3, [R0,#-0x23C]!
		LDR	R3, =pid_of_home_menu
		LDR	R1, [R3]	; processId
		BL	svcOpenProcess
		LDR	R3, [R4]
		MOV	R2, #1
		STR	R2, [R3,#4]
		LDR	R3, =nintendo_home_FlushDataCache_addr
		ADD	R2, SP,	#0x248+buf ; buf
		LDR	R0, [SP,#0x248+handle] ; handle
		LDR	R1, [R3]	; addr_jmpcode
		BL	inject_ntr_into_remote_process
		LDR	R0, [SP,#0x248+handle] ; handle
		BL	svcCloseHandle
		ADD	SP, SP,	#0x240
		LDMFD	SP!, {R4,PC}
; End of function inject_ntr_into_home_menu

; ---------------------------------------------------------------------------
off_10155C	DCD nsDbgPrint_		; DATA XREF: inject_ntr_into_home_menu+18r
off_101560	DCD arm11BinStart	; DATA XREF: inject_ntr_into_home_menu+1Cr
off_101564	DCD arm11BinSize	; DATA XREF: inject_ntr_into_home_menu+30r
off_101568	DCD pid_of_home_menu	; DATA XREF: inject_ntr_into_home_menu+44r
off_10156C	DCD nintendo_home_FlushDataCache_addr
					; DATA XREF: inject_ntr_into_home_menu+5Cr

; =============== S U B	R O U T	I N E =======================================


sleep_thread				; CODE XREF: main+198p
		STMFD	SP!, {R4,LR}
		MOV	R4, #0xA

loc_101578				; CODE XREF: sleep_thread+18j
		LDR	R0, =0x989680	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		SUBS	R4, R4,	#1
		BNE	loc_101578
		LDMFD	SP!, {R4,PC}
; End of function sleep_thread

; ---------------------------------------------------------------------------
; s64 dword_101590
dword_101590	DCD 0x989680		; DATA XREF: sleep_thread:loc_101578r

; =============== S U B	R O U T	I N E =======================================


close_all_srv_handles_			; CODE XREF: main+120p
		STMFD	SP!, {R4,LR}
		MOV	R4, #0xA

loc_10159C				; CODE XREF: close_all_srv_handles_+20j
		BL	srvInit
		BL	srvExit
		LDR	R0, =0x989680	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		SUBS	R4, R4,	#1
		BNE	loc_10159C
		LDMFD	SP!, {R4,PC}
; End of function close_all_srv_handles_

; ---------------------------------------------------------------------------
; s64 dword_1015BC
dword_1015BC	DCD 0x989680		; DATA XREF: close_all_srv_handles_+10r

; =============== S U B	R O U T	I N E =======================================


sub_1015C0
		LDR	R0, =0x3B9ACA00	; ns
		STMFD	SP!, {R3,LR}
		MOV	R1, #0
		BL	svcSleepThread
		LDMFD	SP!, {R3,PC}
; End of function sub_1015C0

; ---------------------------------------------------------------------------
; s64 dword_1015D4
dword_1015D4	DCD 0x3B9ACA00		; DATA XREF: sub_1015C0r

; =============== S U B	R O U T	I N E =======================================


; int __cdecl main(int argc, const char	**argv,	const char **envp)
main					; CODE XREF: ntrInstall+20j

thread		= -0x1C

		STMFD	SP!, {R0-R8,LR}	; threadpriority
		LDR	R5, =nsDbgPrint_
		LDR	R7, =firmware_version_internal
		LDR	R6, [R5]
		MOV	R4, R7
		CMP	R6, #0
		STR	R6, [R7,#(dword_10AD04 - 0x10ACF4)]
		BNE	loc_101720
		LDR	R0, =0x109F01
		BL	sub_107200
		LDR	R3, [R5,#(dword_100108 - 0x100104)]
		MOV	R1, R6
		STR	R3, [R7,#(allowDirectScreenAccess - 0x10ACF4)]
		LDR	R3, [R5,#(nsDbgPrint_0 - 0x100104)]
		LDR	R5, =cfw_02
		MOV	R2, #0x18
		MOV	R0, R5
		STR	R3, [R7,#(hFSUser - 0x10ACF4)]
		BL	memset
		MOV	R3, #9
		STR	R3, [R5]
		MOV	R3, #1
		STRB	R3, [R5,#(byte_108604 -	0x108600)]
		STR	R3, [R5,#(dword_108608 - 0x108600)]
		LDR	R3, =0x10A4DD
		STR	R3, [R5,#(dword_10860C - 0x108600)]
		BL	get_nintendo_home_version_info
		BL	get_kernel_version_info
		LDR	R3, [R7]
		CMP	R3, #0
		BNE	loc_10165C
		LDR	R0, =aFirmVersionNot ; "firm version not supported"
		BL	showMsg

loc_10165C				; CODE XREF: main+78j
		LDR	R3, [R4,#4]
		CMP	R3, #0
		BNE	loc_101670
		LDR	R0, =aHomemenuVersio ; msg
		BL	showMsg

loc_101670				; CODE XREF: main+8Cj
		LDR	R3, [R4,#4]
		LDR	R5, =firmware_version_internal
		CMP	R3, #0
		BEQ	loc_10168C
		LDR	R3, [R5]
		CMP	R3, #0
		BNE	loc_1016EC

loc_10168C				; CODE XREF: main+A4j
		LDR	R0, =aFirmwareVersio ; "firmware version not supported"
		BL	showMsg
		MOV	R0, #0		; pid
		LDR	R1, =aPid0_dmp	; filename
		BL	dumpProcessToFile
		MOV	R0, #2		; pid
		LDR	R1, =aPid2_dmp	; filename
		BL	dumpProcessToFile
		MOV	R0, #3		; pid
		LDR	R1, =aPid3_dmp	; filename
		BL	dumpProcessToFile
		MOV	R0, #0xF	; pid
		LDR	R1, =aPidf_dmp	; filename
		BL	dumpProcessToFile
		LDR	R0, =0xDFF80000	; va_dumpaddr
		MOV	R1, #0x80000	; size
		LDR	R2, =aAxiwram_dmp ; filename
		BL	dumpMemoryToFile
		LDR	R0, =aCurrentFirmwar ; "current firmware not supported. \npleas"...
		BL	showMsg

loc_1016DC				; CODE XREF: main+110j
		LDR	R0, =0x3B9ACA00	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		B	loc_1016DC
; ---------------------------------------------------------------------------

loc_1016EC				; CODE XREF: main+B0j
		BL	arm11kCmdReplaceSVC6DHandler
		LDR	R0, =aKernelhaxDone ; "kernelhax done"
		BL	showMsg
		BL	close_all_srv_handles_
		LDR	R1, [R5,#(dword_10ACF8 - 0x10ACF4)] ; errno
		MOV	R2, #0		; v2
		LDR	R0, =aHomemenuVerD ; fmt
		BL	showDbg
		MOV	R0, #0x64
		LDR	R1, =0x1FF0000
		BL	lcd_solid_fill
		BL	inject_ntr_into_home_menu
		B	loc_101854
; ---------------------------------------------------------------------------

loc_101720				; CODE XREF: main+1Cj
		CMP	R6, #1
		BNE	loc_101854
		LDR	R5, =p_config_memory
		BL	prepare_config_mem
		BL	init_config_mem
		LDR	R3, [R5]
		MOV	R1, #8		; size
		LDR	R6, [R3,#0x28]
		LDR	R2, [R3,#0x20]!
		MOV	R0, R6		; addr
		STR	R2, [R6]
		LDR	R2, [R3,#4]
		STR	R2, [R6,#4]
		BL	rtFlushInstructionCache
		MOV	R0, R6		; dst
		LDR	R1, =locret_1001A0 ; src
		BL	rtGenerateJumpCode
		MOV	R1, #8		; size
		LDR	R0, =locret_1001A0 ; addr
		BL	rtFlushInstructionCache
		BL	sleep_thread
		BL	get_nintendo_home_version_info
		BL	get_kernel_version_info
		BL	ntrGetCurrentProcessId
		LDR	R3, =pid_of_home_menu
		MOV	R8, R3
		LDR	R2, [R3]
		LDR	R3, =0x6001000
		CMP	R0, R2		; current pid == pid of	nintendo home menu?
		MOV	R6, R0
		BNE	loc_1017C4
; this will be executed	if we're running from
; within nintendo home menu

		STR	R3, [R7,#(dword_10AD0C - 0x10ACF4)]
		MOV	R0, #0x10
		MOV	R3, #0xFFFFFFFE
		LDR	R1, =threadNtrHomeInjectee ; entrypoint
		STMEA	SP, {R0,R3}
		MOV	R2, #0		; arg
		ADD	R0, SP,	#0x28+thread ; thread
		LDR	R3, =0x6004FD8	; stacktop
		BL	svcCreateThread
		B	loc_101854
; ---------------------------------------------------------------------------

loc_1017C4				; CODE XREF: main+1C0j
		STR	R3, [R7,#(dword_10AD0C - 0x10ACF4)]
		BL	is_BUTTON_DL_pressed
		CMP	R0, #0
		BNE	loc_1017E8
		LDR	R3, [R5]
		LDR	R2, [R3,#4]
		LDR	R3, =0x3EA
		CMP	R2, R3
		BNE	loc_10181C

loc_1017E8				; CODE XREF: main+1F8j
		LDR	R3, [R4,#0x18]
		MOV	R1, #0x3F
		MOV	R2, #0xFFFFFFFE
		ADD	R3, R3,	#0x3FC0
		STMEA	SP, {R1,R2}
		ADD	R0, SP,	#0x28+thread ; thread
		LDR	R1, =threadSetupNetworkDebugServer ; entrypoint
		MOV	R2, #0		; arg
		ADD	R3, R3,	#0x18	; stacktop
		BL	svcCreateThread
		LDR	R0, =0x3B9ACA00	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread

loc_10181C				; CODE XREF: main+20Cj
		LDR	R3, [R8,#0xC]	; r8+8 = pid of	pm (=2)
		CMP	R6, R3		; are we process manager?
		BNE	loc_101830
; this will be executed	if we're running from
; within the process manager and will be used
; to force it to inject	code into nintendo home	menu

		BL	install_home_injection_hook
		B	loc_101854
; ---------------------------------------------------------------------------

loc_101830				; CODE XREF: main+24Cj
		LDR	R3, [R5]
		LDR	R2, [R3,#4]
		LDR	R3, =0x3E9
		CMP	R2, R3
		BNE	loc_101854
		MOV	R0, #0x64
		LDR	R1, =0x100FF00
		BL	lcd_solid_fill
		BL	init_all_plugins

loc_101854				; CODE XREF: main+144j	main+14Cj ...
		MOV	R0, #0
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R8,PC}
; End of function main

; ---------------------------------------------------------------------------
off_101860	DCD nsDbgPrint_		; DATA XREF: main+4r
off_101864	DCD firmware_version_internal ;	DATA XREF: main+8r main+9Cr
dword_101868	DCD 0x109F01		; DATA XREF: main+20r
off_10186C	DCD cfw_02		; DATA XREF: main+38r
dword_101870	DCD 0x10A4DD		; DATA XREF: main+60r
; u8 *off_101874
off_101874	DCD aFirmVersionNot	; DATA XREF: main+7Cr
					; "firm version not supported"
; u8 *off_101878
off_101878	DCD aHomemenuVersio	; DATA XREF: main+90r
					; "homemenu version not supported"
; u8 *off_10187C
off_10187C	DCD aFirmwareVersio	; DATA XREF: main:loc_10168Cr
					; "firmware version not supported"
; char *filename
filename	DCD aPid0_dmp		; DATA XREF: main+C0r
					; "/pid0.dmp"
; char *off_101884
off_101884	DCD aPid2_dmp		; DATA XREF: main+CCr
					; "/pid2.dmp"
; char *off_101888
off_101888	DCD aPid3_dmp		; DATA XREF: main+D8r
					; "/pid3.dmp"
; char *off_10188C
off_10188C	DCD aPidf_dmp		; DATA XREF: main+E4r
					; "/pidf.dmp"
; u32 va_dumpaddr
va_dumpaddr	DCD 0xDFF80000		; DATA XREF: main+ECr
; char *off_101894
off_101894	DCD aAxiwram_dmp	; DATA XREF: main+F4r
					; "/axiwram.dmp"
; u8 *off_101898
off_101898	DCD aCurrentFirmwar	; DATA XREF: main+FCr
					; "current firmware not supported. \npleas"...
; s64 dword_10189C
dword_10189C	DCD 0x3B9ACA00		; DATA XREF: main:loc_1016DCr
					; main+238r
; u8 *off_1018A0
off_1018A0	DCD aKernelhaxDone	; DATA XREF: main+118r
					; "kernelhax done"
; u8 *off_1018A4
off_1018A4	DCD aHomemenuVerD	; DATA XREF: main+12Cr
					; "homemenu ver: %d"
dword_1018A8	DCD 0x1FF0000		; DATA XREF: main+138r
off_1018AC	DCD p_config_memory	; DATA XREF: main+150r
; uint32_t addr
addr		DCD locret_1001A0	; DATA XREF: main+184r	main+190r
off_1018B4	DCD pid_of_home_menu	; DATA XREF: main+1A8r
dword_1018B8	DCD 0x6001000		; DATA XREF: main+1B4r
; ThreadFunc entrypoint
entrypoint	DCD threadNtrHomeInjectee ; DATA XREF: main+1D0r
; u32 *stacktop
stacktop	DCD 0x6004FD8		; DATA XREF: main+1E0r
dword_1018C4	DCD 0x3EA		; DATA XREF: main+204r
; ThreadFunc off_1018C8
off_1018C8	DCD threadSetupNetworkDebugServer ; DATA XREF: main+228r
dword_1018CC	DCD 0x3E9		; DATA XREF: main+260r
dword_1018D0	DCD 0x100FF00		; DATA XREF: main+270r
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ntr2dPaintPixel

write_color				; CODE XREF: ntr2dPaintPixel+28j
		STRB	R3, [R0]
		STRB	R2, [R0,#1]
		STRB	R1, [R0,#2]
		BX	LR
; END OF FUNCTION CHUNK	FOR ntr2dPaintPixel

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __fastcall write_byte(u32 address, u8 byte)
write_byte
		STRB	R1, [R0]
		BX	LR
; End of function write_byte


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; unsigned __int8 __fastcall ntrMemoryNibbleToReadable(u8 nibble)
ntrMemoryNibbleToReadable		; CODE XREF: ntrMemoryByteToString+18p
					; ntrMemoryByteToString+24p ...
		CMP	R0, #9
		ADDLS	R0, R0,	#0x30
		ADDHI	R0, R0,	#0x37
		UXTB	R0, R0
		BX	LR
; End of function ntrMemoryNibbleToReadable


; =============== S U B	R O U T	I N E =======================================


; u32 __fastcall ntrMemoryByteToString(u8 byte,	unsigned __int8	*ret, int max_len)
ntrMemoryByteToString			; CODE XREF: ntr2dPrintU8+18p
		CMP	R2, #2
		BLE	locret_101938
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		AND	R0, R0,	#0xF
		MOV	R4, R1
		BL	ntrMemoryNibbleToReadable
		STRB	R0, [R4,#1]
		MOV	R0, R5,LSR#4	; nibble
		BL	ntrMemoryNibbleToReadable
		STRB	R0, [R4]
		MOV	R0, #0
		STRB	R0, [R4,#2]
		LDMFD	SP!, {R3-R5,PC}
; ---------------------------------------------------------------------------

locret_101938				; CODE XREF: ntrMemoryByteToString+4j
		BX	LR
; End of function ntrMemoryByteToString


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u32 __fastcall ntrMemoryU32ToString(u32 byte,	unsigned __int8	*ret, int max_len)
ntrMemoryU32ToString			; CODE XREF: ntr2dPrintU32+1Cp
		CMP	R2, #8
		BLE	locret_101990
		STMFD	SP!, {R4-R8,LR}
		MOV	R4, R1
		MOV	R7, R0
		ADD	R8, R1,	#8
		MOV	R5, #0
		MOV	R6, #0xF

loc_10195C				; CODE XREF: ntrMemoryU32ToString+44j
		AND	R3, R6,	R7
		MOV	R0, R5,LSL#2
		ADD	R5, R5,	#1
		MOV	R0, R3,LSR R0
		MOV	R6, R6,LSL#4
		UXTB	R0, R0
		BL	ntrMemoryNibbleToReadable
		CMP	R5, #8
		STRB	R0, [R8,#-1]!
		BNE	loc_10195C
		MOV	R0, #0
		STRB	R0, [R4,#8]
		LDMFD	SP!, {R4-R8,PC}
; ---------------------------------------------------------------------------

locret_101990				; CODE XREF: ntrMemoryU32ToString+4j
		BX	LR
; End of function ntrMemoryU32ToString

; ---------------------------------------------------------------------------
		ALIGN 0x10

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall sleep(s64 ns)
sleep
		SVC	0xA
		BX	LR
; End of function sleep


; =============== S U B	R O U T	I N E =======================================


cb_arm11_dispatch
		STMFD	SP!, {R3-R11,LR}
		MRS	R0, CPSR
		ORR	R0, R0,	#0xC0	; disable fiq and irq
		MSR	CPSR_cf, R0
		BL	arm11kDispatchCmd
		LDMFD	SP!, {R3-R11,PC}
; End of function cb_arm11_dispatch


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

InvalidateEntireInstructionCache	; CODE XREF: install_SVC_6D_hook+80p
					; clean_cache+44p
		MOV	R0, #0
		MCR	p15, 0,	R0,c7,c5, 0
		BX	LR
; End of function InvalidateEntireInstructionCache

; [0000000C BYTES: COLLAPSED FUNCTION CleanEntireDataCache. PRESS KEYPAD CTRL-"+" TO EXPAND]
nsDbgPrint_5	ALIGN 0x10

; =============== S U B	R O U T	I N E =======================================


init_debugger				; DATA XREF: init_config_mem+Co
					; ROM:off_103150o
		LDR	R2, =p_config_memory
		LDR	R3, [R2]
		LDR	R1, [R3,#0x14]
		LDR	R12, [R3,#0x10]
		CMP	R1, R12
		LDRCC	R3, [R3,#0xC]
		STRCCB	R0, [R3,R1]
		LDRCC	R2, [R2]
		LDRCC	R3, [R2,#0x14]
		ADDCC	R3, R3,	#1
		STRCC	R3, [R2,#0x14]
		BX	LR
; End of function init_debugger

; ---------------------------------------------------------------------------
off_101A10	DCD p_config_memory	; DATA XREF: init_debuggerr

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	sendMsg(u8 *msg)
sendMsg					; CODE XREF: callback_patch_smdh+3Cp
					; handle_savefile_packet+11Cp ...

arp		= -0x1C
varg_r0		= -0x10
varg_r1		= -0xC
varg_r2		= -8
varg_r3		= -4

		STMFD	SP!, {R0-R3}	; sends	str to connected network client
		STMFD	SP!, {R0,R1,R4,LR}
		ADD	R3, SP,	#0x20+varg_r1
		LDR	R4, =p_config_memory
		STR	R3, [SP,#0x20+arp]
		LDR	R0, [R4]
		CMP	R0, #0
		BEQ	loc_101A60
		LDR	R3, [R0,#0x18]
		CMP	R3, #0
		BEQ	loc_101A60
		ADD	R0, R0,	#0x1C	; lock
		BL	rtAcquireLock
		LDR	R0, [SP,#0x20+varg_r0] ; fmt
		LDR	R1, [SP,#0x20+arp] ; arp
		BL	xvprintf
		LDR	R0, [R4]
		ADD	R0, R0,	#0x1C	; lock
		BL	rtReleaseLock

loc_101A60				; CODE XREF: sendMsg+1Cj sendMsg+28j
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4,LR}
		ADD	SP, SP,	#0x10
		BX	LR
; End of function sendMsg

; ---------------------------------------------------------------------------
off_101A70	DCD p_config_memory	; DATA XREF: sendMsg+Cr

; =============== S U B	R O U T	I N E =======================================


sub_101A74				; CODE XREF: handle_readmem_packet+94p
					; dispatch_client_cmd+54p
		LDR	R3, =ntrNetworkDebugServerStack
		LDR	R3, [R3]
		ADD	R1, R3,	#0x2000
		LDR	R0, [R3,#8]
		LDR	R2, [R1,#0x74]
		ADD	R1, R1,	#0x24
		STR	R2, [R1,#0x54]
		MOV	R2, #0x54
		B	sub_104EC0
; End of function sub_101A74

; ---------------------------------------------------------------------------
off_101A98	DCD ntrNetworkDebugServerStack ; DATA XREF: sub_101A74r

; =============== S U B	R O U T	I N E =======================================


sub_101A9C				; CODE XREF: handle_readmem_packet+128p
					; dispatch_client_cmd+6Cp
		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4,LR}
		MOV	R2, R1		; v2
		LDR	R12, [R3]
		ADD	LR, R12, #0x2000
		LDR	R1, [LR,#0x78]	; errno
		CMP	R1, R2
		BCC	loc_101AD8
		MOV	R4, R0
		RSB	R3, R2,	R1
		STR	R3, [LR,#0x78]
		MOV	R1, R4
		LDR	R0, [R12,#8]
		LDMFD	SP!, {R4,LR}
		B	sub_104EC0
; ---------------------------------------------------------------------------

loc_101AD8				; CODE XREF: sub_101A9C+1Cj
		LDR	R0, =aSendRemainSize ; "send remain < size: %08x, %08x"
		BL	showDbg
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R4,PC}
; End of function sub_101A9C

; ---------------------------------------------------------------------------
off_101AE8	DCD ntrNetworkDebugServerStack ; DATA XREF: sub_101A9Cr
; u8 *off_101AEC
off_101AEC	DCD aSendRemainSize	; DATA XREF: sub_101A9C:loc_101AD8r
					; "send remain < size: %08x, %08x"

; =============== S U B	R O U T	I N E =======================================


recv_wrapper				; CODE XREF: handle_savefile_packet+28p
					; handle_savefile_packet+D8p ...
		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4,LR}
		MOV	R2, R1		; v2
		LDR	R12, [R3]
		ADD	LR, R12, #0x2000
		LDR	R1, [LR,#0x78]	; errno
		CMP	R1, R2
		BCC	loc_101B2C
		MOV	R4, R0
		RSB	R3, R2,	R1
		STR	R3, [LR,#0x78]
		MOV	R1, R4
		LDR	R0, [R12,#8]
		LDMFD	SP!, {R4,LR}
		B	recv_
; ---------------------------------------------------------------------------

loc_101B2C				; CODE XREF: recv_wrapper+1Cj
		LDR	R0, =aRecvRemainSize ; fmt
		BL	showDbg
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R4,PC}
; End of function recv_wrapper

; ---------------------------------------------------------------------------
off_101B3C	DCD ntrNetworkDebugServerStack ; DATA XREF: recv_wrapperr
; u8 *off_101B40
off_101B40	DCD aRecvRemainSize	; DATA XREF: recv_wrapper:loc_101B2Cr
					; "recv remain < size: %08x, %08x"

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame fpd=0x220

handle_savefile_packet			; CODE XREF: dispatch_client_cmd+94p

var_250		= -0x250
openflags	= -0x244
attributes	= -0x240
out		= -0x234
bytesWritten	= -0x230
var_22C		= -0x22C
var_228		= -0x228
var_224		= -0x224
var_20		= -0x20

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x260	; size
		LDR	R6, =ntrNetworkDebugServerStack
		ADD	R7, SP,	#0x40
		MOV	R1, #0x200
		LDR	R3, [R6]
		MOV	R0, R7
		ADD	R3, R3,	#0x2000
		MOV	R8, #0
		LDR	R4, [R3,#0x74]
		BL	recv_wrapper
		MOV	R3, #3
		MOV	R0, R7		; a1
		STRB	R3, [SP,#0x260+var_22C]
		STRB	R8, [SP,#0x260+var_20]
		BL	strlen
		ADD	R2, SP,	#0x260+var_22C
		STR	R7, [SP,#0x260+var_224]
		ADD	R3, SP,	#0x260+var_250
		LDR	R12, =cfw_02
		SUB	R4, R4,	#0x200
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x260+var_228]
		LDMIA	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x260+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R8, [SP,#0x260+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x260+out ; out
		BL	FSUSER_OpenFileDirectly
		SUBS	R1, R0,	#0	; errno
		MOVEQ	R5, R1
		LDREQ	R10, =0x1FFF
		MOVEQ	R9, R1
		BEQ	loc_101BF8
		LDR	R0, =aOpenfileFailed ; "openFile failed: %08x"
		MOV	R2, R8		; v2
		BL	showDbg
		B	loc_101C64
; ---------------------------------------------------------------------------

loc_101BF8				; CODE XREF: handle_savefile_packet+A0j
					; handle_savefile_packet+108j
		CMP	R4, #0
		BEQ	loc_101C50
		LDR	R0, [R6]
		CMP	R4, R10
		MOVLS	R8, R4
		MOVHI	R8, #0x2000
		ADD	R0, R0,	#0x2040
		MOV	R1, R8
		ADD	R0, R0,	#0x3C
		BL	recv_wrapper
		LDR	R3, [R6]
		MOV	R2, R5		; offset
		ADD	R3, R3,	#0x2040
		ADD	R3, R3,	#0x3C
		LDR	R0, [SP,#0x260+out] ; handle
		STMEA	SP, {R3,R8,R9}
		ADD	R1, SP,	#0x260+bytesWritten ; bytesWritten
		MOV	R3, #0		; buffer
		BL	FSFILE_Write
		RSB	R4, R8,	R4
		ADD	R5, R5,	R8
		B	loc_101BF8
; ---------------------------------------------------------------------------

loc_101C50				; CODE XREF: handle_savefile_packet+B8j
		LDR	R0, [SP,#0x260+out] ; handle
		BL	svcCloseHandle
		LDR	R0, =aSavedToSSucces ; "saved to %s successfully\n"
		MOV	R1, R7
		BL	sendMsg

loc_101C64				; CODE XREF: handle_savefile_packet+B0j
		ADD	SP, SP,	#0x260
		LDMFD	SP!, {R4-R10,PC}
; End of function handle_savefile_packet

; ---------------------------------------------------------------------------
off_101C6C	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_savefile_packet+8r
off_101C70	DCD cfw_02		; DATA XREF: handle_savefile_packet+4Cr
off_101C74	DCD hFSUser		; DATA XREF: handle_savefile_packet+7Cr
dword_101C78	DCD 0x1FFF		; DATA XREF: handle_savefile_packet+98r
; u8 *off_101C7C
off_101C7C	DCD aOpenfileFailed	; DATA XREF: handle_savefile_packet+A4r
					; "openFile failed: %08x"
; u8 *off_101C80
off_101C80	DCD aSavedToSSucces	; DATA XREF: handle_savefile_packet+114r
					; "saved to %s successfully\n"

; =============== S U B	R O U T	I N E =======================================


sub_101C84				; CODE XREF: handle_debugcmd_packet+24p
		LDR	R3, =ntrNetworkDebugServerStack
		MOV	R0, #1
		MOV	R1, #0x15C
		LDR	R2, [R3]

loc_101C94				; CODE XREF: sub_101C84+30j
		MUL	R3, R1,	R0
		ADD	R3, R3,	#0x6000
		ADD	R3, R3,	#0x94
		LDR	R3, [R2,R3]
		CMP	R3, #0
		BXEQ	LR
		ADD	R0, R0,	#1
		CMP	R0, #0x40
		BNE	loc_101C94
		MOV	R0, #0xFFFFFFFF
		BX	LR
; End of function sub_101C84

; ---------------------------------------------------------------------------
off_101CC0	DCD ntrNetworkDebugServerStack ; DATA XREF: sub_101C84r

; =============== S U B	R O U T	I N E =======================================


debugcmd_enable_breakpoint		; CODE XREF: debugcmd_init_breakpoint+68p
					; handle_debugcmd_packet+A4p
		LDR	R3, =ntrNetworkDebugServerStack
		MOV	R1, R0
		STMFD	SP!, {R4,LR}
		LDR	R0, [R3]
		MOV	R3, #0x15C
		MUL	R3, R3,	R1
		ADD	R2, R0,	R3
		ADD	R12, R2, #0x6100
		ADD	R12, R12, #0xE8
		LDR	LR, [R12,#4]
		CMP	LR, #0
		LDRNE	R0, =aBpDAlreadyEnab ; "bp %d already enabled\n"
		BNE	loc_101D30
		ADD	R2, R2,	#0x6000
		MOV	R4, R1
		LDR	R2, [R2,#0x94]
		MOV	R1, #1
		SUB	R2, R2,	#1
		CMP	R2, R1
		STR	R1, [R12,#4]
		BHI	loc_101D28
		ADD	R3, R3,	#0x6000
		ADD	R0, R0,	R3
		ADD	R0, R0,	#0xA0	; rthook
		BL	rtEnableHook

loc_101D28				; CODE XREF: debugcmd_enable_breakpoint+50j
		LDR	R0, =aBpDEnabled ; msg
		MOV	R1, R4

loc_101D30				; CODE XREF: debugcmd_enable_breakpoint+30j
		LDMFD	SP!, {R4,LR}
		B	sendMsg
; End of function debugcmd_enable_breakpoint

; ---------------------------------------------------------------------------
off_101D38	DCD ntrNetworkDebugServerStack ; DATA XREF: debugcmd_enable_breakpointr
off_101D3C	DCD aBpDAlreadyEnab	; DATA XREF: debugcmd_enable_breakpoint+2Cr
					; "bp %d already enabled\n"
; u8 *off_101D40
off_101D40	DCD aBpDEnabled		; DATA XREF: debugcmd_enable_breakpoint:loc_101D28r
					; "bp %d enabled\n"

; =============== S U B	R O U T	I N E =======================================


debugcmd_disable_breakpoint		; CODE XREF: sub_101DC4+3Cp
					; handle_debugcmd_packet+B8p
		LDR	R3, =ntrNetworkDebugServerStack
		MOV	R1, R0
		STMFD	SP!, {R4,LR}
		LDR	R0, [R3]
		MOV	R3, #0x15C
		MUL	R3, R3,	R1
		ADD	R2, R0,	R3
		ADD	R12, R2, #0x6100
		ADD	R12, R12, #0xE8
		LDR	LR, [R12,#4]
		CMP	LR, #0
		LDREQ	R0, =aBpDAlreadyDisa ; "bp %d already disabled\n"
		BEQ	loc_101DB0
		ADD	R2, R2,	#0x6000
		MOV	R4, R1
		LDR	R2, [R2,#0x94]
		MOV	R1, #0
		SUB	R2, R2,	#1
		CMP	R2, #1
		STR	R1, [R12,#4]
		BHI	loc_101DA8
		ADD	R3, R3,	#0x6000
		ADD	R0, R0,	R3
		ADD	R0, R0,	#0xA0	; hook
		BL	rtDisableHook

loc_101DA8				; CODE XREF: debugcmd_disable_breakpoint+50j
		LDR	R0, =aBpDDisabled ; "bp %d disabled\n"
		MOV	R1, R4

loc_101DB0				; CODE XREF: debugcmd_disable_breakpoint+30j
		LDMFD	SP!, {R4,LR}
		B	sendMsg
; End of function debugcmd_disable_breakpoint

; ---------------------------------------------------------------------------
off_101DB8	DCD ntrNetworkDebugServerStack ; DATA XREF: debugcmd_disable_breakpointr
off_101DBC	DCD aBpDAlreadyDisa	; DATA XREF: debugcmd_disable_breakpoint+2Cr
					; "bp %d already disabled\n"
; u8 *off_101DC0
off_101DC0	DCD aBpDDisabled	; DATA XREF: debugcmd_disable_breakpoint:loc_101DA8r
					; "bp %d disabled\n"

; =============== S U B	R O U T	I N E =======================================


sub_101DC4				; DATA XREF: sub_101EA4+A0o
					; ROM:off_101FA8o

var_1C		= -0x1C

		STMFD	SP!, {R0-R2,R4-R7,LR}
		MOV	R7, R0
		LDR	R5, =ntrNetworkDebugServerStack
		MOV	R6, R1
		LDR	R4, [R5]
		ADD	R0, R4,	#0x6000
		ADD	R0, R0,	#0x90	; lock
		BL	rtAcquireLock
		MOV	R3, #0x15C
		MLA	R3, R3,	R6, R4
		ADD	R3, R3,	#0x6000
		LDR	R3, [R3,#0x94]
		CMP	R3, #2
		BNE	loc_101E04
		MOV	R0, R6
		BL	debugcmd_disable_breakpoint

loc_101E04				; CODE XREF: sub_101DC4+34j
		LDR	R0, [R5]
		ADD	R4, R4,	#0xB000
		ADD	R0, R0,	#0xB700
		ADD	R0, R0,	#0x94	; lock
		BL	rtAcquireLock
		LDR	R0, [R5]
		MOV	R3, #0
		ADD	R0, R0,	#0xB700
		STR	R6, [R4,#0x798]
		STR	R7, [R4,#0x79C]
		STR	R3, [R4,#0x7A0]
		ADD	R0, R0,	#0x94	; lock
		BL	rtReleaseLock

loc_101E38				; CODE XREF: sub_101DC4+B0j
		LDR	R0, [R5]
		ADD	R0, R0,	#0xB700
		ADD	R0, R0,	#0x94	; lock
		BL	rtAcquireLock
		LDR	R0, [R5]
		LDR	R3, [R4,#0x7A0]
		ADD	R0, R0,	#0xB700
		ADD	R0, R0,	#0x94	; lock
		STR	R3, [SP,#0x20+var_1C]
		BL	rtReleaseLock
		LDR	R0, =0x5F5E100	; ns
		MOV	R1, #0
		BL	svcSleepThread
		LDR	R3, [SP,#0x20+var_1C]
		CMP	R3, #0
		BEQ	loc_101E38
		MOV	R3, #0
		STR	R3, [R4,#0x798]
		LDR	R3, =ntrNetworkDebugServerStack
		LDR	R0, [R3]
		ADD	R0, R0,	#0x6000
		ADD	R0, R0,	#0x90	; lock
		BL	rtReleaseLock
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R7,PC}
; End of function sub_101DC4

; ---------------------------------------------------------------------------
off_101E9C	DCD ntrNetworkDebugServerStack ; DATA XREF: sub_101DC4+8r
					; sub_101DC4+BCr
; s64 dword_101EA0
dword_101EA0	DCD 0x5F5E100		; DATA XREF: sub_101DC4+9Cr

; =============== S U B	R O U T	I N E =======================================


sub_101EA4				; CODE XREF: debugcmd_init_breakpoint+44p
		STMFD	SP!, {R3-R9,LR}
		MOV	R8, R0
		LDR	R3, =ntrNetworkDebugServerStack
		MOV	R4, #0x15C
		MUL	R4, R4,	R8
		LDR	R6, [R3]
		BL	ntrGetCurrentProcessHandle
		ADD	R7, R6,	R4
		ADD	R7, R7,	#0x6000
		ADD	R9, R7,	#0x98
		MOV	R2, #8		; size
		LDR	R1, [R9,#4]	; addr
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R5, R0,	#0
		BEQ	loc_101EF4
		LDR	R0, =aRtcheckremotem ; "rtCheckRemoteMemoryRegionSafeForWrite f"...
		MOV	R1, R5
		BL	sendMsg
		MOV	R0, R5
		LDMFD	SP!, {R3-R9,PC}
; ---------------------------------------------------------------------------

loc_101EF4				; CODE XREF: sub_101EA4+38j
		LDR	R3, [R7,#0x94]
		CMP	R3, #1
		ADDEQ	R4, R4,	#0x6100
		ADDEQ	R4, R6,	R4
		ADDEQ	R5, R4,	#0x2C
		BEQ	loc_101F14
		CMP	R3, #2
		LDREQ	R5, [R9,#4]

loc_101F14				; CODE XREF: sub_101EA4+64j
		MOV	R4, #0x15C
		LDR	R3, =dumpCmd
		MLA	R4, R4,	R8, R6
		ADD	R1, R3,	#0x2C
		ADD	R4, R4,	#0x6100
		ADD	R4, R4,	#0x6C
		MOV	R2, R4

loc_101F30				; CODE XREF: sub_101EA4+98j
		LDR	R0, [R3],#4
		CMP	R3, R1
		STR	R0, [R2],#4
		BNE	loc_101F30
		MOV	R7, #0x15C
		LDR	R2, =sub_101DC4
		MUL	R7, R7,	R8
		MOV	R0, R4		; ptr
		ADD	R9, R6,	R7
		ADD	R3, R9,	#0x6100
		MOV	R1, #0x40	; size
		STR	R8, [R3,#0x98]
		STR	R2, [R3,#0x9C]
		STR	R5, [R3,#0xA0]
		BL	rtFlushInstructionCache
		ADD	R9, R9,	#0x6000
		ADD	R3, R7,	#0x6000
		ADD	R0, R6,	R3
		LDR	R1, [R9,#0x9C]	; funcAddr
		MOV	R2, R4		; callbackAddr
		ADD	R0, R0,	#0xA0	; hook
		BL	rtInitHook
		LDR	R0, =0x5F5E100	; ns
		MOV	R1, #0
		BL	svcSleepThread
		MOV	R0, #0
		LDMFD	SP!, {R3-R9,PC}
; End of function sub_101EA4

; ---------------------------------------------------------------------------
off_101F9C	DCD ntrNetworkDebugServerStack ; DATA XREF: sub_101EA4+8r
; u8 *off_101FA0
off_101FA0	DCD aRtcheckremotem	; DATA XREF: sub_101EA4+3Cr
					; "rtCheckRemoteMemoryRegionSafeForWrite f"...
off_101FA4	DCD dumpCmd		; DATA XREF: sub_101EA4+74r
off_101FA8	DCD sub_101DC4		; DATA XREF: sub_101EA4+A0r
; s64 dword_101FAC
dword_101FAC	DCD 0x5F5E100		; DATA XREF: sub_101EA4+E4r

; =============== S U B	R O U T	I N E =======================================


debugcmd_init_breakpoint		; CODE XREF: handle_debugcmd_packet+4Cp
					; ntrSetupNetworkDebugServer+174p
		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4-R6,LR}
		MOV	R6, R1
		LDR	R5, [R3]
		MOV	R3, #0x15C
		MOV	R12, #0
		MLA	R3, R3,	R0, R5
		MOV	R4, R0
		ADD	R1, R3,	#0x6000
		ADD	R3, R3,	#0x6100
		STR	R12, [R1,#0x98]
		STR	R2, [R1,#0x94]
		STR	R12, [R3,#0xEC]
		SUB	R3, R2,	#1
		CMP	R3, #1
		STR	R6, [R1,#0x9C]
		BHI	loc_10201C
		BL	sub_101EA4
		CMP	R0, #0
		BNE	loc_10201C
		LDR	R0, =aCodeBreakpoint ; "code breakpoint, id: %d, addr: %08x\n"
		MOV	R1, R4
		MOV	R2, R6
		BL	sendMsg
		MOV	R0, R4
		LDMFD	SP!, {R4-R6,LR}
		B	debugcmd_enable_breakpoint
; ---------------------------------------------------------------------------

loc_10201C				; CODE XREF: debugcmd_init_breakpoint+40j
					; debugcmd_init_breakpoint+4Cj
		MOV	R3, #0x15C
		LDR	R0, =aInitBreakpoint ; msg
		MLA	R4, R3,	R4, R5
		MOV	R3, #0
		ADD	R4, R4,	#0x6000
		ADD	R4, R4,	#0x90
		STR	R3, [R4,#4]
		LDMFD	SP!, {R4-R6,LR}
		B	sendMsg
; End of function debugcmd_init_breakpoint

; ---------------------------------------------------------------------------
off_102040	DCD ntrNetworkDebugServerStack ; DATA XREF: debugcmd_init_breakpointr
; u8 *off_102044
off_102044	DCD aCodeBreakpoint	; DATA XREF: debugcmd_init_breakpoint+50r
					; "code breakpoint, id: %d, addr: %08x\n"
; u8 *off_102048
off_102048	DCD aInitBreakpoint	; DATA XREF: debugcmd_init_breakpoint+70r
					; "init breakpoint failed.\n"

; =============== S U B	R O U T	I N E =======================================


handle_queryhandle_packet		; CODE XREF: dispatch_client_cmd+124p

handle		= -0x658
src		= -0x654
var_650		= -0x650

		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x640
		LDR	R3, [R3]
		SUB	SP, SP,	#0xC
		ADD	R3, R3,	#0x2000
		ADD	R5, SP,	#0x658+var_650
		MOV	R2, #0
		SUB	R0, R5,	#8	; process
		LDR	R1, [R3,#0x34]	; processId
		STR	R2, [SP,#0x658+handle]
		BL	svcOpenProcess
		SUBS	R4, R0,	#0
		BEQ	loc_102090
		LDR	R0, =aOpenprocessF_1 ; "openprocess failed.\n"
		BL	sendMsg
		B	loc_102104
; ---------------------------------------------------------------------------

loc_102090				; CODE XREF: handle_queryhandle_packet+34j
		LDR	R0, [SP,#0x658+handle] ; handle
		BL	arm11kCmdGetKernelObject
		LDR	R3, =offs_KProcessHandleTable
		MOV	R2, #4		; count
		LDR	R1, [R3]
		ADD	R1, R0,	R1	; src
		SUB	R0, R5,	#4	; dst
		BL	arm11kCmdMemcpy
		MOV	R0, R5		; dst
		LDR	R1, [SP,#0x658+src] ; src
		MOV	R2, #0x640	; count
		BL	arm11kCmdMemcpy	; read 0x640 bytes at KProcessHandleTable

loc_1020C0				; CODE XREF: handle_queryhandle_packet+A4j
		MOV	R3, R4,LSL#2
		ADD	R2, R5,	R3
		LDR	R2, [R2,#4]
		CMP	R2, #0
		BEQ	loc_1020E8
		LDRH	R3, [R5,R3]
		MOV	R1, R4,LSR#1
		LDR	R0, =aH08xP08x	; msg
		ORR	R1, R1,	R3,LSL#15
		BL	sendMsg

loc_1020E8				; CODE XREF: handle_queryhandle_packet+84j
		ADD	R4, R4,	#2
		CMP	R4, #0x190
		BNE	loc_1020C0
		LDR	R0, =(aKernelhaxDone+0xA) ; msg
		BL	sendMsg
		LDR	R0, [SP,#0x658+handle] ; handle
		BL	svcCloseHandle

loc_102104				; CODE XREF: handle_queryhandle_packet+40j
		ADD	SP, SP,	#0x640
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function handle_queryhandle_packet

; ---------------------------------------------------------------------------
off_102110	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_queryhandle_packetr
; u8 *off_102114
off_102114	DCD aOpenprocessF_1	; DATA XREF: handle_queryhandle_packet+38r
					; "openprocess failed.\n"
off_102118	DCD offs_KProcessHandleTable ; DATA XREF: handle_queryhandle_packet+4Cr
; u8 *off_10211C
off_10211C	DCD aH08xP08x		; DATA XREF: handle_queryhandle_packet+90r
					; "h: %08x, p: %08x\n"
; u8 *off_102120
off_102120	DCD aKernelhaxDone+0xA	; DATA XREF: handle_queryhandle_packet+A8r

; =============== S U B	R O U T	I N E =======================================


handle_debugcmd_packet			; CODE XREF: dispatch_client_cmd+114p
		STMFD	SP!, {R4-R6,LR}
		LDR	R5, =ntrNetworkDebugServerStack
		LDR	R3, [R5]
		ADD	R3, R3,	#0x2000
		LDR	R4, [R3,#0x34]
		LDR	R6, [R3,#0x38]
		LDR	R3, [R3,#0x3C]
		CMP	R3, #1
		BNE	loc_102178
		BL	sub_101C84
		MOV	R5, R0
		MOV	R1, R5
		LDR	R0, =aFreeidD	; msg
		BL	sendMsg
		CMN	R5, #1
		LDMEQFD	SP!, {R4-R6,PC}
		MOV	R0, R5
		MOV	R1, R6
		MOV	R2, R4
		BL	debugcmd_init_breakpoint
		B	loc_1021E0
; ---------------------------------------------------------------------------

loc_102178				; CODE XREF: handle_debugcmd_packet+20j
		CMP	R3, #4
		BNE	loc_1021A4
		LDR	R0, =aSetResumeFlag ; msg
		BL	sendMsg
		LDR	R3, [R5]
		MOV	R2, #1
		ADD	R3, R3,	#0xB000
		STR	R2, [R3,#0x7A0]
		MOV	R2, #0
		STR	R2, [R3,#0x7A4]
		B	loc_1021E0
; ---------------------------------------------------------------------------

loc_1021A4				; CODE XREF: handle_debugcmd_packet+58j
		CMP	R4, #0x3F
		BLS	loc_1021B8

loc_1021AC				; CODE XREF: handle_debugcmd_packet+C4j
		LDR	R0, =aInvalidBpid ; msg
		LDMFD	SP!, {R4-R6,LR}
		B	sendMsg
; ---------------------------------------------------------------------------

loc_1021B8				; CODE XREF: handle_debugcmd_packet+84j
		CMP	R3, #2
		BNE	loc_1021CC
		MOV	R0, R4
		LDMFD	SP!, {R4-R6,LR}
		B	debugcmd_enable_breakpoint
; ---------------------------------------------------------------------------

loc_1021CC				; CODE XREF: handle_debugcmd_packet+98j
		CMP	R3, #3
		LDMNEFD	SP!, {R4-R6,PC}
		MOV	R0, R4
		LDMFD	SP!, {R4-R6,LR}
		B	debugcmd_disable_breakpoint
; ---------------------------------------------------------------------------

loc_1021E0				; CODE XREF: handle_debugcmd_packet+50j
					; handle_debugcmd_packet+7Cj
		CMP	R4, #0x3F
		LDMLSFD	SP!, {R4-R6,PC}
		B	loc_1021AC
; End of function handle_debugcmd_packet

; ---------------------------------------------------------------------------
off_1021EC	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_debugcmd_packet+4r
; u8 *off_1021F0
off_1021F0	DCD aFreeidD		; DATA XREF: handle_debugcmd_packet+30r
					; "freeid: %d\n"
; u8 *off_1021F4
off_1021F4	DCD aSetResumeFlag	; DATA XREF: handle_debugcmd_packet+5Cr
					; "set resume flag"
; u8 *off_1021F8
off_1021F8	DCD aInvalidBpid	; DATA XREF: handle_debugcmd_packet:loc_1021ACr
					; "invalid bpid\n"

; =============== S U B	R O U T	I N E =======================================


handle_reload_packet			; CODE XREF: dispatch_client_cmd+A4p

var_50		= -0x50
openflags	= -0x44
attributes	= -0x40
addr_out	= -0x34
out		= -0x30
bytesRead	= -0x2C
size		= -0x28
var_1C		= -0x1C
var_18		= -0x18
var_14		= -0x14
var_10		= -0x10

		LDR	R3, =p_config_memory
		STMFD	SP!, {R4-R6,LR}
		MOV	R2, #1
		LDR	R3, [R3]
		LDR	R4, =ntrNetworkDebugServerStack
		SUB	SP, SP,	#0x50	; operation
		STR	R2, [R3]
		LDR	R3, [R4]
		MOV	R6, #3
		LDR	R0, [R3,#8]	; sockfd
		BL	socketClose
		LDR	R3, [R4]
		MOV	R4, #0
		LDR	R0, [R3,#4]	; sockfd
		BL	socketClose
		MOV	R3, #0xB
		STR	R3, [SP,#0x60+var_18]
		ADD	R2, SP,	#0x60+var_10
		LDR	R3, =0x10A183
		STRB	R6, [SP,#0x60+var_1C]
		STR	R3, [SP,#0x60+var_14]
		LDMDB	R2, {R0-R2}
		ADD	R3, SP,	#0x60+var_50
		LDR	R12, =cfw_02
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x60+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R4, [SP,#0x60+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x60+out ; out
		BL	FSUSER_OpenFileDirectly
		SUBS	R5, R0,	#0
		MOVNE	R1, R5
		LDRNE	R0, =aOpenfileFailed ; "openFile failed: %08x"
		BNE	loc_10233C
		LDR	R0, [SP,#0x60+out] ; handle
		ADD	R1, SP,	#0x60+size ; size
		BL	FSFILE_GetSize
		SUBS	R4, R0,	#0
		LDRNE	R0, =aFsfile_getsi_0 ; "FSFILE_GetSize failed: %08x"
		MOVNE	R1, R4
		MOVNE	R2, R5
		BNE	loc_102340
		LDR	R0, [SP,#0x60+size] ; size
		BL	rtAlignToPageSize
		LDR	R3, =0x10003
		MOV	R1, R4		; addr0
		MOV	R2, R4		; addr1
		STMEA	SP, {R3,R6}
		MOV	R5, R0
		MOV	R3, R5		; size
		ADD	R0, SP,	#0x60+addr_out ; outaddr
		BL	svcControlMemory
		SUBS	R6, R0,	#0
		MOVNE	R1, R6
		LDRNE	R0, =aSvc_controlmem ; "svc_controlMemory failed: %08x"
		BNE	loc_10233C
		LDR	R3, [SP,#0x60+addr_out]
		LDR	R0, [SP,#0x60+out] ; handle
		ADD	R1, SP,	#0x60+bytesRead	; bytesRead
		STMEA	SP, {R3,R5}
		MOV	R2, #0		; offset
		MOV	R3, #0		; buffer
		BL	FSFILE_Read
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A1C9
		MOVNE	R1, R4
		MOVNE	R2, R6
		BNE	loc_102340
		MOV	R1, R5		; size
		LDR	R0, [SP,#0x60+addr_out]	; addr
		BL	ntrProtectMemory
		SUBS	R1, R0,	#0	; errno
		BEQ	loc_102348
		LDR	R0, =aProtectmemoryF ; "protectMemory failed: %08x"

loc_10233C				; CODE XREF: handle_reload_packet+9Cj
					; handle_reload_packet+F4j
		MOV	R2, R4		; v2

loc_102340				; CODE XREF: handle_reload_packet+BCj
					; handle_reload_packet+124j
		BL	showDbg
		B	loc_102354
; ---------------------------------------------------------------------------

loc_102348				; CODE XREF: handle_reload_packet+138j
		LDR	R3, [SP,#0x60+addr_out]
		BLX	R3
		BL	svcExitThread
; ---------------------------------------------------------------------------

loc_102354				; CODE XREF: handle_reload_packet+148j
		ADD	SP, SP,	#0x50
		LDMFD	SP!, {R4-R6,PC}
; End of function handle_reload_packet

; ---------------------------------------------------------------------------
off_10235C	DCD p_config_memory	; DATA XREF: handle_reload_packetr
off_102360	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_reload_packet+10r
dword_102364	DCD 0x10A183		; DATA XREF: handle_reload_packet+48r
off_102368	DCD cfw_02		; DATA XREF: handle_reload_packet+5Cr
off_10236C	DCD hFSUser		; DATA XREF: handle_reload_packet+7Cr
off_102370	DCD aOpenfileFailed	; DATA XREF: handle_reload_packet+98r
					; "openFile failed: %08x"
off_102374	DCD aFsfile_getsi_0	; DATA XREF: handle_reload_packet+B0r
					; "FSFILE_GetSize failed: %08x"
dword_102378	DCD 0x10003		; DATA XREF: handle_reload_packet+C8r
off_10237C	DCD aSvc_controlmem	; DATA XREF: handle_reload_packet+F0r
					; "svc_controlMemory failed: %08x"
dword_102380	DCD 0x10A1C9		; DATA XREF: handle_reload_packet+118r
; u8 *off_102384
off_102384	DCD aProtectmemoryF	; DATA XREF: handle_reload_packet+13Cr
					; "protectMemory failed: %08x"

; =============== S U B	R O U T	I N E =======================================


handle_listprocess_packet		; CODE XREF: dispatch_client_cmd+B4p

var_1D8		= -0x1D8
var_1D4		= -0x1D4
processCount	= -0x1CC
var_1C8		= -0x1C8
var_1C4		= -0x1C4
var_1C0		= -0x1C0
var_1B4		= -0x1B4
processIds	= -0x1A0

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x1CC
		ADD	R5, SP,	#0x1D8+processIds
		MOV	R1, R5		; processIds
		ADD	R0, SP,	#0x1D8+processCount ; processCount
		MOV	R2, #0x64	; processIdMaxCount
		BL	svcGetProcessList
		SUBS	R1, R0,	#0
		MOVEQ	R4, R1
		BEQ	loc_102408
		LDR	R0, =aGetprocesslist ; msg
		BL	sendMsg
		B	loc_10241C
; ---------------------------------------------------------------------------

loc_1023BC				; CODE XREF: handle_listprocess_packet+88j
		ADD	R1, SP,	#0x1D8+var_1B4 ; a2
		LDR	R0, [R5,R4,LSL#2] ; processId
		ADD	R2, SP,	#0x1D8+var_1C4 ; a3
		ADD	R3, SP,	#0x1D8+var_1C8 ; a4
		BL	get_process_name
		SUBS	R1, R0,	#0
		BEQ	loc_1023E0
		LDR	R0, =aGetprocessinfo ; "getProcessInfo failed: %08x\n"
		BL	sendMsg

loc_1023E0				; CODE XREF: handle_listprocess_packet+4Cj
		LDR	R3, [SP,#0x1D8+var_1C4]
		LDR	R0, =aPid0x08xPname8 ; msg
		STR	R3, [SP,#0x1D8+var_1D8]
		LDR	R3, [SP,#0x1D8+var_1C8]
		ADD	R2, SP,	#0x1D8+var_1B4
		STR	R3, [SP,#0x1D8+var_1D4]
		LDR	R3, [SP,#0x1D8+var_1C0]
		LDR	R1, [R5,R4,LSL#2]
		BL	sendMsg
		ADD	R4, R4,	#1

loc_102408				; CODE XREF: handle_listprocess_packet+24j
		LDR	R3, [SP,#0x1D8+processCount]
		CMP	R4, R3
		BCC	loc_1023BC
		LDR	R0, =aEndOfProcessLi ; "end of process list.\n"
		BL	sendMsg

loc_10241C				; CODE XREF: handle_listprocess_packet+30j
		ADD	SP, SP,	#0x1CC
		LDMFD	SP!, {R4,R5,PC}
; End of function handle_listprocess_packet

; ---------------------------------------------------------------------------
; u8 *off_102424
off_102424	DCD aGetprocesslist	; DATA XREF: handle_listprocess_packet+28r
					; "getProcessList failed: %08x\n"
; u8 *off_102428
off_102428	DCD aGetprocessinfo	; DATA XREF: handle_listprocess_packet+50r
					; "getProcessInfo failed: %08x\n"
; u8 *off_10242C
off_10242C	DCD aPid0x08xPname8	; DATA XREF: handle_listprocess_packet+5Cr
					; "pid: 0x%08x, pname: %8s, tid: %08x%08x,"...
; u8 *off_102430
off_102430	DCD aEndOfProcessLi	; DATA XREF: handle_listprocess_packet+8Cr
					; "end of process list.\n"

; =============== S U B	R O U T	I N E =======================================


handle_memlayout_packet			; CODE XREF: dispatch_client_cmd+E4p

hProcess	= -0x1C

		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R0-R2,R4-R7,LR}
		ADD	R0, SP,	#0x20+hProcess ; process
		LDR	R3, [R3]
		ADD	R3, R3,	#0x2000
		LDR	R1, [R3,#0x34]	; processId
		BL	svcOpenProcess
		SUBS	R5, R0,	#0
		BEQ	loc_102474
		LDR	R0, =aOpenprocessF_2 ; "openProcess failed: %08x\n"
		MOV	R1, R5
		MOV	R2, #0
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x20+hProcess]
		B	loc_1024DC
; ---------------------------------------------------------------------------

loc_102474				; CODE XREF: handle_memlayout_packet+20j
		LDR	R0, =aValidMemregion ; "valid memregions:\n"
		BL	sendMsg
		MOV	R4, #0x100000
		MOV	R7, R5

loc_102484				; CODE XREF: handle_memlayout_packet+9Cj
		LDR	R0, [SP,#0x20+hProcess]	; hKProcess
		MOV	R1, R4		; addr
		MOV	R2, #0x1000	; size
		BL	ntrProtectRemoteMemory
		CLZ	R6, R0
		MOV	R6, R6,LSR#5
		CMP	R6, R7
		BEQ	loc_1024C8
		CMP	R7, #0
		BEQ	loc_1024C0
		LDR	R0, =a08x08xSize08x ; msg
		MOV	R1, R5
		SUB	R2, R4,	#1
		RSB	R3, R5,	R4
		BL	sendMsg

loc_1024C0				; CODE XREF: handle_memlayout_packet+74j
		MOV	R5, R4
		MOV	R7, R6

loc_1024C8				; CODE XREF: handle_memlayout_packet+6Cj
		ADD	R4, R4,	#0x1000
		CMP	R4, #0x1EC00000
		BNE	loc_102484
		LDR	R0, =aEndOfMemlayout ; msg
		BL	sendMsg

loc_1024DC				; CODE XREF: handle_memlayout_packet+3Cj
		LDR	R0, [SP,#0x20+hProcess]	; handle
		CMP	R0, #0
		BEQ	loc_1024EC
		BL	svcCloseHandle

loc_1024EC				; CODE XREF: handle_memlayout_packet+B0j
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R7,PC}
; End of function handle_memlayout_packet

; ---------------------------------------------------------------------------
off_1024F4	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_memlayout_packetr
; u8 *off_1024F8
off_1024F8	DCD aOpenprocessF_2	; DATA XREF: handle_memlayout_packet+24r
					; "openProcess failed: %08x\n"
; u8 *off_1024FC
off_1024FC	DCD aValidMemregion	; DATA XREF: handle_memlayout_packet:loc_102474r
					; "valid memregions:\n"
; u8 *off_102500
off_102500	DCD a08x08xSize08x	; DATA XREF: handle_memlayout_packet+78r
					; "%08x - %08x , size: %08x\n"
; u8 *off_102504
off_102504	DCD aEndOfMemlayout	; DATA XREF: handle_memlayout_packet+A0r
					; "end of memlayout.\n"

; =============== S U B	R O U T	I N E =======================================


handle_writemem_packet			; CODE XREF: dispatch_client_cmd+104p

size		= -0x30
hProcess	= -0x24

		STMFD	SP!, {R0-R10,LR}
		LDR	R8, =ntrNetworkDebugServerStack
		LDR	R3, [R8]
		ADD	R3, R3,	#0x2000
		LDR	R7, [R3,#0x34]
		LDR	R4, [R3,#0x38]
		CMN	R7, #1
		LDR	R5, [R3,#0x3C]
		BNE	loc_102538
		BL	ntrGetCurrentProcessHandle
		STR	R0, [SP,#0x30+hProcess]
		B	loc_102564
; ---------------------------------------------------------------------------

loc_102538				; CODE XREF: handle_writemem_packet+20j
		MOV	R1, R7		; processId
		ADD	R0, SP,	#0x30+hProcess ; process
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		BEQ	loc_102564
		LDR	R0, =aOpenprocessFai ; "openProcess failed: %08x, pid: %08x\n"
		MOV	R2, R7
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x30+hProcess]
		B	loc_102644
; ---------------------------------------------------------------------------

loc_102564				; CODE XREF: handle_writemem_packet+2Cj
					; handle_writemem_packet+40j
		CMN	R4, #0xE0000001
		BLS	loc_102578

loc_10256C				; CODE XREF: handle_writemem_packet+84j
		LDR	R10, =0xFFF
		LDR	R9, =ntrNetworkDebugServerStack
		B	loc_1025F0
; ---------------------------------------------------------------------------

loc_102578				; CODE XREF: handle_writemem_packet+60j
		MOV	R1, R4		; addr
		LDR	R0, [SP,#0x30+hProcess]	; hProcess
		MOV	R2, R5		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R1, R0,	#0
		BEQ	loc_10256C
		LDR	R0, =aRtcheckremot_0 ; msg
		MOV	R2, #0
		BL	sendMsg
		B	loc_102644
; ---------------------------------------------------------------------------

loc_1025A0				; CODE XREF: handle_writemem_packet+ECj
		LDR	R0, [R8]
		CMP	R5, R10
		MOVLS	R6, R5
		MOVHI	R6, #0x1000
		ADD	R0, R0,	#0x2040
		ADD	R0, R0,	#0x3C
		MOV	R1, R6
		BL	recv_wrapper
		CMN	R7, #1
		BNE	loc_102604
		LDR	R1, [R9]
		CMP	R4, #0x20000000
		ADD	R1, R1,	#0x2040
		MOV	R0, R4		; dst
		ADD	R1, R1,	#0x3C	; src
		MOV	R2, R6		; count
		BLS	loc_1025FC
		BL	arm11kCmdMemcpy

loc_1025E8				; CODE XREF: handle_writemem_packet+F8j
					; handle_writemem_packet+120j ...
		ADD	R4, R4,	R6
		RSB	R5, R6,	R5

loc_1025F0				; CODE XREF: handle_writemem_packet+6Cj
		CMP	R5, #0
		BNE	loc_1025A0
		B	loc_10263C
; ---------------------------------------------------------------------------

loc_1025FC				; CODE XREF: handle_writemem_packet+D8j
		BL	memcpy
		B	loc_1025E8
; ---------------------------------------------------------------------------

loc_102604				; CODE XREF: handle_writemem_packet+BCj
		LDR	R3, [R9]
		MOV	R1, R4		; dst_addr
		ADD	R3, R3,	#0x2040
		STR	R6, [SP,#0x30+size] ; size
		LDR	R0, [SP,#0x30+hProcess]	; hDst
		LDR	R2, =0xFFFF8001	; hSrc
		ADD	R3, R3,	#0x3C	; src_addr
		BL	inter_process_dma_copy
		SUBS	R1, R0,	#0
		BEQ	loc_1025E8
		LDR	R0, =aCopyremotememo ; msg
		MOV	R2, R4
		BL	sendMsg
		B	loc_1025E8
; ---------------------------------------------------------------------------

loc_10263C				; CODE XREF: handle_writemem_packet+F0j
		LDR	R0, =aFinished	; "finished"
		BL	sendMsg

loc_102644				; CODE XREF: handle_writemem_packet+58j
					; handle_writemem_packet+94j
		LDR	R0, [SP,#0x30+hProcess]	; handle
		CMP	R0, #0
		CMNNE	R7, #1
		BEQ	loc_102658
		BL	svcCloseHandle

loc_102658				; CODE XREF: handle_writemem_packet+148j
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R10,PC}
; End of function handle_writemem_packet

; ---------------------------------------------------------------------------
off_102660	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_writemem_packet+4r
					; handle_writemem_packet+68r
; u8 *off_102664
off_102664	DCD aOpenprocessFai	; DATA XREF: handle_writemem_packet+44r
					; "openProcess failed: %08x, pid: %08x\n"
dword_102668	DCD 0xFFF		; DATA XREF: handle_writemem_packet:loc_10256Cr
; u8 *off_10266C
off_10266C	DCD aRtcheckremot_0	; DATA XREF: handle_writemem_packet+88r
					; "rtCheckRemoteMemoryRegionSafeForWrite f"...
; Handle hSrc
hSrc		DCD 0xFFFF8001		; DATA XREF: handle_writemem_packet+110r
; u8 *off_102674
off_102674	DCD aCopyremotememo	; DATA XREF: handle_writemem_packet+124r
					; "copyRemoteMemory failed: %08x, addr: %0"...
; u8 *off_102678
off_102678	DCD aFinished		; DATA XREF: handle_writemem_packet:loc_10263Cr
					; "finished"

; =============== S U B	R O U T	I N E =======================================


handle_readmem_packet			; CODE XREF: dispatch_client_cmd+F4p

size		= -0x30
hProcess	= -0x24

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x14
		LDR	R6, =ntrNetworkDebugServerStack
		LDR	R7, [R6]
		ADD	R7, R7,	#0x2000
		LDR	R8, [R7,#0x34]
		LDR	R4, [R7,#0x38]
		CMN	R8, #1
		LDR	R5, [R7,#0x3C]
		BNE	loc_1026B0
		BL	ntrGetCurrentProcessHandle
		STR	R0, [SP,#0x30+hProcess]
		B	loc_1026DC
; ---------------------------------------------------------------------------

loc_1026B0				; CODE XREF: handle_readmem_packet+24j
		MOV	R1, R8		; processId
		ADD	R0, SP,	#0x30+hProcess ; process
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		BEQ	loc_1026DC
		LDR	R0, =aOpenprocessFai ; "openProcess failed: %08x, pid: %08x\n"
		MOV	R2, R8
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x30+hProcess]
		B	loc_1027BC
; ---------------------------------------------------------------------------

loc_1026DC				; CODE XREF: handle_readmem_packet+30j
					; handle_readmem_packet+44j
		CMN	R4, #0xE0000001
		BHI	loc_10270C
		MOV	R1, R4		; addr
		LDR	R0, [SP,#0x30+hProcess]	; hProcess
		MOV	R2, R5		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R1, R0,	#0
		BEQ	loc_10270C
		LDR	R0, =aRtcheckremot_0 ; msg
		MOV	R2, #0
		BL	sendMsg
		B	loc_1027BC
; ---------------------------------------------------------------------------

loc_10270C				; CODE XREF: handle_readmem_packet+64j
					; handle_readmem_packet+7Cj
		STR	R5, [R7,#0x74]
		BL	sub_101A74
		LDR	R9, =0xFFF

loc_102718				; CODE XREF: handle_readmem_packet+134j
		CMP	R5, #0
		BEQ	loc_1027B4
		CMP	R5, R9
		MOVLS	R7, R5
		MOVHI	R7, #0x1000
		CMN	R8, #1
		BNE	loc_102760
		LDR	R0, [R6]
		CMP	R4, #0x20000000
		ADD	R0, R0,	#0x2040
		ADD	R0, R0,	#0x3C	; dst
		MOV	R1, R4		; src
		MOV	R2, R7		; count
		BLS	loc_102758
		BL	arm11kCmdMemcpy
		B	loc_102794
; ---------------------------------------------------------------------------

loc_102758				; CODE XREF: handle_readmem_packet+D0j
		BL	memcpy
		B	loc_102794
; ---------------------------------------------------------------------------

loc_102760				; CODE XREF: handle_readmem_packet+B4j
		LDR	R1, [R6]
		STR	R7, [SP,#0x30+size] ; size
		ADD	R1, R1,	#0x2040
		ADD	R1, R1,	#0x3C	; dst_addr
		LDR	R0, =0xFFFF8001	; hDst
		LDR	R2, [SP,#0x30+hProcess]	; hSrc
		MOV	R3, R4		; src_addr
		BL	inter_process_dma_copy
		SUBS	R1, R0,	#0
		BEQ	loc_102794
		LDR	R0, =aCopyremotememo ; msg
		MOV	R2, R4
		BL	sendMsg

loc_102794				; CODE XREF: handle_readmem_packet+D8j
					; handle_readmem_packet+E0j ...
		LDR	R0, [R6]
		MOV	R1, R7
		ADD	R0, R0,	#0x2040
		ADD	R0, R0,	#0x3C
		BL	sub_101A9C
		ADD	R4, R4,	R7
		RSB	R5, R7,	R5
		B	loc_102718
; ---------------------------------------------------------------------------

loc_1027B4				; CODE XREF: handle_readmem_packet+A0j
		LDR	R0, =aFinished	; "finished"
		BL	sendMsg

loc_1027BC				; CODE XREF: handle_readmem_packet+5Cj
					; handle_readmem_packet+8Cj
		LDR	R0, [SP,#0x30+hProcess]	; handle
		CMP	R0, #0
		CMNNE	R8, #1
		BEQ	loc_1027D0
		BL	svcCloseHandle

loc_1027D0				; CODE XREF: handle_readmem_packet+14Cj
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4-R9,PC}
; End of function handle_readmem_packet

; ---------------------------------------------------------------------------
off_1027D8	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_readmem_packet+8r
; u8 *off_1027DC
off_1027DC	DCD aOpenprocessFai	; DATA XREF: handle_readmem_packet+48r
					; "openProcess failed: %08x, pid: %08x\n"
; u8 *off_1027E0
off_1027E0	DCD aRtcheckremot_0	; DATA XREF: handle_readmem_packet+80r
					; "rtCheckRemoteMemoryRegionSafeForWrite f"...
dword_1027E4	DCD 0xFFF		; DATA XREF: handle_readmem_packet+98r
; Handle dword_1027E8
dword_1027E8	DCD 0xFFFF8001		; DATA XREF: handle_readmem_packet+F4r
; u8 *off_1027EC
off_1027EC	DCD aCopyremotememo	; DATA XREF: handle_readmem_packet+10Cr
					; "copyRemoteMemory failed: %08x, addr: %0"...
; u8 *off_1027F0
off_1027F0	DCD aFinished		; DATA XREF: handle_readmem_packet:loc_1027B4r
					; "finished"

; =============== S U B	R O U T	I N E =======================================


get_remote_PC				; CODE XREF: handle_listthread_packet+FCp
					; inject_ntr_into_remote_process+C0p

var_B0C		= -0xB0C
threadIds	= -0xB08
var_978		= -0x978
var_7E8		= -0x7E8
var_660		= -0x660
var_620		= -0x620
var_61C		= -0x61C

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0xAF0
		SUB	SP, SP,	#0xC
		MOV	R6, R0
		ADD	R5, SP,	#0xB10+threadIds
		MOV	R1, R5		; threadIds
		SUB	R0, R5,	#4	; threadCount
		MOV	R2, #0x64	; threadIdMaxCount
		MOV	R3, R6		; domain
		BL	svcGetThreadList
		SUBS	R1, R0,	#0
		MOVEQ	R4, R1
		BEQ	loc_102838
		LDR	R0, =aGetthreadlistF ; msg
		BL	sendMsg
		MOV	R0, #0
		B	loc_102970
; ---------------------------------------------------------------------------

loc_102838				; CODE XREF: get_remote_PC+30j
					; get_remote_PC+98j
		LDR	R3, [SP,#0xB10+var_B0C]
		CMP	R4, R3
		BCS	loc_102890
		ADD	R0, SP,	#0xB10+var_660
		LDR	R7, [R5,R4,LSL#2]
		MOV	R1, #0x33
		MOV	R2, #0x640
		ADD	R0, R0,	#8
		BL	memset
		ADD	R2, SP,	#0xB10+var_660
		ADD	R2, R2,	#8	; context_struc
		MOV	R0, R6		; hProcess
		MOV	R1, R7		; tid
		BL	rtGetThreadContext
		LDR	R2, [SP,#0xB10+var_61C]
		ADD	R3, SP,	#0xB10+var_978
		STR	R2, [R3,R4,LSL#2]
		LDR	R2, [SP,#0xB10+var_620]
		ADD	R3, SP,	#0xB10+var_7E8
		STR	R2, [R3,R4,LSL#2]
		ADD	R4, R4,	#1
		B	loc_102838
; ---------------------------------------------------------------------------

loc_102890				; CODE XREF: get_remote_PC+4Cj
		LDR	R0, =aRecommendPc ; msg
		BL	sendMsg
		MOV	R4, #0
		MOV	R5, R4

loc_1028A0				; CODE XREF: get_remote_PC+108j
		LDR	R2, [SP,#0xB10+var_B0C]
		CMP	R5, R2
		BCS	loc_102900
		MOV	R3, #0

loc_1028B0				; CODE XREF: get_remote_PC+E4j
		CMP	R3, R2
		BEQ	loc_1028DC
		CMP	R5, R3
		BEQ	loc_1028D4
		ADD	R1, SP,	#0xB10+var_978
		LDR	R0, [R1,R5,LSL#2]
		LDR	R1, [R1,R3,LSL#2]
		CMP	R0, R1
		BEQ	loc_1028F8

loc_1028D4				; CODE XREF: get_remote_PC+C8j
		ADD	R3, R3,	#1
		B	loc_1028B0
; ---------------------------------------------------------------------------

loc_1028DC				; CODE XREF: get_remote_PC+C0j
		ADD	R3, SP,	#0xB10+var_978
		LDR	R0, =(aRunappletTid00+0x1C) ; msg
		LDR	R6, [R3,R5,LSL#2]
		MOV	R1, R6
		BL	sendMsg
		CMP	R4, #0
		MOVEQ	R4, R6

loc_1028F8				; CODE XREF: get_remote_PC+DCj
		ADD	R5, R5,	#1
		B	loc_1028A0
; ---------------------------------------------------------------------------

loc_102900				; CODE XREF: get_remote_PC+B4j
		LDR	R0, =aRecommendLr ; "recommend lr:\n"
		BL	sendMsg
		MOV	R5, #0

loc_10290C				; CODE XREF: get_remote_PC+174j
		LDR	R2, [SP,#0xB10+var_B0C]
		CMP	R5, R2
		BCS	loc_10296C
		MOV	R3, #0

loc_10291C				; CODE XREF: get_remote_PC+150j
		CMP	R3, R2
		BEQ	loc_102948
		CMP	R5, R3
		BEQ	loc_102940
		ADD	R1, SP,	#0xB10+var_7E8
		LDR	R0, [R1,R5,LSL#2]
		LDR	R1, [R1,R3,LSL#2]
		CMP	R0, R1
		BEQ	loc_102964

loc_102940				; CODE XREF: get_remote_PC+134j
		ADD	R3, R3,	#1
		B	loc_10291C
; ---------------------------------------------------------------------------

loc_102948				; CODE XREF: get_remote_PC+12Cj
		ADD	R3, SP,	#0xB10+var_7E8
		LDR	R0, =(aRunappletTid00+0x1C) ; msg
		LDR	R6, [R3,R5,LSL#2]
		MOV	R1, R6
		BL	sendMsg
		CMP	R4, #0
		MOVEQ	R4, R6

loc_102964				; CODE XREF: get_remote_PC+148j
		ADD	R5, R5,	#1
		B	loc_10290C
; ---------------------------------------------------------------------------

loc_10296C				; CODE XREF: get_remote_PC+120j
		MOV	R0, R4

loc_102970				; CODE XREF: get_remote_PC+40j
		ADD	SP, SP,	#0xAF0
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R7,PC}
; End of function get_remote_PC

; ---------------------------------------------------------------------------
; u8 *off_10297C
off_10297C	DCD aGetthreadlistF	; DATA XREF: get_remote_PC+34r
					; "getThreadList failed: %08x\n"
; u8 *off_102980
off_102980	DCD aRecommendPc	; DATA XREF: get_remote_PC:loc_102890r
					; "recommend pc:\n"
; u8 *off_102984
off_102984	DCD aRunappletTid00+0x1C ; DATA	XREF: get_remote_PC+ECr
					; get_remote_PC+158r
; u8 *off_102988
off_102988	DCD aRecommendLr	; DATA XREF: get_remote_PC:loc_102900r
					; "recommend lr:\n"

; =============== S U B	R O U T	I N E =======================================


handle_listthread_packet		; CODE XREF: dispatch_client_cmd+C4p

hProcess	= -0x7F0
var_7EC		= -0x7EC
var_7E8		= -0x7E8
var_658		= -0x658
var_620		= -0x620
var_61C		= -0x61C

		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x7D0
		LDR	R3, [R3]
		SUB	SP, SP,	#0xC
		ADD	R3, R3,	#0x2000
		ADD	R5, SP,	#0x7F0+var_7E8
		LDR	R1, [R3,#0x34]	; processId
		SUB	R0, R5,	#8	; process
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		BEQ	loc_1029D4
		LDR	R0, =aOpenprocessF_2 ; "openProcess failed: %08x\n"
		MOV	R2, #0
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x7F0+hProcess]
		B	loc_102A8C
; ---------------------------------------------------------------------------

loc_1029D4				; CODE XREF: handle_listthread_packet+2Cj
		MOV	R1, R5		; threadIds
		SUB	R0, R5,	#4	; threadCount
		MOV	R2, #0x64	; threadIdMaxCount
		LDR	R3, [SP,#0x7F0+hProcess] ; domain
		BL	svcGetThreadList
		SUBS	R1, R0,	#0
		MOVEQ	R4, R1
		ADDEQ	R7, SP,	#0x7F0+var_658
		BEQ	loc_102A30
		LDR	R0, =aGetthreadlistF ; msg
		BL	sendMsg
		B	loc_102A9C
; ---------------------------------------------------------------------------

loc_102A04				; CODE XREF: handle_listthread_packet+8Cj
					; handle_listthread_packet+F4j
		LDR	R1, [R7,R6,LSL#2]
		LDR	R0, =(aRD08x+4)	; msg
		ADD	R6, R6,	#1
		BL	sendMsg
		CMP	R6, #0x20
		BNE	loc_102A04
		LDR	R0, =(aWillListenAtPo+0x17) ; msg
		BL	sendMsg
		MOV	R0, #0		; handle
		BL	svcCloseHandle
		ADD	R4, R4,	#1

loc_102A30				; CODE XREF: handle_listthread_packet+68j
		LDR	R3, [SP,#0x7F0+var_7EC]
		CMP	R4, R3
		BCS	loc_102A84
		LDR	R6, [R5,R4,LSL#2]
		LDR	R0, =aTid0x08x	; msg
		MOV	R1, R6
		BL	sendMsg
		MOV	R1, #0x33
		MOV	R2, #0x640
		MOV	R0, R7
		BL	memset
		MOV	R1, R6		; tid
		MOV	R2, R7		; context_struc
		LDR	R0, [SP,#0x7F0+hProcess] ; hProcess
		BL	rtGetThreadContext
		LDR	R0, =aPc08xLr08x ; "pc: %08x, lr: %08x\n"
		LDR	R1, [SP,#0x7F0+var_61C]
		LDR	R2, [SP,#0x7F0+var_620]
		BL	sendMsg
		MOV	R6, #0
		B	loc_102A04
; ---------------------------------------------------------------------------

loc_102A84				; CODE XREF: handle_listthread_packet+ACj
		LDR	R0, [SP,#0x7F0+hProcess]
		BL	get_remote_PC

loc_102A8C				; CODE XREF: handle_listthread_packet+44j
		LDR	R0, [SP,#0x7F0+hProcess] ; handle
		CMP	R0, #0
		BEQ	loc_102A9C
		BL	svcCloseHandle

loc_102A9C				; CODE XREF: handle_listthread_packet+74j
					; handle_listthread_packet+108j
		ADD	SP, SP,	#0x7D0
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R7,PC}
; End of function handle_listthread_packet

; ---------------------------------------------------------------------------
off_102AA8	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_listthread_packetr
; u8 *off_102AAC
off_102AAC	DCD aOpenprocessF_2	; DATA XREF: handle_listthread_packet+30r
					; "openProcess failed: %08x\n"
; u8 *off_102AB0
off_102AB0	DCD aGetthreadlistF	; DATA XREF: handle_listthread_packet+6Cr
					; "getThreadList failed: %08x\n"
; u8 *off_102AB4
off_102AB4	DCD aRD08x+4		; DATA XREF: handle_listthread_packet+7Cr
; u8 *off_102AB8
off_102AB8	DCD aWillListenAtPo+0x17 ; DATA	XREF: handle_listthread_packet+90r
; u8 *off_102ABC
off_102ABC	DCD aTid0x08x		; DATA XREF: handle_listthread_packet+B4r
					; "tid: 0x%08x\n"
; u8 *off_102AC0
off_102AC0	DCD aPc08xLr08x		; DATA XREF: handle_listthread_packet+E0r
					; "pc: %08x, lr: %08x\n"

; =============== S U B	R O U T	I N E =======================================


; Result __cdecl inject_ntr_into_remote_process(Handle handle, u32 addr_jmpcode, void *buf)
inject_ntr_into_remote_process		; CODE XREF: inject_ntr_into_home_menu+6Cp
					; handle_attachprocess_packet+74p ...

size		= -0x78
src_addr	= -0x70
var_6C		= -0x6C

		LDR	R3, =arm11BinStart
		STMFD	SP!, {R4-R9,LR}
		MOV	R6, R0
		LDR	R8, [R3]
		LDR	R3, =arm11BinSize
		SUB	SP, SP,	#0x5C
		MOV	R5, R1
		LDR	R9, [R3]
		MOV	R7, R2
		LDR	R0, =aBuf08xSize08x ; "buf: %08x, size: %08x\n"
		MOV	R1, R8
		MOV	R2, R9
		BL	sendMsg
		CMP	R8, #0
		BNE	loc_102B0C
		LDR	R0, =aArm11NotLoaded ; msg
		BL	sendMsg
		B	loc_102C60
; ---------------------------------------------------------------------------

loc_102B0C				; CODE XREF: inject_ntr_into_remote_process+38j
		ADD	R4, R9,	#0x5000
		MOV	R1, #0x6000000	; addr
		MOV	R0, R6		; handle
		MOV	R2, R4		; size
		BL	controlRemoteMemory
		SUBS	R1, R0,	#0
		BEQ	loc_102B34
		LDR	R0, =aMapremotememor ; msg
		MOV	R2, #0
		BL	sendMsg

loc_102B34				; CODE XREF: inject_ntr_into_remote_process+60j
		MOV	R2, R4		; size
		MOV	R0, R6		; hKProcess
		MOV	R1, #0x6000000	; addr
		BL	ntrProtectRemoteMemory
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A40B
		BNE	loc_102C50
		LDR	R3, =hCurKProcess
		STR	R9, [SP,#0x78+size] ; size
		MOV	R0, R6		; hDst
		LDR	R2, [R3]	; hSrc
		LDR	R1, =0x6005000	; dst_addr
		MOV	R3, R8		; src_addr
		BL	inter_process_dma_copy ; inject	code into foreign process at addr 0x06005000
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A42D
		BNE	loc_102C50
		CMP	R5, #0
		BNE	loc_102B8C
		MOV	R0, R6
		BL	get_remote_PC
		MOV	R5, R0

loc_102B8C				; CODE XREF: inject_ntr_into_remote_process+B8j
		LDR	R0, =aRemotepc08x ; msg
		MOV	R1, R5
		MOV	R2, #0
		BL	sendMsg
		CMP	R5, #0
		BEQ	loc_102C5C
		MOV	R0, R6		; hProcess
		MOV	R1, R5		; addr
		MOV	R2, #8		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A301
		BNE	loc_102C50
		MOV	R1, R7		; dst addr
		MOV	R3, #2
		MOV	R8, #8
		STR	R3, [R1],#0x20
		LDR	R0, =0xFFFF8001	; hDst
		STR	R8, [SP,#0x78+size] ; size
		MOV	R2, R6		; hSrc
		MOV	R3, R5		; src_addr
		BL	inter_process_dma_copy ; back up two instructions at current PC
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A45F
		BNE	loc_102C50
		MOV	R3, #0x238
		STR	R3, [SP,#0x78+size] ; size
		STR	R5, [R7,#0x28]	; save backed up PC at offs 0x28
		MOV	R0, R6		; hDst
		MOV	R1, #0x6000000	; dst_addr
		LDR	R2, =0xFFFF8001	; hSrc
		MOV	R3, R7		; src_addr
		BL	inter_process_dma_copy ; transfer backed up code and configuration to remote process
					; at addr 0x06000000
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A481
		BNE	loc_102C50
		LDR	R3, =0xE51FF004
		STR	R8, [SP,#0x78+size] ; size
		STR	R3, [SP,#0x78+src_addr]
		LDR	R3, =0x6005000
		MOV	R0, R6		; hDst
		STR	R3, [SP,#0x78+var_6C]
		MOV	R1, R5		; dst_addr
		LDR	R2, =0xFFFF8001	; hSrc
		ADD	R3, SP,	#0x78+src_addr ; src_addr
		BL	inter_process_dma_copy ; patch code at current PC to redirect code flow	to addr	0x06005000
		SUBS	R4, R0,	#0
		BEQ	loc_102C5C
		LDR	R0, =aCopyremoteme_3 ; msg

loc_102C50				; CODE XREF: inject_ntr_into_remote_process+88j
					; inject_ntr_into_remote_process+B0j ...
		MOV	R1, R4
		MOV	R2, #0
		BL	sendMsg

loc_102C5C				; CODE XREF: inject_ntr_into_remote_process+DCj
					; inject_ntr_into_remote_process+184j
		MOV	R0, R4

loc_102C60				; CODE XREF: inject_ntr_into_remote_process+44j
		ADD	SP, SP,	#0x5C
		LDMFD	SP!, {R4-R9,PC}
; End of function inject_ntr_into_remote_process

; ---------------------------------------------------------------------------
off_102C68	DCD arm11BinStart	; DATA XREF: inject_ntr_into_remote_processr
off_102C6C	DCD arm11BinSize	; DATA XREF: inject_ntr_into_remote_process+10r
; u8 *off_102C70
off_102C70	DCD aBuf08xSize08x	; DATA XREF: inject_ntr_into_remote_process+24r
					; "buf: %08x, size: %08x\n"
; u8 *off_102C74
off_102C74	DCD aArm11NotLoaded	; DATA XREF: inject_ntr_into_remote_process+3Cr
					; "arm11 not loaded\n"
; u8 *off_102C78
off_102C78	DCD aMapremotememor	; DATA XREF: inject_ntr_into_remote_process+64r
					; "mapRemoteMemory failed: %08x\n"
dword_102C7C	DCD 0x10A40B		; DATA XREF: inject_ntr_into_remote_process+84r
off_102C80	DCD hCurKProcess	; DATA XREF: inject_ntr_into_remote_process+8Cr
; void *dst_addr
dst_addr	DCD 0x6005000		; DATA XREF: inject_ntr_into_remote_process+9Cr
					; inject_ntr_into_remote_process+164r
dword_102C88	DCD 0x10A42D		; DATA XREF: inject_ntr_into_remote_process+ACr
; u8 *off_102C8C
off_102C8C	DCD aRemotepc08x	; DATA XREF: inject_ntr_into_remote_process:loc_102B8Cr
					; "remotePC: %08x\n"
dword_102C90	DCD 0x10A301		; DATA XREF: inject_ntr_into_remote_process+F4r
; Handle dword_102C94
dword_102C94	DCD 0xFFFF8001		; DATA XREF: inject_ntr_into_remote_process+10Cr
					; inject_ntr_into_remote_process+140r ...
dword_102C98	DCD 0x10A45F		; DATA XREF: inject_ntr_into_remote_process+124r
dword_102C9C	DCD 0x10A481		; DATA XREF: inject_ntr_into_remote_process+150r
dword_102CA0	DCD 0xE51FF004		; DATA XREF: inject_ntr_into_remote_process+158r
; u8 *off_102CA4
off_102CA4	DCD aCopyremoteme_3	; DATA XREF: inject_ntr_into_remote_process+188r
					; "copyRemoteMemory(4) failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


handle_attachprocess_packet		; CODE XREF: dispatch_client_cmd+D4p

process		= -0x24C
buf		= -0x248
var_244		= -0x244

		LDR	R3, =ntrNetworkDebugServerStack
		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x244
		LDR	R3, [R3]
		MOV	R1, #0
		ADD	R3, R3,	#0x2000
		MOV	R2, #0x238
		ADD	R0, SP,	#0x250+buf
		LDR	R4, [R3,#0x34]
		LDR	R5, [R3,#0x38]
		BL	memset
		CMP	R4, #2
		MOVEQ	R3, #0x3E8
		LDRNE	R3, =0x3EA
		MOV	R1, R4		; processId
		ADD	R0, SP,	#0x250+process ; process
		STR	R3, [SP,#0x250+var_244]
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		BEQ	loc_102D10
		LDR	R0, =aOpenprocessF_2 ; "openProcess failed: %08x\n"
		MOV	R2, #0
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x250+process]
		B	loc_102D30
; ---------------------------------------------------------------------------

loc_102D10				; CODE XREF: handle_attachprocess_packet+4Cj
		MOV	R1, R5		; addr_jmpcode
		LDR	R0, [SP,#0x250+process]	; handle
		ADD	R2, SP,	#0x250+buf ; buf
		BL	inject_ntr_into_remote_process
		ADD	R1, R4,	#0x1380
		LDR	R0, =aWillListenAtPo ; msg
		ADD	R1, R1,	#8
		BL	sendMsg

loc_102D30				; CODE XREF: handle_attachprocess_packet+64j
		LDR	R0, [SP,#0x250+process]	; handle
		CMP	R0, #0
		BEQ	loc_102D40
		BL	svcCloseHandle

loc_102D40				; CODE XREF: handle_attachprocess_packet+90j
		ADD	SP, SP,	#0x244
		LDMFD	SP!, {R4,R5,PC}
; End of function handle_attachprocess_packet

; ---------------------------------------------------------------------------
off_102D48	DCD ntrNetworkDebugServerStack ; DATA XREF: handle_attachprocess_packetr
dword_102D4C	DCD 0x3EA		; DATA XREF: handle_attachprocess_packet+34r
; u8 *off_102D50
off_102D50	DCD aOpenprocessF_2	; DATA XREF: handle_attachprocess_packet+50r
					; "openProcess failed: %08x\n"
; u8 *off_102D54
off_102D54	DCD aWillListenAtPo	; DATA XREF: handle_attachprocess_packet+7Cr
					; "will listen at port %d \n"

; =============== S U B	R O U T	I N E =======================================


send_proc_context_to_client		; CODE XREF: check_for_bp_hit+84p
		STMFD	SP!, {R3-R5,LR}
		MOV	R4, R0
		MOV	R5, R4
		LDR	R0, =aCpsr08x	; "cpsr:%08x "
		LDR	R1, [R5],#0x38
		BL	sendMsg
		LDR	R1, [R4,#0x38]
		LDR	R0, =aLr08xSp08x ; msg
		MOV	R2, R5
		BL	sendMsg
		MOV	R1, #0

loc_102D84				; CODE XREF: send_proc_context_to_client+44j
		ADD	R5, R1,	#1
		LDR	R0, =aRD08x	; "r%d:%08x "
		LDR	R2, [R4,R5,LSL#2]
		BL	sendMsg
		CMP	R5, #0xD
		MOV	R1, R5
		BNE	loc_102D84
		LDR	R0, =(aWillListenAtPo+0x17) ; msg
		LDMFD	SP!, {R3-R5,LR}
		B	sendMsg
; End of function send_proc_context_to_client

; ---------------------------------------------------------------------------
; u8 *off_102DAC
off_102DAC	DCD aCpsr08x		; DATA XREF: send_proc_context_to_client+Cr
					; "cpsr:%08x "
; u8 *off_102DB0
off_102DB0	DCD aLr08xSp08x		; DATA XREF: send_proc_context_to_client+1Cr
					; "lr:%08x sp:%08x\n"
; u8 *off_102DB4
off_102DB4	DCD aRD08x		; DATA XREF: send_proc_context_to_client+30r
					; "r%d:%08x "
; u8 *off_102DB8
off_102DB8	DCD aWillListenAtPo+0x17 ; DATA	XREF: send_proc_context_to_client+48r

; =============== S U B	R O U T	I N E =======================================


check_for_bp_hit			; CODE XREF: handle_network_client:loc_10303Cp

var_14		= -0x14
var_10		= -0x10
var_C		= -0xC

		STMFD	SP!, {R0-R4,LR}
		LDR	R4, =ntrNetworkDebugServerStack
		LDR	R0, [R4]
		ADD	R0, R0,	#0xB700
		ADD	R0, R0,	#0x94	; lock
		BL	rtAcquireLock
		LDR	R2, [R4]
		ADD	R3, SP,	#0x18+var_14
		ADD	R2, R2,	#0xB700
		MOV	R12, R2
		LDR	R0, [R12,#0x98]!
		LDR	R1, [R12,#4]
		STMIA	R3!, {R0,R1}
		LDR	R0, [R12,#8]
		STR	R0, [R3]
		ADD	R0, R2,	#0x94	; lock
		BL	rtReleaseLock
		LDR	R3, [SP,#0x18+var_14]
		CMP	R3, #0
		BEQ	loc_102E48
		LDR	R3, [SP,#0x18+var_C]
		CMP	R3, #1
		MOVEQ	R3, #0
		BEQ	loc_102E48
		LDR	R3, [R4]
		ADD	R3, R3,	#0xB000
		LDR	R3, [R3,#0x7A4]
		CMP	R3, #0
		BNE	loc_102E44
		LDR	R0, =aBreakpointDHit ; "breakpoint %d hit\n"
		LDR	R1, [SP,#0x18+var_14]
		BL	sendMsg
		LDR	R0, [SP,#0x18+var_10]
		BL	send_proc_context_to_client

loc_102E44				; CODE XREF: check_for_bp_hit+70j
		MOV	R3, #1

loc_102E48				; CODE XREF: check_for_bp_hit+4Cj
					; check_for_bp_hit+5Cj
		LDR	R2, [R4]
		ADD	R2, R2,	#0xB000
		STR	R3, [R2,#0x7A4]
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4,PC}
; End of function check_for_bp_hit

; ---------------------------------------------------------------------------
off_102E5C	DCD ntrNetworkDebugServerStack ; DATA XREF: check_for_bp_hit+4r
; u8 *off_102E60
off_102E60	DCD aBreakpointDHit	; DATA XREF: check_for_bp_hit+74r
					; "breakpoint %d hit\n"

; =============== S U B	R O U T	I N E =======================================


dispatch_client_cmd			; CODE XREF: handle_network_client+A8p
		STMFD	SP!, {R3-R5,LR}
		LDR	R3, =ntrNetworkDebugServerStack
		LDR	R4, [R3]
		ADD	R4, R4,	#0x2000
		LDR	R3, [R4,#0x74]
		STR	R3, [R4,#0x78]
		LDR	R3, [R4,#0x30]
		CMP	R3, #3
		BNE	loc_102E94
handle_hello_packet:
		LDR	R0, =aHello	; msg
		LDMFD	SP!, {R3-R5,LR}
		B	sendMsg
; ---------------------------------------------------------------------------

loc_102E94				; CODE XREF: dispatch_client_cmd+20j
		CMP	R3, #0
		BNE	loc_102EEC
handle_heartbeat_packet:
		LDR	R5, =p_config_memory
		LDR	R0, [R5]
		ADD	R0, R0,	#0x1C	; lock
		BL	rtAcquireLock
		LDR	R3, [R5]
		LDR	R3, [R3,#0x14]
		STR	R3, [R4,#0x74]
		BL	sub_101A74
		LDR	R1, [R4,#0x74]
		CMP	R1, #0
		BEQ	loc_102ED4
		LDR	R3, [R5]
		LDR	R0, [R3,#0xC]
		BL	sub_101A9C

loc_102ED4				; CODE XREF: dispatch_client_cmd+60j
		LDR	R0, [R5]
		MOV	R3, #0
		ADD	R0, R0,	#0x1C	; lock
		STR	R3, [R0,#-8]
		LDMFD	SP!, {R3-R5,LR}
		B	rtReleaseLock
; ---------------------------------------------------------------------------

loc_102EEC				; CODE XREF: dispatch_client_cmd+34j
		CMP	R3, #1
		BNE	loc_102EFC
		LDMFD	SP!, {R3-R5,LR}
		B	handle_savefile_packet
; ---------------------------------------------------------------------------

loc_102EFC				; CODE XREF: dispatch_client_cmd+8Cj
		CMP	R3, #4
		BNE	loc_102F0C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_reload_packet
; ---------------------------------------------------------------------------

loc_102F0C				; CODE XREF: dispatch_client_cmd+9Cj
		CMP	R3, #5
		BNE	loc_102F1C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_listprocess_packet
; ---------------------------------------------------------------------------

loc_102F1C				; CODE XREF: dispatch_client_cmd+ACj
		CMP	R3, #7
		BNE	loc_102F2C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_listthread_packet
; ---------------------------------------------------------------------------

loc_102F2C				; CODE XREF: dispatch_client_cmd+BCj
		CMP	R3, #6
		BNE	loc_102F3C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_attachprocess_packet
; ---------------------------------------------------------------------------

loc_102F3C				; CODE XREF: dispatch_client_cmd+CCj
		CMP	R3, #8
		BNE	loc_102F4C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_memlayout_packet
; ---------------------------------------------------------------------------

loc_102F4C				; CODE XREF: dispatch_client_cmd+DCj
		CMP	R3, #9
		BNE	loc_102F5C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_readmem_packet
; ---------------------------------------------------------------------------

loc_102F5C				; CODE XREF: dispatch_client_cmd+ECj
		CMP	R3, #0xA
		BNE	loc_102F6C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_writemem_packet
; ---------------------------------------------------------------------------

loc_102F6C				; CODE XREF: dispatch_client_cmd+FCj
		CMP	R3, #0xB
		BNE	loc_102F7C
		LDMFD	SP!, {R3-R5,LR}
		B	handle_debugcmd_packet
; ---------------------------------------------------------------------------

loc_102F7C				; CODE XREF: dispatch_client_cmd+10Cj
		CMP	R3, #0xC
		LDMNEFD	SP!, {R3-R5,PC}
		LDMFD	SP!, {R3-R5,LR}
		B	handle_queryhandle_packet
; End of function dispatch_client_cmd

; ---------------------------------------------------------------------------
off_102F8C	DCD ntrNetworkDebugServerStack ; DATA XREF: dispatch_client_cmd+4r
; u8 *off_102F90
off_102F90	DCD aHello		; DATA XREF: dispatch_client_cmd+24r
					; "hello"
off_102F94	DCD p_config_memory	; DATA XREF: dispatch_client_cmd+38r

; =============== S U B	R O U T	I N E =======================================


handle_network_client			; CODE XREF: thread_handle_network_client+4p
					; ntrSetupNetworkDebugServer+18Cp

var_28		= -0x28
var_26		= -0x26
var_24		= -0x24

		STMFD	SP!, {R0-R8,LR}

loc_102F9C				; CODE XREF: handle_network_client+2Cj
		BL	check_plugin_exit_flag
		MOV	R0, #2		; domain
		MOV	R1, #1		; type
		MOV	R2, #0		; protocol
		BL	socketOpen
		SUBS	R6, R0,	#0
		BGT	loc_102FC8
		LDR	R0, =0x3B9ACA00	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		B	loc_102F9C
; ---------------------------------------------------------------------------

loc_102FC8				; CODE XREF: handle_network_client+1Cj
		LDR	R4, =ntrNetworkDebugServerStack
		MOV	R2, #2
		STRH	R2, [SP,#0x28+var_28]
		LDR	R3, [R4]
		MOV	R5, #0
		STR	R6, [R3,#4]
		LDRH	R0, [R3]
		BL	sub_104F18
		MOV	R1, SP		; addr
		MOV	R2, #0x10	; addrlen
		STR	R5, [SP,#0x28+var_24]
		STRH	R0, [SP,#0x28+var_26]
		MOV	R0, R6		; sockfd
		BL	socketBind
		SUBS	R1, R0,	#0
		LDRLT	R0, =0x10A51D
		BLT	loc_10302C
		MOV	R1, #1		; max_connections
		MOV	R0, R6		; sockfd
		BL	socketListen
		SUBS	R1, R0,	#0	; errno
		MOVGE	R7, R4
		LDRGE	R8, =0x12345678	; magic
		BGE	loc_10307C
		LDR	R0, =aListenFailed08 ; fmt

loc_10302C				; CODE XREF: handle_network_client+70j
		MOV	R2, R5		; v2
		BL	showDbg
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R8,PC}
; ---------------------------------------------------------------------------

loc_10303C				; CODE XREF: handle_network_client+12Cj
		BL	check_for_bp_hit
		BL	dispatch_client_cmd

loc_103044				; CODE XREF: handle_network_client+108j
		LDR	R1, [R4]
		MOV	R0, R5
		ADD	R1, R1,	#0x2000
		ADD	R1, R1,	#0x24
		MOV	R2, #0x54
		BL	recv_
		CMP	R0, #0x54
		MOV	R1, R0
		BEQ	loc_1030B4
		LDR	R0, =aRtrecvsocketFa ; msg
		MOV	R2, #0

loc_103070				; CODE XREF: handle_network_client+138j
		BL	sendMsg
		MOV	R0, R5		; sockfd
		BL	socketClose

loc_10307C				; CODE XREF: handle_network_client+8Cj
					; handle_network_client+118j
		BL	check_plugin_exit_flag
		MOV	R1, #0		; addr
		MOV	R0, R6		; sockfd
		MOV	R2, R1		; addrlen
		BL	socketAccept
		LDR	R3, [R4]
		CMP	R0, #0
		MOV	R5, R0
		STR	R0, [R3,#8]
		BGE	loc_103044
		LDR	R0, =0x3B9ACA00	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		B	loc_10307C
; ---------------------------------------------------------------------------

loc_1030B4				; CODE XREF: handle_network_client+CCj
		LDR	R3, [R7]
		ADD	R3, R3,	#0x2000
		LDR	R1, [R3,#0x24]
		CMP	R1, R8
		BEQ	loc_10303C
		LDR	R0, =0x10A55D
		LDR	R2, [R3,#0x28]
		B	loc_103070
; End of function handle_network_client

; ---------------------------------------------------------------------------
; s64 p_some_code
p_some_code	DCD 0x3B9ACA00		; DATA XREF: handle_network_client+20r
					; handle_network_client+10Cr
off_1030D8	DCD ntrNetworkDebugServerStack
					; DATA XREF: handle_network_client:loc_102FC8r
dword_1030DC	DCD 0x10A51D		; DATA XREF: handle_network_client+6Cr
dword_1030E0	DCD 0x12345678		; DATA XREF: handle_network_client+88r
; u8 *off_1030E4
off_1030E4	DCD aListenFailed08	; DATA XREF: handle_network_client+90r
					; "listen failed: %08x"
; u8 *off_1030E8
off_1030E8	DCD aRtrecvsocketFa	; DATA XREF: handle_network_client+D0r
					; "rtRecvSocket failed: %08x"
dword_1030EC	DCD 0x10A55D		; DATA XREF: handle_network_client+130r

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

thread_handle_network_client		; DATA XREF: ntrSetupNetworkDebugServer+1B0o
					; ROM:off_103364o
		STMFD	SP!, {R3,LR}
		BL	handle_network_client
		LDMFD	SP!, {R3,LR}
		B	svcExitThread
; End of function thread_handle_network_client


; =============== S U B	R O U T	I N E =======================================


init_config_mem				; CODE XREF: threadNtrHomeInjectee+ACp
					; main+158p
		STMFD	SP!, {R4,LR}
		LDR	R4, =p_config_memory
		LDR	R3, =xfunc_out
		LDR	R2, =init_debugger
		LDR	R0, [R4]
		STR	R2, [R3]
		ADD	R0, R0,	#0x1C	; lock
		BL	rtInitLock
		LDR	R3, [R4]
		LDR	R2, =0x6000900
		STR	R2, [R3,#0xC]	; offset 0xC = 0x6000900
		MOV	R2, #0xF0
		STR	R2, [R3,#0x10]	; offs 0x10 = 0xF0
		MOV	R2, #0
		STR	R2, [R3,#0x14]
		MOV	R2, #1
		STR	R2, [R3,#0x18]
		LDMFD	SP!, {R4,PC}
; End of function init_config_mem

; ---------------------------------------------------------------------------
off_103148	DCD p_config_memory	; DATA XREF: init_config_mem+4r
off_10314C	DCD xfunc_out		; DATA XREF: init_config_mem+8r
off_103150	DCD init_debugger	; DATA XREF: init_config_mem+Cr
dword_103154	DCD 0x6000900		; DATA XREF: init_config_mem+24r

; =============== S U B	R O U T	I N E =======================================


ntrSetupNetworkDebugServer		; CODE XREF: threadSetupNetworkDebugServer+10p
					; threadNtrHomeInjectee+C0p ...

addr_out	= -0x18
thread		= -0x14

		STMFD	SP!, {R0-R6,LR}	; operation
		LDR	R0, =0xB7A8	; size
		BL	rtAlignToPageSize
		LDR	R4, =p_config_memory
		LDR	R3, [R4]
		LDR	R3, [R3]
		CMP	R3, #1
		MOVEQ	R3, #0x6F00000
		STREQ	R3, [SP,#0x20+addr_out]
		ADD	R5, R0,	#0x14000
		BEQ	loc_1031B0
		LDR	R0, =0x203
		MOV	R3, #3
		MOV	R1, #0x6F00000	; addr0
		STMEA	SP, {R0,R3}
		MOV	R2, #0		; addr1
		ADD	R0, SP,	#0x20+addr_out ; outaddr
		MOV	R3, R5		; size
		BL	svcControlMemory
		SUBS	R1, R0,	#0
		LDRNE	R0, =aSvc_controlmem ; "svc_controlMemory failed: %08x"
		BNE	loc_103330

loc_1031B0				; CODE XREF: ntrSetupNetworkDebugServer+28j
		BL	ntrGetCurrentProcessHandle
		MOV	R1, #0x6F00000	; addr
		MOV	R2, R5		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R1, R0,	#0	; errno
		BEQ	loc_1031D4
		LDR	R0, =aRtcheckremot_1 ; fmt
		MOV	R2, #0		; v2
		BL	showDbg

loc_1031D4				; CODE XREF: ntrSetupNetworkDebugServer+6Cj
		LDR	R3, =srcHandle
		LDR	R3, [R3]
		CMP	R3, #0
		BNE	loc_1031E8
		BL	srvInit

loc_1031E8				; CODE XREF: ntrSetupNetworkDebugServer+88j
		LDR	R3, [R4]
		LDR	R5, [R3,#8]
		CMP	R5, #0
		LDRNE	R3, =socketHandle
		STRNE	R5, [R3]
		BNE	loc_103230
		MOV	R1, #0x10000	; context_size
		LDR	R0, [SP,#0x20+addr_out]	; context_addr
		BL	socketInitialize
		SUBS	R1, R0,	#0
		MOVNE	R2, R5
		LDRNE	R0, =aSoc_initialize ; "SOC_Initialize failed: %08x"
		BNE	loc_103334
		LDR	R3, =p_config_memory
		LDR	R2, =socketHandle
		LDR	R3, [R3]
		LDR	R2, [R2]
		STR	R2, [R3,#8]

loc_103230				; CODE XREF: ntrSetupNetworkDebugServer+A4j
		LDR	R0, [SP,#0x20+addr_out]
		LDR	R5, =ntrNetworkDebugServerStack
		ADD	R0, R0,	#0x10000
		MOV	R1, #0
		LDR	R2, =0xB7A8
		STR	R0, [R5]
		BL	memset
		LDR	R6, [R5]
		MOV	R3, #0x1F40
		STR	R3, [R6]
		LDR	R3, [R4]
		LDR	R3, [R3]
		CMP	R3, #2
		BNE	loc_103278
		BL	ntrGetCurrentProcessId
		ADD	R0, R0,	#0x1380
		ADD	R0, R0,	#8
		STR	R0, [R6]	; *r6 =	pid + 0x1388

loc_103278				; CODE XREF: ntrSetupNetworkDebugServer+10Cj
		LDR	R0, [R5]
		ADD	R0, R0,	#0x6000
		ADD	R0, R0,	#0x90	; lock
		BL	rtInitLock
		LDR	R0, [R5]
		ADD	R0, R0,	#0xB700
		ADD	R0, R0,	#0x94	; lock
		BL	rtInitLock
		LDR	R3, [R4]
		LDR	R2, [R5]
		ADD	R2, R2,	#0x10
		STR	R2, [R3,#0xC]
		MOV	R2, #0
		STR	R2, [R3,#0x14]
		MOV	R2, #0x2000
		STR	R2, [R3,#0x10]
		LDR	R2, [R3]
		CMP	R2, #2
		BNE	loc_1032D0
		MOV	R0, #1
		MOV	R1, #0x100000
		BL	debugcmd_init_breakpoint

loc_1032D0				; CODE XREF: ntrSetupNetworkDebugServer+168j
		LDR	R3, [R4]
		LDR	R3, [R3]
		SUB	R3, R3,	#1
		CMP	R3, #1
		BHI	loc_1032EC
		BL	handle_network_client
		B	loc_103338
; ---------------------------------------------------------------------------

loc_1032EC				; CODE XREF: ntrSetupNetworkDebugServer+188j
		LDR	R0, =0xB7A8	; size
		LDR	R4, [SP,#0x20+addr_out]
		BL	rtAlignToPageSize
		ADD	R4, R4,	#0x10000
		MOV	R1, #0x10
		MOV	R2, #0xFFFFFFFE
		STMEA	SP, {R1,R2}
		LDR	R1, =thread_handle_network_client ; entrypoint
		MOV	R2, #0		; arg
		ADD	R0, R4,	R0
		ADD	R3, R0,	#0x3FC0
		ADD	R3, R3,	#0x18	; stacktop
		ADD	R0, SP,	#0x20+thread ; thread
		BL	svcCreateThread
		SUBS	R1, R0,	#0	; errno
		BEQ	loc_103338
		LDR	R0, =aSvc_createthre ; "svc_createThread failed: %08x"

loc_103330				; CODE XREF: ntrSetupNetworkDebugServer+54j
		MOV	R2, #0		; v2

loc_103334				; CODE XREF: ntrSetupNetworkDebugServer+C0j
		BL	showDbg

loc_103338				; CODE XREF: ntrSetupNetworkDebugServer+190j
					; ntrSetupNetworkDebugServer+1D0j
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R6,PC}
; End of function ntrSetupNetworkDebugServer

; ---------------------------------------------------------------------------
; uint32_t size
size		DCD 0xB7A8		; DATA XREF: ntrSetupNetworkDebugServer+4r
					; ntrSetupNetworkDebugServer+E8r ...
off_103344	DCD p_config_memory	; DATA XREF: ntrSetupNetworkDebugServer+Cr
					; ntrSetupNetworkDebugServer+C4r
dword_103348	DCD 0x203		; DATA XREF: ntrSetupNetworkDebugServer+2Cr
off_10334C	DCD aSvc_controlmem	; DATA XREF: ntrSetupNetworkDebugServer+50r
					; "svc_controlMemory failed: %08x"
; u8 *off_103350
off_103350	DCD aRtcheckremot_1	; DATA XREF: ntrSetupNetworkDebugServer+70r
					; "rtCheckRemoteMemoryRegionSafeForWrite f"...
off_103354	DCD srcHandle		; DATA XREF: ntrSetupNetworkDebugServer:loc_1031D4r
off_103358	DCD socketHandle	; DATA XREF: ntrSetupNetworkDebugServer+9Cr
					; ntrSetupNetworkDebugServer+C8r
off_10335C	DCD aSoc_initialize	; DATA XREF: ntrSetupNetworkDebugServer+BCr
					; "SOC_Initialize failed: %08x"
off_103360	DCD ntrNetworkDebugServerStack ; DATA XREF: ntrSetupNetworkDebugServer+DCr
; ThreadFunc off_103364
off_103364	DCD thread_handle_network_client
					; DATA XREF: ntrSetupNetworkDebugServer+1B0r
; u8 *off_103368
off_103368	DCD aSvc_createthre	; DATA XREF: ntrSetupNetworkDebugServer+1D4r
					; "svc_createThread failed: %08x"

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u32 __fastcall osConvertVaddr2Physaddr(u32 vaddr)
osConvertVaddr2Physaddr
		ADD	R3, R0,	#0xEC000000
		CMN	R3, #0xF8000001
		BHI	osConvertOldLinearMemToNew
		ADD	R0, R0,	#0xC000000
		BX	LR
; End of function osConvertVaddr2Physaddr


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

osConvertOldLinearMemToNew		; CODE XREF: osConvertVaddr2Physaddr+8j
		ADD	R3, R0,	#0xD0000000
		CMN	R3, #0xF0000001
		BHI	loc_103394
		ADD	R0, R0,	#0xF0000000
		BX	LR
; ---------------------------------------------------------------------------

loc_103394				; CODE XREF: osConvertOldLinearMemToNew+8j
		ADD	R3, R0,	#0xE1000000
		CMP	R3, #0x600000
		ADDCC	R0, R0,	#0xF9000000
		MOVCS	R0, #0
		BX	LR
; End of function osConvertOldLinearMemToNew


; =============== S U B	R O U T	I N E =======================================


sub_1033A8

process		= -0xC
var_4		= -4

		STMFD	SP!, {R0-R2,LR}
		MOV	R1, #0x25	; processId
		ADD	R0, SP,	#0x10+process ;	process
		BL	svcOpenProcess
		STR	R0, [SP,#0x10+process]
		BL	svcCloseHandle
		ADD	SP, SP,	#0xC
		LDR	PC, [SP+4+var_4],#4
; End of function sub_1033A8


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u32 __stdcall	plgRegisterCallback(u32	type, void *callback, u32 param0)
plgRegisterCallback			; DATA XREF: ntrPlgInitSharedFunctions+30o
					; ROM:off_1059A8o
		MOV	R0, #0
		BX	LR
; End of function plgRegisterCallback


; =============== S U B	R O U T	I N E =======================================


; u32 __stdcall	plgRequestMemory(u32 size)
plgRequestMemory			; CODE XREF: display_OSD_menu+1Cp
					; DATA XREF: ntrPlgInitSharedFunctions+28o ...

addr_out	= -0x14

		TST	R0, #1
		STMFD	SP!, {R0-R6,LR}	; operation
		BEQ	loc_1033E4

loc_1033DC				; CODE XREF: plgRequestMemory+5Cj
		MOV	R0, #0
		B	loc_103440
; ---------------------------------------------------------------------------

loc_1033E4				; CODE XREF: plgRequestMemory+8j
		LDR	R3, =dword_10AED8
		MOV	R4, R0
		ADD	R0, SP,	#0x20+addr_out ; outaddr
		LDR	R2, [R3]
		LDR	R6, =dword_10AED8
		CMP	R2, #0
		LDREQ	R2, =p_plgloader_info_ver_specific
		LDREQ	R2, [R2]
		STREQ	R2, [R3]
		LDR	R2, =0x203
		LDR	R5, [R3]
		MOV	R3, #3
		MOV	R1, R5		; addr0
		STMEA	SP, {R2,R3}
		MOV	R2, R5		; addr1
		MOV	R3, R4		; size
		BL	svcControlMemory
		CMP	R0, #0
		BNE	loc_1033DC
		LDR	R0, [R6]
		ADD	R4, R4,	R0
		MOV	R0, R5
		STR	R4, [R6]

loc_103440				; CODE XREF: plgRequestMemory+10j
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R6,PC}
; End of function plgRequestMemory

; ---------------------------------------------------------------------------
off_103448	DCD dword_10AED8	; DATA XREF: plgRequestMemory:loc_1033E4r
					; plgRequestMemory+24r
off_10344C	DCD p_plgloader_info_ver_specific ; DATA XREF: plgRequestMemory+2Cr
dword_103450	DCD 0x203		; DATA XREF: plgRequestMemory+38r

; =============== S U B	R O U T	I N E =======================================


; u32 __stdcall	plgGetSharedServiceHandle(char *servName, Handle *handle)
plgGetSharedServiceHandle		; CODE XREF: ntrScreenShotBuiltinPluginInit+28p
					; DATA XREF: ntrPlgInitSharedFunctions+20o ...
		STMFD	SP!, {R4,LR}
		MOV	R4, R1
		LDR	R1, =aFsUser	; "fs:USER"
		BL	strcmp
		CMP	R0, #0
		BNE	locret_10347C
		LDR	R3, =hFSUser
		LDR	R3, [R3]
		STR	R3, [R4]
		LDMFD	SP!, {R4,PC}
; ---------------------------------------------------------------------------

locret_10347C				; CODE XREF: plgGetSharedServiceHandle+14j
		LDMFD	SP!, {R4,PC}
; End of function plgGetSharedServiceHandle

; ---------------------------------------------------------------------------
off_103480	DCD aFsUser		; DATA XREF: plgGetSharedServiceHandle+8r
					; "fs:USER"
off_103484	DCD hFSUser		; DATA XREF: plgGetSharedServiceHandle+18r

; =============== S U B	R O U T	I N E =======================================


; void *__stdcall plgGetIoBase(int IoIndex)
plgGetIoBase				; DATA XREF: ntrPlgInitSharedFunctions+48o
					; ROM:off_1059B4o
		CMP	R0, #2
		LDREQ	R3, =va_mapped_io_LCD
		BEQ	loc_1034A0
		CMP	R0, #1
		BNE	loc_1034A8
		LDR	R3, =va_mapped_io_PAD

loc_1034A0				; CODE XREF: plgGetIoBase+8j
					; plgGetIoBase+28j
		LDR	R0, [R3]
		BX	LR
; ---------------------------------------------------------------------------

loc_1034A8				; CODE XREF: plgGetIoBase+10j
		CMP	R0, #3
		LDREQ	R3, =va_mapped_io_PDC
		BEQ	loc_1034A0
		CMP	R0, #4
		MOVEQ	R0, #0x14000000
		MOVNE	R0, #0
		BX	LR
; End of function plgGetIoBase

; ---------------------------------------------------------------------------
off_1034C4	DCD va_mapped_io_LCD	; DATA XREF: plgGetIoBase+4r
off_1034C8	DCD va_mapped_io_PAD	; DATA XREF: plgGetIoBase+14r
off_1034CC	DCD va_mapped_io_PDC	; DATA XREF: plgGetIoBase+24r

; =============== S U B	R O U T	I N E =======================================

; This set KProcess refcount to	1

; int __cdecl ntrResetKProcessRefcount(u32 processid)
ntrResetKProcessRefcount		; CODE XREF: ntrMenu+E8p

handle		= -0x14
var_10		= -0x10

		STMFD	SP!, {R0-R2,R4,R5,LR}
		ADD	R1, SP,	#0x18+var_10
		MOV	R5, #0		; processId
		STR	R5, [R1,#-4]!
		MOV	R0, R5		; process
		LDR	R2, =aNsS	; "ns:s"
		BL	srvGetServiceHandle
		SUBS	R4, R0,	#0
		BEQ	loc_103508
		LDR	R0, =aOpenNsSFailed0 ; fmt
		MOV	R1, R4		; errno
		MOV	R2, R5		; v2
		BL	showDbg
		B	loc_103540
; ---------------------------------------------------------------------------

loc_103508				; CODE XREF: ntrResetKProcessRefcount+20j
		BL	svcGetThreadCommandBuffer ; handle
		LDR	R2, =ntrReinstall ; handle
		MOV	R3, #1
		STMIA	R0, {R2,R3}
		MOV	R3, #2		; count
		STR	R4, [R0,#8]
		STR	R4, [R0,#0xC]
		STR	R3, [R0,#0x10]
		STR	R4, [R0,#0x14]	; init var_14
		STR	R4, [R0,#0x18]
		LDR	R0, [SP,#0x18+handle] ;	session
		BL	svcSendSyncRequest
		LDR	R0, [SP,#0x18+handle] ;	handle
		BL	svcCloseHandle

loc_103540				; CODE XREF: ntrResetKProcessRefcount+34j
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrResetKProcessRefcount

; ---------------------------------------------------------------------------
; unsigned __int8 *off_103548
off_103548	DCD aNsS		; DATA XREF: ntrResetKProcessRefcount+14r
					; "ns:s"
; u8 *off_10354C
off_10354C	DCD aOpenNsSFailed0	; DATA XREF: ntrResetKProcessRefcount+24r
					; "open ns:s failed: %08x"
off_103550	DCD ntrReinstall	; DATA XREF: ntrResetKProcessRefcount+3Cr

; =============== S U B	R O U T	I N E =======================================


; void ntrSetHotkey(void)
ntrSetHotkey				; CODE XREF: ntrMenu+F8p

var_28		= -0x28
var_24		= -0x24
var_20		= -0x20
var_1C		= -0x1C
var_4		= -4

		STR	LR, [SP,#var_4]!
		SUB	SP, SP,	#0x24
		LDR	R3, =aNtrMenuXY	; "NTR Menu: X+Y"
		STR	R3, [SP,#0x28+var_28]
		LDR	R3, =aNtrMenuLStart ; "NTR Menu: L+START"
		STR	R3, [SP,#0x28+var_24]
		LDR	R3, =aScreenshotDisa ; "Screenshot: disabled"
		STR	R3, [SP,#0x28+var_20]
		LDR	R3, =0x10A63F
		STR	R3, [SP,#0x28+var_1C]

loc_10357C				; CODE XREF: ntrSetHotkey+70j
		LDR	R0, =aNtrCfw2_2	; "NTR CFW 2.2"
		MOV	R1, #4		; entryCount
		MOV	R2, SP		; captions
		BL	showMenu
		CMN	R0, #1
		BEQ	loc_1035D4
		CMP	R0, #0
		MOVEQ	R2, #0xC00
		BEQ	loc_1035AC
		CMP	R0, #1
		BNE	loc_1035B4
		MOV	R2, #0x208

loc_1035AC				; CODE XREF: ntrSetHotkey+48j
		LDR	R3, =ntrKeyOpenMenu
		B	loc_1035D0
; ---------------------------------------------------------------------------

loc_1035B4				; CODE XREF: ntrSetHotkey+50j
		CMP	R0, #2
		MOVEQ	R2, #0
		BEQ	loc_1035CC
		CMP	R0, #3
		BNE	loc_10357C
		MOV	R2, #0xC

loc_1035CC				; CODE XREF: ntrSetHotkey+68j
		LDR	R3, =ntrKeyScreenShot

loc_1035D0				; CODE XREF: ntrSetHotkey+5Cj
		STR	R2, [R3]

loc_1035D4				; CODE XREF: ntrSetHotkey+3Cj
		ADD	SP, SP,	#0x24
		LDR	PC, [SP+4+var_4],#4
; End of function ntrSetHotkey

; ---------------------------------------------------------------------------
off_1035DC	DCD aNtrMenuXY		; DATA XREF: ntrSetHotkey+8r
					; "NTR Menu: X+Y"
off_1035E0	DCD aNtrMenuLStart	; DATA XREF: ntrSetHotkey+10r
					; "NTR Menu: L+START"
off_1035E4	DCD aScreenshotDisa	; DATA XREF: ntrSetHotkey+18r
					; "Screenshot: disabled"
dword_1035E8	DCD 0x10A63F		; DATA XREF: ntrSetHotkey+20r
; uint8_t *title
title		DCD aNtrCfw2_2		; DATA XREF: ntrSetHotkey:loc_10357Cr
					; "NTR CFW 2.2"
off_1035F0	DCD ntrKeyOpenMenu	; DATA XREF: ntrSetHotkey:loc_1035ACr
off_1035F4	DCD ntrKeyScreenShot	; DATA XREF: ntrSetHotkey:loc_1035CCr

; =============== S U B	R O U T	I N E =======================================


; void ntrMenu(void)
ntrMenu					; CODE XREF: threadNtrHomeInjectee+100p

var_238		= -0x238
var_234		= -0x234
var_230		= -0x230
var_22C		= -0x22C
var_8		= -8

		STMFD	SP!, {R4,LR}
		SUB	SP, SP,	#0x230
		BL	debounceKey
		LDR	R3, =aProcessManager ; "Process Manager"
		LDR	R2, =g_plugin_func_ptrs_
		STR	R3, [SP,#0x238+var_238]
		LDR	R3, =aEnableDebugger ; "Enable Debugger"
		MOV	R4, #4
		STR	R3, [SP,#0x238+var_234]
		LDR	R3, =aCleanMode	; "Clean Mode"
		MOV	R12, #0xC
		STR	R3, [SP,#0x238+var_230]
		LDR	R3, =0x10A68F	; Set HotKey
		STR	R3, [SP,#0x238+var_22C]
		LDR	R3, =dword_10AED8
		LDR	R0, [R3,#(dword_10AEDC - 0x10AED8)]
		MOV	R3, #0

loc_10363C				; CODE XREF: ntrMenu+78j
		CMP	R3, R0
		BEQ	loc_103674
		MUL	R1, R12, R3
		ADD	LR, R1,	R2
		LDR	R1, [R1,R2]
		CMP	R1, #1
		ADDEQ	R1, SP,	#0x238+var_8
		ADDEQ	R1, R1,	R4,LSL#2
		LDREQ	LR, [LR,#4]
		STREQ	R3, [R1,#-0x118]
		STREQ	LR, [R1,#-0x230]
		ADDEQ	R4, R4,	#1
		ADD	R3, R3,	#1
		B	loc_10363C
; ---------------------------------------------------------------------------

loc_103674				; CODE XREF: ntrMenu+48j
		BL	acquire_video

loc_103678				; CODE XREF: ntrMenu+A4j ntrMenu+FCj ...
		LDR	R0, =aNtrCfw2_2	; "NTR CFW 2.2"
		MOV	R1, R4		; entryCount
		MOV	R2, SP		; captions
		BL	showMenu
		CMN	R0, #1
		BEQ	loc_103724
		CMP	R0, #0
		BNE	loc_1036A0
		BL	ntrProcessManager
		B	loc_103678
; ---------------------------------------------------------------------------

loc_1036A0				; CODE XREF: ntrMenu+9Cj
		CMP	R0, #1
		BNE	loc_1036D0
		LDR	R3, =p_config_memory
		LDR	R3, [R3]
		LDR	R3, [R3,#8]
		CMP	R3, #0
		BEQ	loc_1036C8
		LDR	R0, =aDebuggerHasAlr ; "Debugger has already been enabled."
		BL	showMsg
		B	loc_103724
; ---------------------------------------------------------------------------

loc_1036C8				; CODE XREF: ntrMenu+C0j
		BL	ntrSetupNetworkDebugServer
		B	loc_103724
; ---------------------------------------------------------------------------

loc_1036D0				; CODE XREF: ntrMenu+ACj
		CMP	R0, #2
		BNE	loc_1036E8
		BL	ntrClosePluginHandle_
		MOV	R0, #1		; processid
		BL	ntrResetKProcessRefcount ; This	set KProcess refcount to 1
		B	loc_103724
; ---------------------------------------------------------------------------

loc_1036E8				; CODE XREF: ntrMenu+DCj
		CMP	R0, #3
		BNE	loc_1036F8
		BL	ntrSetHotkey
		B	loc_103678
; ---------------------------------------------------------------------------

loc_1036F8				; CODE XREF: ntrMenu+F4j
		BLS	loc_103678
		ADD	R3, SP,	#0x238+var_8
		ADD	R0, R3,	R0,LSL#2
		MOV	R1, #0xC
		LDR	R2, [R0,#-0x118]
		LDR	R3, =g_plugin_func_ptrs_
		MLA	R3, R1,	R2, R3
		LDR	R3, [R3,#8]
		BLX	R3
		CMP	R0, #0
		BEQ	loc_103678

loc_103724				; CODE XREF: ntrMenu+94j ntrMenu+CCj ...
		BL	release_video
		BL	debounceKey
		BL	sub_107160
		ADD	SP, SP,	#0x230
		LDMFD	SP!, {R4,PC}
; End of function ntrMenu

; ---------------------------------------------------------------------------
off_103738	DCD aProcessManager	; DATA XREF: ntrMenu+Cr
					; "Process Manager"
off_10373C	DCD g_plugin_func_ptrs_	; DATA XREF: ntrMenu+10r ntrMenu+114r
off_103740	DCD aEnableDebugger	; DATA XREF: ntrMenu+18r
					; "Enable Debugger"
off_103744	DCD aCleanMode		; DATA XREF: ntrMenu+24r
					; "Clean Mode"
dword_103748	DCD 0x10A68F		; DATA XREF: ntrMenu+30r
off_10374C	DCD dword_10AED8	; DATA XREF: ntrMenu+38r
; uint8_t *off_103750
off_103750	DCD aNtrCfw2_2		; DATA XREF: ntrMenu:loc_103678r
					; "NTR CFW 2.2"
off_103754	DCD p_config_memory	; DATA XREF: ntrMenu+B0r
; u8 *off_103758
off_103758	DCD aDebuggerHasAlr	; DATA XREF: ntrMenu+C4r
					; "Debugger has already been enabled."

; =============== S U B	R O U T	I N E =======================================


; u32 __stdcall	plgRegisterMenuEntry(u32 catalog, char *title, void *callback)
plgRegisterMenuEntry			; CODE XREF: ntrScreenShotBuiltinPluginInit+1Cp
					; DATA XREF: ntrPlgInitSharedFunctions+18o ...
		STMFD	SP!, {R4,R5,LR}
		LDR	LR, =dword_10AED8
		LDR	R3, [LR,#(dword_10AEDC - 0x10AED8)]
		CMP	R3, #0x3F
		BLS	loc_103778
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R4,R5,PC}
; ---------------------------------------------------------------------------

loc_103778				; CODE XREF: plgRegisterMenuEntry+10j
		MOV	R12, #0xC
		LDR	R5, =g_plugin_func_ptrs_
		MUL	R12, R12, R3
		ADD	R3, R3,	#1
		ADD	R4, R5,	R12
		STR	R0, [R5,R12]
		STR	R3, [LR,#(dword_10AEDC - 0x10AED8)]
		STMIB	R4, {R1,R2}
		LDMFD	SP!, {R4,R5,PC}
; End of function plgRegisterMenuEntry

; ---------------------------------------------------------------------------
off_10379C	DCD dword_10AED8	; DATA XREF: plgRegisterMenuEntry+4r
off_1037A0	DCD g_plugin_func_ptrs_	; DATA XREF: plgRegisterMenuEntry+20r

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall ntrAllocPluginMemory(u32 size, int a2, int a3, u32 *targetAddress)
ntrAllocPluginMemory			; CODE XREF: load_ntr_plugins+80p
					; load_all_plugins_and_inject_ntr_into_pm+A0p

addr_out	= -0x1C

		STMFD	SP!, {R0-R8,LR}	; operation
		LDR	R5, =dword_10AED8
		LDR	R3, [R5,#(plgMemoryAlloced - 0x10AED8)]	; means	failed when 0x7000000
		CMP	R3, #0
		LDREQ	R3, =p_plgloader_info_ver_specific
		LDREQ	R3, [R3,#(dword_1085F8 - 0x1085F4)]
		STREQ	R3, [R5,#(plgMemoryAlloced - 0x10AED8)]	; means	failed when 0x7000000
		LDR	R6, [R5,#(plgMemoryAlloced - 0x10AED8)]	; means	failed when 0x7000000
		CMP	R0, R6
		BLS	loc_10383C
		RSB	R8, R6,	R0
		MOV	R1, R6
		MOV	R2, R8
		MOV	R7, R0
		LDR	R0, =aExpandPoolAddr ; msg
		BL	sendMsg
		LDR	R2, =0x203
		MOV	R3, #3
		ADD	R0, SP,	#0x28+addr_out ; outaddr
		STMEA	SP, {R2,R3}
		MOV	R1, R6		; addr0
		MOV	R2, R6		; addr1
		MOV	R3, R8		; size
		BL	svcControlMemory
		SUBS	R4, R0,	#0
		BEQ	loc_103838
		LDR	R0, =0xFFFF8001	; hProcess
		MOV	R1, R6		; addr
		MOV	R2, R8		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		CMP	R0, #0
		BEQ	loc_103838
		LDR	R0, =aAllocPlgMemory ; msg
		MOV	R1, R4
		BL	sendMsg
		MOV	R0, R4
		B	loc_103840
; ---------------------------------------------------------------------------

loc_103838				; CODE XREF: ntrAllocPluginMemory+64j
					; ntrAllocPluginMemory+7Cj
		STR	R7, [R5,#8]

loc_10383C				; CODE XREF: ntrAllocPluginMemory+24j
		MOV	R0, #0

loc_103840				; CODE XREF: ntrAllocPluginMemory+90j
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4-R8,PC}
; End of function ntrAllocPluginMemory

; ---------------------------------------------------------------------------
off_103848	DCD dword_10AED8	; DATA XREF: ntrAllocPluginMemory+4r
off_10384C	DCD p_plgloader_info_ver_specific ; DATA XREF: ntrAllocPluginMemory+10r
; u8 *off_103850
off_103850	DCD aExpandPoolAddr	; DATA XREF: ntrAllocPluginMemory+38r
					; "expand pool addr: %08x, size: %08x\n"
dword_103854	DCD 0x203		; DATA XREF: ntrAllocPluginMemory+40r
; Handle hProcess
hProcess	DCD 0xFFFF8001		; DATA XREF: ntrAllocPluginMemory+68r
; u8 *off_10385C
off_10385C	DCD aAllocPlgMemory	; DATA XREF: ntrAllocPluginMemory+80r
					; "alloc plg memory failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


; void ntrGetFSUserHandle(void)
ntrGetFSUserHandle
		STMFD	SP!, {R4,LR}
		LDR	R4, =hFSUser
		LDR	R3, [R4]
		CMP	R3, #0
		LDMNEFD	SP!, {R4,PC}
		LDR	R3, =srcHandle
		LDR	R3, [R3]
		CMP	R3, #0
		BNE	loc_103888
		BL	srvInit

loc_103888				; CODE XREF: ntrGetFSUserHandle+20j
		LDR	R1, =hFSUser	; out
		LDR	R2, =aFsReg	; "fs:REG"
		MOV	R0, #0		; handleptr
		BL	srvGetServiceHandle
		LDR	R0, [R4]	; handle
		BL	FSUSER_Initialize
		SUBS	R1, R0,	#0
		BEQ	loc_1038B0
		LDR	R0, =aFsuser_initial ; msg
		BL	sendMsg

loc_1038B0				; CODE XREF: ntrGetFSUserHandle+44j
		LDR	R1, [R4]
		LDR	R0, =aFsuserhandle08 ; msg
		LDMFD	SP!, {R4,LR}
		B	sendMsg
; End of function ntrGetFSUserHandle

; ---------------------------------------------------------------------------
; Handle *off_1038C0
off_1038C0	DCD hFSUser		; DATA XREF: ntrGetFSUserHandle+4r
					; ntrGetFSUserHandle:loc_103888r
off_1038C4	DCD srcHandle		; DATA XREF: ntrGetFSUserHandle+14r
; unsigned __int8 *off_1038C8
off_1038C8	DCD aFsReg		; DATA XREF: ntrGetFSUserHandle+2Cr
					; "fs:REG"
; u8 *off_1038CC
off_1038CC	DCD aFsuser_initial	; DATA XREF: ntrGetFSUserHandle+48r
					; "FSUSER_Initialize failed: %08x\n"
; u8 *off_1038D0
off_1038D0	DCD aFsuserhandle08	; DATA XREF: ntrGetFSUserHandle+54r
					; "fsUserHandle: %08x\n"

; =============== S U B	R O U T	I N E =======================================


inject_into_nintendo_home		; CODE XREF: callback_inject_into_nintendo_home+Cp

size		= -0x498
var_490		= -0x490
var_48C		= -0x48C
dst_addr	= -0x488
var_384		= -0x384
var_380		= -0x380
var_37C		= -0x37C
var_378		= -0x378
var_374		= -0x374
buf		= -0x260
var_25C		= -0x25C

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x470
		LDR	R7, =dword_10AED8
		SUB	SP, SP,	#4
		MOV	R5, R0
		LDR	R8, [R7,#(dword_10AEE4 - 0x10AED8)]
		MOV	R6, R7
		CMP	R8, #0
		BNE	loc_103914
		ADD	R0, R7,	#0xC	; process
		MOV	R1, #0xF	; pid 15 = "menu" process?
		BL	svcOpenProcess
		SUBS	R4, R0,	#0
		STRNE	R8, [R7,#(dword_10AEE4 - 0x10AED8)]
		LDRNE	R0, =0x10A73B
		BNE	loc_103B0C

loc_103914				; CODE XREF: inject_into_nintendo_home+20j
		LDR	R0, =aHmenuprocess08 ; msg
		LDR	R1, [R6,#0xC]
		LDR	R9, =p_plgloader_info_ver_specific
		BL	sendMsg
		MOV	R1, #0
		MOV	R2, #0x238
		ADD	R0, SP,	#0x498+buf
		BL	memset
		ADD	R7, SP,	#0x498+dst_addr
		MOV	R3, #0x114
		STR	R3, [SP,#0x498+size] ; size
		LDR	R0, =0xFFFF8001	; hDst
		MOV	R1, R7		; dst_addr
		LDR	R2, [R6,#0xC]	; hSrc
		LDR	R3, [R9,#(dword_1085F8 - 0x1085F4)] ; src_addr
		BL	inter_process_dma_copy
		SUBS	R4, R0,	#0
		LDRNE	R0, =aLoadPlginfoFai ; "load plginfo failed:%08x\n"
		BNE	loc_103B0C
		SUB	R1, R7,	#8	; buf
		MOV	R0, R5		; handle
		BL	sub_104524
		LDR	R2, [SP,#0x498+var_490]
		LDR	R0, =aProctid08x08x ; "procTid: %08x%08x\n"
		LDR	R1, [SP,#0x498+var_48C]
		BL	sendMsg
		LDR	R3, [SP,#0x498+var_37C]
		LDR	R2, [SP,#0x498+var_490]
		CMP	R2, R3
		BNE	loc_10399C
		LDR	R3, [SP,#0x498+var_378]
		LDR	R2, [SP,#0x498+var_48C]
		CMP	R2, R3
		BEQ	loc_1039A8

loc_10399C				; CODE XREF: inject_into_nintendo_home+B4j
		LDR	R0, =aTidMismatch ; msg
		BL	sendMsg
		B	loc_103B18
; ---------------------------------------------------------------------------

loc_1039A8				; CODE XREF: inject_into_nintendo_home+C4j
		LDR	R3, [SP,#0x498+dst_addr]
		CMP	R3, #0
		BEQ	loc_103A0C

loc_1039B4				; CODE XREF: inject_into_nintendo_home+144j
		LDR	R3, [SP,#0x498+var_384]
		ADD	R8, SP,	#0x498+var_374
		STR	R3, [R6,#0x10]
		LDR	R3, [SP,#0x498+var_380]
		MOV	R1, R7
		STR	R3, [R6,#0x14]
		LDR	R3, [R6,#0xC]
		MOV	R2, #0x114
		STR	R3, [R9,#(hCurKProcess - 0x1085F4)]
		LDR	R3, =0x3E9
		MOV	R0, R8
		STR	R3, [SP,#0x498+var_25C]
		LDR	R4, [R9,#(dword_1085F8 - 0x1085F4)]
		BL	memcpy
		MOV	R0, #0x114	; size
		BL	rtAlignToPageSize
		LDR	R1, [SP,#0x498+dst_addr]
		MOV	R3, #0
		MOV	R1, R1,LSL#2
		MOV	R11, R0
		ADD	R2, R0,	R4
		B	loc_103A1C
; ---------------------------------------------------------------------------

loc_103A0C				; CODE XREF: inject_into_nintendo_home+DCj
		BL	is_BUTTON_DL_pressed
		CMP	R0, #0
		BEQ	loc_103B18
		B	loc_1039B4
; ---------------------------------------------------------------------------

loc_103A1C				; CODE XREF: inject_into_nintendo_home+134j
					; inject_into_nintendo_home+16Cj
		CMP	R3, R1
		BEQ	loc_103A44
		ADD	R0, R7,	R3
		ADD	R12, R8, R3
		LDR	R0, [R0,#0x84]
		STR	R2, [R12,#4]
		ADD	R11, R11, R0
		ADD	R2, R2,	R0
		ADD	R3, R3,	#4
		B	loc_103A1C
; ---------------------------------------------------------------------------

loc_103A44				; CODE XREF: inject_into_nintendo_home+14Cj
		MOV	R0, R5		; handle
		LDR	R1, [R9,#(dword_1085F8 - 0x1085F4)] ; addr
		MOV	R2, R11		; size
		BL	controlRemoteMemory
		LDR	R10, =p_plgloader_info_ver_specific
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A7A9
		BNE	loc_103B0C
		MOV	R0, R5		; hProcess
		LDR	R1, [R10,#(dword_1085F8	- 0x1085F4)] ; addr
		MOV	R2, R11		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A7CB
		BNE	loc_103B0C
		MOV	R3, #0x114
		STR	R3, [SP,#0x498+size] ; size
		MOV	R0, R5		; hDst
		LDR	R1, [R10,#(dword_1085F8	- 0x1085F4)] ; dst_addr
		LDR	R2, =0xFFFF8001	; hSrc
		MOV	R3, R8		; src_addr
		BL	inter_process_dma_copy
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A7DD
		BNE	loc_103B0C
		MOV	R9, #1

loc_103AAC				; CODE XREF: inject_into_nintendo_home+210j
		LDR	R2, [SP,#0x498+var_374]
		SUB	R3, R9,	#1
		CMP	R3, R2
		BCS	loc_103AF0
		ADD	R3, R8,	R9,LSL#2
		MOV	R0, R5		; hDst
		LDR	R3, [R3,#0x80]
		STR	R3, [SP,#0x498+size] ; size
		LDR	R1, [R8,R9,LSL#2] ; dst_addr
		LDR	R3, [R7,R9,LSL#2] ; src_addr
		LDR	R2, [R6,#0xC]	; hSrc
		BL	inter_process_dma_copy
		ADD	R9, R9,	#1
		SUBS	R4, R0,	#0
		BEQ	loc_103AAC
		LDR	R0, =aLoadPlgFailed0 ; "load plg failed: %08x\n"
		B	loc_103B0C
; ---------------------------------------------------------------------------

loc_103AF0				; CODE XREF: inject_into_nintendo_home+1E4j
		MOV	R0, R5		; handle
		MOV	R1, #0x100000	; addr_jmpcode
		ADD	R2, SP,	#0x498+buf ; buf
		BL	inject_ntr_into_remote_process
		SUBS	R4, R0,	#0
		BEQ	loc_103B20
		LDR	R0, =aAttachProcessF ; msg

loc_103B0C				; CODE XREF: inject_into_nintendo_home+3Cj
					; inject_into_nintendo_home+88j ...
		MOV	R1, R4
		BL	sendMsg
		B	loc_103B20
; ---------------------------------------------------------------------------

loc_103B18				; CODE XREF: inject_into_nintendo_home+D0j
					; inject_into_nintendo_home+140j
		MOV	R0, #0xFFFFFFFF
		B	loc_103B24
; ---------------------------------------------------------------------------

loc_103B20				; CODE XREF: inject_into_nintendo_home+230j
					; inject_into_nintendo_home+240j
		MOV	R0, R4

loc_103B24				; CODE XREF: inject_into_nintendo_home+248j
		ADD	SP, SP,	#0x470
		ADD	SP, SP,	#4
		LDMFD	SP!, {R4-R11,PC}
; End of function inject_into_nintendo_home

; ---------------------------------------------------------------------------
off_103B30	DCD dword_10AED8	; DATA XREF: inject_into_nintendo_home+8r
dword_103B34	DCD 0x10A73B		; DATA XREF: inject_into_nintendo_home+38r
; u8 *off_103B38
off_103B38	DCD aHmenuprocess08	; DATA XREF: inject_into_nintendo_home:loc_103914r
					; "hMenuProcess:%08x\n"
off_103B3C	DCD p_plgloader_info_ver_specific ; DATA XREF: inject_into_nintendo_home+48r
					; inject_into_nintendo_home+180r
; Handle dword_103B40
dword_103B40	DCD 0xFFFF8001		; DATA XREF: inject_into_nintendo_home+6Cr
					; inject_into_nintendo_home+1BCr
off_103B44	DCD aLoadPlginfoFai	; DATA XREF: inject_into_nintendo_home+84r
					; "load plginfo failed:%08x\n"
; u8 *off_103B48
off_103B48	DCD aProctid08x08x	; DATA XREF: inject_into_nintendo_home+9Cr
					; "procTid: %08x%08x\n"
; u8 *off_103B4C
off_103B4C	DCD aTidMismatch	; DATA XREF: inject_into_nintendo_home:loc_10399Cr
					; "tid mismatch\n"
dword_103B50	DCD 0x3E9		; DATA XREF: inject_into_nintendo_home+104r
dword_103B54	DCD 0x10A7A9		; DATA XREF: inject_into_nintendo_home+188r
dword_103B58	DCD 0x10A7CB		; DATA XREF: inject_into_nintendo_home+1A4r
dword_103B5C	DCD 0x10A7DD		; DATA XREF: inject_into_nintendo_home+1CCr
off_103B60	DCD aLoadPlgFailed0	; DATA XREF: inject_into_nintendo_home+214r
					; "load plg failed: %08x\n"
; u8 *off_103B64
off_103B64	DCD aAttachProcessF	; DATA XREF: inject_into_nintendo_home+234r
					; "attach process failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


callback_inject_into_nintendo_home	; DATA XREF: install_home_injection_hook+14o
					; ROM:off_103C24o
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R0
		MOV	R4, R1
		BL	inject_into_nintendo_home
		MOV	R0, R5
		MOV	R1, R4
		LDR	R3, =(g_plugin_func_ptrs_+0x390)
		LDMFD	SP!, {R4-R6,LR}
		BX	R3
; End of function callback_inject_into_nintendo_home

; ---------------------------------------------------------------------------
off_103B8C	DCD g_plugin_func_ptrs_+0x390
					; DATA XREF: callback_inject_into_nintendo_home+18r

; =============== S U B	R O U T	I N E =======================================


sub_103B90

arg_0		=  0

		STMFD	SP!, {R4-R8,LR}
		MOV	R4, R2
		MOV	R5, R3
		LDR	R3, [R2]
		LDR	R2, =dword_10AED8
		LDR	R8, [SP,#0x18+arg_0]
		MOV	R7, R0
		STR	R3, [R2,#(dword_10AEF0 - 0x10AED8)]
		LDR	R3, [R4,#4]
		MOV	R6, R1
		STR	R3, [R2,#(dword_10AEF4 - 0x10AED8)]
		LDR	R0, =aRunappletTid00 ; "runApplet tid0: %08x, tid1: %08x\n"
		LDMIA	R4, {R1,R2}
		BL	sendMsg
		STR	R8, [SP,#0x18+arg_0]
		MOV	R0, R7
		MOV	R1, R6
		MOV	R2, R4
		MOV	R3, R5
		LDR	R12, =dword_10AF84
		LDMFD	SP!, {R4-R8,LR}
		BX	R12 ; dword_10AF84
; End of function sub_103B90

; ---------------------------------------------------------------------------
off_103BE8	DCD dword_10AED8	; DATA XREF: sub_103B90+10r
; u8 *off_103BEC
off_103BEC	DCD aRunappletTid00	; DATA XREF: sub_103B90+2Cr
					; "runApplet tid0: %08x, tid1: %08x\n"
off_103BF0	DCD dword_10AF84	; DATA XREF: sub_103B90+4Cr

; =============== S U B	R O U T	I N E =======================================


install_home_injection_hook		; CODE XREF: main+250p
		LDR	R3, =process_manager_patch_addr
		STMFD	SP!, {R4,LR}
		LDR	R4, =(g_plugin_func_ptrs_+0x304)
		LDR	R1, [R3]	; funcaddr
		MOV	R0, R4		; hook
		LDR	R2, =callback_inject_into_nintendo_home	; callback_addr
		BL	rtInitHook
		MOV	R0, R4		; rthook
		LDMFD	SP!, {R4,LR}
		B	rtEnableHook
; End of function install_home_injection_hook

; ---------------------------------------------------------------------------
off_103C1C	DCD process_manager_patch_addr ; DATA XREF: install_home_injection_hookr
; RT_HOOK *off_103C20
off_103C20	DCD g_plugin_func_ptrs_+0x304 ;	DATA XREF: install_home_injection_hook+8r
; uint32_t off_103C24
off_103C24	DCD callback_inject_into_nintendo_home
					; DATA XREF: install_home_injection_hook+14r

; =============== S U B	R O U T	I N E =======================================


find_files_				; CODE XREF: load_ntr_plugins+28p

var_498		= -0x498
handle		= -0x484
entriesRead	= -0x480
var_47C		= -0x47C
var_478		= -0x478
var_474		= -0x474
var_470		= -0x470

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x480
		SUB	SP, SP,	#0xC	; archive
		MOV	R3, #3
		MOV	R7, R0
		MOV	R0, R2		; a1
		MOV	R4, R2
		MOV	R6, R1
		STRB	R3, [SP,#0x4A8+var_47C]
		BL	strlen
		ADD	R5, SP,	#0x4A8+var_470
		STR	R4, [SP,#0x4A8+var_474]
		LDR	R12, =(g_plugin_func_ptrs_+0x3D0)
		ADD	R3, SP,	#0x4A8+var_498
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x4A8+var_478]
		LDMDB	R5, {R0-R2}
		STMIA	R3, {R0-R2}
		ADD	R3, R12, #8
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x4A8+handle ;	out
		BL	FSUSER_OpenDirectory
		SUBS	R1, R0,	#0
		MOVEQ	R4, R1
		MOVEQ	R8, R4
		MOVEQ	R9, R4
		BEQ	loc_103CE0
		LDR	R0, =aFsuser_opendir ; msg
		BL	sendMsg
		MOV	R0, #0
		B	loc_103D1C
; ---------------------------------------------------------------------------

loc_103CB4				; CODE XREF: find_files_+A8j
		ADD	R3, R3,	#2
		CMP	R3, #0x450
		STRB	R2, [R6,R8]
		ADD	R8, R8,	#1
		BEQ	loc_103CD4

loc_103CC8				; CODE XREF: find_files_+E4j
		LDRH	R2, [R5,R3]
		CMP	R2, #0
		BNE	loc_103CB4

loc_103CD4				; CODE XREF: find_files_+9Cj
		STRB	R9, [R6,R8]
		ADD	R4, R4,	#1
		ADD	R8, R8,	#1

loc_103CE0				; CODE XREF: find_files_+78j
		MOV	R3, R5		; buffer
		LDR	R0, [SP,#0x4A8+handle] ; handle
		ADD	R1, SP,	#0x4A8+entriesRead ; entriesRead
		MOV	R2, #1		; entrycount
		STR	R9, [SP,#0x4A8+entriesRead]
		BL	FSDIR_Read	; There	are some problems with this function which is abnormal.
		LDR	R3, [SP,#0x4A8+entriesRead]
		CMP	R3, #0
		ADDNE	R3, R6,	R8
		STRNE	R3, [R7,R4,LSL#2]
		MOVNE	R3, #0
		BNE	loc_103CC8
		LDR	R0, [SP,#0x4A8+handle] ; handle
		BL	FSDIR_Close
		MOV	R0, R4

loc_103D1C				; CODE XREF: find_files_+88j
		ADD	SP, SP,	#0x480
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4-R9,PC}
; End of function find_files_

; ---------------------------------------------------------------------------
off_103D28	DCD g_plugin_func_ptrs_+0x3D0 ;	DATA XREF: find_files_+30r
off_103D2C	DCD hFSUser		; DATA XREF: find_files_+54r
; u8 *off_103D30
off_103D30	DCD aFsuser_opendir	; DATA XREF: find_files_+7Cr
					; "FSUSER_OpenDirectory failed, ret=%08x"

; =============== S U B	R O U T	I N E =======================================


update_plginfo_with_arm11_addresses	; CODE XREF: callback_applet_start+24p
					; load_all_plugins_and_inject_ntr_into_pm+10Cp	...
		LDR	R3, =p_plgloader_info
		MOV	R2, #0
		LDR	R3, [R3]
		STR	R2, [R3]
		LDR	R2, =(g_plugin_func_ptrs_+0x300)
		LDR	R1, [R2]
		LDR	R2, =arm11BinEnd2
		STR	R1, [R2]
		LDR	R2, =dword_10AED8
		LDR	R1, [R2,#(arm11BinStart	- 0x10AED8)]
		LDR	R2, [R2,#(arm11BinSize - 0x10AED8)]
		STR	R1, [R3,#0x104]
		STR	R2, [R3,#0x108]
		BX	LR
; End of function update_plginfo_with_arm11_addresses

; ---------------------------------------------------------------------------
off_103D6C	DCD p_plgloader_info	; DATA XREF: update_plginfo_with_arm11_addressesr
off_103D70	DCD g_plugin_func_ptrs_+0x300
					; DATA XREF: update_plginfo_with_arm11_addresses+10r
off_103D74	DCD arm11BinEnd2	; DATA XREF: update_plginfo_with_arm11_addresses+18r
off_103D78	DCD dword_10AED8	; DATA XREF: update_plginfo_with_arm11_addresses+20r
; ---------------------------------------------------------------------------
		BX	LR

; =============== S U B	R O U T	I N E =======================================


load_ntr_plugins			; CODE XREF: callback_applet_start+2Cp
					; callback_applet_start+48p ...

buff		= -0x11A8
fileName	= -0x10E0
var_1018	= -0x1018

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x1200
		SUB	SP, SP,	#0x14
		MOV	R2, R0
		LDR	R1, =aPluginS	; "/plugin/%s"
		ADD	R0, SP,	#0x1228+buff ; buff
		BL	xsprintf
		MOV	R0, SP
		ADD	R1, SP,	#0x1228+var_1018
		ADD	R2, SP,	#0x1228+buff
		BL	find_files_
		LDR	R6, =arm11BinEnd2
		MOV	R5, #0
		MOV	R7, R0

loc_103DB8				; CODE XREF: load_ntr_plugins+E4j
		CMP	R5, R7
		BEQ	loc_103E68
		LDR	R1, =aSS_0	; fmt
		ADD	R2, SP,	#0x1228+buff
		LDR	R3, [SP,R5,LSL#2]
		ADD	R0, SP,	#0x1228+fileName ; buff
		BL	xsprintf
		ADD	R0, SP,	#0x1228+fileName ; fileName
		BL	rtGetFileSize
		BL	rtAlignToPageSize
		ADD	R1, SP,	#0x1228+fileName
		LDR	R3, [R6]
		MOV	R4, R0
		MOV	R2, R4
		LDR	R0, =aLoadingPluginS ; msg
		BL	sendMsg
		LDR	R0, [R6]
		ADD	R0, R4,	R0	; size
		BL	ntrAllocPluginMemory
		CMP	R0, #0
		LDRNE	R0, =0x10A88B
		BNE	loc_103E2C
		ADD	R0, SP,	#0x1228+fileName ; fileName
		LDR	R1, [R6]	; pBuf
		MOV	R2, R4		; bufSize
		BL	rtLoadFileToBuffer
		CMP	R0, #0
		BNE	loc_103E34
		LDR	R0, =aRtloadfiletobu ; msg

loc_103E2C				; CODE XREF: load_ntr_plugins+8Cj
		BL	sendMsg
		B	loc_103E60
; ---------------------------------------------------------------------------

loc_103E34				; CODE XREF: load_ntr_plugins+A4j
		LDR	R3, =p_plgloader_info
		LDR	R1, [R6]
		LDR	R2, [R3]
		LDR	R3, [R2]
		ADD	R0, R2,	R3,LSL#2
		ADD	R3, R3,	#1
		STR	R4, [R0,#0x84]
		ADD	R4, R4,	R1
		STR	R1, [R0,#4]
		STR	R3, [R2]
		STR	R4, [R6]

loc_103E60				; CODE XREF: load_ntr_plugins+B0j
		ADD	R5, R5,	#1
		B	loc_103DB8
; ---------------------------------------------------------------------------

loc_103E68				; CODE XREF: load_ntr_plugins+3Cj
		MOV	R0, R5
		ADD	SP, SP,	#0x1200
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4-R7,PC}
; End of function load_ntr_plugins

; ---------------------------------------------------------------------------
; char *off_103E78
off_103E78	DCD aPluginS		; DATA XREF: load_ntr_plugins+10r
					; "/plugin/%s"
off_103E7C	DCD arm11BinEnd2	; DATA XREF: load_ntr_plugins+2Cr
; char *off_103E80
off_103E80	DCD aSS_0		; DATA XREF: load_ntr_plugins+40r
					; "%s/%s"
; u8 *off_103E84
off_103E84	DCD aLoadingPluginS	; DATA XREF: load_ntr_plugins+70r
					; "loading plugin: %s, size: %08x, addr: %"...
dword_103E88	DCD 0x10A88B		; DATA XREF: load_ntr_plugins+88r
; u8 *off_103E8C
off_103E8C	DCD aRtloadfiletobu	; DATA XREF: load_ntr_plugins+A8r
					; "rtLoadFileToBuffer failed\n"
off_103E90	DCD p_plgloader_info	; DATA XREF: load_ntr_plugins:loc_103E34r

; =============== S U B	R O U T	I N E =======================================


callback_applet_start			; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+134o
					; ROM:off_1041D4o
		STMFD	SP!, {R4-R6,LR}
		MOV	R4, R0
		SUB	SP, SP,	#0x20
		MOV	R6, R1
		MOV	R5, R2
		LDR	R1, [R4,#4]
		LDR	R2, [R4]
		LDR	R0, =aStartingApplet ; "starting applet: %08x%08x\n"
		BL	sendMsg
		BL	update_plginfo_with_arm11_addresses
		LDR	R0, =0x10A8DD
		BL	load_ntr_plugins
		LDR	R2, [R4,#4]
		LDR	R3, [R4]
		MOV	R0, SP		; buff
		LDR	R1, =a08x08x	; "%08x%08x"
		BL	xsprintf
		MOV	R0, SP
		BL	load_ntr_plugins
		LDR	R3, =p_plgloader_info
		LDR	R2, [R4]
		MOV	R0, R4
		LDR	R3, [R3]
		MOV	R1, R6
		STR	R2, [R3,#0x10C]
		LDR	R2, [R4,#4]
		STR	R2, [R3,#0x110]
		MOV	R2, R5
		LDR	R3, =dword_10B440
		BLX	R3 ; dword_10B440
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R6,PC}
; End of function callback_applet_start

; ---------------------------------------------------------------------------
; u8 *off_103F14
off_103F14	DCD aStartingApplet	; DATA XREF: callback_applet_start+1Cr
					; "starting applet: %08x%08x\n"
dword_103F18	DCD 0x10A8DD		; DATA XREF: callback_applet_start+28r
; char *off_103F1C
off_103F1C	DCD a08x08x		; DATA XREF: callback_applet_start+3Cr
					; "%08x%08x"
off_103F20	DCD p_plgloader_info	; DATA XREF: callback_applet_start+4Cr
off_103F24	DCD dword_10B440	; DATA XREF: callback_applet_start+70r

; =============== S U B	R O U T	I N E =======================================


inject_ntr_into_process_manager		; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+14Cp

process		= -0x244
buf		= -0x240
var_23C		= -0x23C

		LDR	R3, =process_manager_patch_addr
		STMFD	SP!, {R4,LR}
		SUB	SP, SP,	#0x240
		MOV	R1, #0
		MOV	R2, #0x238
		ADD	R0, SP,	#0x248+buf
		LDR	R4, [R3]
		BL	memset
		MOV	R3, #0x3E8
		MOV	R1, #2		; pid 2
		ADD	R0, SP,	#0x248+process ; process
		STR	R3, [SP,#0x248+var_23C]
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		BEQ	loc_103F7C
		LDR	R0, =aOpenprocessF_2 ; "openProcess failed: %08x\n"
		MOV	R2, #0
		BL	sendMsg
		MOV	R3, #0
		STR	R3, [SP,#0x248+process]
		B	loc_103F8C
; ---------------------------------------------------------------------------

loc_103F7C				; CODE XREF: inject_ntr_into_process_manager+38j
		LDR	R0, [SP,#0x248+process]	; handle
		MOV	R1, R4		; addr_jmpcode
		ADD	R2, SP,	#0x248+buf ; buf
		BL	inject_ntr_into_remote_process

loc_103F8C				; CODE XREF: inject_ntr_into_process_manager+50j
		LDR	R0, [SP,#0x248+process]	; handle
		CMP	R0, #0
		BEQ	loc_103F9C
		BL	svcCloseHandle

loc_103F9C				; CODE XREF: inject_ntr_into_process_manager+6Cj
		ADD	SP, SP,	#0x240
		LDMFD	SP!, {R4,PC}
; End of function inject_ntr_into_process_manager

; ---------------------------------------------------------------------------
off_103FA4	DCD process_manager_patch_addr ; DATA XREF: inject_ntr_into_process_managerr
; u8 *off_103FA8
off_103FA8	DCD aOpenprocessF_2	; DATA XREF: inject_ntr_into_process_manager+3Cr
					; "openProcess failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


init_all_plugins_0			; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+118p
		STMFD	SP!, {R4-R6,LR}
		LDR	R3, =arm11BinEnd2
		LDR	R5, =(g_plugin_func_ptrs_+0x300)
		LDR	R3, [R3]
		LDR	R4, [R5]
		RSB	R4, R4,	R3
		BL	ntrGetCurrentProcessHandle
		LDR	R1, [R5]	; addr
		MOV	R2, R4		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R1, R0,	#0
		MOVEQ	R4, R1
		LDREQ	R5, =p_plgloader_info
		BEQ	loc_103FF0
		LDR	R0, =aRwxFailed08x ; msg
		LDMFD	SP!, {R4-R6,LR}
		B	sendMsg
; ---------------------------------------------------------------------------

loc_103FF0				; CODE XREF: init_all_plugins_0+34j
					; init_all_plugins_0+7Cj
		LDR	R3, [R5]
		LDR	R2, [R3]
		CMP	R4, R2
		BCS	locret_10402C
		MOV	R6, R4,LSL#2
		ADD	R3, R3,	R6
		LDR	R0, =aPlg08x	; msg
		LDR	R1, [R3,#4]
		BL	sendMsg
		LDR	R3, [R5]
		ADD	R4, R4,	#1
		ADD	R3, R3,	R6
		LDR	R3, [R3,#4]
		BLX	R3
		B	loc_103FF0
; ---------------------------------------------------------------------------

locret_10402C				; CODE XREF: init_all_plugins_0+50j
		LDMFD	SP!, {R4-R6,PC}
; End of function init_all_plugins_0

; ---------------------------------------------------------------------------
off_104030	DCD arm11BinEnd2	; DATA XREF: init_all_plugins_0+4r
off_104034	DCD g_plugin_func_ptrs_+0x300 ;	DATA XREF: init_all_plugins_0+8r
off_104038	DCD p_plgloader_info	; DATA XREF: init_all_plugins_0+30r
; u8 *off_10403C
off_10403C	DCD aRwxFailed08x	; DATA XREF: init_all_plugins_0+38r
					; "rwx failed: %08x\n"
; u8 *off_104040
off_104040	DCD aPlg08x		; DATA XREF: init_all_plugins_0+5Cr
					; "plg: %08x\n"

; =============== S U B	R O U T	I N E =======================================


load_all_plugins_and_inject_ntr_into_pm	; CODE XREF: threadNtrHomeInjectee+D0p
		STMFD	SP!, {R3-R7,LR}
		LDR	R3, =p_plgloader_info_ver_specific
		LDR	R5, =(g_plugin_func_ptrs_+0x3D0)
		LDR	R4, [R3,#(dword_1085F8 - 0x1085F4)]
		BL	ntrPlgInitSharedFunctions
		MOV	R1, #0
		MOV	R2, #0x18
		MOV	R0, R5
		BL	memset
		MOV	R3, #9
		STR	R3, [R5]
		MOV	R3, #1
		STRB	R3, [R5,#(some_filename_ - 0x10B394)]
		STR	R3, [R5,#(dword_10B39C - 0x10B394)]
		LDR	R3, =0x10A4DD
		MOV	R1, R5		; archive
		STR	R3, [R5,#(dword_10B3A0 - 0x10B394)]
		LDR	R3, =hFSUser
		LDR	R0, [R3]	; handle
		BL	FSUSER_OpenArchive
		SUBS	R1, R0,	#0
		BEQ	loc_1040A8
		LDR	R0, =aFsuser_openarc ; "FSUSER_OpenArchive failed: %08x\n"
		LDMFD	SP!, {R3-R7,LR}
		B	sendMsg
; ---------------------------------------------------------------------------

loc_1040A8				; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+54j
		LDR	R6, =p_plgloader_info
		MOV	R0, #0x114	; size
		LDR	R5, =dword_10AED8
		STR	R4, [R6]
		BL	rtAlignToPageSize
		ADD	R4, R0,	R4
		LDR	R0, =aNtr_bin	; "/ntr.bin"
		BL	rtGetFileSize
		BL	rtAlignToPageSize
		MOV	R1, R0
		STR	R0, [R5,#(arm11BinSize - 0x10AED8)]
		LDR	R0, =aArm11BinSize08 ; "arm11 bin size: %08x\n"
		BL	sendMsg
		LDR	R0, [R5,#(arm11BinSize - 0x10AED8)]
		ADD	R0, R4,	R0	; size
		BL	ntrAllocPluginMemory
		CMP	R0, #0
		BEQ	loc_1040F8
		LDR	R0, =aAllocMemoryFor ; "alloc memory for arm11bin failed\n"
		BL	sendMsg

loc_1040F8				; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+A8j
		LDR	R0, =aNtr_bin	; fileName
		MOV	R1, R4		; pBuf
		LDR	R2, [R5,#0x14]	; arm11	binsize
		BL	rtLoadFileToBuffer
		LDR	R7, =dword_10AED8
		CMP	R0, #0
		BNE	loc_104120
		LDR	R0, =aLoadArm11binFa ; "load arm11bin failed\n"
		LDMFD	SP!, {R3-R7,LR}
		B	sendMsg
; ---------------------------------------------------------------------------

loc_104120				; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+CCj
		LDR	R3, [R7,#(arm11BinSize - 0x10AED8)]
		STR	R4, [R7,#(arm11BinStart	- 0x10AED8)]
		CMP	R3, #0x20
		ADD	R5, R4,	R3
		MOVHI	R3, #1
		STRHI	R3, [R4,#4]
		LDR	R4, =(g_plugin_func_ptrs_+0x300)
		MOV	R1, #0
		MOV	R2, #0x114
		LDR	R0, [R6]
		BL	memset
		STR	R5, [R4]
		BL	update_plginfo_with_arm11_addresses
		LDR	R0, =aHome	; "home"
		BL	load_ntr_plugins
		BL	init_all_plugins_0
		LDR	R3, =arm11BinEnd2
		LDR	R3, [R3]
		STR	R3, [R4]
		BL	update_plginfo_with_arm11_addresses
		LDR	R3, =nintendo_home_applet_start_hook_addr
		LDR	R0, =rthook_applet_start ; hook
		LDR	R2, =callback_applet_start ; callback_addr
		LDR	R1, [R3]	; funcaddr
		BL	rtInitHook
		LDR	R0, =rthook_applet_start ; rthook
		BL	rtEnableHook
		LDMFD	SP!, {R3-R7,LR}
		B	inject_ntr_into_process_manager
; End of function load_all_plugins_and_inject_ntr_into_pm

; ---------------------------------------------------------------------------
off_104194	DCD p_plgloader_info_ver_specific
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+4r
off_104198	DCD g_plugin_func_ptrs_+0x3D0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+8r
dword_10419C	DCD 0x10A4DD		; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+38r
off_1041A0	DCD hFSUser		; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+44r
; u8 *off_1041A4
off_1041A4	DCD aFsuser_openarc	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+58r
					; "FSUSER_OpenArchive failed: %08x\n"
off_1041A8	DCD p_plgloader_info	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm:loc_1040A8r
off_1041AC	DCD dword_10AED8	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+6Cr
					; load_all_plugins_and_inject_ntr_into_pm+C4r
; uint8_t *fileName
fileName	DCD aNtr_bin		; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+7Cr
					; load_all_plugins_and_inject_ntr_into_pm:loc_1040F8r
					; "/ntr.bin"
; u8 *off_1041B4
off_1041B4	DCD aArm11BinSize08	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+90r
					; "arm11 bin size: %08x\n"
; u8 *off_1041B8
off_1041B8	DCD aAllocMemoryFor	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+ACr
					; "alloc memory for arm11bin failed\n"
; u8 *off_1041BC
off_1041BC	DCD aLoadArm11binFa	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+D0r
					; "load arm11bin failed\n"
off_1041C0	DCD g_plugin_func_ptrs_+0x300
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+F4r
off_1041C4	DCD aHome		; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+110r
					; "home"
off_1041C8	DCD arm11BinEnd2	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+11Cr
off_1041CC	DCD nintendo_home_applet_start_hook_addr
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+12Cr
; RT_HOOK *off_1041D0
off_1041D0	DCD rthook_applet_start	; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+130r
					; load_all_plugins_and_inject_ntr_into_pm+140r
; uint32_t off_1041D4
off_1041D4	DCD callback_applet_start
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+134r

; =============== S U B	R O U T	I N E =======================================


init_all_plugins			; CODE XREF: main+278p
		STMFD	SP!, {R3-R7,LR}
		BL	ntrPlgInitSharedFunctions
		LDR	R3, =p_plgloader_info_ver_specific
		LDR	R4, =p_plgloader_info
		MOV	R5, #0
		LDR	R3, [R3,#(dword_1085F8 - 0x1085F4)]
		MOV	R7, R4
		STR	R3, [R4]

loc_1041F8				; CODE XREF: init_all_plugins+58j
		LDR	R3, [R4]
		LDR	R2, [R3]
		CMP	R5, R2
		BCS	locret_104234
		MOV	R6, R5,LSL#2
		ADD	R3, R3,	R6
		LDR	R0, =aPlg08x	; msg
		LDR	R1, [R3,#4]
		BL	sendMsg
		LDR	R3, [R7]
		ADD	R5, R5,	#1
		ADD	R3, R3,	R6
		LDR	R3, [R3,#4]
		BLX	R3
		B	loc_1041F8
; ---------------------------------------------------------------------------

locret_104234				; CODE XREF: init_all_plugins+2Cj
		LDMFD	SP!, {R3-R7,PC}
; End of function init_all_plugins

; ---------------------------------------------------------------------------
off_104238	DCD p_plgloader_info_ver_specific ; DATA XREF: init_all_plugins+8r
off_10423C	DCD p_plgloader_info	; DATA XREF: init_all_plugins+Cr
; u8 *off_104240
off_104240	DCD aPlg08x		; DATA XREF: init_all_plugins+38r
					; "plg: %08x\n"
; ---------------------------------------------------------------------------
		BX	LR

; =============== S U B	R O U T	I N E =======================================


; uint32_t __stdcall ntrGetCurrentProcessId()
ntrGetCurrentProcessId			; CODE XREF: main+1A4p
					; ntrSetupNetworkDebugServer+110p
		STMFD	SP!, {R4,LR}
		LDR	R4, =cur_pid
		LDR	R1, =0xFFFF8001	; handle
		MOV	R0, R4		; out
		BL	svcGetProcessId
		LDR	R0, [R4]
		LDMFD	SP!, {R4,PC}
; End of function ntrGetCurrentProcessId

; ---------------------------------------------------------------------------
; u32 *out
out		DCD cur_pid		; DATA XREF: ntrGetCurrentProcessId+4r
; Handle handle
handle		DCD 0xFFFF8001		; DATA XREF: ntrGetCurrentProcessId+8r

; =============== S U B	R O U T	I N E =======================================


; Handle ntrGetCurrentProcessHandle(void)
ntrGetCurrentProcessHandle		; CODE XREF: sub_101EA4+18p
					; handle_writemem_packet+24p ...

process		= -0x14

		STMFD	SP!, {R0-R2,R4,R5,LR}
		MOV	R3, #0
		LDR	R5, =cur_pid
		STR	R3, [SP,#0x18+process]
		LDR	R4, [R5,#(hProcess_0 - 0x10B480)]
		CMP	R4, R3
		BNE	loc_1042BC
		LDR	R1, =0xFFFF8001	; handle
		MOV	R0, R5		; out
		BL	svcGetProcessId
		LDR	R1, [R5]	; processId
		ADD	R0, SP,	#0x18+process ;	process
		BL	svcOpenProcess
		SUBS	R1, R0,	#0	; errno
		LDREQ	R4, [SP,#0x18+process]
		STREQ	R4, [R5,#(hProcess_0 - 0x10B480)]
		BEQ	loc_1042BC
		LDR	R0, =aOpenprocessFailedRet08x ;	fmt
		MOV	R2, R4		; v2
		BL	showDbg

loc_1042BC				; CODE XREF: ntrGetCurrentProcessHandle+18j
					; ntrGetCurrentProcessHandle+40j
		MOV	R0, R4
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrGetCurrentProcessHandle

; ---------------------------------------------------------------------------
; u32 *off_1042C8
off_1042C8	DCD cur_pid		; DATA XREF: ntrGetCurrentProcessHandle+8r
; Handle dword_1042CC
dword_1042CC	DCD 0xFFFF8001		; DATA XREF: ntrGetCurrentProcessHandle+1Cr
; u8 *off_1042D0
off_1042D0	DCD aOpenprocessFailedRet08x ; DATA XREF: ntrGetCurrentProcessHandle+44r
					; "openProcess failed, ret: %08x"
; ---------------------------------------------------------------------------
		B	arm11kCmdGetCurrentKProcess

; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall controlRemoteMemory(void *addr, size_t size)
controlRemoteMemory			; CODE XREF: inject_ntr_into_remote_process+58p
					; inject_into_nintendo_home+17Cp

v1		= -0x24
var_20		= -0x20

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x14	; operation
		ADD	R5, SP,	#0x30+var_20
		MOV	R6, #0
		MOV	R4, R1
		MOV	R8, R2
		STR	R6, [R5,#-4]!
		BL	arm11kCmdGetKernelObject
		MOV	R9, R0
		BL	arm11kCmdGetCurrentKProcess
		MOV	R7, R0
		MOV	R0, R9
		BL	arm11kCmdSetCurrentKProcess
		LDR	R2, =0x203
		MOV	R3, #3
		MOV	R0, R5		; outaddr
		STMEA	SP, {R2,R3}
		MOV	R1, R4		; addr0
		MOV	R2, R4		; addr1
		MOV	R3, R8		; size
		BL	svcControlMemory
		MOV	R5, R0
		MOV	R0, R7
		BL	arm11kCmdSetCurrentKProcess
		CMP	R5, R6
		LDRNE	R0, =aSvc_controlmem ; "svc_controlMemory failed: %08x"
		MOVNE	R1, R5
		MOVNE	R2, R6
		BNE	loc_104360
		LDR	R1, [SP,#0x30+v1] ; errno
		CMP	R1, R4
		BEQ	loc_104364
		LDR	R0, =aOutaddr08xAddr ; fmt
		MOV	R2, R4		; v2

loc_104360				; CODE XREF: controlRemoteMemory+70j
		BL	showDbg

loc_104364				; CODE XREF: controlRemoteMemory+7Cj
		MOV	R0, R5
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4-R9,PC}
; End of function controlRemoteMemory

; ---------------------------------------------------------------------------
dword_104370	DCD 0x203		; DATA XREF: controlRemoteMemory+34r
off_104374	DCD aSvc_controlmem	; DATA XREF: controlRemoteMemory+64r
					; "svc_controlMemory failed: %08x"
; u8 *off_104378
off_104378	DCD aOutaddr08xAddr	; DATA XREF: controlRemoteMemory+80r
					; "outAddr: %08x, addr: %08x"

; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall ntrProtectRemoteMemory(Handle hProcess, void *addr, uint32_t size)
ntrProtectRemoteMemory			; CODE XREF: handle_memlayout_packet+5Cp
					; inject_ntr_into_remote_process+7Cp ...

var_4		= -4

		STMFD	SP!, {R0-R2,LR}	; Type
		MOV	R3, R2		; Size
		MOV	R12, #7		; permissions
		MOV	R2, #6		; type
		STMEA	SP, {R2,R12}
		MOV	R2, R1		; Addr1
		BL	svcControlProcessMemory
		ADD	SP, SP,	#0xC
		LDR	PC, [SP+4+var_4],#4
; End of function ntrProtectRemoteMemory


; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall ntrProtectMemory(void *addr, uint32_t size)
ntrProtectMemory			; CODE XREF: prepare_config_mem+1Cp
					; handle_reload_packet+130p ...
		STMFD	SP!, {R3-R5,LR}
		MOV	R4, R1
		MOV	R5, R0
		BL	ntrGetCurrentProcessHandle
		MOV	R1, R5		; addr
		MOV	R2, R4		; size
		LDMFD	SP!, {R3-R5,LR}
		B	ntrProtectRemoteMemory
; End of function ntrProtectMemory


; =============== S U B	R O U T	I N E =======================================


; Result __fastcall inter_process_dma_copy(Handle hDst,	void *dst_addr,	Handle hSrc, const void	*src_addr, u32 size)
inter_process_dma_copy			; CODE XREF: get_nintendo_home_version_info+3Cp
					; handle_writemem_packet+118p ...

src		= -0x88
hdma		= -0x78
state		= -0x74
var_70		= -0x70
size		=  0

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x68
		ADD	R9, SP,	#0x88+var_70
		LDR	R5, [SP,#0x88+size]
		MOV	R10, R3
		MOV	R8, R2
		MOV	R7, R0
		MOV	R2, #0x50
		MOV	R6, R1
		MOV	R0, R9
		MOV	R1, #0
		BL	memset
		MOV	R3, #0
		MOV	R0, R8		; process
		MOV	R1, R10		; addr
		MOV	R2, R5		; size
		STR	R3, [SP,#0x88+hdma]
		BL	svcFlushProcessDataCache
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10A9AB
		BNE	loc_104430
		MOV	R0, R7		; process
		MOV	R1, R6		; addr
		MOV	R2, R5		; size
		BL	svcFlushProcessDataCache
		SUBS	R4, R0,	#0
		BEQ	loc_10443C
		LDR	R0, =aSvc_flushproce ; "svc_flushProcessDataCache(hDst) failed."...

loc_104430				; CODE XREF: inter_process_dma_copy+50j
		BL	sendMsg
		MOV	R0, R4
		B	loc_1044FC
; ---------------------------------------------------------------------------

loc_10443C				; CODE XREF: inter_process_dma_copy+68j
		STR	R10, [SP,#0x88+src] ; src
		STMFA	SP, {R5,R9}
		ADD	R0, SP,	#0x88+hdma ; hdma
		MOV	R1, R7		; hdstProcess
		MOV	R2, R6		; dst
		MOV	R3, R8		; hsrcProcess
		BL	svcStartInterProcessDma
		CMP	R0, #0
		BNE	loc_1044FC
		LDR	R4, =0x2710
		LDR	R8, =0xFFF04504
		LDR	R9, =0xFFF54204

loc_10446C				; CODE XREF: inter_process_dma_copy+108j
		MOV	R3, #0
		ADD	R0, SP,	#0x88+state ; state
		LDR	R1, [SP,#0x88+hdma] ; dma
		STR	R3, [SP,#0x88+state]
		BL	svcGetDmaState
		LDR	R3, [SP,#0x88+state]
		UXTB	R2, R3
		CMP	R2, #4
		BNE	loc_1044B8
		CMP	R3, R9
		CMPNE	R3, R8
		LDR	R1, =0xFFF04204
		MOVEQ	R2, #1
		MOVNE	R2, #0
		CMP	R3, R1
		MOVNE	R3, R2
		ORREQ	R3, R2,	#1
		CMP	R3, #0
		BNE	loc_1044E4

loc_1044B8				; CODE XREF: inter_process_dma_copy+CCj
		LDR	R0, =0xF4240	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		SUBS	R4, R4,	#1
		BNE	loc_10446C
		LDR	R0, =aReadremotememo ; fmt
		LDR	R1, [SP,#0x88+state] ; errno
		MOV	R2, R4		; v2
		BL	showDbg
		MOV	R0, #1
		B	loc_1044FC
; ---------------------------------------------------------------------------

loc_1044E4				; CODE XREF: inter_process_dma_copy+F4j
		LDR	R0, [SP,#0x88+hdma] ; handle
		BL	svcCloseHandle
		MOV	R0, R7		; process
		MOV	R1, R6		; addr
		MOV	R2, R5		; size
		BL	svcInvalidateProcessDataCache

loc_1044FC				; CODE XREF: inter_process_dma_copy+78j
					; inter_process_dma_copy+9Cj ...
		ADD	SP, SP,	#0x68
		LDMFD	SP!, {R4-R10,PC}
; End of function inter_process_dma_copy

; ---------------------------------------------------------------------------
dword_104504	DCD 0x10A9AB		; DATA XREF: inter_process_dma_copy+4Cr
; u8 *off_104508
off_104508	DCD aSvc_flushproce	; DATA XREF: inter_process_dma_copy+6Cr
					; "svc_flushProcessDataCache(hDst) failed."...
dword_10450C	DCD 0x2710		; DATA XREF: inter_process_dma_copy+A0r
dword_104510	DCD 0xFFF04504		; DATA XREF: inter_process_dma_copy+A4r
dword_104514	DCD 0xFFF54204		; DATA XREF: inter_process_dma_copy+A8r
dword_104518	DCD 0xFFF04204		; DATA XREF: inter_process_dma_copy+D8r
; s64 dword_10451C
dword_10451C	DCD 0xF4240		; DATA XREF: inter_process_dma_copy:loc_1044B8r
; u8 *off_104520
off_104520	DCD aReadremotememo	; DATA XREF: inter_process_dma_copy+10Cr
					; "readRemoteMemory time out %08x"

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall sub_104524(Handle handle, u32 *a2)
sub_104524				; CODE XREF: inject_into_nintendo_home+94p

dst		= -0x108
var_AC		= -0xAC
var_A8		= -0xA8

		STMFD	SP!, {R4,LR}
		SUB	SP, SP,	#0x200
		MOV	R4, R1
		BL	arm11kCmdGetKernelObject
		MOV	R2, #0x100	; count
		MOV	R1, R0		; src
		MOV	R0, SP		; dst
		BL	arm11kCmdMemcpy
		LDR	R3, =offs_KCodeSet
		ADD	R0, SP,	#0x208+dst ; dst
		MOV	R2, #0x100	; count
		LDR	R3, [R3]
		LDR	R1, [SP,R3]	; src
		BL	arm11kCmdMemcpy
		LDR	R3, [SP,#0x208+var_AC]
		STR	R3, [R4]
		LDR	R3, [SP,#0x208+var_A8]
		STR	R3, [R4,#4]
		ADD	SP, SP,	#0x200
		LDMFD	SP!, {R4,PC}
; End of function sub_104524

; ---------------------------------------------------------------------------
off_104574	DCD offs_KCodeSet	; DATA XREF: sub_104524+20r

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall get_process_name(u32 processId, int	a2, int	a3, int	a4)
get_process_name			; CODE XREF: handle_listprocess_packet+44p
					; ntrProcessManager+128p

process		= -0x224
dst		= -0x220
var_120		= -0x120
var_D0		= -0xD0
var_C6		= -0xC6
var_C4		= -0xC4
var_C0		= -0xC0

		STMFD	SP!, {R4-R9,LR}
		MOV	R12, R0
		SUB	SP, SP,	#0x20C
		MOV	R9, R1
		ADD	R0, SP,	#0x228+process ; process
		MOV	R1, R12		; processId
		MOV	R6, R2
		MOV	R8, R3
		BL	svcOpenProcess
		SUBS	R4, R0,	#0
		BEQ	loc_1045B8
		LDR	R0, =aOpenprocessF_2 ; "openProcess failed: %08x\n"
		MOV	R1, R4
		MOV	R2, #0
		BL	sendMsg
		B	loc_104614
; ---------------------------------------------------------------------------

loc_1045B8				; CODE XREF: get_process_name+28j
		LDR	R0, [SP,#0x228+process]	; handle
		BL	arm11kCmdGetKernelObject
		ADD	R7, SP,	#0x228+dst
		MOV	R2, #0x100	; count
		MOV	R5, R0
		MOV	R1, R5		; src
		MOV	R0, R7		; dst
		BL	arm11kCmdMemcpy
		LDR	R3, =offs_KCodeSet
		ADD	R0, SP,	#0x228+var_120 ; dst
		MOV	R2, #0x100	; count
		LDR	R3, [R3]
		LDR	R1, [R7,R3]	; src
		BL	arm11kCmdMemcpy
		LDR	R3, [SP,#0x228+var_C4]
		MOV	R0, R9
		STR	R3, [R6]
		LDR	R3, [SP,#0x228+var_C0]
		ADD	R1, SP,	#0x228+var_D0
		STR	R3, [R6,#4]
		STRB	R4, [SP,#0x228+var_C6]
		BL	strncpy
		STR	R5, [R8]

loc_104614				; CODE XREF: get_process_name+3Cj
		LDR	R0, [SP,#0x228+process]	; handle
		CMP	R0, #0
		BEQ	loc_104624
		BL	svcCloseHandle

loc_104624				; CODE XREF: get_process_name+A4j
		MOV	R0, R4
		ADD	SP, SP,	#0x20C
		LDMFD	SP!, {R4-R9,PC}
; End of function get_process_name

; ---------------------------------------------------------------------------
; u8 *off_104630
off_104630	DCD aOpenprocessF_2	; DATA XREF: get_process_name+2Cr
					; "openProcess failed: %08x\n"
off_104634	DCD offs_KCodeSet	; DATA XREF: get_process_name+60r

; =============== S U B	R O U T	I N E =======================================


; void __cdecl dumpProcessToFile(u32 processId,	char *filename)
dumpProcessToFile			; CODE XREF: main+C4p main+D0p ...

size		= -0x1078
var_1068	= -0x1068
openflags	= -0x105C
attributes	= -0x1058
hProcess	= -0x1050
out		= -0x104C
var_1044	= -0x1044
var_1040	= -0x1040
var_103C	= -0x103C
buff		= -0x1038
var_1018	= -0x1018

		STMFD	SP!, {R4-R8,LR}
		SUB	SP, SP,	#0x1040
		SUB	SP, SP,	#0x20	; archive
		MOV	R3, #3
		MOV	R6, R0
		MOV	R0, R1		; a1
		MOV	R4, R1
		STRB	R3, [SP,#0x1078+var_1044]
		BL	strlen
		ADD	R2, SP,	#0x1078+var_1044
		STR	R4, [SP,#0x1078+var_103C]
		ADD	R3, SP,	#0x1078+var_1068
		LDR	R12, =cfw_02
		MOV	R5, #0
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x1078+var_1040]
		LDMIA	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x1078+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R5, [SP,#0x1078+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x1078+out ; out
		BL	FSUSER_OpenFileDirectly
		SUBS	R4, R0,	#0
		LDRNE	R0, =aOpenfileFailed ; "openFile failed: %08x"
		MOVNE	R1, R4
		MOVNE	R2, R5
		BNE	loc_10473C
		MOV	R1, R6		; processId
		ADD	R0, SP,	#0x1078+hProcess ; process
		BL	svcOpenProcess
		SUBS	R1, R0,	#0
		MOVNE	R2, R4
		LDRNE	R0, =aOpenprocessF_0 ; "openProcess failed: %08x"
		BNE	loc_10473C
		ADD	R3, SP,	#0x1078+var_1018
		MOV	R4, #0x100000
		ADD	R5, SP,	#0x1078+buff
		SUB	R7, R3,	#0x30

loc_1046EC				; CODE XREF: dumpProcessToFile+174j
		LDR	R1, =(aOutaddr08xAddr+0xF) ; fmt
		MOV	R2, R4
		MOV	R0, R5		; buff
		BL	xsprintf
		MOV	R0, R5
		BL	sub_107200
		MOV	R1, #0
		LDR	R2, =0x1020
		MOV	R0, R5
		BL	memset
		LDR	R0, [SP,#0x1078+hProcess] ; hKProcess
		MOV	R1, R4		; addr
		MOV	R2, #0x1000	; size
		BL	ntrProtectRemoteMemory
		SUB	R6, R4,	#0x100000
		SUBS	R8, R0,	#0
		BEQ	loc_104754
		LDR	R0, =aDumpFinishedAt ; fmt
		MOV	R1, R4		; errno
		MOV	R2, #0		; v2

loc_10473C				; CODE XREF: dumpProcessToFile+84j
					; dumpProcessToFile+A0j
		BL	showDbg
		LDR	R0, [SP,#0x1078+hProcess] ; handle
		CMP	R0, #0
		BEQ	loc_1047B0
		BL	svcCloseHandle
		B	loc_1047B0
; ---------------------------------------------------------------------------

loc_104754				; CODE XREF: dumpProcessToFile+F4j
		MOV	R3, #0x1000
		STR	R3, [SP,#0x1078+size] ;	size
		MOV	R1, R5		; dst_addr
		LDR	R0, =0xFFFF8001	; hDst
		LDR	R2, [SP,#0x1078+hProcess] ; hSrc
		MOV	R3, R4		; src_addr
		BL	inter_process_dma_copy
		SUBS	R1, R0,	#0	; errno
		BEQ	loc_104784
		LDR	R0, =aReadremoteme_0 ; fmt
		MOV	R2, R8		; v2
		BL	showDbg

loc_104784				; CODE XREF: dumpProcessToFile+13Cj
		MOV	R2, #0x1000
		MOV	R3, #0
		STR	R5, [SP,#0x1078+size] ;	size
		STMFA	SP, {R2,R3}
		LDR	R0, [SP,#0x1078+out] ; handle
		MOV	R1, R7		; bytesWritten
		MOV	R2, R6		; offset
		MOV	R3, #0		; buffer
		BL	FSFILE_Write
		ADD	R4, R4,	#0x1000
		B	loc_1046EC
; ---------------------------------------------------------------------------

loc_1047B0				; CODE XREF: dumpProcessToFile+110j
					; dumpProcessToFile+118j
		LDR	R0, [SP,#0x1078+out] ; handle
		CMP	R0, #0
		BEQ	loc_1047C0
		BL	svcCloseHandle

loc_1047C0				; CODE XREF: dumpProcessToFile+180j
		ADD	SP, SP,	#0x1040
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R8,PC}
; End of function dumpProcessToFile

; ---------------------------------------------------------------------------
off_1047CC	DCD cfw_02		; DATA XREF: dumpProcessToFile+30r
off_1047D0	DCD hFSUser		; DATA XREF: dumpProcessToFile+60r
off_1047D4	DCD aOpenfileFailed	; DATA XREF: dumpProcessToFile+78r
					; "openFile failed: %08x"
off_1047D8	DCD aOpenprocessF_0	; DATA XREF: dumpProcessToFile+9Cr
					; "openProcess failed: %08x"
; char *off_1047DC
off_1047DC	DCD aOutaddr08xAddr+0xF	; DATA XREF: dumpProcessToFile:loc_1046ECr
dword_1047E0	DCD 0x1020		; DATA XREF: dumpProcessToFile+D0r
; u8 *off_1047E4
off_1047E4	DCD aDumpFinishedAt	; DATA XREF: dumpProcessToFile+F8r
					; "dump finished at addr: %08x"
; Handle dword_1047E8
dword_1047E8	DCD 0xFFFF8001		; DATA XREF: dumpProcessToFile+128r
; u8 *off_1047EC
off_1047EC	DCD aReadremoteme_0	; DATA XREF: dumpProcessToFile+140r
					; "readRemoteMemory failed: %08x"

; =============== S U B	R O U T	I N E =======================================


sub_1047F0

g		= -0x1078
b		= -0x1074
var_1070	= -0x1070
var_1068	= -0x1068
openflags	= -0x105C
attributes	= -0x1058
handle_out	= -0x1050
out		= -0x104C
var_1044	= -0x1044
var_1040	= -0x1040
var_103C	= -0x103C
buff		= -0x1038
var_1018	= -0x1018

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x1040
		SUB	SP, SP,	#0x24	; archive
		MOV	R4, #0
		MOV	R3, #3
		MOV	R6, R0
		MOV	R0, R1
		MOV	R5, R1
		STRB	R3, [SP,#0x1078+var_1044]
		STR	R4, [SP,#0x1078+handle_out]
		STR	R4, [SP,#0x1078+out]
		BL	strlen
		ADD	R2, SP,	#0x1078+var_1044
		STR	R5, [SP,#0x1078+var_103C]
		ADD	R3, SP,	#0x1078+var_1068
		LDR	R12, =cfw_02
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x1078+var_1040]
		LDMIA	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x1078+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R4, [SP,#0x1078+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x1078+out ; out
		BL	FSUSER_OpenFileDirectly
		SUBS	R5, R0,	#0
		LDRNE	R0, =aOpenfileFailed ; "openFile failed: %08x"
		MOVNE	R1, R5
		MOVNE	R2, R4
		BNE	loc_104928
		LDR	R0, =aHfile08x	; fmt
		LDR	R1, [SP,#0x1078+out] ; errno
		MOV	R2, R5		; v2
		BL	showDbg
		ADD	R0, SP,	#0x1078+handle_out ; handle_out
		MOV	R1, R6		; pid
		BL	svcDebugActiveProcess
		SUBS	R4, R0,	#0
		LDRNE	R0, =0x10AA7B
		MOVNE	R1, R4
		MOVNE	R2, R5
		BNE	loc_104928
		LDR	R0, =aHdebug08x	; fmt
		LDR	R1, [SP,#0x1078+handle_out] ; errno
		MOV	R2, R4		; v2
		BL	showDbg
		ADD	R3, SP,	#0x1078+var_1018
		ADD	R5, SP,	#0x1078+buff
		SUB	R7, R3,	#0x30

loc_1048CC				; CODE XREF: sub_1047F0+178j
		ADD	R6, R4,	#0x100000
		MOV	R0, R5		; buff
		LDR	R1, =(aOutaddr08xAddr+0xF) ; fmt
		MOV	R2, R6
		BL	xsprintf
		MOV	R1, #0xA	; x
		MOV	R3, #0
		MOV	R2, R1		; y
		STR	R3, [SP,#0x1078+g] ; g
		STR	R3, [SP,#0x1078+b] ; b
		MOV	R0, R5		; s
		MOV	R3, #0xFF	; r
		BL	ntr2dPrint
		BL	update_screen
		MOV	R2, R6		; addr
		MOV	R0, R5		; buffer
		LDR	R1, [SP,#0x1078+handle_out] ; debug
		MOV	R3, #0x1000	; size
		BL	svcReadProcessMemory
		SUBS	R2, R0,	#0	; v2
		BEQ	loc_104940
		LDR	R0, =aReadmemoryAddr ; "readmemory addr = %08x, ret = %08x"
		MOV	R1, R6		; errno

loc_104928				; CODE XREF: sub_1047F0+8Cj
					; sub_1047F0+BCj
		BL	showDbg
		LDR	R0, [SP,#0x1078+handle_out] ; handle
		CMP	R0, #0
		BEQ	loc_10496C
		BL	svcCloseHandle
		B	loc_10496C
; ---------------------------------------------------------------------------

loc_104940				; CODE XREF: sub_1047F0+12Cj
		MOV	R3, #0x1000
		STR	R3, [SP,#0x1078+b] ; flushFlags
		STR	R2, [SP,#0x1078+var_1070]
		STR	R5, [SP,#0x1078+g] ; size
		MOV	R2, R4		; offset
		LDR	R0, [SP,#0x1078+out] ; handle
		MOV	R1, R7		; bytesWritten
		MOV	R3, #0		; data
		BL	FSFILE_Write
		ADD	R4, R4,	#0x1000
		B	loc_1048CC
; ---------------------------------------------------------------------------

loc_10496C				; CODE XREF: sub_1047F0+144j
					; sub_1047F0+14Cj
		LDR	R0, [SP,#0x1078+out] ; handle
		CMP	R0, #0
		BEQ	loc_10497C
		BL	svcCloseHandle

loc_10497C				; CODE XREF: sub_1047F0+184j
		ADD	SP, SP,	#0x1040
		ADD	SP, SP,	#0x24
		LDMFD	SP!, {R4-R7,PC}
; End of function sub_1047F0

; ---------------------------------------------------------------------------
off_104988	DCD cfw_02		; DATA XREF: sub_1047F0+3Cr
off_10498C	DCD hFSUser		; DATA XREF: sub_1047F0+68r
off_104990	DCD aOpenfileFailed	; DATA XREF: sub_1047F0+80r
					; "openFile failed: %08x"
; u8 *off_104994
off_104994	DCD aHfile08x		; DATA XREF: sub_1047F0+90r
					; "hfile: %08x"
dword_104998	DCD 0x10AA7B		; DATA XREF: sub_1047F0+B0r
; u8 *off_10499C
off_10499C	DCD aHdebug08x		; DATA XREF: sub_1047F0+C0r
					; "hdebug: %08x"
; char *off_1049A0
off_1049A0	DCD aOutaddr08xAddr+0xF	; DATA XREF: sub_1047F0+E4r
; u8 *off_1049A4
off_1049A4	DCD aReadmemoryAddr	; DATA XREF: sub_1047F0+130r
					; "readmemory addr = %08x, ret = %08x"

; =============== S U B	R O U T	I N E =======================================


; s32 __stdcall	dumpMemoryToFile(u32 va_dumpaddr, u32 size, char *filename)
dumpMemoryToFile			; CODE XREF: main+F8p

size		= -0x1128
var_1118	= -0x1118
openflags	= -0x110C
attributes	= -0x1108
out		= -0x1100
bytesWritten	= -0x10FC
anonymous_0	= -0x10F4
buff		= -0x10E8
var_1020	= -0x1020

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x1100	; flushFlags
		SUB	SP, SP,	#8	; archive
		ADD	R4, SP,	#0x1128+var_1020
		MOV	R8, R2
		MOV	R5, #0
		MOV	R7, R0
		LDR	R0, =aDumpcode	; msg
		MOV	R6, R1
		STR	R5, [R4,#-0xE0]
		STR	R5, [R4,#-0xDC]
		BL	showMsg
		MOV	R3, #3
		MOV	R0, R8		; a1
		STRB	R3, [R4,#-0xD4]
		BL	strlen
		STR	R8, [R4,#-0xCC]
		ADD	R0, R0,	#1
		STR	R0, [R4,#-0xD0]
		LDR	R0, =aTestpath	; "testpath"
		BL	showMsg
		SUB	R2, R4,	#0xD4
		ADD	R3, SP,	#0x1128+var_1118
		LDMIA	R2, {R0-R2}
		LDR	R12, =cfw_02
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x1128+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R5, [SP,#0x1128+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x1128+out ; out
		BL	FSUSER_OpenFileDirectly
		LDR	R0, =aOpenfile	; msg
		BL	showMsg
		LDR	R3, [R4,#-0xE0]
		CMP	R3, R5
		ADDNE	R8, SP,	#0x1128+buff
		LDRNE	R9, =0xF423F
		BNE	loc_104A9C
		LDR	R0, =aOpenFileFailed ; "open file failed"
		BL	showMsg
		B	loc_104AE0
; ---------------------------------------------------------------------------

loc_104A64				; CODE XREF: dumpMemoryToFile+128j
		MOV	R0, R4		; dst
		MOV	R1, R10		; src
		MOV	R2, #0x1000	; count
		BL	arm11kCmdMemcpy
		MOV	R2, #0x1000
		MOV	R3, #0
		STR	R4, [SP,#0x1128+size] ;	size
		STMFA	SP, {R2,R3}
		ADD	R1, SP,	#0x1128+bytesWritten ; bytesWritten
		MOV	R2, R5		; offset
		LDR	R0, [R4,#-0xE0]	; handle
		MOV	R3, #0		; buffer
		BL	FSFILE_Write
		ADD	R5, R5,	#0x1000

loc_104A9C				; CODE XREF: dumpMemoryToFile+ACj
		CMP	R5, R6
		BCS	loc_104AE0
		ADD	R10, R5, R7
		MOV	R0, R8		; buff
		LDR	R1, =(aOutaddr08xAddr+0xF) ; fmt
		MOV	R2, R10
		BL	xsprintf
		MOV	R0, R8
		BL	sub_107200
		MOV	R3, #0

loc_104AC4				; CODE XREF: dumpMemoryToFile+134j
		STR	R3, [R4,#-0xD8]
		LDR	R3, [R4,#-0xD8]
		CMP	R3, R9
		BHI	loc_104A64
		LDR	R3, [R4,#-0xD8]
		ADD	R3, R3,	#1
		B	loc_104AC4
; ---------------------------------------------------------------------------

loc_104AE0				; CODE XREF: dumpMemoryToFile+B8j
					; dumpMemoryToFile+F8j
		ADD	SP, SP,	#0x1100
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4-R10,PC}
; End of function dumpMemoryToFile

; ---------------------------------------------------------------------------
; u8 *off_104AEC
off_104AEC	DCD aDumpcode		; DATA XREF: dumpMemoryToFile+1Cr
					; "dumpcode"
; u8 *off_104AF0
off_104AF0	DCD aTestpath		; DATA XREF: dumpMemoryToFile+4Cr
					; "testpath"
off_104AF4	DCD cfw_02		; DATA XREF: dumpMemoryToFile+60r
off_104AF8	DCD hFSUser		; DATA XREF: dumpMemoryToFile+80r
; u8 *off_104AFC
off_104AFC	DCD aOpenfile		; DATA XREF: dumpMemoryToFile+94r
					; "openfile"
dword_104B00	DCD 0xF423F		; DATA XREF: dumpMemoryToFile+A8r
; u8 *off_104B04
off_104B04	DCD aOpenFileFailed	; DATA XREF: dumpMemoryToFile+B0r
					; "open file failed"
; char *off_104B08
off_104B08	DCD aOutaddr08xAddr+0xF	; DATA XREF: dumpMemoryToFile+104r

; =============== S U B	R O U T	I N E =======================================


inject_code				; CODE XREF: patch_sm+24p

size		= -0x28
hProcess	= -0x1C
var_18		= -0x18

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x14
		MOV	R12, R0
		ADD	R0, SP,	#0x28+var_18
		MOV	R7, R3
		MOV	R3, #0
		MOV	R5, R1
		STR	R3, [R0,#-4]!
		MOV	R1, R12		; processId
		MOV	R6, R2
		BL	svcOpenProcess
		CMP	R0, #0
		BNE	loc_104B88
		LDR	R0, [SP,#0x28+hProcess]	; hProcess
		MOV	R1, R5		; addr
		MOV	R2, R6		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R4, R0,	#0
		BNE	loc_104B74
		STR	R6, [SP,#0x28+size] ; size
		LDR	R0, [SP,#0x28+hProcess]	; hDst
		MOV	R1, R5		; dst_addr
		LDR	R2, =0xFFFF8001	; hSrc
		MOV	R3, R7		; src_addr
		BL	inter_process_dma_copy
		MOV	R4, R0

loc_104B74				; CODE XREF: inject_code+48j
		LDR	R0, [SP,#0x28+hProcess]	; handle
		CMP	R0, #0
		BEQ	loc_104B84
		BL	svcCloseHandle

loc_104B84				; CODE XREF: inject_code+70j
		MOV	R0, R4

loc_104B88				; CODE XREF: inject_code+30j
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4-R7,PC}
; End of function inject_code

; ---------------------------------------------------------------------------
; Handle dword_104B90
dword_104B90	DCD 0xFFFF8001		; DATA XREF: inject_code+58r

; =============== S U B	R O U T	I N E =======================================


patch_sm

var_4		= -4

		LDR	R2, =0xE3A00001
		LDR	R3, =0xE12FFF1E
		STR	LR, [SP,#var_4]!
		SUB	SP, SP,	#0x54
		LDR	R1, =0x101820
		STMEA	SP, {R2,R3}
		MOV	R0, #3
		MOV	R2, #8
		MOV	R3, SP
		BL	inject_code
		SUBS	R1, R0,	#0	; errno
		BEQ	loc_104BD0
		LDR	R0, =aPatchSmFailed0 ; fmt
		MOV	R2, #0		; v2
		BL	showDbg

loc_104BD0				; CODE XREF: patch_sm+2Cj
		ADD	SP, SP,	#0x54
		LDR	PC, [SP+4+var_4],#4
; End of function patch_sm

; ---------------------------------------------------------------------------
dword_104BD8	DCD 0xE3A00001		; DATA XREF: patch_smr
dword_104BDC	DCD 0xE12FFF1E		; DATA XREF: patch_sm+4r
dword_104BE0	DCD 0x101820		; DATA XREF: patch_sm+10r
; u8 *off_104BE4
off_104BE4	DCD aPatchSmFailed0	; DATA XREF: patch_sm+30r
					; "patch sm failed: %08x"

; =============== S U B	R O U T	I N E =======================================


ntrProcessManager			; CODE XREF: ntrMenu+A0p

entryCount	= -0x6BC
var_6B8		= -0x6B8
var_6B0		= -0x6B0
var_6A0		= -0x6A0
var_696		= -0x696
filename	= -0x68C
processIds	= -0x658
captions	= -0x4C8
var_338		= -0x338
var_20		= -0x20

		STMFD	SP!, {R4-R8,LR}
		SUB	SP, SP,	#0x6A0
		SUB	SP, SP,	#8
		ADD	R5, SP,	#0x6C0+var_6B8
		ADD	R8, SP,	#0x6C0+processIds
		MOV	R4, #0
		MOV	R1, R8		; processIds
		SUB	R0, R5,	#4	; processCount
		MOV	R2, #0x64	; processIdMaxCount
		STR	R4, [SP,#0x6C0+entryCount]
		BL	svcGetProcessList
		SUBS	R1, R0,	#0	; errno
		MOVEQ	R4, R1
		STREQB	R1, [SP,#0x6C0+var_338]
		MOVEQ	R6, R4
		BEQ	loc_104C38
		LDR	R0, =aGetprocessli_0 ; fmt
		MOV	R2, R4		; v2
		BL	showDbg
		B	loc_104D28
; ---------------------------------------------------------------------------

loc_104C38				; CODE XREF: ntrProcessManager+3Cj
					; ntrProcessManager+98j
		LDR	R3, [SP,#0x6C0+entryCount]
		ADD	R7, SP,	#0x6C0+captions
		CMP	R4, R3
		BCS	loc_104C84
		LDR	R2, [R8,R4,LSL#2]
		ADD	R0, SP,	#0x6C0+filename	; buff
		LDR	R1, =(aSendRemainSize+0x1A) ; fmt
		BL	xsprintf
		ADD	R3, SP,	#0x6C0+var_338
		ADD	R0, R3,	R6
		ADD	R1, SP,	#0x6C0+filename
		STR	R0, [R7,R4,LSL#2]
		BL	strncpy
		ADD	R0, SP,	#0x6C0+filename	; a1
		BL	strlen
		ADD	R4, R4,	#1
		ADD	R0, R0,	#1
		ADD	R6, R6,	R0
		B	loc_104C38
; ---------------------------------------------------------------------------

loc_104C84				; CODE XREF: ntrProcessManager+5Cj
		LDR	R8, =dword_109E0C

loc_104C88				; CODE XREF: ntrProcessManager+104j
					; ntrProcessManager+10Cj ...
		LDR	R0, =aProcesslist ; title
		LDR	R1, [SP,#0x6C0+entryCount] ; entryCount
		MOV	R2, R7		; captions
		BL	showMenu
		CMN	R0, #1
		MOV	R4, R0
		BEQ	loc_104D28
		ADD	R3, SP,	#0x6C0+var_20
		LDMIA	R8, {R0,R1}
		ADD	R3, R3,	#8
		ADD	R4, R3,	R4,LSL#2
		STMIA	R5, {R0,R1}
		MOV	R2, R5		; captions
		LDR	R0, [R4,#-0x4B0] ; title
		MOV	R1, #2		; entryCount
		BL	showMenu
		CMP	R0, #0
		BNE	loc_104CF0
		ADD	R0, SP,	#0x6C0+filename	; buff
		LDR	R1, =aDump_pid08x ; fmt
		LDR	R2, [R4,#-0x640]
		BL	xsprintf
		LDR	R0, [R4,#-0x640] ; pid
		ADD	R1, SP,	#0x6C0+filename	; filename
		BL	dumpProcessToFile
		B	loc_104C88
; ---------------------------------------------------------------------------

loc_104CF0				; CODE XREF: ntrProcessManager+E4j
		CMP	R0, #1
		BNE	loc_104C88
		MOV	R6, #0
		ADD	R1, SP,	#0x6C0+var_6A0 ; a2
		ADD	R2, SP,	#0x6C0+var_6B0 ; a3
		LDR	R0, [R4,#-0x640] ; processId
		SUB	R3, R5,	#8	; a4
		STRB	R6, [SP,#0x6C0+var_696]
		BL	get_process_name
		LDR	R0, =aPnameS	; fmt
		ADD	R1, SP,	#0x6C0+var_6A0 ; errno
		MOV	R2, R6		; v2
		BL	showDbg
		B	loc_104C88
; ---------------------------------------------------------------------------

loc_104D28				; CODE XREF: ntrProcessManager+4Cj
					; ntrProcessManager+B8j
		ADD	SP, SP,	#0x6A0
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4-R8,PC}
; End of function ntrProcessManager

; ---------------------------------------------------------------------------
; u8 *off_104D34
off_104D34	DCD aGetprocessli_0	; DATA XREF: ntrProcessManager+40r
					; "getProcessList failed: %08x"
; char *off_104D38
off_104D38	DCD aSendRemainSize+0x1A ; DATA	XREF: ntrProcessManager+68r
off_104D3C	DCD dword_109E0C	; DATA XREF: ntrProcessManager:loc_104C84r
; uint8_t *off_104D40
off_104D40	DCD aProcesslist	; DATA XREF: ntrProcessManager:loc_104C88r
					; "processList"
; char *off_104D44
off_104D44	DCD aDump_pid08x	; DATA XREF: ntrProcessManager+ECr
					; "/dump_pid%08x"
; u8 *off_104D48
off_104D48	DCD aPnameS		; DATA XREF: ntrProcessManager+12Cr
					; "pname: %s"

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall rtInitLock(RT_LOCK *lock)
rtInitLock				; CODE XREF: init_config_mem+1Cp
					; ntrSetupNetworkDebugServer+12Cp ...
		MOV	R3, #0
		STR	R3, [R0]
		BX	LR
; End of function rtInitLock


; =============== S U B	R O U T	I N E =======================================


; void __fastcall rtAcquireLock(RT_LOCK	*lock)
rtAcquireLock				; CODE XREF: sendMsg+30p
					; sub_101DC4+1Cp ...
		STMFD	SP!, {R4,LR}
		MOV	R4, R0

loc_104D60				; CODE XREF: rtAcquireLock+20j
		LDR	R3, [R4]
		CMP	R3, #0
		BEQ	loc_104D7C
		LDR	R0, =0xF4240	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		B	loc_104D60
; ---------------------------------------------------------------------------

loc_104D7C				; CODE XREF: rtAcquireLock+10j
		MOV	R3, #1
		STR	R3, [R4]
		LDMFD	SP!, {R4,PC}
; End of function rtAcquireLock

; ---------------------------------------------------------------------------
; s64 dword_104D88
dword_104D88	DCD 0xF4240		; DATA XREF: rtAcquireLock+14r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall rtReleaseLock(RT_LOCK *lock)
rtReleaseLock				; CODE XREF: sendMsg+48p
					; sub_101DC4+70p ...
		MOV	R3, #0
		STR	R3, [R0]
		BX	LR
; End of function rtReleaseLock


; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall rtAlignToPageSize(uint32_t size)
rtAlignToPageSize			; CODE XREF: inject_ntr_into_home_menu+2Cp
					; handle_reload_packet+C4p ...
		CMP	R0, #0
		SUBNE	R0, R0,	#1
		BICNE	R0, R0,	#0xFF0
		BICNE	R0, R0,	#0xF
		ADDNE	R0, R0,	#0x1000
		BX	LR
; End of function rtAlignToPageSize

; [0000000C BYTES: COLLAPSED FUNCTION rtGetPageOfAddress. PRESS	KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall rtCheckRemoteMemoryRegionSafeForWrite(Handle hProcess, uint32_t addr, uint32_t size)
rtCheckRemoteMemoryRegionSafeForWrite	; CODE XREF: sub_101EA4+30p
					; handle_writemem_packet+7Cp ...
		SUB	R2, R2,	#1
		STMFD	SP!, {R4-R6,LR}
		ADD	R4, R2,	R1
		BIC	R5, R1,	#0xFF0
		BIC	R4, R4,	#0xFF0
		MOV	R6, R0
		BIC	R5, R5,	#0xF
		BIC	R4, R4,	#0xF

loc_104DDC				; CODE XREF: rtCheckRemoteMemoryRegionSafeForWrite+44j
		CMP	R5, R4
		BHI	loc_104E04
		MOV	R0, R6		; hKProcess
		MOV	R1, R5		; addr
		MOV	R2, #0x1000	; size
		BL	ntrProtectRemoteMemory
		CMP	R0, #0
		LDMNEFD	SP!, {R4-R6,PC}
		ADD	R5, R5,	#0x1000
		B	loc_104DDC
; ---------------------------------------------------------------------------

loc_104E04				; CODE XREF: rtCheckRemoteMemoryRegionSafeForWrite+24j
		MOV	R0, #0
		LDMFD	SP!, {R4-R6,PC}
; End of function rtCheckRemoteMemoryRegionSafeForWrite


; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall rtSafeCopyMemory(uint32_t	dst, uint32_t src, uint32_t size)
rtSafeCopyMemory
		STMFD	SP!, {R3-R7,LR}
		MOV	R7, R0
		MOV	R6, R1
		LDR	R0, =0xFFFF8001	; hProcess
		MOV	R1, R7		; addr
		MOV	R5, R2
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R7,PC}
		LDR	R0, =0xFFFF8001	; hProcess
		MOV	R1, R6		; addr
		MOV	R2, R5		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		SUBS	R4, R0,	#0
		BNE	loc_104E58
		MOV	R0, R7
		MOV	R1, R6
		MOV	R2, R5
		BL	memcpy

loc_104E58				; CODE XREF: rtSafeCopyMemory+38j
		MOV	R0, R4
		LDMFD	SP!, {R3-R7,PC}
; End of function rtSafeCopyMemory

; ---------------------------------------------------------------------------
; Handle dword_104E60
dword_104E60	DCD 0xFFFF8001		; DATA XREF: rtSafeCopyMemory+Cr
					; rtSafeCopyMemory+24r

; =============== S U B	R O U T	I N E =======================================


recv_					; CODE XREF: recv_wrapper+38p
					; handle_network_client+C0p
		STMFD	SP!, {R4-R8,LR}
		MOV	R7, R0
		MOV	R8, R1
		MOV	R6, R2
		MOV	R4, R2
		MOV	R5, #0

loc_104E7C				; CODE XREF: recv_+50j
		CMP	R4, #0
		BEQ	loc_104EB8
		MOV	R0, R7		; sockfd
		ADD	R1, R8,	R5	; buf
		MOV	R2, R4		; len
		MOV	R3, #0		; flags
		BL	socketRecv
		CMP	R0, #0
		BGT	loc_104EAC
		LDMEQFD	SP!, {R4-R8,PC}
		LDMFD	SP!, {R4-R8,LR}
		B	socketGetErrno	; This should be get Error number however content mismatchs.
; ---------------------------------------------------------------------------

loc_104EAC				; CODE XREF: recv_+38j
		ADD	R5, R5,	R0
		RSB	R4, R0,	R4
		B	loc_104E7C
; ---------------------------------------------------------------------------

loc_104EB8				; CODE XREF: recv_+1Cj
		MOV	R0, R6
		LDMFD	SP!, {R4-R8,PC}
; End of function recv_


; =============== S U B	R O U T	I N E =======================================


sub_104EC0				; CODE XREF: sub_101A74+20j
					; sub_101A9C+38p
		STMFD	SP!, {R4-R8,LR}
		MOV	R7, R0
		MOV	R8, R1
		MOV	R6, R2
		MOV	R4, R2
		MOV	R5, #0

loc_104ED8				; CODE XREF: sub_104EC0+4Cj
		CMP	R4, #0
		BEQ	loc_104F10
		MOV	R0, R7		; sockfd
		ADD	R1, R8,	R5	; buf
		MOV	R2, R4		; len
		MOV	R3, #0		; flags
		BL	socketSend
		CMP	R0, #0
		BGE	loc_104F04
		LDMFD	SP!, {R4-R8,LR}
		B	socketGetErrno	; This should be get Error number however content mismatchs.
; ---------------------------------------------------------------------------

loc_104F04				; CODE XREF: sub_104EC0+38j
		ADD	R5, R5,	R0
		RSB	R4, R0,	R4
		B	loc_104ED8
; ---------------------------------------------------------------------------

loc_104F10				; CODE XREF: sub_104EC0+1Cj
		MOV	R0, R6
		LDMFD	SP!, {R4-R8,PC}
; End of function sub_104EC0


; =============== S U B	R O U T	I N E =======================================


sub_104F18				; CODE XREF: handle_network_client+4Cp

var_2		= -2

		SUB	SP, SP,	#8
		MOV	R3, R0,LSR#8
		STRB	R3, [SP,#8+var_2]
		STRB	R0, [SP,#8+var_2+1]
		LDRH	R0, [SP,#8+var_2]
		ADD	SP, SP,	#8
		BX	LR
; End of function sub_104F18


; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall rtGetFileSize(uint8_t *fileName)
rtGetFileSize				; CODE XREF: load_ntr_plugins+58p
					; load_all_plugins_and_inject_ntr_into_pm+80p

var_50		= -0x50
openflags	= -0x44
attributes	= -0x40
out		= -0x34
size		= -0x30
var_24		= -0x24
var_20		= -0x20
var_1C		= -0x1C
var_18		= -0x18

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x4C	; archive
		MOV	R3, #3
		MOV	R4, R0
		STRB	R3, [SP,#0x60+var_24]
		BL	strlen
		ADD	R2, SP,	#0x60+var_18
		STR	R4, [SP,#0x60+var_1C]
		ADD	R3, SP,	#0x60+var_50
		LDR	R12, =cfw_02
		MOV	R5, #0
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x60+var_20]
		LDMDB	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x60+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R5, [SP,#0x60+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x60+out ; out
		BL	FSUSER_OpenFileDirectly
		CMP	R0, R5
		MOV	R4, R0
		BEQ	loc_104FC0
		LDR	R0, =aOpenfileFailed08x	; msg
		MOV	R1, R4
		MOV	R2, R5
		BL	sendMsg
		STR	R5, [SP,#0x60+out]
		B	loc_104FEC
; ---------------------------------------------------------------------------

loc_104FC0				; CODE XREF: rtGetFileSize+70j
		MOV	R7, R0
		ADD	R1, SP,	#0x60+size ; size
		LDR	R0, [SP,#0x60+out] ; handle
		BL	FSFILE_GetSize
		SUBS	R4, R0,	#0
		LDREQ	R6, [SP,#0x60+size]
		BEQ	loc_104FEC
		LDR	R0, =aFsfile_getsizeFailed08x ;	msg
		MOV	R1, R4
		MOV	R2, R7
		BL	sendMsg

loc_104FEC				; CODE XREF: rtGetFileSize+88j
					; rtGetFileSize+A4j
		LDR	R0, [SP,#0x60+out] ; handle
		CMP	R0, #0
		BEQ	loc_104FFC
		BL	svcCloseHandle

loc_104FFC				; CODE XREF: rtGetFileSize+C0j
		CMP	R4, #0
		MOVEQ	R0, R6
		MOVNE	R0, #0
		ADD	SP, SP,	#0x4C
		LDMFD	SP!, {R4-R7,PC}
; End of function rtGetFileSize

; ---------------------------------------------------------------------------
off_105010	DCD cfw_02		; DATA XREF: rtGetFileSize+24r
off_105014	DCD hFSUser		; DATA XREF: rtGetFileSize+54r
; u8 *off_105018
off_105018	DCD aOpenfileFailed08x	; DATA XREF: rtGetFileSize+74r
					; "openFile failed: %08x\n"
; u8 *off_10501C
off_10501C	DCD aFsfile_getsizeFailed08x ; DATA XREF: rtGetFileSize+A8r
					; "FSFILE_GetSize failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


; uint32_t __fastcall rtLoadFileToBuffer(uint8_t *fileName, uint32_t *pBuf, uint32_t bufSize)
rtLoadFileToBuffer			; CODE XREF: load_ntr_plugins+9Cp
					; load_all_plugins_and_inject_ntr_into_pm+C0p

var_68		= -0x68
var_64		= -0x64
var_58		= -0x58
openflags	= -0x4C
attributes	= -0x48
out		= -0x40
bytesRead	= -0x3C
size		= -0x38
var_2C		= -0x2C
var_28		= -0x28
var_24		= -0x24
var_20		= -0x20

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x4C	; archive
		MOV	R3, #3
		MOV	R4, R0
		MOV	R7, R1
		MOV	R8, R2
		STRB	R3, [SP,#0x68+var_2C]
		BL	strlen
		ADD	R2, SP,	#0x68+var_20
		STR	R4, [SP,#0x68+var_24]
		ADD	R3, SP,	#0x68+var_58
		LDR	R12, =cfw_02
		MOV	R6, #0
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x68+var_28]
		LDMDB	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x68+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R6, [SP,#0x68+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x68+out ; out
		BL	FSUSER_OpenFileDirectly
		CMP	R0, R6
		MOV	R4, R0
		BEQ	loc_1050B4
		LDR	R0, =aOpenfileFailed08x	; msg
		MOV	R1, R4
		MOV	R2, R6
		BL	sendMsg
		STR	R6, [SP,#0x68+out]
		B	loc_10512C
; ---------------------------------------------------------------------------

loc_1050B4				; CODE XREF: rtLoadFileToBuffer+78j
		MOV	R9, R0
		ADD	R1, SP,	#0x68+size ; size
		LDR	R0, [SP,#0x68+out] ; handle
		BL	FSFILE_GetSize
		SUBS	R6, R0,	#0
		MOV	R4, R0
		LDRNE	R0, =aFsfile_getsizeFailed08x ;	"FSFILE_GetSize failed: %08x\n"
		MOVNE	R1, R4
		MOVNE	R2, R9
		BNE	loc_105128
		LDR	R5, [SP,#0x68+size]
		CMP	R8, R5
		BCS	loc_1050F8
		LDR	R0, =aRtloadfileto_0 ; msg
		BL	sendMsg
		MOV	R4, #0xFFFFFFFF
		B	loc_10512C
; ---------------------------------------------------------------------------

loc_1050F8				; CODE XREF: rtLoadFileToBuffer+C4j
		STR	R7, [SP,#0x68+var_68] ;	size
		STR	R5, [SP,#0x68+var_64] ;	size
		LDR	R0, [SP,#0x68+out] ; handle
		ADD	R1, SP,	#0x68+bytesRead	; bytesRead
		MOV	R2, #0		; offset
		MOV	R3, #0		; buffer
		BL	FSFILE_Read
		SUBS	R4, R0,	#0
		BEQ	loc_10512C
		LDR	R0, =aFsfile_readF_0 ; msg
		MOV	R1, R4
		MOV	R2, R6

loc_105128				; CODE XREF: rtLoadFileToBuffer+B8j
		BL	sendMsg

loc_10512C				; CODE XREF: rtLoadFileToBuffer+90j
					; rtLoadFileToBuffer+D4j ...
		LDR	R0, [SP,#0x68+out] ; handle
		CMP	R0, #0
		BEQ	loc_10513C
		BL	svcCloseHandle

loc_10513C				; CODE XREF: rtLoadFileToBuffer+114j
		CMP	R4, #0
		MOVEQ	R0, R5
		MOVNE	R0, #0
		ADD	SP, SP,	#0x4C
		LDMFD	SP!, {R4-R9,PC}
; End of function rtLoadFileToBuffer

; ---------------------------------------------------------------------------
off_105150	DCD cfw_02		; DATA XREF: rtLoadFileToBuffer+2Cr
off_105154	DCD hFSUser		; DATA XREF: rtLoadFileToBuffer+5Cr
; u8 *off_105158
off_105158	DCD aOpenfileFailed08x	; DATA XREF: rtLoadFileToBuffer+7Cr
					; "openFile failed: %08x\n"
off_10515C	DCD aFsfile_getsizeFailed08x ; DATA XREF: rtLoadFileToBuffer+ACr
					; "FSFILE_GetSize failed: %08x\n"
; u8 *off_105160
off_105160	DCD aRtloadfileto_0	; DATA XREF: rtLoadFileToBuffer+C8r
					; "rtLoadFileToBuffer: buffer too small\n"
; u8 *off_105164
off_105164	DCD aFsfile_readF_0	; DATA XREF: rtLoadFileToBuffer+FCr
					; "FSFILE_Read failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================


; int __cdecl rtGetThreadContext(Handle	hProcess, u32 threadId,	void *threadContext)
rtGetThreadContext			; CODE XREF: get_remote_PC+78p
					; handle_listthread_packet+DCp

handle		= -0x14

		MOV	R12, R0
		MOV	R3, R1
		STMFD	SP!, {R0-R2,R4,R5,LR}
		MOV	R4, R2
		ADD	R0, SP,	#0x18+handle ; thread
		MOV	R1, R12		; process
		MOV	R2, R3		; threadId
		BL	svcOpenThread
		SUBS	R5, R0,	#0
		BEQ	loc_1051A4
		LDR	R0, =aOpenthreadFail ; msg
		MOV	R1, R5
		MOV	R2, #0
		BL	sendMsg
		B	loc_1051D8
; ---------------------------------------------------------------------------

loc_1051A4				; CODE XREF: rtGetThreadContext+24j
		LDR	R0, [SP,#0x18+handle] ;	handle
		BL	arm11kCmdGetKernelObject
		MOV	R2, #0xA0	; count
		MOV	R1, R0		; src
		MOV	R0, R4		; dst
		BL	arm11kCmdMemcpy	; get first 0xA0 bytes of KThread object
		LDR	R1, [R4,#0x8C]	; end address of the page for this thread
		MOV	R0, R4		; dst
		SUB	R1, R1,	#0x10C	; src
		MOV	R2, #0x10C	; get very last	0x10C number of	bytes of the end address
		BL	arm11kCmdMemcpy
		LDR	R0, [SP,#0x18+handle] ;	handle
		BL	svcCloseHandle

loc_1051D8				; CODE XREF: rtGetThreadContext+38j
		MOV	R0, R5
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function rtGetThreadContext

; ---------------------------------------------------------------------------
; u8 *off_1051E4
off_1051E4	DCD aOpenthreadFail	; DATA XREF: rtGetThreadContext+28r
					; "openThread failed: %08x\n"

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u32 __stdcall	rtGenerateJumpCode(u32 dst, u32	*buf)
rtGenerateJumpCode			; CODE XREF: main+188p
					; install_SVC_6D_hook+6Cp
		LDR	R3, =0xE51FF004
		STR	R0, [R1,#4]
		STR	R3, [R1]
		MOV	R0, #8
		BX	LR
; End of function rtGenerateJumpCode

; ---------------------------------------------------------------------------
LDR_PC_PC_MINUS_4 DCD 0xE51FF004	; DATA XREF: rtGenerateJumpCoder

; =============== S U B	R O U T	I N E =======================================


; u32 __stdcall	rtFlushInstructionCache(void *ptr, u32 size)
rtFlushInstructionCache			; CODE XREF: main+17Cp	main+194p ...
		MOV	R3, R0
		MOV	R2, R1		; size
		LDR	R0, =0xFFFF8001	; process
		MOV	R1, R3		; addr
		B	svcFlushProcessDataCache
; End of function rtFlushInstructionCache

; ---------------------------------------------------------------------------
; Handle process
process		DCD 0xFFFF8001		; DATA XREF: rtFlushInstructionCache+8r

; =============== S U B	R O U T	I N E =======================================


; void __fastcall rtInitHook(RT_HOOK *hook, uint32_t funcAddr, uint32_t	callbackAddr)
rtInitHook				; CODE XREF: threadNtrHomeInjectee+14p
					; threadNtrHomeInjectee+30p ...
		STMFD	SP!, {R4-R6,LR}
		MOV	R3, #0
		MOV	R5, R1
		STR	R3, [R0]
		STMIB	R0, {R3,R5}
		MOV	R4, R0
		MOV	R6, R2
		BL	ntrGetCurrentProcessHandle
		MOV	R1, R5		; addr
		MOV	R2, #8		; size
		BL	rtCheckRemoteMemoryRegionSafeForWrite
		LDR	R3, [R5]
		LDR	R1, =0xE51FF004	; ldr pc, [pc-4]
		STR	R3, [R4,#0xC]
		LDR	R3, [R5,#4]
		STR	R1, [R4,#0x4C]
		STR	R3, [R4,#0x10]
		STR	R6, [R4,#0x50]
		LDR	R3, [R5]
		ADD	R0, R4,	#0x8C	; addr
		STR	R3, [R4,#0x8C]
		LDR	R3, [R5,#4]
		ADD	R5, R5,	#8
		STR	R3, [R0,#4]
		STR	R1, [R4,#0x94]
		STR	R5, [R4,#0x98]
		MOV	R1, #0x10	; size
		LDMFD	SP!, {R4-R6,LR}
		B	rtFlushInstructionCache
; End of function rtInitHook

; ---------------------------------------------------------------------------
dword_10528C	DCD 0xE51FF004		; DATA XREF: rtInitHook+30r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall rtEnableHook(RT_HOOK *hook)
rtEnableHook				; CODE XREF: threadNtrHomeInjectee+1Cp
					; threadNtrHomeInjectee+38p ...
		LDR	R3, [R0,#4]
		CMP	R3, #0
		BXNE	LR
		MOV	R2, R0
		STMFD	SP!, {R4,LR}
		MOV	R4, R0
		LDR	R1, [R0,#8]	; get patch addr
		LDR	R3, [R2,#0x4C]!	; get code: ldr	pc, [pc-4]
		STR	R3, [R1]	; place	jmp
		LDR	R3, [R2,#4]
		STR	R3, [R1,#4]	; place	target addr
		MOV	R1, #8		; size
		LDR	R0, [R0,#8]	; addr
		BL	rtFlushInstructionCache
		MOV	R3, #1
		STR	R3, [R4,#4]
		LDMFD	SP!, {R4,PC}
; End of function rtEnableHook

; [00000044 BYTES: COLLAPSED FUNCTION rtDisableHook. PRESS KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================


; Handle __stdcall ntrFileCreate(char *filename, u32 mode)
ntrFileCreate				; CODE XREF: ntrScreenShotSaveFile+E0p
					; ntrScreenShotGetIndex+24p

var_38		= -0x38
openflags	= -0x2C
attributes	= -0x28
out		= -0x20
var_1C		= -0x1C
var_18		= -0x18
var_14		= -0x14
var_10		= -0x10

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x3C	; archive
		MOV	R3, #3
		MOV	R4, R1
		MOV	R5, R0
		STRB	R3, [SP,#0x48+var_1C]
		BL	strlen
		ADD	R2, SP,	#0x48+var_10
		STR	R5, [SP,#0x48+var_14]
		ADD	R3, SP,	#0x48+var_38
		LDR	R12, =cfw_02
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x48+var_18]
		LDMDB	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #0
		STR	R3, [SP,#0x48+attributes] ; attributes
		ADD	R3, R12, #8
		STR	R4, [SP,#0x48+openflags] ; openflags
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x48+out ; out
		BL	FSUSER_OpenFileDirectly
		CMP	R0, #0
		LDRGE	R0, [SP,#0x48+out]
		ADD	SP, SP,	#0x3C
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrFileCreate

; ---------------------------------------------------------------------------
off_105390	DCD cfw_02		; DATA XREF: ntrFileCreate+28r
off_105394	DCD hFSUser		; DATA XREF: ntrFileCreate+54r

; =============== S U B	R O U T	I N E =======================================

; This functions abnormally due	to its mistake in usage.

ntrFileRead

bytesRead	= -0x14

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x14	; size
		MOV	R4, R1
		MOV	R5, R1,ASR#31
		STMEA	SP, {R2,R3}
		ADD	R1, SP,	#0x20+bytesRead	; bytesRead
		MOV	R2, R4		; offset
		MOV	R3, R5		; buffer
		BL	FSFILE_Read
		CMP	R0, #0
		LDRGE	R0, [SP,#0x20+bytesRead]
		ADD	SP, SP,	#0x14
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrFileRead


; =============== S U B	R O U T	I N E =======================================

; This functions abnormally due	to its mistake in usage.

; u32 __fastcall ntrFileWrite(Handle file, u64 offset, char *buffer, u32 size)
ntrFileWrite				; CODE XREF: ntrScreenShotSaveFile+F8p

var_20		= -0x20
bytesWritten	= -0x14

		STMFD	SP!, {R4,R5,LR}
		SUB	SP, SP,	#0x1C	; size
		MOV	R4, R1
		STMEA	SP, {R2,R3}
		MOV	R5, R1,ASR#31
		MOV	R3, #0
		STR	R3, [SP,#0x28+var_20] ;	flushFlags
		ADD	R1, SP,	#0x28+bytesWritten ; bytesWritten
		MOV	R2, R4		; offset
		MOV	R3, R5		; buffer
		BL	FSFILE_Write
		CMP	R0, #0
		LDRGE	R0, [SP,#0x28+bytesWritten]
		ADD	SP, SP,	#0x1C
		LDMFD	SP!, {R4,R5,PC}
; End of function ntrFileWrite


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

; Result __stdcall ntrFileClose(Handle handle)
ntrFileClose				; CODE XREF: ntrScreenShotSaveFile+104p
					; ntrScreenShotGetIndex+30p
		B	FSFILE_Close
; End of function ntrFileClose


; =============== S U B	R O U T	I N E =======================================


; u8 *__fastcall ntrU32ToU8Array(u8 *array, u32	number)
ntrU32ToU8Array				; CODE XREF: ntrScreenShotSaveFile+48p
					; ntrScreenShotSaveFile+7Cp ...
		MOV	R3, R1,LSR#8
		STRB	R1, [R0]
		STRB	R3, [R0,#1]
		MOV	R3, R1,LSR#16
		MOV	R1, R1,LSR#24
		STRB	R3, [R0,#2]
		STRB	R1, [R0,#3]
		BX	LR
; End of function ntrU32ToU8Array


; =============== S U B	R O U T	I N E =======================================


; u16 __stdcall	ntrU16ToU8Array(u8 *array, u16 number)
ntrU16ToU8Array
		STRB	R1, [R0]
		MOV	R1, R1,LSR#8
		STRB	R1, [R0,#1]
		BX	LR
; End of function ntrU16ToU8Array


; =============== S U B	R O U T	I N E =======================================


; u32 __fastcall ntrScreenShotSaveFile(char *buffer, u16 width,	u16 height, char *filename)
ntrScreenShotSaveFile			; CODE XREF: display_OSD_menu+F0p
					; display_OSD_menu+15Cp
		STMFD	SP!, {R4-R10,LR} ; flushFlags
		MUL	R6, R2,	R1
		MOV	R5, #0x36	; Header Length
		MOV	R4, R0
		MOV	R10, R1
		MOV	R8, R2
		MOV	R1, #0
		MOV	R2, R5
		MOV	R9, R3
		ADD	R6, R6,	R6,LSL#1
		BL	memset
		MOV	R3, #0x42
		ADD	R7, R6,	#0x36
		STRB	R3, [R4]
		MOV	R3, #0x4D
		STRB	R3, [R4,#1]
		ADD	R0, R4,	#2	; array
		MOV	R1, R7		; number
		BL	ntrU32ToU8Array
		MOV	R3, #0x28
		STRB	R5, [R4,#0xA]
		MOV	R5, #0
		STRB	R3, [R4,#0xE]
		ADD	R0, R4,	#0x12	; array
		MOV	R1, R10		; number
		STRB	R5, [R4,#0xB]
		STRB	R5, [R4,#0xC]
		STRB	R5, [R4,#0xD]
		STRB	R5, [R4,#0xF]
		STRB	R5, [R4,#0x10]
		STRB	R5, [R4,#0x11]
		BL	ntrU32ToU8Array
		ADD	R0, R4,	#0x16	; array
		MOV	R1, R8		; number
		BL	ntrU32ToU8Array
		MOV	R3, #1
		STRB	R3, [R4,#0x1A]
		MOV	R3, #0x18
		MOV	R1, R6		; number
		STRB	R3, [R4,#0x1C]
		ADD	R0, R4,	#0x22	; array
		STRB	R5, [R4,#0x1B]
		STRB	R5, [R4,#0x1D]
		BL	ntrU32ToU8Array
		MOV	R12, #0x12
		MOV	R2, #0xB
		STRB	R12, [R4,#0x26]
		STRB	R2, [R4,#0x27]
		STRB	R5, [R4,#0x28]
		STRB	R5, [R4,#0x29]
		STRB	R12, [R4,#0x2A]
		STRB	R2, [R4,#0x2B]
		STRB	R5, [R4,#0x2C]
		STRB	R5, [R4,#0x2D]
		MOV	R0, R9		; filename
		MOV	R1, #7		; mode
		BL	ntrFileCreate
		SUBS	R6, R0,	#0
		LDMLEFD	SP!, {R4-R10,PC}
		MOV	R1, R5		; offset
		MOV	R2, R4		; buffer
		MOV	R3, R7		; size
		BL	ntrFileWrite	; This functions abnormally due	to its mistake in usage.
		MOV	R0, R6		; handle
		LDMFD	SP!, {R4-R10,LR}
		B	ntrFileClose
; End of function ntrScreenShotSaveFile


; =============== S U B	R O U T	I N E =======================================


ntrScreenShotCopyImageAsBMP		; CODE XREF: display_OSD_menu+CCp
					; display_OSD_menu+138p

arg_0		=  0
arg_4		=  4

		STMFD	SP!, {R4-R11,LR}
		LDR	R4, [SP,#0x24+arg_4]
		LDR	R10, [SP,#0x24+arg_0]
		ANDS	R4, R4,	#0xF
		MOVEQ	R8, #4
		BEQ	loc_105568
		CMP	R4, #1
		MOVEQ	R8, #3
		MOVNE	R8, #2

loc_105568				; CODE XREF: ntrScreenShotCopyImageAsBMP+14j
		ADD	R9, R1,	R1,LSL#1
		ADD	R0, R0,	#3
		ADD	R3, R3,	#2
		MOV	R6, #0

loc_105578				; CODE XREF: ntrScreenShotCopyImageAsBMP+128j
		CMP	R6, R2
		BGE	locret_105670
		MOV	LR, R3
		MOV	R12, R0
		MOV	R7, #0

loc_10558C				; CODE XREF: ntrScreenShotCopyImageAsBMP+118j
		CMP	R7, R1
		BGE	loc_105660
		CMP	R4, #0
		BEQ	loc_1055A4
		CMP	R4, #1
		BNE	loc_1055BC

loc_1055A4				; CODE XREF: ntrScreenShotCopyImageAsBMP+54j
		LDRB	R5, [LR,#-2]
		STRB	R5, [R12,#-3]
		LDRB	R5, [LR,#-1]
		STRB	R5, [R12,#-2]
		LDRB	R5, [LR]
		B	loc_10564C
; ---------------------------------------------------------------------------

loc_1055BC				; CODE XREF: ntrScreenShotCopyImageAsBMP+5Cj
		CMP	R4, #2
		BNE	loc_1055E4
		LDRB	R11, [LR,#-1]
		LDRB	R5, [LR,#-2]
		ORR	R5, R5,	R11,LSL#8
		MOV	R11, R5,LSL#3
		STRB	R11, [R12,#-3]
		MOV	R11, R5,LSR#3
		BIC	R11, R11, #3
		B	loc_10560C
; ---------------------------------------------------------------------------

loc_1055E4				; CODE XREF: ntrScreenShotCopyImageAsBMP+7Cj
		CMP	R4, #3
		BNE	loc_10561C
		LDRB	R11, [LR,#-1]
		LDRB	R5, [LR,#-2]
		ORR	R5, R5,	R11,LSL#8
		MOV	R11, R5,LSL#2
		BIC	R11, R11, #7
		STRB	R11, [R12,#-3]
		MOV	R11, R5,LSR#3
		BIC	R11, R11, #7

loc_10560C				; CODE XREF: ntrScreenShotCopyImageAsBMP+9Cj
		MOV	R5, R5,LSR#8
		STRB	R11, [R12,#-2]
		BIC	R5, R5,	#7
		B	loc_10564C
; ---------------------------------------------------------------------------

loc_10561C				; CODE XREF: ntrScreenShotCopyImageAsBMP+A4j
		CMP	R4, #4
		BNE	loc_105650
		LDRB	R11, [LR,#-1]
		LDRB	R5, [LR,#-2]
		ORR	R5, R5,	R11,LSL#8
		BIC	R11, R5, #0xF
		STRB	R11, [R12,#-3]
		MOV	R11, R5,LSR#4
		MOV	R5, R5,LSR#8
		BIC	R5, R5,	#0xF
		BIC	R11, R11, #0xF
		STRB	R11, [R12,#-2]

loc_10564C				; CODE XREF: ntrScreenShotCopyImageAsBMP+74j
					; ntrScreenShotCopyImageAsBMP+D4j
		STRB	R5, [R12,#-1]

loc_105650				; CODE XREF: ntrScreenShotCopyImageAsBMP+DCj
		ADD	R7, R7,	#1
		ADD	R12, R12, #3
		ADD	LR, LR,	R10
		B	loc_10558C
; ---------------------------------------------------------------------------

loc_105660				; CODE XREF: ntrScreenShotCopyImageAsBMP+4Cj
		ADD	R6, R6,	#1
		ADD	R0, R0,	R9
		ADD	R3, R3,	R8
		B	loc_105578
; ---------------------------------------------------------------------------

locret_105670				; CODE XREF: ntrScreenShotCopyImageAsBMP+38j
		LDMFD	SP!, {R4-R11,PC}
; End of function ntrScreenShotCopyImageAsBMP


; =============== S U B	R O U T	I N E =======================================

; I would wonder if someone use	FATFS instead of touching it..

; u32 ntrScreenShotGetIndex(void)
ntrScreenShotGetIndex			; CODE XREF: ntrScreenShotBuiltinPluginInit+38p
		STMFD	SP!, {R4,LR}
		MOV	R4, #0
		SUB	SP, SP,	#0x40

loc_105680				; CODE XREF: ntrScreenShotGetIndex+38j
		MOV	R0, SP		; buff
		LDR	R1, =aTop_04d_bmp ; "/top_%04d.bmp"
		MOV	R2, R4
		BL	xsprintf
		MOV	R0, SP		; filename
		MOV	R1, #3		; mode
		BL	ntrFileCreate
		CMP	R0, #0
		BLE	loc_1056B0
		BL	ntrFileClose
		ADD	R4, R4,	#1
		B	loc_105680
; ---------------------------------------------------------------------------

loc_1056B0				; CODE XREF: ntrScreenShotGetIndex+2Cj
		MOV	R0, R4
		ADD	SP, SP,	#0x40
		LDMFD	SP!, {R4,PC}
; End of function ntrScreenShotGetIndex

; ---------------------------------------------------------------------------
; char *off_1056BC
off_1056BC	DCD aTop_04d_bmp	; DATA XREF: ntrScreenShotGetIndex+10r
					; "/top_%04d.bmp"

; =============== S U B	R O U T	I N E =======================================


display_OSD_menu			; CODE XREF: threadNtrHomeInjectee+120p
					; sub_105864+3Cp

var_78		= -0x78
var_74		= -0x74
var_70		= -0x70
var_6C		= -0x6C
var_68		= -0x68
var_64		= -0x64
buff		= -0x60
var_20		= -0x20

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x5C
		LDR	R5, =dword_10B488
		LDR	R3, [R5]
		CMP	R3, #0
		BNE	loc_1056F4
		MOV	R0, #0x100000	; size
		BL	plgRequestMemory
		MOV	R4, R0
		MOV	R1, R4
		LDR	R0, =aOut_addr08x ; "    out_addr: %08x"
		BL	sendMsg
		STR	R4, [R5]

loc_1056F4				; CODE XREF: display_OSD_menu+14j
		LDR	R0, [R5]
		LDR	R4, =dword_10B488
		CMP	R0, #0
		BEQ	loc_105838
		LDR	R8, =va_mapped_io_PDC
		ADD	R0, R0,	#0x50000 ; dst
		LDR	R3, [R8]
		LDR	R2, [R3,#0x468]
		ADD	R2, R2,	#0xC0000000
		STR	R2, [SP,#0x78+var_70]
		LDR	R2, [R3,#0x46C]
		ADD	R2, R2,	#0xC0000000
		STR	R2, [SP,#0x78+var_6C]
		LDR	R2, [R3,#0x568]
		ADD	R2, R2,	#0xC0000000
		STR	R2, [SP,#0x78+var_68]
		LDR	R2, [R3,#0x56C]
		LDR	R7, [R3,#0x470]
		LDR	R5, [R3,#0x570]
		LDR	R9, [R3,#0x490]
		LDR	R6, [R3,#0x590]
		LDR	R3, [R3,#0x478]
		ADD	R2, R2,	#0xC0000000
		AND	R3, R3,	#1
		STR	R2, [SP,#0x78+var_64]
		ADD	R2, SP,	#0x78+var_20
		ADD	R3, R2,	R3,LSL#2
		LDR	R2, =0x46500	; count
		LDR	R1, [R3,#-0x50]	; src
		BL	arm11kCmdMemcpy
		LDR	R3, [R4]
		STR	R7, [SP,#0x78+var_74]
		LDR	R7, =bmp_idx
		ADD	R0, R3,	#0x36
		MOV	R1, #0x190
		ADD	R3, R3,	#0x50000
		MOV	R2, #0xF0
		STR	R9, [SP,#0x78+var_78]
		BL	ntrScreenShotCopyImageAsBMP
		ADD	R0, SP,	#0x78+buff ; buff
		LDR	R1, =aTop_04d_bmp ; "/top_%04d.bmp"
		LDR	R2, [R7]
		BL	xsprintf
		LDR	R0, [R4]	; buffer
		MOV	R1, #0x190	; width
		MOV	R2, #0xF0	; height
		ADD	R3, SP,	#0x78+buff ; filename
		BL	ntrScreenShotSaveFile
		LDR	R3, [R8]
		ADD	R2, SP,	#0x78+var_20
		LDR	R0, [R4]
		LDR	R3, [R3,#0x578]
		ADD	R0, R0,	#0x50000 ; dst
		AND	R3, R3,	#1
		ADD	R3, R2,	R3,LSL#2
		MOV	R2, #0x38400	; count
		LDR	R1, [R3,#-0x48]	; src
		BL	arm11kCmdMemcpy
		LDR	R3, [R4]
		MOV	R1, #0x140
		ADD	R0, R3,	#0x36
		MOV	R2, #0xF0
		ADD	R3, R3,	#0x50000
		STR	R6, [SP,#0x78+var_78]
		STR	R5, [SP,#0x78+var_74]
		BL	ntrScreenShotCopyImageAsBMP
		ADD	R0, SP,	#0x78+buff ; buff
		LDR	R1, =aBot_04d_bmp ; fmt
		LDR	R2, [R7]
		BL	xsprintf
		ADD	R3, SP,	#0x78+buff ; filename
		LDR	R0, [R4]	; buffer
		MOV	R1, #0x140	; width
		MOV	R2, #0xF0	; height
		BL	ntrScreenShotSaveFile
		MOV	R0, #0x64
		LDR	R1, =0x1FF00FF
		BL	lcd_solid_fill
		LDR	R3, [R7]
		ADD	R3, R3,	#1
		STR	R3, [R7]

loc_105838				; CODE XREF: display_OSD_menu+40j
		ADD	SP, SP,	#0x5C
		LDMFD	SP!, {R4-R9,PC}
; End of function display_OSD_menu

; ---------------------------------------------------------------------------
off_105840	DCD dword_10B488	; DATA XREF: display_OSD_menu+8r
					; display_OSD_menu+38r
; u8 *off_105844
off_105844	DCD aOut_addr08x	; DATA XREF: display_OSD_menu+28r
					; "    out_addr: %08x"
off_105848	DCD va_mapped_io_PDC	; DATA XREF: display_OSD_menu+44r
; size_t count
count		DCD 0x46500		; DATA XREF: display_OSD_menu+A0r
off_105850	DCD bmp_idx		; DATA XREF: display_OSD_menu+B4r
; char *off_105854
off_105854	DCD aTop_04d_bmp	; DATA XREF: display_OSD_menu+D4r
					; "/top_%04d.bmp"
; char *off_105858
off_105858	DCD aBot_04d_bmp	; DATA XREF: display_OSD_menu+140r
					; "/bot_%04d.bmp"
dword_10585C	DCD 0x1FF00FF		; DATA XREF: display_OSD_menu+164r
ntrCreateScreenShotCallback DCD	0xE3A03000 ; DATA XREF:	ntrScreenShotBuiltinPluginInit+10o
					; ROM:callbacko

; =============== S U B	R O U T	I N E =======================================


sub_105864

var_C		= -0xC
var_4		= -4

		STMFD	SP!, {R0-R2,LR}

loc_105868				; CODE XREF: sub_105864+18j
		STR	R3, [SP,#0x10+var_C]
		LDR	R3, [SP,#0x10+var_C]
		CMP	R3, #0x1000000
		LDRCC	R3, [SP,#0x10+var_C]
		ADDCC	R3, R3,	#1
		BCC	loc_105868
		MOV	R1, #0		; arg1
		MOV	R2, R1		; arg2
		MOV	R3, R1		; arg3
		MOV	R0, #2		; cmd
		BL	controlVideo
		LDR	R0, =0x5F5E100	; ns
		MOV	R1, #0
		BL	svcSleepThread
		BL	display_OSD_menu
		MOV	R1, #0		; arg1
		MOV	R2, R1		; arg2
		MOV	R3, R1		; arg3
		MOV	R0, #1		; cmd
		BL	controlVideo
		MOV	R0, #1
		ADD	SP, SP,	#0xC
		LDR	PC, [SP+4+var_4],#4
; End of function sub_105864

; ---------------------------------------------------------------------------
; s64 dword_1058C4
dword_1058C4	DCD 0x5F5E100		; DATA XREF: sub_105864+30r

; =============== S U B	R O U T	I N E =======================================


; void ntrScreenShotBuiltinPluginInit(void)
ntrScreenShotBuiltinPluginInit		; CODE XREF: threadNtrHomeInjectee+D4p
		STMFD	SP!, {R4,LR}
		LDR	R0, =aInitializingSc ; msg
		LDR	R4, =hFSUser
		BL	sendMsg
		LDR	R2, =ntrCreateScreenShotCallback ; callback
		LDR	R1, =aTakeScreenshot ; title
		MOV	R0, #1		; catalog
		BL	plgRegisterMenuEntry
		MOV	R1, R4		; handle
		LDR	R0, =aFsUser	; "fs:USER"
		BL	plgGetSharedServiceHandle
		LDR	R1, [R4]
		LDR	R0, =aFsuserhandle08 ; msg
		BL	sendMsg
		BL	ntrScreenShotGetIndex ;	I would	wonder if someone use FATFS instead of touching	it..
		LDR	R3, =bmp_idx
		MOV	R1, R0
		STR	R0, [R3]
		LDR	R0, =aBmpIndexIsD ; msg
		BL	sendMsg
		LDMFD	SP!, {R4,PC}
; End of function ntrScreenShotBuiltinPluginInit

; ---------------------------------------------------------------------------
; u8 *off_10591C
off_10591C	DCD aInitializingSc	; DATA XREF: ntrScreenShotBuiltinPluginInit+4r
					; "initializing screenshot plugin\n"
off_105920	DCD hFSUser		; DATA XREF: ntrScreenShotBuiltinPluginInit+8r
; void *callback
callback	DCD ntrCreateScreenShotCallback
					; DATA XREF: ntrScreenShotBuiltinPluginInit+10r
; char *off_105928
off_105928	DCD aTakeScreenshot	; DATA XREF: ntrScreenShotBuiltinPluginInit+14r
					; "Take Screenshot"
; char *servName
servName	DCD aFsUser		; DATA XREF: ntrScreenShotBuiltinPluginInit+24r
					; "fs:USER"
; u8 *off_105930
off_105930	DCD aFsuserhandle08	; DATA XREF: ntrScreenShotBuiltinPluginInit+30r
					; "fsUserHandle: %08x\n"
off_105934	DCD bmp_idx		; DATA XREF: ntrScreenShotBuiltinPluginInit+3Cr
; u8 *off_105938
off_105938	DCD aBmpIndexIsD	; DATA XREF: ntrScreenShotBuiltinPluginInit+48r
					; "bmp index is: %d"

; =============== S U B	R O U T	I N E =======================================


; void ntrPlgInitSharedFunctions(void)
ntrPlgInitSharedFunctions		; CODE XREF: load_all_plugins_and_inject_ntr_into_pm+10p
					; init_all_plugins+4p
		LDR	R3, =p_config_memory
		LDR	R2, =showDbg
		LDR	R3, [R3]
		STR	R2, [R3,#0xA8]
		LDR	R2, =sendMsg
		STR	R2, [R3,#0xAC]
		LDR	R2, =plgRegisterMenuEntry
		STR	R2, [R3,#0xB0]
		LDR	R2, =plgGetSharedServiceHandle
		STR	R2, [R3,#0xB4]
		LDR	R2, =plgRequestMemory
		STR	R2, [R3,#0xB8]
		LDR	R2, =plgRegisterCallback
		STR	R2, [R3,#0xBC]
		LDR	R2, =xsprintf
		STR	R2, [R3,#0xC0]
		LDR	R2, =controlVideo
		STR	R2, [R3,#0xC4]
		LDR	R2, =plgGetIoBase
		STR	R2, [R3,#0xC8]
		BX	LR
; End of function ntrPlgInitSharedFunctions

; ---------------------------------------------------------------------------
off_105990	DCD p_config_memory	; DATA XREF: ntrPlgInitSharedFunctionsr
off_105994	DCD showDbg		; DATA XREF: ntrPlgInitSharedFunctions+4r
off_105998	DCD sendMsg		; DATA XREF: ntrPlgInitSharedFunctions+10r
off_10599C	DCD plgRegisterMenuEntry ; DATA	XREF: ntrPlgInitSharedFunctions+18r
off_1059A0	DCD plgGetSharedServiceHandle ;	DATA XREF: ntrPlgInitSharedFunctions+20r
off_1059A4	DCD plgRequestMemory	; DATA XREF: ntrPlgInitSharedFunctions+28r
off_1059A8	DCD plgRegisterCallback	; DATA XREF: ntrPlgInitSharedFunctions+30r
off_1059AC	DCD xsprintf		; DATA XREF: ntrPlgInitSharedFunctions+38r
off_1059B0	DCD controlVideo	; DATA XREF: ntrPlgInitSharedFunctions+40r
off_1059B4	DCD plgGetIoBase	; DATA XREF: ntrPlgInitSharedFunctions+48r

; =============== S U B	R O U T	I N E =======================================


; s32 __stdcall	socketNetConvertError(s32 sock_retval)
socketNetConvertError			; CODE XREF: socketOpen+5Cp
					; socketClose+44p ...
		CMP	R0, #0
		BXGE	LR
		CMN	R0, #0x4E
		BLS	loc_1059DC
		LDR	R2, =socketNetErrorCodeMap
		RSB	R3, R0,	#0
		LDRB	R3, [R2,R3]
		CMP	R3, #0
		BNE	loc_1059E8

loc_1059DC				; CODE XREF: socketNetConvertError+Cj
		SUB	R0, R0,	#0x2700
		SUB	R0, R0,	#0x10
		BX	LR
; ---------------------------------------------------------------------------

loc_1059E8				; CODE XREF: socketNetConvertError+20j
		RSB	R0, R3,	#0
		BX	LR
; End of function socketNetConvertError

; ---------------------------------------------------------------------------
off_1059F0	DCD socketNetErrorCodeMap ; DATA XREF: socketNetConvertError+10r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall socketCmd1(Handle memhandle,	u32 memsize)
socketCmd1				; CODE XREF: socketInitialize+54p
		STMFD	SP!, {R4-R6,LR}
		MOV	R6, R1
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x10044
		STMIA	R0, {R3,R6}
		MOV	R3, #0x20
		STR	R3, [R0,#8]
		MOV	R3, #0
		STR	R3, [R0,#0x10]
		LDR	R3, =socketHandle
		MOV	R4, R0
		STR	R5, [R0,#0x14]
		LDR	R0, [R3]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R4-R6,PC}
; End of function socketCmd1

; ---------------------------------------------------------------------------
dword_105A3C	DCD 0x10044		; DATA XREF: socketCmd1+10r
off_105A40	DCD socketHandle	; DATA XREF: socketCmd1+28r
; ---------------------------------------------------------------------------
		STMFD	SP!, {R3-R5,LR}
		BL	svcGetThreadCommandBuffer
		LDR	R5, =socketHandle
		MOV	R3, #0x190000
		STR	R3, [R0]
		MOV	R4, R0
		LDR	R0, [R5]
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R5,PC}
		LDR	R0, [R5]
		BL	svcCloseHandle
		LDR	R0, [R4,#4]
		LDMFD	SP!, {R3-R5,PC}
; ---------------------------------------------------------------------------
off_105A7C	DCD socketHandle	; DATA XREF: ROM:00105A4Cr

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall socketInitialize(u32	*context_addr, u32 context_size)
socketInitialize			; CODE XREF: ntrSetupNetworkDebugServer+B0p

otherpermission	= -0x18
memhandle	= -0xC
var_8		= -8

		STMFD	SP!, {R0-R4,LR}
		MOV	R2, R0
		ADD	R0, SP,	#0x18+var_8
		MOV	R3, #0		; mypermission
		MOV	R4, R1
		MOV	R1, #3
		STR	R3, [R0,#-4]!
		STR	R1, [SP,#0x18+otherpermission] ; otherpermission
		MOV	R1, R2		; addr
		MOV	R2, R4		; size
		BL	svcCreateMemoryBlock
		SUBS	R3, R0,	#0
		MOVNE	R0, R3		; handleptr
		BNE	loc_105AD8
		LDR	R1, =socketHandle ; out
		LDR	R2, =aSocU	; "soc:U"
		BL	srvGetServiceHandle
		CMP	R0, #0
		BNE	loc_105AD8
		LDR	R0, [SP,#0x18+memhandle] ; memhandle
		MOV	R1, R4		; memsize
		BL	socketCmd1

loc_105AD8				; CODE XREF: socketInitialize+34j
					; socketInitialize+48j
		ADD	SP, SP,	#0x10
		LDMFD	SP!, {R4,PC}
; End of function socketInitialize

; ---------------------------------------------------------------------------
; Handle *off_105AE0
off_105AE0	DCD socketHandle	; DATA XREF: socketInitialize+38r
; unsigned __int8 *off_105AE4
off_105AE4	DCD aSocU		; DATA XREF: socketInitialize+3Cr
					; "soc:U"

; =============== S U B	R O U T	I N E =======================================

; This should be get Error number however content mismatchs.

; int socketGetErrno(void)
socketGetErrno				; CODE XREF: recv_+44p	sub_104EC0+40p
		LDR	R3, =socketHandle
		LDR	R0, [R3,#(dword_10B494 - 0x10B490)]
		BX	LR
; End of function socketGetErrno

; ---------------------------------------------------------------------------
off_105AF4	DCD socketHandle	; DATA XREF: socketGetErrnor

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketOpen(int domain, int type, int protocol)
socketOpen				; CODE XREF: handle_network_client+14p
		STMFD	SP!, {R3-R7,LR}
		MOV	R5, R2
		MOV	R6, R1
		MOV	R7, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x200C2
		STR	R5, [R0,#0xC]
		LDR	R5, =socketHandle
		STMIA	R0, {R3,R7}
		MOV	R3, #0x20
		STR	R6, [R0,#8]
		STR	R3, [R0,#0x10]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R7,PC}
		LDR	R3, [R4,#4]
		CMP	R3, #0
		STR	R3, [R5,#4]
		BNE	loc_105B58
		LDR	R0, [R4,#8]	; sock_retval
		LDMFD	SP!, {R3-R7,LR}
		B	socketNetConvertError
; ---------------------------------------------------------------------------

loc_105B58				; CODE XREF: socketOpen+50j
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R7,PC}
; End of function socketOpen

; ---------------------------------------------------------------------------
dword_105B60	DCD 0x200C2		; DATA XREF: socketOpen+14r
off_105B64	DCD socketHandle	; DATA XREF: socketOpen+1Cr

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketClose(int	sockfd)
socketClose				; CODE XREF: handle_reload_packet+28p
					; handle_reload_packet+38p ...
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0xB0042
		STMIA	R0, {R3,R5}
		LDR	R5, =socketHandle
		MOV	R3, #0x20
		STR	R3, [R0,#8]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R5,PC}
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_105BB0
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_105BB0				; CODE XREF: socketClose+3Cj
		STR	R0, [R5,#4]
		MOVS	R0, R0
		MOVNE	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R5,PC}
; End of function socketClose

; ---------------------------------------------------------------------------
dword_105BC0	DCD 0xB0042		; DATA XREF: socketClose+Cr
off_105BC4	DCD socketHandle	; DATA XREF: socketClose+14r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketShutdown(int sockfd, int shutdown_type)
socketShutdown
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R1
		MOV	R6, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0xC0082
		STR	R5, [R0,#8]
		LDR	R5, =socketHandle
		STMIA	R0, {R3,R6}
		MOV	R3, #0x20
		STR	R3, [R0,#0xC]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R4-R6,PC}
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_105C18
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_105C18				; CODE XREF: socketShutdown+44j
		STR	R0, [R5,#4]
		MOVS	R0, R0
		MOVNE	R0, #0xFFFFFFFF
		LDMFD	SP!, {R4-R6,PC}
; End of function socketShutdown

; ---------------------------------------------------------------------------
dword_105C28	DCD 0xC0082		; DATA XREF: socketShutdown+10r
off_105C2C	DCD socketHandle	; DATA XREF: socketShutdown+18r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketListen(int sockfd, int max_connections)
socketListen				; CODE XREF: handle_network_client+7Cp
		STMFD	SP!, {R4-R6,LR}
		MOV	R5, R1
		MOV	R6, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x30082
		STR	R5, [R0,#8]
		LDR	R5, =socketHandle
		STMIA	R0, {R3,R6}
		MOV	R3, #0x20
		STR	R3, [R0,#0xC]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R4-R6,PC}
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_105C80
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_105C80				; CODE XREF: socketListen+44j
		STR	R0, [R5,#4]
		MOVS	R0, R0
		MOVNE	R0, #0xFFFFFFFF
		LDMFD	SP!, {R4-R6,PC}
; End of function socketListen

; ---------------------------------------------------------------------------
dword_105C90	DCD 0x30082		; DATA XREF: socketListen+10r
off_105C94	DCD socketHandle	; DATA XREF: socketListen+18r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketAccept(int sockfd, struct	sockaddr *addr,	int *addrlen)
socketAccept				; CODE XREF: handle_network_client+F4p

var_44		= -0x44
var_43		= -0x43

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x24
		MOV	R6, R0
		MOV	R8, R1
		MOV	R9, R2
		BL	svcGetThreadCommandBuffer
		ADD	R7, SP,	#0x48+var_44
		MOV	R4, #0x1C
		MOV	R1, #0
		MOV	R2, R4
		MOV	R5, R0
		MOV	R0, R7
		BL	memset
		LDR	R3, =0x40082
		LDR	R11, [R5,#0x100]
		LDR	R10, [R5,#0x104]
		STMIA	R5, {R3,R6}
		MOV	R3, #0x20
		LDR	R6, =socketHandle
		STR	R3, [R5,#0xC]
		LDR	R3, =0x70002
		STR	R4, [R5,#8]
		STR	R3, [R5,#0x100]
		STR	R7, [R5,#0x104]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_105D88
		LDR	R4, [R5,#4]
		STR	R11, [R5,#0x100]
		CMP	R4, #0
		STR	R10, [R5,#0x104]
		BNE	loc_105D28
		LDR	R0, [R5,#8]	; sock_retval
		BL	socketNetConvertError
		MOV	R4, R0

loc_105D28				; CODE XREF: socketAccept+80j
		CMP	R4, #0
		MVN	R3, R4
		STRLT	R4, [R6,#4]
		CMP	R8, #0
		MOV	R3, R3,LSR#31
		MOVEQ	R3, #0
		CMP	R3, #0
		BEQ	loc_105D7C
		LDRB	R3, [SP,#0x48+var_43]
		LDR	R2, [R9]
		ADD	R0, R8,	#2
		STRH	R3, [R8]
		LDRB	R3, [SP,#0x48+var_44]
		ADD	R1, R7,	#2
		CMP	R2, R3
		STRGT	R3, [R9]
		LDR	R2, [R9]
		SUB	R2, R2,	#2
		BL	memcpy
		MOV	R0, R4
		B	loc_105D88
; ---------------------------------------------------------------------------

loc_105D7C				; CODE XREF: socketAccept+ACj
		CMP	R4, #0
		MOVGE	R0, R4
		MOVLT	R0, #0xFFFFFFFF

loc_105D88				; CODE XREF: socketAccept+6Cj
					; socketAccept+E0j
		ADD	SP, SP,	#0x24
		LDMFD	SP!, {R4-R11,PC}
; End of function socketAccept

; ---------------------------------------------------------------------------
dword_105D90	DCD 0x40082		; DATA XREF: socketAccept+34r
off_105D94	DCD socketHandle	; DATA XREF: socketAccept+48r
dword_105D98	DCD 0x70002		; DATA XREF: socketAccept+50r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketBind(int sockfd, const struct sockaddr *addr, int	addrlen)
socketBind				; CODE XREF: handle_network_client+64p

var_3C		= -0x3C
var_3B		= -0x3B

		STMFD	SP!, {R4-R9,LR}
		SUB	SP, SP,	#0x24
		MOV	R6, R2
		MOV	R8, R1
		MOV	R9, R0
		BL	svcGetThreadCommandBuffer
		ADD	R7, SP,	#0x40+var_3C
		MOV	R1, #0
		MOV	R2, #0x1C
		MOV	R5, R0
		MOV	R0, R7
		BL	memset
		LDRH	R3, [R8]
		CMP	R3, #2
		MOVEQ	R4, #8
		MOVNE	R4, #0x1C
		CMP	R6, R4
		LDR	R6, =socketHandle
		MOVLT	R3, #0xFFFFFFEA
		MOVLT	R0, #0xFFFFFFFF
		STRLT	R3, [R6,#(dword_10B494 - 0x10B490)]
		BLT	loc_105E5C
		SUB	R2, R4,	#2
		ADD	R1, R8,	#2
		ADD	R0, R7,	#2
		STRB	R4, [SP,#0x40+var_3C]
		STRB	R3, [SP,#0x40+var_3B]
		BL	memcpy
		LDR	R3, =0x50084
		STR	R4, [R5,#8]
		MOV	R4, R4,LSL#14
		STMIA	R5, {R3,R9}
		ORR	R4, R4,	#2
		MOV	R3, #0x20
		STR	R3, [R5,#0xC]
		STR	R4, [R5,#0x14]
		STR	R7, [R5,#0x18]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_105E5C
		LDR	R0, [R5,#4]
		CMP	R0, #0
		BNE	loc_105E54
		LDR	R0, [R5,#8]	; sock_retval
		BL	socketNetConvertError

loc_105E54				; CODE XREF: socketBind+ACj
		STR	R0, [R6,#4]
		MOV	R0, R0,ASR#31

loc_105E5C				; CODE XREF: socketBind+54j
					; socketBind+A0j
		ADD	SP, SP,	#0x24
		LDMFD	SP!, {R4-R9,PC}
; End of function socketBind

; ---------------------------------------------------------------------------
off_105E64	DCD socketHandle	; DATA XREF: socketBind+44r
dword_105E68	DCD 0x50084		; DATA XREF: socketBind+70r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketConnect(int sockfd, const	struct sockaddr	*addr, int addrlen)
socketConnect

var_3C		= -0x3C
var_3B		= -0x3B

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x20
		MOV	R9, R1
		MOV	R8, R2
		MOV	R10, R0
		BL	svcGetThreadCommandBuffer
		ADD	R7, SP,	#0x40+var_3C
		MOV	R1, #0
		MOV	R2, #0x1C
		LDR	R6, =socketHandle
		MOV	R4, R0
		MOV	R0, R7
		BL	memset
		LDRH	R3, [R9]
		CMP	R3, #2
		MOVEQ	R5, #8
		MOVNE	R5, #0x1C
		CMP	R8, R5
		MOVLT	R3, #0xFFFFFFEA
		STRLT	R3, [R6,#(dword_10B494 - 0x10B490)]
		MOVLT	R0, #0xFFFFFFFF
		BLT	loc_105F2C
		SUB	R2, R5,	#2
		ADD	R1, R9,	#2
		ADD	R0, R7,	#2
		STRB	R5, [SP,#0x40+var_3C]
		STRB	R3, [SP,#0x40+var_3B]
		BL	memcpy
		LDR	R3, =0x60084
		MOV	R5, R5,LSL#14
		ORR	R5, R5,	#2
		STMIA	R4, {R3,R10}
		MOV	R3, #0x20
		STR	R8, [R4,#8]
		STR	R3, [R4,#0xC]
		STR	R5, [R4,#0x14]
		STR	R7, [R4,#0x18]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_105F2C
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_105F24
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_105F24				; CODE XREF: socketConnect+ACj
		STR	R0, [R6,#4]
		MOV	R0, R0,ASR#31

loc_105F2C				; CODE XREF: socketConnect+54j
					; socketConnect+A0j
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R10,PC}
; End of function socketConnect

; ---------------------------------------------------------------------------
off_105F34	DCD socketHandle	; DATA XREF: socketConnect+24r
dword_105F38	DCD 0x60084		; DATA XREF: socketConnect+70r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketIpcCmd7RecvFromOther(int sockfd, void *buf, int len, int flags, struct sockaddr *src_addr, int *addrlen)
socketIpcCmd7RecvFromOther		; CODE XREF: socketRecvFrom+28p

var_44		= -0x44
var_43		= -0x43
src_addr	=  0
addrlen		=  4

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x24
		MOV	R10, R3
		MOV	R9, R1
		MOV	R5, R2
		MOV	R11, R0
		LDR	R6, [SP,#0x48+src_addr]
		LDR	R8, [SP,#0x48+addrlen]
		BL	svcGetThreadCommandBuffer
		ADD	R7, SP,	#0x48+var_44
		MOV	R1, #0
		MOV	R2, #0x1C
		MOV	R4, R0
		MOV	R0, R7
		BL	memset
		CMP	R6, #0
		MOVNE	R12, #0x1C
		MOVEQ	R12, #0
		LDR	R3, =0x70104
		STR	R9, [R4,#0x20]
		LDR	R9, =socketHandle
		STR	R5, [R4,#8]
		MOV	R5, R5,LSL#4
		STMIA	R4, {R3,R11}
		ORR	R5, R5,	#0xC
		MOV	R3, #0x20
		STR	R10, [R4,#0xC]
		LDR	R11, [R4,#0x100]
		LDR	R10, [R4,#0x104]
		STR	R3, [R4,#0x14]
		STR	R5, [R4,#0x1C]
		STR	R7, [R4,#0x104]
		LDR	R0, [R9]	; session
		STR	R12, [R4,#0x10]
		MOV	R12, R12,LSL#14
		ORR	R12, R12, #2
		STR	R12, [R4,#0x100]
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_106050
		LDR	R5, [R4,#4]
		STR	R11, [R4,#0x100]
		CMP	R5, #0
		STR	R10, [R4,#0x104]
		BNE	loc_105FFC
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError
		MOV	R5, R0

loc_105FFC				; CODE XREF: socketIpcCmd7RecvFromOther+B0j
		CMP	R5, #0
		STRLT	R5, [R9,#4]
		CMP	R6, #0
		CMPNE	R5, #0
		BLE	loc_106044
		LDRB	R3, [SP,#0x48+var_43]
		LDR	R2, [R8]
		ADD	R0, R6,	#2
		STRH	R3, [R6]
		LDRB	R3, [SP,#0x48+var_44]
		ADD	R1, R7,	#2
		CMP	R2, R3
		STRGT	R3, [R8]
		LDR	R2, [R8]
		SUB	R2, R2,	#2
		BL	memcpy
		MOV	R0, R5
		B	loc_106050
; ---------------------------------------------------------------------------

loc_106044				; CODE XREF: socketIpcCmd7RecvFromOther+D0j
		CMP	R5, #0
		MOVGE	R0, R5
		MOVLT	R0, #0xFFFFFFFF

loc_106050				; CODE XREF: socketIpcCmd7RecvFromOther+9Cj
					; socketIpcCmd7RecvFromOther+104j
		ADD	SP, SP,	#0x24
		LDMFD	SP!, {R4-R11,PC}
; End of function socketIpcCmd7RecvFromOther

; ---------------------------------------------------------------------------
dword_106058	DCD 0x70104		; DATA XREF: socketIpcCmd7RecvFromOther+48r
off_10605C	DCD socketHandle	; DATA XREF: socketIpcCmd7RecvFromOther+50r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketIpcCmd8RecvFrom(int sockfd, void *buf, int len, int flags, struct	sockaddr *src_addr, int	*addrlen)
socketIpcCmd8RecvFrom			; CODE XREF: socketRecvFrom+18p

var_54		= -0x54
var_50		= -0x50
var_4C		= -0x4C
var_44		= -0x44
var_43		= -0x43
src_addr	=  0
addrlen		=  4

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x34
		MOV	R10, R3
		MOV	R6, R2
		MOV	R11, R0
		STR	R1, [SP,#0x58+var_4C]
		LDR	R7, [SP,#0x58+src_addr]
		LDR	R9, [SP,#0x58+addrlen]
		BL	svcGetThreadCommandBuffer
		ADD	R8, SP,	#0x58+var_44
		CMP	R7, #0
		MOV	R1, #0
		MOV	R2, #0x1C
		MOVNE	R5, #0x1C
		MOVEQ	R5, #0
		MOV	R4, R0
		MOV	R0, R8
		BL	memset
		LDR	R3, =0x80102
		STR	R6, [R4,#8]
		MOV	R6, R6,LSL#14
		ORR	R6, R6,	#2
		LDR	R2, [R4,#0x100]
		STR	R6, [R4,#0x100]
		LDR	R6, =socketHandle
		STMIA	R4, {R3,R11}
		STR	R5, [R4,#0x10]
		MOV	R3, #0x20
		LDR	R12, [SP,#0x58+var_4C]
		MOV	R5, R5,LSL#14
		STR	R3, [R4,#0x14]
		ORR	R5, R5,	#2
		LDR	R3, [R4,#0x104]
		STR	R10, [R4,#0xC]
		LDR	R11, [R4,#0x108]
		LDR	R10, [R4,#0x10C]
		STR	R12, [R4,#0x104]
		STR	R5, [R4,#0x108]
		STR	R8, [R4,#0x10C]
		LDR	R0, [R6]	; session
		STR	R2, [SP,#0x58+var_50]
		STR	R3, [SP,#0x58+var_54]
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_106198
		LDR	R5, [R4,#4]
		LDR	R2, [SP,#0x58+var_50]
		LDR	R3, [SP,#0x58+var_54]
		CMP	R5, #0
		STR	R2, [R4,#0x100]
		STR	R3, [R4,#0x104]
		STR	R11, [R4,#0x108]
		STR	R10, [R4,#0x10C]
		BNE	loc_106144
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError
		MOV	R5, R0

loc_106144				; CODE XREF: socketIpcCmd8RecvFrom+D4j
		CMP	R5, #0
		STRLT	R5, [R6,#4]
		CMP	R7, #0
		CMPNE	R5, #0
		BLE	loc_10618C
		LDRB	R3, [SP,#0x58+var_43]
		LDR	R2, [R9]
		ADD	R0, R7,	#2
		STRH	R3, [R7]
		LDRB	R3, [SP,#0x58+var_44]
		ADD	R1, R8,	#2
		CMP	R2, R3
		STRGT	R3, [R9]
		LDR	R2, [R9]
		SUB	R2, R2,	#2
		BL	memcpy
		MOV	R0, R5
		B	loc_106198
; ---------------------------------------------------------------------------

loc_10618C				; CODE XREF: socketIpcCmd8RecvFrom+F4j
		CMP	R5, #0
		MOVGE	R0, R5
		MOVLT	R0, #0xFFFFFFFF

loc_106198				; CODE XREF: socketIpcCmd8RecvFrom+B0j
					; socketIpcCmd8RecvFrom+128j
		ADD	SP, SP,	#0x34
		LDMFD	SP!, {R4-R11,PC}
; End of function socketIpcCmd8RecvFrom

; ---------------------------------------------------------------------------
dword_1061A0	DCD 0x80102		; DATA XREF: socketIpcCmd8RecvFrom+48r
off_1061A4	DCD socketHandle	; DATA XREF: socketIpcCmd8RecvFrom+60r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketIpcCmd9SendToOther(int sockfd, const void	*buf, int len, int flags, const	struct sockaddr	*dest_addr, int	addrlen)
socketIpcCmd9SendToOther		; CODE XREF: socketSendTo+28p

var_4C		= -0x4C
var_44		= -0x44
var_43		= -0x43
dest_addr	=  0
addrlen		=  4

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x2C
		MOV	R10, R3
		LDR	R3, [SP,#0x50+dest_addr]
		MOV	R8, R1
		STR	R3, [SP,#0x50+var_4C]
		MOV	R7, R2
		MOV	R11, R0
		BL	svcGetThreadCommandBuffer
		ADD	R9, SP,	#0x50+var_44
		MOV	R1, #0
		MOV	R2, #0x1C
		LDR	R6, =socketHandle
		MOV	R4, R0
		MOV	R0, R9
		BL	memset
		LDR	R3, [SP,#0x50+var_4C]
		CMP	R3, #0
		BEQ	loc_106234
		LDRH	R2, [R3]
		LDR	R1, [SP,#0x50+addrlen]
		CMP	R2, #2
		MOVEQ	R5, #8
		MOVNE	R5, #0x1C
		CMP	R1, R5
		MOVCC	R3, #0xFFFFFFEA
		STRCC	R3, [R6,#(dword_10B494 - 0x10B490)]
		BCC	loc_1062A8
		STRB	R2, [SP,#0x50+var_43]
		ADD	R0, R9,	#2
		ADD	R1, R3,	#2
		SUB	R2, R5,	#2
		STRB	R5, [SP,#0x50+var_44]
		BL	memcpy
		B	loc_106238
; ---------------------------------------------------------------------------

loc_106234				; CODE XREF: socketIpcCmd9SendToOther+48j
		MOV	R5, R3

loc_106238				; CODE XREF: socketIpcCmd9SendToOther+88j
		LDR	R3, =0x90106
		STR	R5, [R4,#0x10]
		MOV	R5, R5,LSL#14
		STR	R7, [R4,#8]
		ORR	R5, R5,	#0x400
		MOV	R7, R7,LSL#4
		STMIA	R4, {R3,R11}
		ORR	R5, R5,	#2
		MOV	R3, #0x20
		ORR	R7, R7,	#0xA
		STR	R10, [R4,#0xC]
		STR	R3, [R4,#0x14]
		STR	R5, [R4,#0x1C]
		STR	R9, [R4,#0x20]
		STR	R7, [R4,#0x24]
		STR	R8, [R4,#0x28]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_1062AC
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_10629C
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_10629C				; CODE XREF: socketIpcCmd9SendToOther+E8j
		CMP	R0, #0
		BGE	loc_1062AC
		STR	R0, [R6,#4]

loc_1062A8				; CODE XREF: socketIpcCmd9SendToOther+6Cj
		MOV	R0, #0xFFFFFFFF

loc_1062AC				; CODE XREF: socketIpcCmd9SendToOther+DCj
					; socketIpcCmd9SendToOther+F8j
		ADD	SP, SP,	#0x2C
		LDMFD	SP!, {R4-R11,PC}
; End of function socketIpcCmd9SendToOther

; ---------------------------------------------------------------------------
off_1062B4	DCD socketHandle	; DATA XREF: socketIpcCmd9SendToOther+30r
dword_1062B8	DCD 0x90106		; DATA XREF: socketIpcCmd9SendToOther:loc_106238r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketIpcCmdASendTo(int	sockfd,	const void *buf, int len, int flags, const struct sockaddr *dest_addr, int addrlen)
socketIpcCmdASendTo			; CODE XREF: socketSendTo+18p

var_4C		= -0x4C
var_44		= -0x44
var_43		= -0x43
dest_addr	=  0
addrlen		=  4

		STMFD	SP!, {R4-R11,LR}
		SUB	SP, SP,	#0x2C
		MOV	R10, R3
		LDR	R3, [SP,#0x50+dest_addr]
		MOV	R9, R1
		STR	R3, [SP,#0x50+var_4C]
		MOV	R7, R2
		MOV	R11, R0
		BL	svcGetThreadCommandBuffer
		ADD	R8, SP,	#0x50+var_44
		MOV	R1, #0
		MOV	R2, #0x1C
		LDR	R6, =socketHandle
		MOV	R4, R0
		MOV	R0, R8
		BL	memset
		LDR	R3, [SP,#0x50+var_4C]
		CMP	R3, #0
		BEQ	loc_106348
		LDRH	R2, [R3]
		LDR	R1, [SP,#0x50+addrlen]
		CMP	R2, #2
		MOVEQ	R5, #8
		MOVNE	R5, #0x1C
		CMP	R1, R5
		MOVCC	R3, #0xFFFFFFEA
		STRCC	R3, [R6,#(dword_10B494 - 0x10B490)]
		BCC	loc_1063C0
		STRB	R2, [SP,#0x50+var_43]
		ADD	R0, R8,	#2
		ADD	R1, R3,	#2
		SUB	R2, R5,	#2
		STRB	R5, [SP,#0x50+var_44]
		BL	memcpy
		B	loc_10634C
; ---------------------------------------------------------------------------

loc_106348				; CODE XREF: socketIpcCmdASendTo+48j
		MOV	R5, R3

loc_10634C				; CODE XREF: socketIpcCmdASendTo+88j
		LDR	R3, =0xA0106
		STR	R7, [R4,#8]
		STR	R5, [R4,#0x10]
		MOV	R7, R7,LSL#14
		MOV	R5, R5,LSL#14
		ORR	R7, R7,	#0x800
		ORR	R5, R5,	#0x400
		STMIA	R4, {R3,R11}
		ORR	R7, R7,	#2
		MOV	R3, #0x20
		ORR	R5, R5,	#2
		STR	R10, [R4,#0xC]
		STR	R3, [R4,#0x14]
		STR	R7, [R4,#0x1C]
		STR	R9, [R4,#0x20]
		STR	R5, [R4,#0x24]
		STR	R8, [R4,#0x28]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_1063C4
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_1063B4
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_1063B4				; CODE XREF: socketIpcCmdASendTo+ECj
		CMP	R0, #0
		BGE	loc_1063C4
		STR	R0, [R6,#4]

loc_1063C0				; CODE XREF: socketIpcCmdASendTo+6Cj
		MOV	R0, #0xFFFFFFFF

loc_1063C4				; CODE XREF: socketIpcCmdASendTo+E0j
					; socketIpcCmdASendTo+FCj
		ADD	SP, SP,	#0x2C
		LDMFD	SP!, {R4-R11,PC}
; End of function socketIpcCmdASendTo

; ---------------------------------------------------------------------------
off_1063CC	DCD socketHandle	; DATA XREF: socketIpcCmdASendTo+30r
dword_1063D0	DCD 0xA0106		; DATA XREF: socketIpcCmdASendTo:loc_10634Cr

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketRecvFrom(int sockfd, void	*buf, int len, int flags, struct sockaddr *src_addr, int *addrlen)
socketRecvFrom				; CODE XREF: socketRecv+10p

var_4		= -4
src_addr	=  0
addrlen		=  4

		STR	LR, [SP,#var_4]!
		CMP	R2, #0x2000
		LDR	LR, [SP,#4+src_addr]
		LDR	R12, [SP,#4+addrlen]
		BGE	loc_1063F0
		LDR	LR, [SP+4+var_4],#4
		B	socketIpcCmd8RecvFrom
; ---------------------------------------------------------------------------

loc_1063F0				; CODE XREF: socketRecvFrom+10j
		STR	LR, [SP,#4+src_addr] ; src_addr
		STR	R12, [SP,#4+addrlen] ; addrlen
		LDR	LR, [SP+4+var_4],#4
		B	socketIpcCmd7RecvFromOther
; End of function socketRecvFrom


; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketSendTo(int sockfd, const void *buf, int len, int flags, const struct sockaddr *dest_addr,	int addrlen)
socketSendTo				; CODE XREF: socketSend+10p

var_4		= -4
dest_addr	=  0
addrlen		=  4

		STR	LR, [SP,#var_4]!
		CMP	R2, #0x2000
		LDR	LR, [SP,#4+dest_addr]
		LDR	R12, [SP,#4+addrlen]
		BGE	loc_10641C
		LDR	LR, [SP+4+var_4],#4
		B	socketIpcCmdASendTo
; ---------------------------------------------------------------------------

loc_10641C				; CODE XREF: socketSendTo+10j
		STR	LR, [SP,#4+dest_addr] ;	dest_addr
		STR	R12, [SP,#4+addrlen] ; addrlen
		LDR	LR, [SP+4+var_4],#4
		B	socketIpcCmd9SendToOther
; End of function socketSendTo


; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketRecv(int sockfd, void *buf, int len, int flags)
socketRecv				; CODE XREF: recv_+30p

src_addr	= -0x10
addrlen		= -0xC
var_4		= -4

		MOV	R12, #0
		STMFD	SP!, {R0-R2,LR}
		STR	R12, [SP,#0x10+src_addr] ; src_addr
		STR	R12, [SP,#0x10+addrlen]	; addrlen
		BL	socketRecvFrom
		ADD	SP, SP,	#0xC
		LDR	PC, [SP+4+var_4],#4
; End of function socketRecv


; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketSend(int sockfd, const void *buf,	int len, int flags)
socketSend				; CODE XREF: sub_104EC0+30p

dest_addr	= -0x10
addrlen		= -0xC
var_4		= -4

		MOV	R12, #0
		STMFD	SP!, {R0-R2,LR}
		STR	R12, [SP,#0x10+dest_addr] ; dest_addr
		STR	R12, [SP,#0x10+addrlen]	; addrlen
		BL	socketSendTo
		ADD	SP, SP,	#0xC
		LDR	PC, [SP+4+var_4],#4
; End of function socketSend


; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketGetSockOpt(int sockfd, int level,	int option_name, void *data, int *data_len)
socketGetSockOpt

data_len	=  0

		STMFD	SP!, {R3-R9,LR}
		MOV	R8, R1
		MOV	R7, R2
		MOV	R5, R3
		MOV	R9, R0
		LDR	R6, [SP,#0x20+data_len]
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x110102
		LDR	R2, [R6]
		STR	R7, [R0,#0xC]
		LDR	R7, [R0,#0x104]
		STR	R5, [R0,#0x104]
		LDR	R5, =socketHandle
		STR	R2, [R0,#0x10]
		MOV	R2, R2,LSL#14
		STMIA	R0, {R3,R9}
		ORR	R2, R2,	#2
		MOV	R3, #0x20
		STR	R8, [R0,#8]
		STR	R3, [R0,#0x14]
		LDR	R8, [R0,#0x100]
		MOV	R4, R0
		STR	R2, [R0,#0x100]
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R9,PC}
		LDR	R0, [R4,#4]
		STR	R8, [R4,#0x100]
		CMP	R0, #0
		STR	R7, [R4,#0x104]
		BNE	loc_10650C
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError
		CMP	R0, #0
		BGE	loc_106500

loc_1064F4				; CODE XREF: socketGetSockOpt:loc_10650Cj
		STR	R0, [R5,#4]
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R9,PC}
; ---------------------------------------------------------------------------

loc_106500				; CODE XREF: socketGetSockOpt+8Cj
		LDREQ	R3, [R4,#0xC]
		STREQ	R3, [R6]
		LDMFD	SP!, {R3-R9,PC}
; ---------------------------------------------------------------------------

loc_10650C				; CODE XREF: socketGetSockOpt+7Cj
		BLT	loc_1064F4
		LDMFD	SP!, {R3-R9,PC}
; End of function socketGetSockOpt

; ---------------------------------------------------------------------------
dword_106514	DCD 0x110102		; DATA XREF: socketGetSockOpt+1Cr
off_106518	DCD socketHandle	; DATA XREF: socketGetSockOpt+30r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketSetSockOpt(int sockfd, int level,	int option_name, const void *data, int data_len)
socketSetSockOpt

data_len	=  0

		STMFD	SP!, {R3-R9,LR}
		MOV	R8, R1
		MOV	R7, R2
		MOV	R6, R3
		LDR	R5, [SP,#0x20+data_len]
		MOV	R9, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x120104
		STR	R5, [R0,#0x10]
		MOV	R5, R5,LSL#14
		ORR	R5, R5,	#0x2400
		ORR	R5, R5,	#2
		STR	R5, [R0,#0x1C]
		LDR	R5, =socketHandle
		STMIA	R0, {R3,R9}
		MOV	R3, #0x20
		STR	R8, [R0,#8]
		STR	R7, [R0,#0xC]
		STR	R3, [R0,#0x14]
		STR	R6, [R0,#0x20]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R9,PC}
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_106594
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_106594				; CODE XREF: socketSetSockOpt+6Cj
		CMP	R0, #0
		STRLT	R0, [R5,#4]
		MOVLT	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R9,PC}
; End of function socketSetSockOpt

; ---------------------------------------------------------------------------
dword_1065A4	DCD 0x120104		; DATA XREF: socketSetSockOpt+1Cr
off_1065A8	DCD socketHandle	; DATA XREF: socketSetSockOpt+34r

; =============== S U B	R O U T	I N E =======================================


; int socketFcntl(int sockfd, int cmd, ...)
socketFcntl

var_24		= -0x24
varg_r1		= -0xC
varg_r2		= -8
varg_r3		= -4

		STMFD	SP!, {R1-R3}
		STMFD	SP!, {R0,R1,R4-R7,LR}
		MOV	R7, R0
		LDR	R6, [SP,#0x28+varg_r1]
		BL	svcGetThreadCommandBuffer
		SUB	R2, R6,	#3
		ADD	R3, SP,	#0x28+varg_r2
		CMP	R2, #1
		STR	R3, [SP,#0x28+var_24]
		LDR	R5, =socketHandle
		BLS	loc_1065E4

loc_1065D8				; CODE XREF: socketFcntl+58j
		MOV	R3, #0xFFFFFFEA
		STR	R3, [R5,#(dword_10B494 - 0x10B490)]
		B	loc_106658
; ---------------------------------------------------------------------------

loc_1065E4				; CODE XREF: socketFcntl+28j
		CMP	R6, #4
		MOV	R4, R0
		MOVNE	R3, #0
		BNE	loc_106610
		LDR	R3, [R3]
		ADD	R2, SP,	#0x28+varg_r3
		STR	R2, [SP,#0x28+var_24]
		BICS	R2, R3,	#0x4000
		BNE	loc_1065D8
		CMP	R3, #0x4000
		MOVEQ	R3, #4

loc_106610				; CODE XREF: socketFcntl+44j
		LDR	R2, =0x1300C2
		STR	R3, [R4,#0xC]
		MOV	R3, #0x20
		STMIA	R4, {R2,R7}
		STR	R6, [R4,#8]
		STR	R3, [R4,#0x10]
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_10665C
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_10664C
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_10664C				; CODE XREF: socketFcntl+94j
		CMP	R0, #0
		BGE	loc_10665C
		STR	R0, [R5,#4]

loc_106658				; CODE XREF: socketFcntl+34j
		MOV	R0, #0xFFFFFFFF

loc_10665C				; CODE XREF: socketFcntl+88j
					; socketFcntl+A4j
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4-R7,LR}
		ADD	SP, SP,	#0xC
		BX	LR
; End of function socketFcntl

; ---------------------------------------------------------------------------
off_10666C	DCD socketHandle	; DATA XREF: socketFcntl+24r
dword_106670	DCD 0x1300C2		; DATA XREF: socketFcntl:loc_106610r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketAtMark(int sockfd)
socketAtMark
		STMFD	SP!, {R3-R5,LR}
		MOV	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x150042
		STMIA	R0, {R3,R5}
		LDR	R5, =socketHandle
		MOV	R3, #0x20
		STR	R3, [R0,#8]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R3-R5,PC}
		LDR	R0, [R4,#4]
		CMP	R0, #0
		BNE	loc_1066BC
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError

loc_1066BC				; CODE XREF: socketAtMark+3Cj
		CMP	R0, #0
		STRLT	R0, [R5,#4]
		MOVLT	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R5,PC}
; End of function socketAtMark

; ---------------------------------------------------------------------------
dword_1066CC	DCD 0x150042		; DATA XREF: socketAtMark+Cr
off_1066D0	DCD socketHandle	; DATA XREF: socketAtMark+14r

; =============== S U B	R O U T	I N E =======================================


; __int32 __stdcall socketGetHostId()
socketGetHostId
		STMFD	SP!, {R4,LR}
		BL	svcGetThreadCommandBuffer
		MOV	R3, #0x160000
		STR	R3, [R0]
		LDR	R3, =socketHandle
		MOV	R4, R0
		LDR	R0, [R3]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDMNEFD	SP!, {R4,PC}
		LDR	R3, [R4,#4]
		CMP	R3, #0
		LDREQ	R0, [R4,#8]
		MOVNE	R0, R3
		LDMFD	SP!, {R4,PC}
; End of function socketGetHostId

; ---------------------------------------------------------------------------
off_106710	DCD socketHandle	; DATA XREF: socketGetHostId+10r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketGetSockName(int sockfd, struct sockaddr *addr, int *addr_len)
socketGetSockName

var_3C		= -0x3C
var_3B		= -0x3B

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x20
		MOV	R5, R0
		MOV	R6, R1
		MOV	R7, R2
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x170082
		ADD	R8, SP,	#0x40+var_3C
		STMIA	R0, {R3,R5}
		MOV	R3, #0x1C
		STR	R3, [R0,#8]
		LDR	R5, =socketHandle
		MOV	R3, #0x20
		STR	R3, [R0,#0xC]
		LDR	R3, =0x70002
		LDR	R10, [R0,#0x100]
		LDR	R9, [R0,#0x104]
		STR	R3, [R0,#0x100]
		STR	R8, [R0,#0x104]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_1067F0
		LDR	R0, [R4,#4]
		STR	R10, [R4,#0x100]
		CMP	R0, #0
		STR	R9, [R4,#0x104]
		BNE	loc_1067EC
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError
		CMP	R0, #0
		BGE	loc_1067A4

loc_106798				; CODE XREF: socketGetSockName:loc_1067ECj
		STR	R0, [R5,#(dword_10B494 - 0x10B490)]
		MOV	R0, #0xFFFFFFFF
		B	loc_1067F0
; ---------------------------------------------------------------------------

loc_1067A4				; CODE XREF: socketGetSockName+80j
		BNE	loc_1067F0
		LDRB	R3, [SP,#0x40+var_3B]
		LDR	R2, [R7]
		MOV	R1, #0
		STRH	R3, [R6]
		LDRB	R3, [SP,#0x40+var_3C]
		MOV	R0, R6
		CMP	R2, R3
		STRGT	R3, [R7]
		MOV	R2, #0x10
		BL	memset
		LDR	R2, [R7]
		ADD	R0, R6,	#2
		ADD	R1, R8,	#2
		SUB	R2, R2,	#2
		BL	memcpy
		MOV	R0, #0
		B	loc_1067F0
; ---------------------------------------------------------------------------

loc_1067EC				; CODE XREF: socketGetSockName+70j
		BLT	loc_106798

loc_1067F0				; CODE XREF: socketGetSockName+5Cj
					; socketGetSockName+8Cj ...
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R10,PC}
; End of function socketGetSockName

; ---------------------------------------------------------------------------
dword_1067F8	DCD 0x170082		; DATA XREF: socketGetSockName+18r
off_1067FC	DCD socketHandle	; DATA XREF: socketGetSockName+2Cr
dword_106800	DCD 0x70002		; DATA XREF: socketGetSockName+38r

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	socketGetPeerName(int sockfd, struct sockaddr *addr, int *addr_len)
socketGetPeerName

var_3C		= -0x3C
var_3B		= -0x3B

		STMFD	SP!, {R4-R10,LR}
		SUB	SP, SP,	#0x20
		MOV	R5, R0
		MOV	R6, R1
		MOV	R7, R2
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x180082
		ADD	R8, SP,	#0x40+var_3C
		STMIA	R0, {R3,R5}
		MOV	R3, #0x1C
		STR	R3, [R0,#8]
		LDR	R5, =socketHandle
		MOV	R3, #0x20
		STR	R3, [R0,#0xC]
		LDR	R3, =0x70002
		LDR	R10, [R0,#0x100]
		LDR	R9, [R0,#0x104]
		STR	R3, [R0,#0x100]
		STR	R8, [R0,#0x104]
		MOV	R4, R0
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		BNE	loc_1068E0
		LDR	R0, [R4,#4]
		STR	R10, [R4,#0x100]
		CMP	R0, #0
		STR	R9, [R4,#0x104]
		BNE	loc_1068DC
		LDR	R0, [R4,#8]	; sock_retval
		BL	socketNetConvertError
		CMP	R0, #0
		BGE	loc_106894

loc_106888				; CODE XREF: socketGetPeerName:loc_1068DCj
		STR	R0, [R5,#(dword_10B494 - 0x10B490)]
		MOV	R0, #0xFFFFFFFF
		B	loc_1068E0
; ---------------------------------------------------------------------------

loc_106894				; CODE XREF: socketGetPeerName+80j
		BNE	loc_1068E0
		LDRB	R3, [SP,#0x40+var_3B]
		LDR	R2, [R7]
		MOV	R1, #0
		STRH	R3, [R6]
		LDRB	R3, [SP,#0x40+var_3C]
		MOV	R0, R6
		CMP	R2, R3
		STRGT	R3, [R7]
		MOV	R2, #0x10
		BL	memset
		LDR	R2, [R7]
		ADD	R0, R6,	#2
		ADD	R1, R8,	#2
		SUB	R2, R2,	#2
		BL	memcpy
		MOV	R0, #0
		B	loc_1068E0
; ---------------------------------------------------------------------------

loc_1068DC				; CODE XREF: socketGetPeerName+70j
		BLT	loc_106888

loc_1068E0				; CODE XREF: socketGetPeerName+5Cj
					; socketGetPeerName+8Cj ...
		ADD	SP, SP,	#0x20
		LDMFD	SP!, {R4-R10,PC}
; End of function socketGetPeerName

; ---------------------------------------------------------------------------
dword_1068E8	DCD 0x180082		; DATA XREF: socketGetPeerName+18r
off_1068EC	DCD socketHandle	; DATA XREF: socketGetPeerName+2Cr
dword_1068F0	DCD 0x70002		; DATA XREF: socketGetPeerName+38r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall srvExit()
srvExit					; CODE XREF: close_all_srv_handles_+Cp
		LDR	R3, =srcHandle
		STMFD	SP!, {R4,LR}
		MOV	R4, R3
		LDR	R0, [R3]	; handle
		CMP	R0, #0
		BEQ	loc_106910
		BL	svcCloseHandle

loc_106910				; CODE XREF: srvExit+14j
		MOV	R3, #0
		STR	R3, [R4]
		LDMFD	SP!, {R4,PC}
; End of function srvExit

; ---------------------------------------------------------------------------
off_10691C	DCD srcHandle		; DATA XREF: srvExitr

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall srvRegisterClient(Handle *handleptr)
srvRegisterClient			; CODE XREF: srvInit+20p
		STMFD	SP!, {R3-R5,LR}
		CMP	R0, #0
		LDR	R5, =srcHandle
		MOVNE	R5, R0
		BL	svcGetThreadCommandBuffer
		LDR	R2, =0x10002
		MOV	R3, #0x20
		MOV	R4, R0
		STMIA	R0, {R2,R3}
		LDR	R0, [R5]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R0, [R4,#4]
		LDMFD	SP!, {R3-R5,PC}
; End of function srvRegisterClient

; ---------------------------------------------------------------------------
off_106958	DCD srcHandle		; DATA XREF: srvRegisterClient+8r
dword_10695C	DCD 0x10002		; DATA XREF: srvRegisterClient+14r

; =============== S U B	R O U T	I N E =======================================


; Result __stdcall srvInit()
srvInit					; CODE XREF: threadNtrHomeInjectee+A8p
					; close_all_srv_handles_:loc_10159Cp ...
		STMFD	SP!, {R3,LR}
		LDR	R0, =srcHandle	; out
		LDR	R1, =aSrv	; "srv:"
		BL	svcConnectToPort
		CMP	R0, #0
		BNE	loc_106984
		LDR	R0, =srcHandle	; handleptr
		LDMFD	SP!, {R3,LR}
		B	srvRegisterClient
; ---------------------------------------------------------------------------

loc_106984				; CODE XREF: srvInit+14j
		MOV	R0, #0
		LDMFD	SP!, {R3,PC}
; End of function srvInit

; ---------------------------------------------------------------------------
; volatile Handle *handleptr
handleptr	DCD srcHandle		; DATA XREF: srvInit+4r srvInit+18r
; char *portName
portName	DCD aSrv		; DATA XREF: srvInit+8r
					; "srv:"

; =============== S U B	R O U T	I N E =======================================


; Result __fastcall srvGetServiceHandle(Handle *handleptr, Handle *out,	unsigned __int8	*server)
srvGetServiceHandle			; CODE XREF: acuWaitInternetConnection+18p
					; ntrResetKProcessRefcount+18p	...
		CMP	R0, #0
		STMFD	SP!, {R3-R9,LR}
		MOV	R7, R1
		LDR	R6, =srcHandle
		MOVNE	R6, R0
		MOV	R0, R2		; a1
		MOV	R9, R2
		BL	strlen
		CLZ	R3, R7
		MOV	R3, R3,LSR#5
		UXTB	R8, R0
		CMP	R8, #8
		MOVLS	R4, R3
		ORRHI	R4, R3,	#1
		CMP	R4, #0
		BNE	loc_106A10
		BL	svcGetThreadCommandBuffer
		LDR	R3, =0x50100	; GetServiceSessionHandle(8-byte servicename, u32 strlen, u32 flags).
					; Flags	bit0: if not set, return port-handle instead of	session-handle
					; when session-handle unavailable (max sessions/timeout?).
		MOV	R1, R9
		MOV	R5, R0
		STR	R3, [R0],#4
		BL	strncpy
		STR	R8, [R5,#0xC]
		STR	R4, [R5,#0x10]
		LDR	R0, [R6]	; session
		BL	svcSendSyncRequest
		CMP	R0, #0
		LDREQ	R3, [R5,#0xC]
		STREQ	R3, [R7]
		LDREQ	R0, [R5,#4]
		LDMFD	SP!, {R3-R9,PC}
; ---------------------------------------------------------------------------

loc_106A10				; CODE XREF: srvGetServiceHandle+3Cj
		MOV	R0, #0xFFFFFFFF
		LDMFD	SP!, {R3-R9,PC}
; End of function srvGetServiceHandle

; ---------------------------------------------------------------------------
off_106A18	DCD srcHandle		; DATA XREF: srvGetServiceHandle+Cr
dword_106A1C	DCD 0x50100		; DATA XREF: srvGetServiceHandle+44r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void *svcGetThreadCommandBuffer(void)
svcGetThreadCommandBuffer		; CODE XREF: acuCmd1+Cp acuCmd26+10p ...
		MRC	p15, 0,	R0,c13,c0, 3 ; Read User read-only Thread and Process ID Register
		ADD	R0, R0,	#0x80
		BX	LR
; End of function svcGetThreadCommandBuffer


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcControlMemory(u32	*addr_out, u32 addr0, u32 addr1, u32 size, MemOp op, MemPerm perm)
svcControlMemory			; CODE XREF: prepare_config_mem+44p
					; handle_reload_packet+E4p ...

var_8		= -8
var_4		= -4
operation	=  0
permissions	=  4

		STMFD	SP!, {R0,R4}
		LDR	R0, [SP,#8+operation]
		LDR	R4, [SP,#8+permissions]
		SVC	1
		LDR	R2, [SP+8+var_8],#4
		STR	R1, [R2]
		LDR	R4, [SP+4+var_4],#4
		BX	LR
; End of function svcControlMemory

; [00000008 BYTES: COLLAPSED FUNCTION svcExitProcess. PRESS KEYPAD CTRL-"+" TO EXPAND]
; [00000020 BYTES: COLLAPSED FUNCTION svcCreateThread. PRESS KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn

; void __stdcall __noreturn svcExitThread()
svcExitThread				; CODE XREF: threadSetupNetworkDebugServer+28p
					; check_plugin_exit_flag+14j ...
		SVC	9
		BX	LR
; End of function svcExitThread


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall svcSleepThread(s64 ns)
svcSleepThread				; CODE XREF: lcd_solid_fill+2Cp
					; threadNtrHomeInjectee+CCp ...
		SVC	0xA
		BX	LR
; End of function svcSleepThread


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcCreateMutex(Handle *mutex, bool initialLocked)
svcCreateMutex

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x13
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcCreateMutex


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcReleaseMutex(Handle handle)
svcReleaseMutex
		SVC	0x14
		BX	LR
; End of function svcReleaseMutex


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcReleaseSemaphore(s32 *count, Handle semaphore, s32 releaseCount)
svcReleaseSemaphore

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x16
		LDR	R2, [SP+4+var_4],#4
		STR	R1, [R2]
		BX	LR
; End of function svcReleaseSemaphore


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcCreateEvent(Handle *event, u8 reset_type)
svcCreateEvent

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x17
		LDR	R2, [SP+4+var_4],#4
		STR	R1, [R2]
		BX	LR
; End of function svcCreateEvent


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcSignalEvent(Handle handle)
svcSignalEvent
		SVC	0x18
		BX	LR
; End of function svcSignalEvent


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcClearEvent(Handle handle)
svcClearEvent
		SVC	0x19
		BX	LR
; End of function svcClearEvent


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcCreateMemoryBlock(Handle *memblock, u32 addr, u32 size, MemPerm my_perm, MemPerm other_perm)
svcCreateMemoryBlock			; CODE XREF: socketInitialize+28p

var_4		= -4
otherpermission	=  0

		STR	R0, [SP,#var_4]!
		LDR	R0, [SP,#4+otherpermission]
		SVC	0x1E
		LDR	R2, [SP+4+var_4],#4
		STR	R1, [R2]
		BX	LR
; End of function svcCreateMemoryBlock


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcMapMemoryBlock(Handle memblock, u32 addr,	u32 mypermissions, u32 otherpermission)
svcMapMemoryBlock
		SVC	0x1F
		BX	LR
; End of function svcMapMemoryBlock


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcUnmapMemoryBlock(Handle memblock, u32 addr)
svcUnmapMemoryBlock
		SVC	0x20
		BX	LR
; End of function svcUnmapMemoryBlock


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcArbitrateAddress(Handle arbiter, u32 addr, u8 type, s32 value, s64 nanoseconds)
svcArbitrateAddress
		SVC	0x22
		BX	LR
; End of function svcArbitrateAddress


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcCloseHandle(Handle handle)
svcCloseHandle				; CODE XREF: acuWaitInternetConnection+48p
					; get_nintendo_home_version_info+170p ...
		SVC	0x23
		BX	LR
; End of function svcCloseHandle


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcWaitSynchronization(Handle handle, s64 nanoseconds)
svcWaitSynchronization
		SVC	0x24
		BX	LR
; End of function svcWaitSynchronization


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcWaitSynchronizationN(s32 *out, Handle *handles, s32 handlecount, bool waitAll, s64 nanoseconds)
svcWaitSynchronizationN

var_4		= -4
nanoseconds	=  0

		STR	R5, [SP,#var_4]!
		MOV	R5, R0
		LDR	R0, [SP,#4+nanoseconds]
		LDR	R4, [SP,#4+nanoseconds+4]
		SVC	0x25
		STR	R1, [R5]
		LDR	R5, [SP+4+var_4],#4
		BX	LR
; End of function svcWaitSynchronizationN


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u64 __stdcall	svcGetSystemTick()
svcGetSystemTick
		SVC	0x28
		BX	LR
; End of function svcGetSystemTick


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcGetSystemInfo(s64	*out, u32 type,	s32 param)
svcGetSystemInfo

var_8		= -8
var_4		= -4

		STMFD	SP!, {R0,R4}
		SVC	0x2A
		LDR	R4, [SP+8+var_8],#4
		STR	R1, [R4]
		STR	R2, [R4,#4]
		LDR	R4, [SP+4+var_4],#4
		BX	LR
; End of function svcGetSystemInfo


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcGetProcessInfo(s64 *out, Handle process, u32	type)
svcGetProcessInfo

var_8		= -8
var_4		= -4

		STMFD	SP!, {R0,R4}
		SVC	0x2B
		LDR	R4, [SP+8+var_8],#4
		STR	R1, [R4]
		STR	R2, [R4,#4]
		LDR	R4, [SP+4+var_4],#4
		BX	LR
; End of function svcGetProcessInfo


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcConnectToPort(volatile Handle *out, const char *portName)
svcConnectToPort			; CODE XREF: srvInit+Cp

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x2D
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcConnectToPort


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcSendSyncRequest(Handle session)
svcSendSyncRequest			; CODE XREF: acuCmd1+34p acuCmd26+40p	...
		SVC	0x32
		BX	LR
; End of function svcSendSyncRequest

; [00000014 BYTES: COLLAPSED FUNCTION svcGetProcessId. PRESS KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; s32 __stdcall	svcGetThreadId(u32 *out, Handle	handle)
svcGetThreadId

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x37
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcGetThreadId


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcSetThreadIdealProcessor(Handle handle, u32 processorid)
svcSetThreadIdealProcessor
		SVC	0x10
		BX	LR
; End of function svcSetThreadIdealProcessor


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcOpenThread(Handle	*thread, Handle	process, u32 threadId)
svcOpenThread				; CODE XREF: rtGetThreadContext+1Cp

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x34
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcOpenThread


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcFlushProcessDataCache(Handle handle, u32 addr, u32 size)
svcFlushProcessDataCache		; CODE XREF: inter_process_dma_copy+44p
					; inter_process_dma_copy+60p ...
		SVC	0x54
		BX	LR
; End of function svcFlushProcessDataCache


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcInvalidateProcessDataCache(Handle	handle,	u32 addr, u32 size)
svcInvalidateProcessDataCache		; CODE XREF: inter_process_dma_copy+138p
		SVC	0x52
		BX	LR
; End of function svcInvalidateProcessDataCache


; =============== S U B	R O U T	I N E =======================================

; Result QueryMemory(MemoryInfo* info, PageInfo* out, u32 Addr)
; Attributes: library function

; Result __stdcall svcQueryMemory(s32 info, PageInfo *out, u32 addr)
svcQueryMemory
		SVC	2
		BX	LR
; End of function svcQueryMemory


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcAddCodeSegment(u32 addr, u32 size)
svcAddCodeSegment
		SVC	0x7A
		BX	LR
; End of function svcAddCodeSegment


; =============== S U B	R O U T	I N E =======================================


; Result __stdcall svcTerminateProcess(Handle thread)
svcTerminateProcess
		SVC	0x76
		BX	LR
; End of function svcTerminateProcess


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcOpenProcess(Handle *process, u32 processId)
svcOpenProcess				; CODE XREF: get_nintendo_home_version_info+20p
					; ntrScreenShotCreate+Cp ...

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x33
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcOpenProcess


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcControlProcessMemory(Handle hProcess, void *Addr0, void *Addr1, u32 size,	u32 Type, u32 Permissions)
svcControlProcessMemory			; CODE XREF: ntrProtectRemoteMemory+18p

Type		=  0
Permissions	=  4

		STMFD	SP!, {R0,R4,R5}
		LDR	R4, [SP,#0xC+Type]
		LDR	R5, [SP,#0xC+Permissions]
		SVC	0x70
		LDMFD	SP!, {R2,R4,R5}
		BX	LR
; End of function svcControlProcessMemory


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcMapProcessMemory(Handle process, u32 startAddr, u32 endAddr)
svcMapProcessMemory
		SVC	0x71
		BX	LR
; End of function svcMapProcessMemory


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcStartInterProcessDma(Handle *hdma, Handle	dstProcess, void *dst, Handle srcProcess, const	void *src, u32 size, u32 *config)
svcStartInterProcessDma			; CODE XREF: inter_process_dma_copy+94p

src		=  0
size		=  4
config		=  8

		STMFD	SP!, {R0,R4,R5}
		LDR	R0, [SP,#0xC+src]
		LDR	R4, [SP,#0xC+size]
		LDR	R5, [SP,#0xC+config]
		SVC	0x55
		LDMFD	SP!, {R2,R4,R5}
		STR	R1, [R2]
		BX	LR
; End of function svcStartInterProcessDma


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcGetDmaState(u32 *state, Handle dma)
svcGetDmaState				; CODE XREF: inter_process_dma_copy+BCp

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x57
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcGetDmaState


; =============== S U B	R O U T	I N E =======================================

; This is used on ARM9 NATIVE_FIRM.
; No ARM11 processes have access to it without some form of kernelhax.
; Attributes: library function

; Result __stdcall svcBackdoor(s32 (*callback)(void))
svcBackdoor				; CODE XREF: arm11kCmdUnused5+1Cp
					; arm11kCmdSetCurrentKProcess+18j ...
		SVC	0x7B
		BX	LR
; End of function svcBackdoor


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcGetProcessList(s32 *processCount,	u32 *processIds, s32 processIdMaxCount)
svcGetProcessList			; CODE XREF: handle_listprocess_packet+18p
					; ntrProcessManager+28p

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x65
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcGetProcessList


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcGetThreadList(s32	*threadCount, u32 *threadIds, s32 threadIdMaxCount, Handle domain)
svcGetThreadList			; CODE XREF: get_remote_PC+24p
					; handle_listthread_packet+58p

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x66
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcGetThreadList


; =============== S U B	R O U T	I N E =======================================

; Result GetDebugThreadContext(ThreadContext* context, Handle debug, u32 threadId, u32 controlFlags)
; Attributes: library function

svcGetThreadContext
		SVC	0x3B
		BX	LR
; End of function svcGetThreadContext


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcDebugActiveProcess(s32 *handle_out, u32 pid)
svcDebugActiveProcess			; CODE XREF: sub_1047F0+A8p

var_4		= -4

		STR	R0, [SP,#var_4]!
		SVC	0x60
		LDR	R3, [SP+4+var_4],#4
		STR	R1, [R3]
		BX	LR
; End of function svcDebugActiveProcess


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcReadProcessMemory(void *buffer, Handle debug, u32	addr, u32 size)
svcReadProcessMemory			; CODE XREF: sub_1047F0+124p
		SVC	0x6A
		BX	LR
; End of function svcReadProcessMemory


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; Result __stdcall svcWriteProcessMemory(Handle	debug, const void *buffer, u32 addr, u32 size)
svcWriteProcessMemory
		SVC	0x6B
		BX	LR
; End of function svcWriteProcessMemory

; ---------------------------------------------------------------------------
nsDbgPrint_6	ALIGN 0x10

; =============== S U B	R O U T	I N E =======================================


get_kernel_object_ptr			; CODE XREF: arm11kDispatchCmd+5Cp
		LDR	R3, [R0]	; r3 now holds handledata *?
		MOV	R1, R1,LSL#17
		ADD	R1, R3,	R1,LSR#14 ; hProcess * 8
		LDR	R0, [R1,#4]	; get Pointer to the kernel object that	the handle references.
		BX	LR
; End of function get_kernel_object_ptr

; ---------------------------------------------------------------------------
		BX	LR
; ---------------------------------------------------------------------------
		ADD	R0, R0,	#0xC0000000
		BX	LR

; =============== S U B	R O U T	I N E =======================================


mmu_stuff				; CODE XREF: install_SVC_6D_hook+14p
					; install_SVC_6D_hook+24p ...
		LDR	R12, =0x1FFFC000 ; -> DFFFC7FC
		LDR	R3, =0x1FFF8000	; -> DFFF87FC
		CMP	R0, #0
		MOVEQ	R0, R3
		MOVNE	R0, R12
		ADD	R0, R0,	#0x7F0
		STMFD	SP!, {R4-R6,LR}
		ADD	R2, R2,	R1
		ADD	R0, R0,	#0xC000000C
		MOV	LR, #0x20000000

loc_106D18				; CODE XREF: mmu_stuff+D8j
		LDR	R3, [R0,#4]!
		AND	R12, R3, #3
		CMP	R12, #2
		BNE	loc_106D50
		CMP	LR, R2
		MOVCC	R12, #1
		MOVCS	R12, #0
		CMP	LR, R1
		MOVCC	R12, #0
		CMP	R12, #0
		BICNE	R3, R3,	#0x8C00
		ORRNE	R3, R3,	#0xC00
		STRNE	R3, [R0]
		B	loc_106DC4
; ---------------------------------------------------------------------------

loc_106D50				; CODE XREF: mmu_stuff+34j
		CMP	R12, #1
		BNE	loc_106DC4
		BIC	R3, R3,	#0x3FC
		BIC	R3, R3,	#3
		SUB	R4, R3,	#0x40000004
		ADD	R3, R3,	#0xC0000000
		ADD	R12, R3, #0x3FC
		MOV	R5, LR

loc_106D70				; CODE XREF: mmu_stuff+D0j
		CMP	R5, R2
		MOVCC	R6, #1
		MOVCS	R6, #0
		CMP	R5, R1
		MOVCC	R6, #0
		CMP	R6, #0
		LDR	R3, [R4,#4]!
		BEQ	loc_106DB8
		AND	R6, R3,	#3
		CMP	R6, #1
		BICEQ	R3, R3,	#0x8200
		BICEQ	R3, R3,	#0x30
		BEQ	loc_106DB0
		BLS	loc_106DB8
		BIC	R3, R3,	#0x230
		BIC	R3, R3,	#1

loc_106DB0				; CODE XREF: mmu_stuff+B0j
		ORR	R3, R3,	#0x30
		STR	R3, [R4]

loc_106DB8				; CODE XREF: mmu_stuff+9Cj
					; mmu_stuff+B4j
		CMP	R4, R12
		ADD	R5, R5,	#0x1000
		BNE	loc_106D70

loc_106DC4				; CODE XREF: mmu_stuff+5Cj
					; mmu_stuff+64j
		ADDS	LR, LR,	#0x100000
		BNE	loc_106D18
		LDMFD	SP!, {R4-R6,PC}
; End of function mmu_stuff

; ---------------------------------------------------------------------------
dword_106DD0	DCD 0x1FFFC000		; DATA XREF: mmu_stuffr
dword_106DD4	DCD 0x1FFF8000		; DATA XREF: mmu_stuff+4r

; =============== S U B	R O U T	I N E =======================================


install_SVC_6D_hook			; CODE XREF: arm11kDispatchCmd+D4p
		STMFD	SP!, {R4,LR}
		MOV	R0, #0
		LDR	R4, =va_arm11_kernel_base_W
		LDR	R1, =0xFFFBA000	; mapped IO I2C
		MOV	R2, #0x10000
		BL	mmu_stuff
		MOV	R0, #1
		LDR	R1, =0xFFFBA000
		MOV	R2, #0x10000
		BL	mmu_stuff
		LDR	R3, [R4]	; get va_arm11_kernel_base
		MOV	R2, #0
		ADD	R3, R3,	#0x8000
		LDR	R0, =0xE10F0000
		STR	R2, [R3,#0x4EC]	; patch	error code 0xE0E01BEE
		LDR	R3, [R4]
		ADD	R3, R3,	#0x8000
		STR	R2, [R3,#0x4F0]	; patch	error code 0xE0E01BF5
		LDR	R2, [R4,#(dword_10861C - 0x108618)]
		LDR	R3, [R4]
		ADD	R1, R2,	R3

patch svc 6D handler's code to force it	to disable FIQ and IRQ

MRS		R0, CPSR
ORR		R0, R0,	#0xC0
MSR		CPSR_cf, R0

		STR	R0, [R2,R3]
		LDR	R2, =0xE38000C0
		LDR	R3, =0xE129F000
		LDR	R0, =arm11kDispatchCmd ; dst
		STMIB	R1, {R2,R3}

then redirect to arm11 cmd dispatcher

		ADD	R1, R1,	#0xC	; src
		BL	rtGenerateJumpCode ; hook SVC 6D
		LDR	R3, [R4,#(dword_10861C - 0x108618)]
		LDR	R2, [R4,#(dword_108624 - 0x108618)]
		ADD	R3, R3,	R2

let arm11 cb point to modified handler 6D code

		STR	R3, [R4,#(pcb_arm11_dispatch - 0x108618)]
		BL	InvalidateEntireInstructionCache
		LDMFD	SP!, {R4,LR}
		B	CleanEntireDataCache
; End of function install_SVC_6D_hook

; ---------------------------------------------------------------------------
off_106E64	DCD va_arm11_kernel_base_W ; DATA XREF:	install_SVC_6D_hook+8r
dword_106E68	DCD 0xFFFBA000		; DATA XREF: install_SVC_6D_hook+Cr
					; install_SVC_6D_hook+1Cr
dword_106E6C	DCD 0xE10F0000		; DATA XREF: install_SVC_6D_hook+34r
dword_106E70	DCD 0xE38000C0		; DATA XREF: install_SVC_6D_hook+58r
dword_106E74	DCD 0xE129F000		; DATA XREF: install_SVC_6D_hook+5Cr
; u32 dst
dst		DCD arm11kDispatchCmd	; DATA XREF: install_SVC_6D_hook+60r

; =============== S U B	R O U T	I N E =======================================


clean_cache				; CODE XREF: arm11kDispatchCmd+E8p
		STMFD	SP!, {R3,LR}
		MOV	R0, #0
		LDR	R1, =0xFFFBA000
		MOV	R2, #0x10000
		BL	mmu_stuff
		MOV	R0, #1
		LDR	R1, =0xFFFBA000
		MOV	R2, #0x10000
		BL	mmu_stuff
		LDR	R1, =va_arm11_kernel_base_W
		MOV	R2, #0
		LDR	R3, [R1]
		ADD	R3, R3,	#0x8000
		STR	R2, [R3,#0x158]
		LDR	R3, [R1]
		ADD	R3, R3,	#0x8000
		STR	R2, [R3,#0x15C]
		BL	InvalidateEntireInstructionCache
		LDMFD	SP!, {R3,LR}
		B	CleanEntireDataCache
; End of function clean_cache

; ---------------------------------------------------------------------------
dword_106ECC	DCD 0xFFFBA000		; DATA XREF: clean_cache+8r
					; clean_cache+18r
off_106ED0	DCD va_arm11_kernel_base_W ; DATA XREF:	clean_cache+24r

; =============== S U B	R O U T	I N E =======================================


arm11kDispatchCmd			; CODE XREF: cb_arm11_dispatch+10p
					; DATA XREF: install_SVC_6D_hook+60o ...
		STMFD	SP!, {R4,LR}
		LDR	R4, =g_arm11_cmd
		LDR	R3, [R4]
		CMP	R3, #1
		BNE	loc_106F10	;
					; @arm11k_memcpy
handle_cmd_1:
		LDR	R2, [R4,#(dword_10B4A8 - 0x10B49C)]
		LDR	R1, [R4,#(g_arm11_handle - 0x10B49C)]
		LDR	R0, [R4,#(dword_10B4A4 - 0x10B49C)]
		MOV	R3, #0

loc_106EF8				; CODE XREF: arm11kDispatchCmd+34j
		CMP	R3, R2
		LDRCC	R12, [R3,R0]
		STRCC	R12, [R3,R1]
		ADDCC	R3, R3,	#4
		BCC	loc_106EF8
		LDMFD	SP!, {R4,PC}
; ---------------------------------------------------------------------------

loc_106F10				; CODE XREF: arm11kDispatchCmd+10j
		CMP	R3, #2
		BNE	loc_106F3C	;
					; @arm11k_get_kernel_object
handle_cmd_2:
		LDR	R3, =va_arm11_kernel_base_W
		LDR	R1, [R4,#(g_arm11_handle - 0x10B49C)] ;	hProcess
		LDR	R0, [R3,#(offs_KProcessHandleTable - 0x108618)]
		MOV	R3, #0xFFFF9FFF
		LDR	R3, [R3,#-0xFFB] ; KProcess
		ADD	R0, R0,	R3	; r0 points to KProcessHandleTable
		BL	get_kernel_object_ptr
		STR	R0, [R4,#(g_arm11_handle - 0x10B49C)]
		LDMFD	SP!, {R4,PC}
; ---------------------------------------------------------------------------

loc_106F3C				; CODE XREF: arm11kDispatchCmd+40j
		CMP	R3, #3		;
					; @arm11k_set_current_kprocess
handle_cmd_3:
		MOVEQ	R3, #0xFFFF9FFF
		LDREQ	R3, [R3,#-0xFFB]
		STREQ	R3, [R4,#(g_arm11_handle - 0x10B49C)]
		LDMEQFD	SP!, {R4,PC}
set_kprocess:
		CMP	R3, #4		;
					; @arm11k_set_current_kprocess
handle_cmd_4:
		MOVEQ	R3, #0xFFFF9FFF
		LDREQ	R2, [R4,#4]
		STREQ	R2, [R3,#-0xFFB]
		LDMEQFD	SP!, {R4,PC}
		CMP	R3, #5
		BNE	loc_106F8C	;
					; @Unused?
handle_cmd_5:
		LDR	R1, =va_arm11_kernel_base_W
		LDR	R3, [R4,#4]	; param	1
		LDR	R2, [R4,#8]	; param	2
		LDR	R1, [R1,#(dword_10862C - 0x108618)]
		LDR	R1, [R1,R3]
		STR	R1, [R4,#8]	; param	3
		STR	R2, [R3,#0xAC]
		LDMFD	SP!, {R4,PC}
; ---------------------------------------------------------------------------

loc_106F8C				; CODE XREF: arm11kDispatchCmd+94j
		CMP	R3, #6
		LDMNEFD	SP!, {R4,PC}	;
					; @This	would replace SVC 0x6D handler
					; GetDebugThreadParam(s64 *, s32 *, Handle, u32, DebugThreadParam)
					; @arm11k_replacel_svc_6D_handler
handle_cmd_6:
		LDR	R3, =firmware_version_internal
		MOV	R4, R3
		LDR	R2, [R3]
		CMP	R2, #0x5C
		BNE	loc_106FAC
		BL	install_SVC_6D_hook

loc_106FAC				; CODE XREF: arm11kDispatchCmd+D0j
		LDR	R3, [R4]
		CMP	R3, #0x51
		LDMNEFD	SP!, {R4,PC}
		LDMFD	SP!, {R4,LR}
		B	clean_cache
; End of function arm11kDispatchCmd

; ---------------------------------------------------------------------------
off_106FC0	DCD g_arm11_cmd		; DATA XREF: arm11kDispatchCmd+4r
off_106FC4	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kDispatchCmd+44r
					; arm11kDispatchCmd+98r
off_106FC8	DCD firmware_version_internal ;	DATA XREF: arm11kDispatchCmd+C0r

; =============== S U B	R O U T	I N E =======================================


arm11kCmdUnused5
		STMFD	SP!, {R4,LR}
		MOV	R3, #5
		LDR	R4, =g_arm11_cmd
		STR	R3, [R4]
		LDR	R3, =va_arm11_kernel_base_W
		STMIB	R4, {R0,R1}
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; callback
		BL	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
					; No ARM11 processes have access to it without some form of kernelhax.
		LDR	R0, [R4,#(dword_10B4A4 - 0x10B49C)]
		LDMFD	SP!, {R4,PC}
; End of function arm11kCmdUnused5

; ---------------------------------------------------------------------------
off_106FF4	DCD g_arm11_cmd		; DATA XREF: arm11kCmdUnused5+8r
off_106FF8	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdUnused5+10r

; =============== S U B	R O U T	I N E =======================================


arm11kCmdSetCurrentKProcess		; CODE XREF: controlRemoteMemory+30p
					; controlRemoteMemory+5Cp
		LDR	R3, =g_arm11_cmd
		MOV	R2, #4
		STR	R0, [R3,#(g_arm11_handle - 0x10B49C)]
		STR	R2, [R3]
		LDR	R3, =va_arm11_kernel_base_W
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; CodeAddress
		B	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
; End of function arm11kCmdSetCurrentKProcess ;	No ARM11 processes have	access to it without some form of kernelhax.

; ---------------------------------------------------------------------------
off_107018	DCD g_arm11_cmd		; DATA XREF: arm11kCmdSetCurrentKProcessr
off_10701C	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdSetCurrentKProcess+10r

; =============== S U B	R O U T	I N E =======================================


arm11kCmdGetCurrentKProcess		; CODE XREF: ROM:001042D4j
					; controlRemoteMemory+24p
		STMFD	SP!, {R4,LR}
		MOV	R3, #3
		LDR	R4, =g_arm11_cmd
		STR	R3, [R4]
		LDR	R3, =va_arm11_kernel_base_W
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; CodeAddress
		BL	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
					; No ARM11 processes have access to it without some form of kernelhax.
		LDR	R0, [R4,#(g_arm11_handle - 0x10B49C)]
		LDMFD	SP!, {R4,PC}
; End of function arm11kCmdGetCurrentKProcess

; ---------------------------------------------------------------------------
off_107044	DCD g_arm11_cmd		; DATA XREF: arm11kCmdGetCurrentKProcess+8r
off_107048	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdGetCurrentKProcess+10r

; =============== S U B	R O U T	I N E =======================================


; void *__stdcall arm11kCmdGetKernelObject(Handle handle)
arm11kCmdGetKernelObject		; CODE XREF: ntrScreenShotCreate+1Cp
					; handle_queryhandle_packet+48p ...
		STMFD	SP!, {R4,LR}
		MOV	R3, #2
		LDR	R4, =g_arm11_cmd
		STR	R3, [R4]
		LDR	R3, =va_arm11_kernel_base_W
		STR	R0, [R4,#(g_arm11_handle - 0x10B49C)]
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; CodeAddress
		BL	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
					; No ARM11 processes have access to it without some form of kernelhax.
		LDR	R0, [R4,#(g_arm11_handle - 0x10B49C)]
		LDMFD	SP!, {R4,PC}
; End of function arm11kCmdGetKernelObject

; ---------------------------------------------------------------------------
off_107074	DCD g_arm11_cmd		; DATA XREF: arm11kCmdGetKernelObject+8r
off_107078	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdGetKernelObject+10r

; =============== S U B	R O U T	I N E =======================================


; Result __cdecl arm11kCmdMemcpy(void *dst, void *src, size_t count)
arm11kCmdMemcpy				; CODE XREF: ntrScreenShotCreate+38p
					; ntrScreenShotCreate+50p ...
		LDR	R3, =g_arm11_cmd
		MOV	R12, #1
		STMIB	R3, {R0-R2}	; param1-3
					; dst, src, count
		STR	R12, [R3]
		LDR	R3, =va_arm11_kernel_base_W
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; CodeAddress
		B	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
; End of function arm11kCmdMemcpy	; No ARM11 processes have access to it without some form of kernelhax.

; ---------------------------------------------------------------------------
off_107098	DCD g_arm11_cmd		; DATA XREF: arm11kCmdMemcpyr
off_10709C	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdMemcpy+10r

; =============== S U B	R O U T	I N E =======================================


arm11kCmdReplaceSVC6DHandler		; CODE XREF: main:loc_1016ECp
		LDR	R3, =g_arm11_cmd
		MOV	R2, #6
		STR	R2, [R3]
		LDR	R3, =va_arm11_kernel_base_W
		LDR	R0, [R3,#(pcb_arm11_dispatch - 0x108618)] ; CodeAddress
		B	svcBackdoor	; This is used on ARM9 NATIVE_FIRM.
; End of function arm11kCmdReplaceSVC6DHandler ; No ARM11 processes have access	to it without some form	of kernelhax.

; ---------------------------------------------------------------------------
off_1070B8	DCD g_arm11_cmd		; DATA XREF: arm11kCmdReplaceSVC6DHandlerr
off_1070BC	DCD va_arm11_kernel_base_W ; DATA XREF:	arm11kCmdReplaceSVC6DHandler+Cr
; [00000004 BYTES: COLLAPSED FUNCTION nullsub_2. PRESS KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================


pa_to_va				; CODE XREF: update_screen+10p
					; update_screen+20p ...
		ADD	R3, R0,	#0xEC000000
		CMN	R3, #0xF8000001
		BHI	loc_1070D8
		ADD	R0, R0,	#0xC000000
		BX	LR
; ---------------------------------------------------------------------------

loc_1070D8				; CODE XREF: pa_to_va+8j
		ADD	R3, R0,	#0xD0000000
		CMN	R3, #0xF0000001
		BHI	loc_1070EC
		ADD	R0, R0,	#0xF0000000
		BX	LR
; ---------------------------------------------------------------------------

loc_1070EC				; CODE XREF: pa_to_va+1Cj
		ADD	R3, R0,	#0xE1000000
		CMP	R3, #0x600000
		BCS	locret_107100
		ADD	R0, R0,	#0xF9000000
		BX	LR
; ---------------------------------------------------------------------------

locret_107100				; CODE XREF: pa_to_va+30j
		BX	LR
; End of function pa_to_va


; =============== S U B	R O U T	I N E =======================================


assign_rwx_to_0x1F000000		; CODE XREF: threadNtrHomeInjectee+80p
		STMFD	SP!, {R3,LR}
		MOV	R1, #0x600000	; size
		MOV	R0, #0x1F000000	; addr
		BL	ntrProtectMemory
		CMP	R0, #0
		MOVEQ	R2, #1
		LDREQ	R3, =is_NTR_OSD_requested
		STREQ	R2, [R3]
		LDMFD	SP!, {R3,PC}
; End of function assign_rwx_to_0x1F000000

; ---------------------------------------------------------------------------
off_107128	DCD is_NTR_OSD_requested ; DATA	XREF: assign_rwx_to_0x1F000000+18r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void debounceKey(void)
debounceKey				; CODE XREF: ntrMenu+8p ntrMenu+130p ...

var_4		= -4

		LDR	R2, =0xFFFFF
		SUB	SP, SP,	#8
		MOV	R3, #0
		STR	R3, [SP,#8+var_4]

loc_10713C				; CODE XREF: debounceKey+24j
		LDR	R3, [SP,#8+var_4]
		CMP	R3, R2
		LDRLS	R3, [SP,#8+var_4]
		ADDLS	R3, R3,	#1
		STRLS	R3, [SP,#8+var_4]
		BLS	loc_10713C
		ADD	SP, SP,	#8
		BX	LR
; End of function debounceKey

; ---------------------------------------------------------------------------
dword_10715C	DCD 0xFFFFF		; DATA XREF: debounceKeyr

; =============== S U B	R O U T	I N E =======================================


sub_107160				; CODE XREF: ntrMenu+134p

var_4		= -4

		SUB	SP, SP,	#8
		MOV	R3, #0

loc_107168				; CODE XREF: sub_107160+1Cj
		STR	R3, [SP,#8+var_4]
		LDR	R3, [SP,#8+var_4]
		CMP	R3, #0x3000000
		LDRCC	R3, [SP,#8+var_4]
		ADDCC	R3, R3,	#1
		BCC	loc_107168
		ADD	SP, SP,	#8
		BX	LR
; End of function sub_107160


; =============== S U B	R O U T	I N E =======================================


; void update_screen(void)
update_screen				; CODE XREF: sub_1047F0+110p
					; controlVideo+50p ...
		STMFD	SP!, {R4-R6,LR}
		LDR	R5, =pa_N3DS
		LDR	R4, =va_mapped_io_PDC
		LDR	R0, [R5]
		BL	pa_to_va
		LDR	R6, [R4]
		STR	R0, [R6,#0x568]
		LDR	R0, [R5]
		BL	pa_to_va
		LDR	R6, [R4]
		LDR	R2, =0x80301
		STR	R0, [R6,#0x56C]
		LDR	R3, [R4]
		LDR	R0, =0xFFFF8001	; process
		STR	R2, [R3,#0x570]
		LDR	R3, [R4]
		LDR	R2, =0x14000F0
		STR	R2, [R3,#0x55C]
		LDR	R3, [R4]
		MOV	R2, #0x2D0
		STR	R2, [R3,#0x590]
		MOV	R2, #0x38400	; size
		LDR	R1, [R5]	; addr
		LDMFD	SP!, {R4-R6,LR}
		B	svcFlushProcessDataCache
; End of function update_screen

; ---------------------------------------------------------------------------
off_1071EC	DCD pa_N3DS		; DATA XREF: update_screen+4r
off_1071F0	DCD va_mapped_io_PDC	; DATA XREF: update_screen+8r
dword_1071F4	DCD 0x80301		; DATA XREF: update_screen+28r
; Handle dword_1071F8
dword_1071F8	DCD 0xFFFF8001		; DATA XREF: update_screen+34r
dword_1071FC	DCD 0x14000F0		; DATA XREF: update_screen+40r

; =============== S U B	R O U T	I N E =======================================


sub_107200				; CODE XREF: main+24p
					; dumpProcessToFile+C8p ...
		STMFD	SP!, {R3,LR}
		LDR	R3, =allowDirectScreenAccess
		LDR	R3, [R3]
		CMP	R3, #0
		LDMEQFD	SP!, {R3,PC}
		BLX	R3
		LDMFD	SP!, {R3,PC}
; End of function sub_107200

; ---------------------------------------------------------------------------
off_10721C	DCD allowDirectScreenAccess ; DATA XREF: sub_107200+4r

; =============== S U B	R O U T	I N E =======================================


; void acquire_video(void)
acquire_video				; CODE XREF: fatal_LR+8p
					; ntrMenu:loc_103674p ...
		STMFD	SP!, {R4-R8,LR}
		LDR	R5, =is_NTR_OSD_requested
		LDR	R7, [R5,#(dword_10B520 - 0x10B51C)]
		CMP	R7, #0
		BNE	loc_1072D4
		LDR	R3, =va_mapped_io_LCD
		LDR	R6, =va_mapped_io_PDC
		LDR	R8, =pa_N3DS
		LDR	R2, [R3]
		STR	R7, [R2,#0x204]	; REG_LCDCOLORFILLMAIN
		LDR	R3, [R3]
		STR	R7, [R3,#0xA04]	; REG_LCDCOLORFILLSUB
		LDR	R4, [R6]
		LDR	R3, =dword_10B52C
		LDR	R0, [R8]
		LDR	R2, [R4,#0x568]
		STR	R2, [R3]
		LDR	R2, [R4,#0x56C]
		STR	R2, [R3,#(dword_10B530 - 0x10B52C)]
		LDR	R2, [R4,#0x570]
		STR	R2, [R3,#(dword_10B534 - 0x10B52C)]
		LDR	R2, [R4,#0x55C]
		STR	R2, [R3,#(dword_10B538 - 0x10B52C)]
		LDR	R2, [R4,#0x590]
		STR	R2, [R3,#(dword_10B53C - 0x10B52C)]
		BL	pa_to_va
		STR	R0, [R4,#0x568]
		LDR	R0, [R8]
		BL	pa_to_va
		LDR	R4, [R6]
		LDR	R2, =0x80301
		MOV	R1, R7		; y
		STR	R0, [R4,#0x56C]
		LDR	R3, [R6]
		MOV	R0, R7		; x
		STR	R2, [R3,#0x570]
		LDR	R3, [R6]
		LDR	R2, =0x14000F0
		STR	R2, [R3,#0x55C]
		LDR	R3, [R6]
		MOV	R2, #0x2D0
		STR	R2, [R3,#0x590]
		MOV	R2, #0x140	; xs
		MOV	R3, #0xF0	; ys
		BL	ntr2dBlank

loc_1072D4				; CODE XREF: acquire_video+10j
		LDR	R3, [R5,#4]
		ADD	R3, R3,	#1
		STR	R3, [R5,#4]
		LDMFD	SP!, {R4-R8,PC}
; End of function acquire_video

; ---------------------------------------------------------------------------
off_1072E4	DCD is_NTR_OSD_requested ; DATA	XREF: acquire_video+4r
off_1072E8	DCD va_mapped_io_LCD	; DATA XREF: acquire_video+14r
off_1072EC	DCD va_mapped_io_PDC	; DATA XREF: acquire_video+18r
off_1072F0	DCD pa_N3DS		; DATA XREF: acquire_video+1Cr
off_1072F4	DCD dword_10B52C	; DATA XREF: acquire_video+34r
dword_1072F8	DCD 0x80301		; DATA XREF: acquire_video+78r
dword_1072FC	DCD 0x14000F0		; DATA XREF: acquire_video+94r

; =============== S U B	R O U T	I N E =======================================


; void release_video(void)
release_video				; CODE XREF: fatal_LR+20p
					; ntrMenu:loc_103724p ...
		LDR	R2, =is_NTR_OSD_requested
		LDR	R3, [R2,#(dword_10B520 - 0x10B51C)]
		SUB	R3, R3,	#1
		CMP	R3, #0
		STR	R3, [R2,#(dword_10B520 - 0x10B51C)]
		BXNE	LR
		LDR	R2, =va_mapped_io_PDC
		LDR	R3, =dword_10B52C
		LDR	R1, [R2]
		LDR	R0, [R3]
		STR	R0, [R1,#0x568]
		LDR	R1, [R2]
		LDR	R0, [R3,#(dword_10B530 - 0x10B52C)]
		STR	R0, [R1,#0x56C]
		LDR	R1, [R2]
		LDR	R0, [R3,#(dword_10B534 - 0x10B52C)]
		STR	R0, [R1,#0x570]
		LDR	R1, [R2]
		LDR	R0, [R3,#(dword_10B538 - 0x10B52C)]
		STR	R0, [R1,#0x55C]
		LDR	R2, [R2]
		LDR	R3, [R3,#(dword_10B53C - 0x10B52C)]
		STR	R3, [R2,#0x590]
		BX	LR
; End of function release_video

; ---------------------------------------------------------------------------
off_107360	DCD is_NTR_OSD_requested ; DATA	XREF: release_videor
off_107364	DCD va_mapped_io_PDC	; DATA XREF: release_video+18r
off_107368	DCD dword_10B52C	; DATA XREF: release_video+1Cr

; =============== S U B	R O U T	I N E =======================================


; int __cdecl controlVideo(u32 cmd, u32	arg1, u32 arg2,	u32 arg3)
controlVideo				; CODE XREF: sub_105864+2Cp
					; sub_105864+50p
					; DATA XREF: ...
		CMP	R0, #1
		STMFD	SP!, {R3,LR}
		BNE	loc_107380
		BL	acquire_video
		B	loc_1073C0
; ---------------------------------------------------------------------------

loc_107380				; CODE XREF: controlVideo+8j
		CMP	R0, #2
		BNE	loc_107390
		BL	release_video
		B	loc_1073C0
; ---------------------------------------------------------------------------

loc_107390				; CODE XREF: controlVideo+18j
		CMP	R0, #3
		BNE	loc_1073A4
get_framebuffer
		LDR	R3, =pa_N3DS
		LDR	R0, [R3]
		LDMFD	SP!, {R3,PC}
; ---------------------------------------------------------------------------

loc_1073A4				; CODE XREF: controlVideo+28j
		CMP	R0, #4
		LDREQ	R3, =pa_N3DS
		STREQ	R1, [R3]
		BEQ	loc_1073C0
		CMP	R0, #5
		BNE	locret_1073C8
		BL	update_screen

loc_1073C0				; CODE XREF: controlVideo+10j
					; controlVideo+20j ...
		MOV	R0, #0
		LDMFD	SP!, {R3,PC}
; ---------------------------------------------------------------------------

locret_1073C8				; CODE XREF: controlVideo+4Cj
		LDMFD	SP!, {R3,PC}
; End of function controlVideo

; ---------------------------------------------------------------------------
off_1073CC	DCD pa_N3DS		; DATA XREF: controlVideo+2Cr
					; controlVideo+3Cr

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; u32 read_pad(void)
read_pad				; CODE XREF: is_BUTTON_DL_pressed+4p
					; threadNtrHomeInjectee:loc_10135Cp ...
		LDR	R3, =va_mapped_io_PAD
		LDR	R3, [R3]
		LDR	R0, [R3]
		MVN	R0, R0
		MOV	R0, R0,LSL#20
		MOV	R0, R0,LSR#20
		BX	LR
; End of function read_pad

; ---------------------------------------------------------------------------
off_1073EC	DCD va_mapped_io_PAD	; DATA XREF: read_padr

; =============== S U B	R O U T	I N E =======================================


; u32 wait_pad_input(void)
wait_pad_input				; CODE XREF: showMenu:loc_10750Cp
					; showMsg+94p
		STMFD	SP!, {R4,LR}

loc_1073F4				; CODE XREF: wait_pad_input+Cj
		BL	read_pad
		CMP	R0, #0
		BNE	loc_1073F4

loc_107400				; CODE XREF: wait_pad_input+18j
					; wait_pad_input+28j
		BL	read_pad
		SUBS	R4, R0,	#0
		BEQ	loc_107400
		BL	debounceKey
		BL	read_pad
		CMP	R4, R0
		BNE	loc_107400
		LDMFD	SP!, {R4,PC}
; End of function wait_pad_input


; =============== S U B	R O U T	I N E =======================================


; s32 __stdcall	showMenu(u8 *title, u32	entryCount, u8 **captions)
showMenu				; CODE XREF: sub_100F64+148p
					; ntrSetHotkey+34p ...

g		= -0x100
b		= -0xFC
s		= -0xF4
var_F0		= -0xF0

		STMFD	SP!, {R4-R11,LR}
		MOV	R6, R1
		LDR	R9, =0x10AC5F
		LDR	R10, =0x10AC63
		SUB	SP, SP,	#0xDC
		MOV	R8, R2
		MOV	R4, #0
		STR	R0, [SP,#0x100+s]

loc_107440				; CODE XREF: showMenu+10Cj
					; showMenu+120j ...
		MOV	R0, #0		; x
		MOV	R1, R0		; y
		MOV	R2, #0x140	; xs
		MOV	R3, #0xF0	; ys
		BL	ntr2dBlank
		MOV	R5, #0
		MOV	R1, #0xA	; x
		MOV	R2, R1		; y
		STR	R5, [SP,#0x100+g] ; g
		STR	R5, [SP,#0x100+b] ; b
		MOV	R3, #0xFF	; r
		LDR	R0, [SP,#0x100+s] ; s
		BL	ntr2dPrint
		MOV	R3, #0xFF
		STR	R5, [SP,#0x100+g] ; g
		STR	R3, [SP,#0x100+b] ; b
		MOV	R1, #0xA	; x
		MOV	R3, R5		; r
		MOV	R2, #0xDC	; y
		LDR	R0, =aHttp44670_orgN ; s
		BL	ntr2dPrint
		MOV	R0, R4
		MOV	R1, #0x12
		BL	__aeabi_uidiv
		MOV	R5, #0x12
		MOV	R7, #0x1E
		MUL	R5, R5,	R0
		ADD	R11, R5, #0x12
		CMP	R11, R6
		MOVCS	R11, R6

loc_1074B8				; CODE XREF: showMenu+E4j
		CMP	R5, R11
		BCS	loc_107508
		CMP	R5, R4
		MOVEQ	R1, R9
		MOVNE	R1, R10
		ADD	R0, SP,	#0x100+var_F0
		BL	strncpy
		LDR	R1, [R8,R5,LSL#2]
		ADD	R0, SP,	#0x100+var_F0
		BL	strcat
		MOV	R3, #0		; r
		MOV	R2, R7		; y
		STR	R3, [SP,#0x100+g] ; g
		STR	R3, [SP,#0x100+b] ; b
		ADD	R0, SP,	#0x100+var_F0 ;	s
		MOV	R1, #0xA	; x
		BL	ntr2dPrint
		ADD	R7, R7,	#0xA
		ADD	R5, R5,	#1
		B	loc_1074B8
; ---------------------------------------------------------------------------

loc_107508				; CODE XREF: showMenu+9Cj
		BL	update_screen

loc_10750C				; CODE XREF: showMenu+F4j
		BL	wait_pad_input
		CMP	R0, #0
		BEQ	loc_10750C
		CMP	R0, #0x80
		BNE	loc_107530
		ADD	R4, R4,	#1
		CMP	R4, R6
		MOVCS	R4, #0
		B	loc_107440
; ---------------------------------------------------------------------------

loc_107530				; CODE XREF: showMenu+FCj
		CMP	R0, #0x40
		BNE	loc_107544
		SUBS	R4, R4,	#1
		SUBMI	R4, R6,	#1
		B	loc_107440
; ---------------------------------------------------------------------------

loc_107544				; CODE XREF: showMenu+114j
		CMP	R0, #1
		BEQ	loc_10755C
		CMP	R0, #2
		BNE	loc_107440
		MOV	R0, #0xFFFFFFFF
		B	loc_107560
; ---------------------------------------------------------------------------

loc_10755C				; CODE XREF: showMenu+128j
		MOV	R0, R4

loc_107560				; CODE XREF: showMenu+138j
		ADD	SP, SP,	#0xDC
		LDMFD	SP!, {R4-R11,PC}
; End of function showMenu

; ---------------------------------------------------------------------------
dword_107568	DCD 0x10AC5F		; DATA XREF: showMenu+8r
dword_10756C	DCD 0x10AC63		; DATA XREF: showMenu+Cr
; u8 *s
s		DCD aHttp44670_orgN	; DATA XREF: showMenu+6Cr
					; "http://44670.org/ntr"

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	showMsg(u8 *msg)
showMsg					; CODE XREF: sub_100F64:loc_101094p
					; sub_10111C+60p ...

g		= -0x18
b		= -0x14

		LDR	R3, =allowDirectScreenAccess
		STMFD	SP!, {R0-R2,R4,R5,LR}
		LDR	R4, [R3]
		CMP	R4, #0
		BEQ	loc_10759C
		BLX	R4
		LDR	R0, =0x3B9ACA00	; nanoseconds
		MOV	R1, #0
		BL	svcSleepThread
		B	loc_10761C
; ---------------------------------------------------------------------------

loc_10759C				; CODE XREF: showMsg+10j
		LDR	R3, =is_NTR_OSD_requested
		LDR	R3, [R3]
		CMP	R3, #0
		BEQ	loc_10761C
		MOV	R5, R0
		BL	acquire_video

loc_1075B4				; CODE XREF: showMsg+9Cj
		MOV	R0, #0		; x
		MOV	R1, R0		; y
		MOV	R2, #0x140	; xs
		MOV	R3, #0xF0	; ys
		BL	ntr2dBlank
		MOV	R1, #0xA	; x
		MOV	R2, R1		; y
		MOV	R3, #0xFF	; r
		STR	R4, [SP,#0x18+g] ; g
		STR	R4, [SP,#0x18+b] ; b
		MOV	R0, R5		; s
		BL	ntr2dPrint
		MOV	R3, #0xFF
		MOV	R1, #0xA	; x
		MOV	R2, #0xDC	; y
		STR	R3, [SP,#0x18+b] ; b
		STR	R4, [SP,#0x18+g] ; g
		MOV	R3, #0		; r
		LDR	R0, =aPressBToClose_ ; s
		BL	ntr2dPrint
		BL	update_screen
		BL	wait_pad_input
		CMP	R0, #2
		BNE	loc_1075B4
		BL	release_video
		MOV	R0, #0

loc_10761C				; CODE XREF: showMsg+24j showMsg+34j
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,R5,PC}
; End of function showMsg

; ---------------------------------------------------------------------------
off_107624	DCD allowDirectScreenAccess ; DATA XREF: showMsgr
; s64 dword_107628
dword_107628	DCD 0x3B9ACA00		; DATA XREF: showMsg+18r
off_10762C	DCD is_NTR_OSD_requested ; DATA	XREF: showMsg:loc_10759Cr
; u8 *off_107630
off_107630	DCD aPressBToClose_	; DATA XREF: showMsg+88r
					; "Press [B] to close."

; =============== S U B	R O U T	I N E =======================================


; void __stdcall showDbg(char *fmt, u32	errno, u32 v2)
showDbg					; CODE XREF: fatal_LR+18p main+130p ...
		STMFD	SP!, {R4-R6,LR}
		MOV	R6, R0
		SUB	SP, SP,	#0x190
		MOV	R5, R1
		MOV	R4, R2
		BL	sendMsg
		MOV	R0, SP		; buff
		MOV	R1, R6		; fmt
		MOV	R2, R5
		MOV	R3, R4
		BL	xsprintf
		MOV	R0, SP		; msg
		BL	showMsg
		ADD	SP, SP,	#0x190
		LDMFD	SP!, {R4-R6,PC}
; End of function showDbg


; =============== S U B	R O U T	I N E =======================================


sub_107670

var_4		= -4

		LDR	R3, =va_mapped_io_LCD
		LDR	R1, =0x1869F
		SUB	SP, SP,	#8
		LDR	R2, [R3]
		STR	R0, [R2,#0x204]
		MOV	R2, #0
		STR	R2, [SP,#8+var_4]

loc_10768C				; CODE XREF: sub_107670+30j
		LDR	R2, [SP,#8+var_4]
		CMP	R2, R1
		LDRLS	R2, [SP,#8+var_4]
		ADDLS	R2, R2,	#1
		STRLS	R2, [SP,#8+var_4]
		BLS	loc_10768C
		LDR	R2, [R3]
		MOV	R3, #0
		STR	R3, [R2,#0x204]
		LDR	R2, =0x1869F
		STR	R3, [SP,#8+var_4]

loc_1076B8				; CODE XREF: sub_107670+5Cj
		LDR	R3, [SP,#8+var_4]
		CMP	R3, R2
		LDRLS	R3, [SP,#8+var_4]
		ADDLS	R3, R3,	#1
		STRLS	R3, [SP,#8+var_4]
		BLS	loc_1076B8
		ADD	SP, SP,	#8
		BX	LR
; End of function sub_107670

; ---------------------------------------------------------------------------
off_1076D8	DCD va_mapped_io_LCD	; DATA XREF: sub_107670r
dword_1076DC	DCD 0x1869F		; DATA XREF: sub_107670+4r
					; sub_107670+40r

; =============== S U B	R O U T	I N E =======================================


sub_1076E0				; CODE XREF: sub_1076E0+10j
					; sub_107748+28p ...
		MOV	R3, R0
		ADD	R0, R0,	#1
		LDRB	R2, [R3]
		CMP	R2, #0
		BNE	sub_1076E0
		SUB	R1, R1,	#1

loc_1076F8				; CODE XREF: sub_1076E0+24j
		LDRB	R2, [R1,#1]!
		CMP	R2, #0
		STRNEB	R2, [R3],#1
		BNE	loc_1076F8
		STRB	R2, [R3]
		BX	LR
; End of function sub_1076E0


; =============== S U B	R O U T	I N E =======================================


sub_107710				; CODE XREF: sub_107748+40p

var_4		= -4

		STR	LR, [SP,#var_4]!
		MOV	R3, R1
		ADD	LR, R1,	#8

loc_10771C				; CODE XREF: sub_107710+28j
		MOV	R12, R0,LSR#28
		ADD	R2, R12, #0x30
		CMP	R2, #0x39
		ADDHI	R2, R12, #0x37
		STRB	R2, [R3],#1
		CMP	R3, LR
		MOV	R0, R0,LSL#4
		BNE	loc_10771C
		MOV	R3, #0
		STRB	R3, [R1,#8]
		LDR	PC, [SP+4+var_4],#4
; End of function sub_107710


; =============== S U B	R O U T	I N E =======================================


sub_107748

var_120		= -0x120
openflags	= -0x114
attributes	= -0x110
out		= -0x104
var_100		= -0x100
var_FC		= -0xFC
var_F8		= -0xF8
var_F4		= -0xF4
var_18		= -0x18

		STMFD	SP!, {R4-R7,LR}
		SUB	SP, SP,	#0x11C	; archive
		ADD	R4, SP,	#0x130+var_18
		MOV	R5, #0
		STRB	R5, [R4,#-0xC8]!
		MOV	R7, R0
		MOV	R6, R1
		MOV	R0, R4
		LDR	R1, =aDbg	; "/dbg"
		STR	R5, [SP,#0x130+out]
		BL	sub_1076E0
		MOV	R0, R4
		MOV	R1, R7
		BL	sub_1076E0
		MOV	R0, R6
		ADD	R1, SP,	#0x130+var_F4
		BL	sub_107710
		ADD	R1, SP,	#0x130+var_F4
		MOV	R0, R4
		BL	sub_1076E0
		MOV	R3, #3
		MOV	R0, R4
		STRB	R3, [SP,#0x130+var_100]
		BL	strlen
		ADD	R2, SP,	#0x130+var_100
		STR	R4, [SP,#0x130+var_F8]
		ADD	R3, SP,	#0x130+var_120
		LDR	R12, =cfw_02
		ADD	R0, R0,	#1
		STR	R0, [SP,#0x130+var_FC]
		LDMIA	R2, {R0-R2}
		STMIA	R3, {R0-R2}
		MOV	R3, #7
		STR	R3, [SP,#0x130+openflags] ; openflags
		ADD	R3, R12, #8
		STR	R5, [SP,#0x130+attributes] ; attributes
		LDMIA	R3, {R0-R3}
		STMEA	SP, {R0-R3}
		LDR	R1, =hFSUser
		LDMIA	R12, {R2,R3}
		LDR	R0, [R1]	; handle
		ADD	R1, SP,	#0x130+out ; out
		BL	FSUSER_OpenFileDirectly
		LDR	R0, [SP,#0x130+out] ; handle
		CMP	R0, R5
		BEQ	loc_107804
		BL	FSFILE_Close

loc_107804				; CODE XREF: sub_107748+B4j
		ADD	SP, SP,	#0x11C
		LDMFD	SP!, {R4-R7,PC}
; End of function sub_107748

; ---------------------------------------------------------------------------
off_10780C	DCD aDbg		; DATA XREF: sub_107748+20r
					; "/dbg"
off_107810	DCD cfw_02		; DATA XREF: sub_107748+6Cr
off_107814	DCD hFSUser		; DATA XREF: sub_107748+98r
; File Name   :	D:\STATION\rxTools.CFW\decrypt\NTR\xprintf\xprintf.o
; Format      :	ELF for	ARM (Relocatable)
;
; EABI version:	5
;
; Source File :	'xprintf.c'

; =============== S U B	R O U T	I N E =======================================


; void __stdcall xputc(char c)
xputc					; CODE XREF: xputs+14p	xfputs+24p ...
		LDR	R2, =outptr
		MOV	R1, R0
		LDR	R3, [R2]
		CMP	R3, #0
		ADDNE	R0, R3,	#1
		STRNE	R0, [R2]
		STRNEB	R1, [R3]
		BXNE	LR
		LDR	R3, =xfunc_out
		LDR	R3, [R3]
; File Name   :	D:\STATION\rxTools.CFW\decrypt\NTR\xprintf\xprintf.o
; Format      :	ELF for	ARM (Relocatable)
;
; EABI version:	5
;
; Source File :	'xprintf.c'
		CMP	R3, #0
		BXEQ	LR
		BX	R3
; End of function xputc

; ---------------------------------------------------------------------------
off_10784C	DCD outptr		; DATA XREF: xputcr
off_107850	DCD xfunc_out		; DATA XREF: xputc+20r

; =============== S U B	R O U T	I N E =======================================


; void __stdcall xputs(const char *str)
xputs					; CODE XREF: xvprintf+140p
		STMFD	SP!, {R4,LR}
		SUB	R4, R0,	#1

loc_10785C				; CODE XREF: xputs+18j
		LDRB	R0, [R4,#1]!	; c
		CMP	R0, #0
		BEQ	locret_107870
		BL	xputc
		B	loc_10785C
; ---------------------------------------------------------------------------

locret_107870				; CODE XREF: xputs+10j
		LDMFD	SP!, {R4,PC}
; End of function xputs


; =============== S U B	R O U T	I N E =======================================


; void __stdcall xfputs(void (__stdcall	*func)(unsigned	__int8), const char *str)
xfputs
		LDR	R3, =xfunc_out
		STMFD	SP!, {R4-R6,LR}
		SUB	R5, R1,	#1
		MOV	R4, R3
		LDR	R6, [R3]
		STR	R0, [R3]

loc_10788C				; CODE XREF: xfputs+28j
		LDRB	R0, [R5,#1]!	; c
		CMP	R0, #0
		BEQ	loc_1078A0
		BL	xputc
		B	loc_10788C
; ---------------------------------------------------------------------------

loc_1078A0				; CODE XREF: xfputs+20j
		STR	R6, [R4]
		LDMFD	SP!, {R4-R6,PC}
; End of function xfputs

; ---------------------------------------------------------------------------
off_1078A8	DCD xfunc_out		; DATA XREF: xfputsr

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void __stdcall xvprintf(const	char *fmt, va_list arp)
xvprintf				; CODE XREF: sendMsg+3Cp xprintf+14p ...

var_40		= -0x40
var_3C		= -0x3C
s		= -0x38
var_28		= -0x28

		STMFD	SP!, {R4-R11,LR}
		MOV	R3, R0
		SUB	SP, SP,	#0x1C
		MOV	R5, R1

loc_1078BC				; CODE XREF: xvprintf+154j
		LDRB	R0, [R3]
		CMP	R0, #0
		BEQ	loc_107B60
		CMP	R0, #0x25
		ADDNE	R7, R3,	#1
		BNE	loc_107A30
		LDRB	R4, [R3,#1]
		CMP	R4, #0x30
		ADDEQ	R7, R3,	#3
		LDREQB	R4, [R3,#2]
		MOVEQ	R9, #1
		BEQ	loc_107904
		CMP	R4, #0x2D
		ADDNE	R7, R3,	#2
		LDREQB	R4, [R3,#2]
		MOVNE	R9, #0
		ADDEQ	R7, R3,	#3
		MOVEQ	R9, #2

loc_107904				; CODE XREF: xvprintf+3Cj
		MOV	R8, #0
		MOV	R2, #0xA

loc_10790C				; CODE XREF: xvprintf+74j
		SUB	R3, R4,	#0x30
		CMP	R3, #9
		MLALS	R8, R2,	R8, R4
		LDRLSB	R4, [R7],#1
		SUBLS	R8, R8,	#0x30
		BLS	loc_10790C
		AND	R2, R4,	#0xDF
		CMP	R2, #0x4C
		MOV	R3, R7
		ORREQ	R9, R9,	#4
		LDREQB	R4, [R3]
		ADDEQ	R7, R7,	#1
		CMP	R4, #0
		BEQ	loc_107B60
		CMP	R4, #0x60
		SUBHI	R3, R4,	#0x20
		MOVLS	R3, R4
		UXTBHI	R3, R3
		CMP	R3, #0x4F
		BEQ	loc_1079A8
		BHI	loc_107980
		CMP	R3, #0x43
		BEQ	loc_107A14
		CMP	R3, #0x44
		BEQ	loc_107A3C
		CMP	R3, #0x42
		MOVEQ	R11, #2
		BEQ	loc_107A40
		B	loc_107A2C
; ---------------------------------------------------------------------------

loc_107980				; CODE XREF: xvprintf+B0j
		CMP	R3, #0x55
		BEQ	loc_107A3C
		CMP	R3, #0x58
		BEQ	loc_107A24
		CMP	R3, #0x53
		BNE	loc_107A2C
		ADD	R6, R5,	#4
		LDR	R5, [R5]
		MOV	R3, R5
		B	loc_1079B0
; ---------------------------------------------------------------------------

loc_1079A8				; CODE XREF: xvprintf+ACj
		MOV	R11, #8
		B	loc_107A40
; ---------------------------------------------------------------------------

loc_1079B0				; CODE XREF: xvprintf+F8j
					; xvprintf+110j
		RSB	R4, R5,	R3
		LDRB	R2, [R3],#1
		CMP	R2, #0
		BNE	loc_1079B0
		TST	R9, #2
		BNE	loc_1079E8

loc_1079C8				; CODE XREF: xvprintf+134j
		CMP	R4, R8
		ADD	R9, R4,	#1
		BCS	loc_1079E4
		MOV	R0, #0x20	; c
		BL	xputc
		MOV	R4, R9
		B	loc_1079C8
; ---------------------------------------------------------------------------

loc_1079E4				; CODE XREF: xvprintf+124j
		MOV	R4, R9

loc_1079E8				; CODE XREF: xvprintf+118j
		MOV	R0, R5		; str
		BL	xputs

loc_1079F0				; CODE XREF: xvprintf+164j
		CMP	R4, R8
		BCC	loc_107A04

loc_1079F8				; CODE XREF: xvprintf+174j
					; xvprintf+18Cj ...
		MOV	R5, R6
		MOV	R3, R7
		B	loc_1078BC
; ---------------------------------------------------------------------------

loc_107A04				; CODE XREF: xvprintf+148j
		MOV	R0, #0x20	; c
		BL	xputc
		ADD	R4, R4,	#1
		B	loc_1079F0
; ---------------------------------------------------------------------------

loc_107A14				; CODE XREF: xvprintf+B8j
		LDRB	R0, [R5]	; c
		ADD	R6, R5,	#4
		BL	xputc
		B	loc_1079F8
; ---------------------------------------------------------------------------

loc_107A24				; CODE XREF: xvprintf+E0j
		MOV	R11, #0x10
		B	loc_107A40
; ---------------------------------------------------------------------------

loc_107A2C				; CODE XREF: xvprintf+D0j xvprintf+E8j
		MOV	R0, R4		; c

loc_107A30				; CODE XREF: xvprintf+24j
		BL	xputc
		MOV	R6, R5
		B	loc_1079F8
; ---------------------------------------------------------------------------

loc_107A3C				; CODE XREF: xvprintf+C0j xvprintf+D8j
		MOV	R11, #0xA

loc_107A40				; CODE XREF: xvprintf+CCj
					; xvprintf+100j ...
		LDR	R10, [R5]
		SUB	R3, R3,	#0x44
		CLZ	R3, R3
		MOV	R3, R3,LSR#5
		ANDS	R3, R3,	R10,LSR#31
		ADD	R6, R5,	#4
		RSBNE	R10, R10, #0
		ORRNE	R9, R9,	#8
		MOV	R5, #0

loc_107A64				; CODE XREF: xvprintf+22Cj
		MOV	R0, R10
		MOV	R1, R11
		BL	__aeabi_uidivmod
		MOV	R0, R10
		UXTB	R3, R1
		STR	R1, [SP,#0x40+var_3C]
		MOV	R1, R11
		STR	R3, [SP,#0x40+var_40]
		BL	__aeabi_uidiv
		LDR	R2, [SP,#0x40+var_3C]
		LDR	R3, [SP,#0x40+var_40]
		CMP	R2, #9
		MOV	R10, R0
		BLS	loc_107AB0
		CMP	R4, #0x78
		MOVEQ	R2, #0x27
		MOVNE	R2, #7
		ADD	R3, R2,	R3
		UXTB	R3, R3

loc_107AB0				; CODE XREF: xvprintf+1ECj
		ADD	R5, R5,	#1
		ADD	R2, SP,	#0x40+s
		ADD	R2, R2,	R5
		ADD	R3, R3,	#0x30
		STRB	R3, [R2,#-1]
		MOVS	R3, R10
		MOVNE	R3, #1
		CMP	R5, #0xF
		MOVHI	R3, #0
		CMP	R3, #0
		BNE	loc_107A64
		TST	R9, #8
		ADDNE	R2, SP,	#0x40+var_28
		MOV	R3, R5
		ADDNE	R3, R2,	R3
		MOVNE	R2, #0x2D
		ADDNE	R5, R5,	#1
		STRNEB	R2, [R3,#-0x10]
		TST	R9, #1
		MOVNE	R10, #0x30
		MOVEQ	R10, #0x20
		TST	R9, #2
		MOV	R4, R5
		BNE	loc_107B30

loc_107B10				; CODE XREF: xvprintf+27Cj
		CMP	R4, R8
		ADD	R9, R4,	#1
		BCS	loc_107B2C
		MOV	R0, R10		; c
		BL	xputc
		MOV	R4, R9
		B	loc_107B10
; ---------------------------------------------------------------------------

loc_107B2C				; CODE XREF: xvprintf+26Cj
		MOV	R4, R9

loc_107B30				; CODE XREF: xvprintf+260j
					; xvprintf+298j
		SUB	R5, R5,	#1
		ADD	R3, SP,	#0x40+s
		LDRB	R0, [R3,R5]	; c
		BL	xputc
		CMP	R5, #0
		BNE	loc_107B30

loc_107B48				; CODE XREF: xvprintf+2B0j
		CMP	R4, R8
		BCS	loc_1079F8
		MOV	R0, #0x20	; c
		BL	xputc
		ADD	R4, R4,	#1
		B	loc_107B48
; ---------------------------------------------------------------------------

loc_107B60				; CODE XREF: xvprintf+18j xvprintf+94j
		ADD	SP, SP,	#0x1C
		LDMFD	SP!, {R4-R11,PC}
; End of function xvprintf


; =============== S U B	R O U T	I N E =======================================


; void xprintf(const char *fmt,	...)
xprintf					; CODE XREF: put_dump+14p put_dump+48p ...

var_1C		= -0x1C
var_14		= -0x14
varg_r0		= -0x10
varg_r1		= -0xC
varg_r2		= -8
varg_r3		= -4

		STMFD	SP!, {R0-R3}
		STMFD	SP!, {R0-R2,LR}
		ADD	R1, SP,	#0x20+varg_r1 ;	arp
		LDR	R0, [SP,#0x20+varg_r0] ; fmt
		STR	R1, [SP,#0x20+var_1C]
		BL	xvprintf
		ADD	SP, SP,	#0xC
		LDR	LR, [SP+0x14+var_14],#4
		ADD	SP, SP,	#0x10
		BX	LR
; End of function xprintf


; =============== S U B	R O U T	I N E =======================================


; void xsprintf(char *buff, const char *fmt, ...)
xsprintf				; CODE XREF: sub_100F64+9Cp
					; sub_100F64+168p ...

var_1C		= -0x1C
varg_r1		= -0xC
varg_r2		= -8
varg_r3		= -4

		STMFD	SP!, {R1-R3}
		STMFD	SP!, {R0-R2,R4,LR}
		ADD	R1, SP,	#0x20+varg_r2 ;	arp
		LDR	R4, =outptr
		STR	R1, [SP,#0x20+var_1C]
		STR	R0, [R4]
		LDR	R0, [SP,#0x20+varg_r1] ; fmt
		BL	xvprintf
		LDR	R2, [R4]
		MOV	R3, #0
		STR	R3, [R4]
		STRB	R3, [R2]
		ADD	SP, SP,	#0xC
		LDMFD	SP!, {R4,LR}
		ADD	SP, SP,	#0xC
		BX	LR
; End of function xsprintf

; ---------------------------------------------------------------------------
off_107BD0	DCD outptr		; DATA XREF: xsprintf+Cr

; =============== S U B	R O U T	I N E =======================================


; void xfprintf(void (__stdcall	*func)(unsigned	__int8), const char *fmt, ...)
xfprintf

var_1C		= -0x1C
varg_r1		= -0xC
varg_r2		= -8
varg_r3		= -4

		STMFD	SP!, {R1-R3}
		STMFD	SP!, {R0,R1,R4,R5,LR}
		ADD	R1, SP,	#0x20+varg_r2 ;	arp
		LDR	R4, =xfunc_out
		STR	R1, [SP,#0x20+var_1C]
		LDR	R5, [R4]
		STR	R0, [R4]
		LDR	R0, [SP,#0x20+varg_r1] ; fmt
		BL	xvprintf
		STR	R5, [R4]
		ADD	SP, SP,	#8
		LDMFD	SP!, {R4,R5,LR}
		ADD	SP, SP,	#0xC
		BX	LR
; End of function xfprintf

; ---------------------------------------------------------------------------
off_107C0C	DCD xfunc_out		; DATA XREF: xfprintf+Cr

; =============== S U B	R O U T	I N E =======================================


; void __stdcall put_dump(const	void *buff, unsigned __int32 addr, int len, int	width)
put_dump
		STMFD	SP!, {R4-R6,LR}
		MOV	R6, R3
		MOV	R5, R0
		LDR	R0, =a08lx	; "%08lX "
		MOV	R4, R2
		BL	xprintf
		CMP	R6, #2
		BEQ	loc_107C94
		CMP	R6, #4
		BEQ	loc_107CAC
		CMP	R6, #1
		MOVEQ	R6, R5
		BNE	loc_107CC0

loc_107C44				; CODE XREF: put_dump+4Cj
		RSB	R3, R5,	R6
		CMP	R3, R4
		BGE	loc_107C60
		LDR	R0, =a02x	; " %02X"
		LDRB	R1, [R6],#1
		BL	xprintf
		B	loc_107C44
; ---------------------------------------------------------------------------

loc_107C60				; CODE XREF: put_dump+3Cj
		MOV	R0, #0x20	; c
		BL	xputc
		MOV	R6, R5

loc_107C6C				; CODE XREF: put_dump+80j
		RSB	R3, R5,	R6
		CMP	R3, R4
		BGE	loc_107CC0
		LDRB	R3, [R6],#1
		SUB	R0, R3,	#0x20
		CMP	R0, #0x5E
		MOVLS	R0, R3
		MOVHI	R0, #0x2E	; c
		BL	xputc
		B	loc_107C6C
; ---------------------------------------------------------------------------

loc_107C94				; CODE XREF: put_dump+1Cj put_dump+94j
		LDR	R0, =a04x	; " %04X"
		LDRH	R1, [R5],#2
		BL	xprintf
		SUBS	R4, R4,	#1
		BNE	loc_107C94
		B	loc_107CC0
; ---------------------------------------------------------------------------

loc_107CAC				; CODE XREF: put_dump+24j put_dump+ACj
		LDR	R0, =a08lx_0	; " %08LX"
		LDR	R1, [R5],#4
		BL	xprintf
		SUBS	R4, R4,	#1
		BNE	loc_107CAC

loc_107CC0				; CODE XREF: put_dump+30j put_dump+64j ...
		MOV	R0, #0xA	; c
		LDMFD	SP!, {R4-R6,LR}
		B	xputc
; End of function put_dump

; ---------------------------------------------------------------------------
; char *off_107CCC
off_107CCC	DCD a08lx		; DATA XREF: put_dump+Cr
					; "%08lX "
; char *off_107CD0
off_107CD0	DCD a02x		; DATA XREF: put_dump+40r
					; " %02X"
; char *off_107CD4
off_107CD4	DCD a04x		; DATA XREF: put_dump:loc_107C94r
					; " %04X"
; char *off_107CD8
off_107CD8	DCD a08lx_0		; DATA XREF: put_dump:loc_107CACr
					; " %08LX"

; =============== S U B	R O U T	I N E =======================================


; int __stdcall	xgets(char *buff, int len)
xgets					; CODE XREF: xfgets+18p
		LDR	R3, =xfunc_in
		LDR	R2, [R3]
		CMP	R2, #0
		BEQ	loc_107D84
		STMFD	SP!, {R4-R8,LR}
		MOV	R7, R3
		MOV	R6, R0
		MOV	R4, #0
		SUB	R5, R1,	#1

loc_107D00				; CODE XREF: xgets+68j	xgets+70j ...
		LDR	R3, [R7]
		BLX	R3
		SUBS	R3, R0,	#0
		BNE	loc_107D18
		MOV	R0, #0
		LDMFD	SP!, {R4-R8,PC}
; ---------------------------------------------------------------------------

loc_107D18				; CODE XREF: xgets+30j
		CMP	R3, #0xD
		BEQ	loc_107D6C
		CMP	R4, #0
		SUB	R2, R3,	#8
		CLZ	R2, R2
		MOV	R2, R2,LSR#5
		MOVEQ	R2, #0
		CMP	R2, #0
		BEQ	loc_107D48
		SUB	R4, R4,	#1
		BL	xputc
		B	loc_107D00
; ---------------------------------------------------------------------------

loc_107D48				; CODE XREF: xgets+5Cj
		CMP	R3, #0x1F
		BLE	loc_107D00
		CMP	R4, R5
		BGE	loc_107D00
		STRB	R3, [R6,R4]
		ADD	R8, R4,	#1
		BL	xputc
		MOV	R4, R8
		B	loc_107D00
; ---------------------------------------------------------------------------

loc_107D6C				; CODE XREF: xgets+40j
		MOV	R3, #0
		STRB	R3, [R6,R4]
		MOV	R0, #0xA	; c
		BL	xputc
		MOV	R0, #1
		LDMFD	SP!, {R4-R8,PC}
; ---------------------------------------------------------------------------

loc_107D84				; CODE XREF: xgets+Cj
		MOV	R0, #0
		BX	LR
; End of function xgets

; ---------------------------------------------------------------------------
off_107D8C	DCD xfunc_in		; DATA XREF: xgetsr

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int __stdcall	xfgets(unsigned	__int8 (*func)(void), char *buff, int len)
xfgets
		STMFD	SP!, {R3-R5,LR}
		LDR	R4, =xfunc_in
		LDR	R5, [R4]
		STR	R0, [R4]
		MOV	R0, R1		; buff
		MOV	R1, R2		; len
		BL	xgets
		STR	R5, [R4]
		LDMFD	SP!, {R3-R5,PC}
; End of function xfgets

; ---------------------------------------------------------------------------
off_107DB4	DCD xfunc_in		; DATA XREF: xfgets+4r

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int __stdcall	xatoi(char **str, __int32 *res)
xatoi
		MOV	R3, #0
		STR	R3, [R1]

loc_107DC0				; CODE XREF: xatoi+1Cj
		LDR	R2, [R0]
		LDRB	R3, [R2]
		CMP	R3, #0x20
		ADDEQ	R2, R2,	#1
		STREQ	R2, [R0]
		BEQ	loc_107DC0
		CMP	R3, #0x2D
		ADDEQ	R3, R2,	#1
		STMFD	SP!, {R4,LR}
		MOVEQ	R4, #1
		STREQ	R3, [R0]
		LDREQB	R3, [R2,#1]
		MOVNE	R4, #0
		CMP	R3, #0x30
		BNE	loc_107E64
		LDR	R2, [R0]
		ADD	R3, R2,	#1
		STR	R3, [R0]
		LDRB	R3, [R2,#1]
		CMP	R3, #0x62
		BEQ	loc_107E30
		CMP	R3, #0x78
		BNE	loc_107E44
		ADD	R3, R2,	#2
		STR	R3, [R0]
		MOV	LR, #0x10
		LDRB	R3, [R2,#2]
		B	loc_107E74
; ---------------------------------------------------------------------------

loc_107E30				; CODE XREF: xatoi+58j
		ADD	R3, R2,	#2
		STR	R3, [R0]
		MOV	LR, #2
		LDRB	R3, [R2,#2]
		B	loc_107E74
; ---------------------------------------------------------------------------

loc_107E44				; CODE XREF: xatoi+60j
		CMP	R3, #0x20
		BLS	loc_107ED8
		SUB	R2, R3,	#0x30
		CMP	R2, #9
		MOVLS	LR, #8
		BLS	loc_107E74

loc_107E5C				; CODE XREF: xatoi+B8j	xatoi+F0j ...
		MOV	R0, #0
		LDMFD	SP!, {R4,PC}
; ---------------------------------------------------------------------------

loc_107E64				; CODE XREF: xatoi+40j
		SUB	R2, R3,	#0x30
		CMP	R2, #9
		MOVLS	LR, #0xA
		BHI	loc_107E5C

loc_107E74				; CODE XREF: xatoi+74j	xatoi+88j ...
		MOV	R12, #0

loc_107E78				; CODE XREF: xatoi+110j
		CMP	R3, #0x20
		BLS	loc_107ECC
		CMP	R3, #0x60
		SUBHI	R3, R3,	#0x20
		UXTBHI	R3, R3
		SUB	R2, R3,	#0x30
		UXTB	R2, R2
		CMP	R2, #0x10
		BLS	loc_107EAC
		SUB	R3, R3,	#0x37
		UXTB	R2, R3
		CMP	R2, #9
		BLS	loc_107E5C

loc_107EAC				; CODE XREF: xatoi+E0j
		CMP	R2, LR
		BCS	loc_107E5C
		LDR	R3, [R0]
		MLA	R12, LR, R12, R2
		ADD	R2, R3,	#1
		STR	R2, [R0]
		LDRB	R3, [R3,#1]
		B	loc_107E78
; ---------------------------------------------------------------------------

loc_107ECC				; CODE XREF: xatoi+C4j
		CMP	R4, #0
		RSBNE	R12, R12, #0
		STR	R12, [R1]

loc_107ED8				; CODE XREF: xatoi+90j
		MOV	R0, #1
		LDMFD	SP!, {R4,PC}
; End of function xatoi

; [000000F0 BYTES: COLLAPSED FUNCTION memcpy. PRESS KEYPAD CTRL-"+" TO EXPAND]
; [000000F4 BYTES: COLLAPSED FUNCTION memset. PRESS KEYPAD CTRL-"+" TO EXPAND]

; =============== S U B	R O U T	I N E =======================================


strcat					; CODE XREF: showMenu+BCp
		TST	R0, #3
		STMFD	SP!, {R4,LR}
		MOV	R4, R0
		BNE	loc_108118
		LDR	R0, [R4]
		LDR	R3, =0xFEFEFEFF
		LDR	R2, =0x80808080
		ADD	R3, R0,	R3
		BIC	R3, R3,	R0
		AND	R2, R2,	R3
		CMP	R2, #0
		MOV	R0, R4
		BNE	loc_108118

loc_1080F8				; CODE XREF: strcat+50j
		LDR	LR, [R0,#4]!
		LDR	R2, =0xFEFEFEFF
		LDR	R12, =0x80808080
		ADD	R2, LR,	R2
		BIC	R2, R2,	LR
		AND	R12, R12, R2
		CMP	R12, #0
		BEQ	loc_1080F8

loc_108118				; CODE XREF: strcat+Cj	strcat+30j
		LDRB	R2, [R0]
		CMP	R2, #0
		BEQ	loc_108130

loc_108124				; CODE XREF: strcat+68j
		LDRB	R2, [R0,#1]!
		CMP	R2, #0
		BNE	loc_108124

loc_108130				; CODE XREF: strcat+5Cj
		BL	strncpy
		MOV	R0, R4
		LDMFD	SP!, {R4,LR}
		BX	LR
; End of function strcat

; ---------------------------------------------------------------------------
dword_108140	DCD 0xFEFEFEFF		; DATA XREF: strcat+14r strcat+38r
dword_108144	DCD 0x80808080		; DATA XREF: strcat+18r strcat+3Cr

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

strcmp					; CODE XREF: plgGetSharedServiceHandle+Cp

var_4		= -4

		EOR	R12, R0, R1
		TST	R12, #3
		BNE	loc_1081DC
		ANDS	R12, R0, #3
		BIC	R0, R0,	#3
		BIC	R1, R1,	#3
		LDR	R2, [R0],#4
		LDREQ	R3, [R1],#4
		BEQ	loc_108188
		EOR	R12, R12, #3
		MOV	R3, #0xFFFFFF
		MOV	R12, R12,LSL#3
		MOV	R12, R3,LSR R12
		LDR	R3, [R1],#4
		ORR	R2, R2,	R12
		ORR	R3, R3,	R12

loc_108188				; CODE XREF: strcmp+20j
		STR	R4, [SP,#var_4]!
		MOV	R4, #1
		ORR	R4, R4,	R4,LSL#8
		ORR	R4, R4,	R4,LSL#16

loc_108198				; CODE XREF: strcmp+68j
		SUB	R12, R2, R4
		CMP	R2, R3
		BICEQ	R12, R12, R2
		TSTEQ	R12, R4,LSL#7
		LDREQ	R2, [R0],#4
		LDREQ	R3, [R1],#4
		BEQ	loc_108198

loc_1081B4				; CODE XREF: strcmp+80j
		MOV	R0, R2,LSL#24
		MOV	R2, R2,LSR#8
		CMP	R0, #1
		CMPCS	R0, R3,LSL#24
		MOVEQ	R3, R3,LSR#8
		BEQ	loc_1081B4
		AND	R3, R3,	#0xFF
		RSB	R0, R3,	R0,LSR#24
		LDR	R4, [SP+4+var_4],#4
		BX	LR
; ---------------------------------------------------------------------------

loc_1081DC				; CODE XREF: strcmp+8j	strcmp+ACj
		TST	R0, #3
		BEQ	loc_108200
		LDRB	R2, [R0],#1
		LDRB	R3, [R1],#1
		CMP	R2, #1
		CMPCS	R2, R3
		BEQ	loc_1081DC
		SUB	R0, R2,	R3
		BX	LR
; ---------------------------------------------------------------------------

loc_108200				; CODE XREF: strcmp+98j
		STMFD	SP!, {R4,R5}
		MOV	R4, #1
		ORR	R4, R4,	R4,LSL#8
		ORR	R4, R4,	R4,LSL#16
		LDR	R2, [R0],#4
		AND	R5, R1,	#3
		BIC	R1, R1,	#3
		LDR	R3, [R1],#4
		CMP	R5, #2
		BEQ	loc_108288
		BHI	loc_1082E4

loc_10822C				; CODE XREF: strcmp+114j
		BIC	R5, R2,	#0xFF000000
		CMP	R5, R3,LSR#8
		SUB	R12, R2, R4
		BIC	R12, R12, R2
		BNE	loc_108260
		ANDS	R12, R12, R4,LSL#7
		LDREQ	R3, [R1],#4
		BNE	loc_108268
		EOR	R5, R5,	R2
		CMP	R5, R3,LSL#24
		BNE	loc_10827C
		LDR	R2, [R0],#4
		B	loc_10822C
; ---------------------------------------------------------------------------

loc_108260				; CODE XREF: strcmp+F4j
		MOV	R3, R3,LSR#8
		B	loc_108344
; ---------------------------------------------------------------------------

loc_108268				; CODE XREF: strcmp+100j
		BICS	R12, R12, #0xFF000000
		BNE	loc_108338
		LDRB	R3, [R1]
		MOV	R5, R2,LSR#24
		B	loc_108344
; ---------------------------------------------------------------------------

loc_10827C				; CODE XREF: strcmp+10Cj
		MOV	R5, R2,LSR#24
		AND	R3, R3,	#0xFF
		B	loc_108344
; ---------------------------------------------------------------------------

loc_108288				; CODE XREF: strcmp+DCj strcmp+174j
		MOV	R5, R2,LSL#16
		SUB	R12, R2, R4
		MOV	R5, R5,LSR#16
		BIC	R12, R12, R2
		CMP	R5, R3,LSR#16
		BNE	loc_1082DC
		ANDS	R12, R12, R4,LSL#7
		LDREQ	R3, [R1],#4
		BNE	loc_1082C0
		EOR	R5, R5,	R2
		CMP	R5, R3,LSL#16
		BNE	loc_1082D4
		LDR	R2, [R0],#4
		B	loc_108288
; ---------------------------------------------------------------------------

loc_1082C0				; CODE XREF: strcmp+160j
		MOVS	R12, R12,LSL#16
		BNE	loc_108338
		LDRH	R3, [R1]
		MOV	R5, R2,LSR#16
		B	loc_108344
; ---------------------------------------------------------------------------

loc_1082D4				; CODE XREF: strcmp+16Cj
		MOV	R3, R3,LSL#16
		MOV	R5, R2,LSR#16

loc_1082DC				; CODE XREF: strcmp+154j
		MOV	R3, R3,LSR#16
		B	loc_108344
; ---------------------------------------------------------------------------

loc_1082E4				; CODE XREF: strcmp+E0j strcmp+1CCj
		AND	R5, R2,	#0xFF
		CMP	R5, R3,LSR#24
		SUB	R12, R2, R4
		BIC	R12, R12, R2
		BNE	loc_108318
		ANDS	R12, R12, R4,LSL#7
		LDREQ	R3, [R1],#4
		BNE	loc_108320
		EOR	R5, R5,	R2
		CMP	R5, R3,LSL#8
		BNE	loc_10832C
		LDR	R2, [R0],#4
		B	loc_1082E4
; ---------------------------------------------------------------------------

loc_108318				; CODE XREF: strcmp+1ACj
		MOV	R3, R3,LSR#24
		B	loc_108344
; ---------------------------------------------------------------------------

loc_108320				; CODE XREF: strcmp+1B8j
		TST	R2, #0xFF
		BEQ	loc_108338
		LDR	R3, [R1],#4

loc_10832C				; CODE XREF: strcmp+1C4j
		MOV	R5, R2,LSR#8
		BIC	R3, R3,	#0xFF000000
		B	loc_108344
; ---------------------------------------------------------------------------

loc_108338				; CODE XREF: strcmp+124j strcmp+17Cj ...
		MOV	R0, #0
		LDMFD	SP!, {R4,R5}
		BX	LR
; ---------------------------------------------------------------------------

loc_108344				; CODE XREF: strcmp+11Cj strcmp+130j ...
		AND	R2, R5,	#0xFF
		AND	R0, R3,	#0xFF
		CMP	R0, #1
		CMPCS	R0, R2
		MOVEQ	R5, R5,LSR#8
		MOVEQ	R3, R3,LSR#8
		BEQ	loc_108344
		SUB	R0, R2,	R0
		LDMFD	SP!, {R4,R5}
		BX	LR
; End of function strcmp

; [000000F0 BYTES: COLLAPSED FUNCTION strncpy. PRESS KEYPAD CTRL-"+" TO EXPAND]
; [00000060 BYTES: COLLAPSED FUNCTION strlen. PRESS KEYPAD CTRL-"+" TO EXPAND]
; [000000F4 BYTES: COLLAPSED FUNCTION __aeabi_uidiv. PRESS KEYPAD CTRL-"+" TO EXPAND]
; [00000020 BYTES: COLLAPSED FUNCTION __aeabi_uidivmod.	PRESS KEYPAD CTRL-"+" TO EXPAND]
; ---------------------------------------------------------------------------
; [00000004 BYTES: COLLAPSED CHUNK OF FUNCTION __aeabi_uidiv. PRESS KEYPAD CTRL-"+" TO EXPAND]
pid_of_home_menu DCD 0xF		; DATA XREF: get_nintendo_home_version_info+18o
					; get_nintendo_home_version_info+1Cr ...
va_mapped_io_LCD DCD 0xFFFC4000		; DATA XREF: lcd_solid_fill+1Cr
					; lcd_solid_fill+40r ...
ntrKeyOpenMenu	DCD 0xC00		; DATA XREF: threadNtrHomeInjectee+E8r
					; ntrSetHotkey:loc_1035ACo ...
		DCD 2
va_mapped_io_PDC DCD 0xFFFBC000		; DATA XREF: plgGetIoBase+24o
					; ROM:off_1034CCo ...
va_mapped_io_PAD DCD 0xFFFC2000		; DATA XREF: plgGetIoBase+14o
					; ROM:off_1034C8o ...
		DCD 1, 1
p_plgloader_info_ver_specific DCD 0x6200000 ; DATA XREF: plgRequestMemory+2Co
					; plgRequestMemory+30r	...
dword_1085F8	DCD 0x7000000		; DATA XREF: ntrAllocPluginMemory+14r
					; inject_into_nintendo_home+78r ...
hCurKProcess	DCD 0xFFFF8001		; DATA XREF: inject_ntr_into_remote_process+8Co
					; inject_ntr_into_remote_process+98r ...
cfw_02		DCD 9			; DATA XREF: sub_1011E4+28o
					; sub_1011E4+5Co ...
byte_108604	DCB 1			; DATA XREF: threadNtrHomeInjectee+70w
					; main+58w
		DCB 0, 0, 0
dword_108608	DCD 1			; DATA XREF: sub_1011E4+50o
					; threadNtrHomeInjectee+74w ...
dword_10860C	DCD 0x10A4DD		; DATA XREF: threadNtrHomeInjectee+7Cw
					; main+64w
		DCD 0, 0
va_arm11_kernel_base_W DCD 0xDFF80000	; DATA XREF: install_SVC_6D_hook+8o
					; install_SVC_6D_hook+28r ...
dword_10861C	DCD 0xA35C		; DATA XREF: install_SVC_6D_hook+48r
					; install_SVC_6D_hook+70r
pcb_arm11_dispatch DCD 0x1019A8		; DATA XREF: install_SVC_6D_hook+7Cw
					; arm11kCmdUnused5+18r	...
dword_108624	DCD 0xFFF00000		; DATA XREF: install_SVC_6D_hook+74r
offs_KProcessHandleTable DCD 0xDC	; DATA XREF: handle_queryhandle_packet+4Co
					; handle_queryhandle_packet+54r ...
dword_10862C	DCD 0xBC		; DATA XREF: arm11kDispatchCmd+A4r
offs_KCodeSet	DCD 0xB8		; DATA XREF: sub_104524+20o
					; sub_104524+2Cr ...
; u32 pa_N3DS[36]
pa_N3DS		DCD 0x1F000000,	4, 0x1095B4, 5,	0x109590, 6, 0x109530
					; DATA XREF: ntr2dBlank+8o
					; ntr2dBlank+1Cr ...
		DCD 0xA, 0x21, 0xB, 0x10, 0x15,	0, 0x11, 0, 0x12, 0, 0x13
		DCD 8, 0x16, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0x108638
		DCD 0, 0
offsets		DCD off_1001B4		; DATA XREF: ntrEntry+18o
					; ntrEntry:loc_10014Co	...
		DCD 0x17, 0x1001B8, 0x17, 0x1001BC, 0x17, 0x1002D8, 0x17
		DCD 0x100374, 0x17, 0x100480, 0x17, 0x100658, 0x17, 0x100680
		DCD 0x17, 0x100684, 0x17, 0x100C08, 0x17, 0x100C10, 0x17
		DCD 0x100C94, 0x17, 0x100C98, 0x17, 0x100E28, 0x17, 0x100E2C
		DCD 0x17, 0x100E38, 0x17, 0x100E40, 0x17, 0x100E48, 0x17
		DCD 0x100E5C, 0x17, 0x100E94, 0x17, 0x100EE4, 0x17, 0x100F38
		DCD 0x17, 0x100F60, 0x17, 0x10110C, 0x17, 0x101110, 0x17
		DCD 0x101114, 0x17, 0x101118, 0x17, 0x1011B8, 0x17, 0x1011BC
		DCD 0x17, 0x1011C0, 0x17, 0x1011C4, 0x17, 0x1011E0, 0x17
		DCD 0x101270, 0x17, 0x101274, 0x17, 0x1013B0, 0x17, 0x1013B4
		DCD 0x17, 0x1013B8, 0x17, 0x1013BC, 0x17, 0x1013C0, 0x17
		DCD 0x1013C4, 0x17, 0x1013C8, 0x17, 0x1013CC, 0x17, 0x1013D0
		DCD 0x17, 0x1013D4, 0x17, 0x1013DC, 0x17, 0x1013E0, 0x17
		DCD 0x1013E8, 0x17, 0x1013EC, 0x17, 0x1014D4, 0x17, 0x1014D8
		DCD 0x17, 0x10155C, 0x17, 0x101560, 0x17, 0x101564, 0x17
		DCD 0x101568, 0x17, 0x10156C, 0x17, 0x101860, 0x17, 0x101864
		DCD 0x17, 0x101868, 0x17, 0x10186C, 0x17, 0x101870, 0x17
		DCD 0x101874, 0x17, 0x101878, 0x17, 0x10187C, 0x17, 0x101880
		DCD 0x17, 0x101884, 0x17, 0x101888, 0x17, 0x10188C, 0x17
		DCD 0x101894, 0x17, 0x101898, 0x17, 0x1018A0, 0x17, 0x1018A4
		DCD 0x17, 0x1018AC, 0x17, 0x1018B0, 0x17, 0x1018B4, 0x17
		DCD 0x1018BC, 0x17, 0x1018C8, 0x17, 0x101A10, 0x17, 0x101A70
		DCD 0x17, 0x101A98, 0x17, 0x101AE8, 0x17, 0x101AEC, 0x17
		DCD 0x101B3C, 0x17, 0x101B40, 0x17, 0x101C6C, 0x17, 0x101C70
		DCD 0x17, 0x101C74, 0x17, 0x101C7C, 0x17, 0x101C80, 0x17
		DCD 0x101CC0, 0x17, 0x101D38, 0x17, 0x101D3C, 0x17, 0x101D40
		DCD 0x17, 0x101DB8, 0x17, 0x101DBC, 0x17, 0x101DC0, 0x17
		DCD 0x101E9C, 0x17, 0x101F9C, 0x17, 0x101FA0, 0x17, 0x101FA4
		DCD 0x17, 0x101FA8, 0x17, 0x102040, 0x17, 0x102044, 0x17
		DCD 0x102048, 0x17, 0x102110, 0x17, 0x102114, 0x17, 0x102118
		DCD 0x17, 0x10211C, 0x17, 0x102120, 0x17, 0x1021EC, 0x17
		DCD 0x1021F0, 0x17, 0x1021F4, 0x17, 0x1021F8, 0x17, 0x10235C
		DCD 0x17, 0x102360, 0x17, 0x102364, 0x17, 0x102368, 0x17
		DCD 0x10236C, 0x17, 0x102370, 0x17, 0x102374, 0x17, 0x10237C
		DCD 0x17, 0x102380, 0x17, 0x102384, 0x17, 0x102424, 0x17
		DCD 0x102428, 0x17, 0x10242C, 0x17, 0x102430, 0x17, 0x1024F4
		DCD 0x17, 0x1024F8, 0x17, 0x1024FC, 0x17, 0x102500, 0x17
		DCD 0x102504, 0x17, 0x102660, 0x17, 0x102664, 0x17, 0x10266C
		DCD 0x17, 0x102674, 0x17, 0x102678, 0x17, 0x1027D8, 0x17
		DCD 0x1027DC, 0x17, 0x1027E0, 0x17, 0x1027EC, 0x17, 0x1027F0
		DCD 0x17, 0x10297C, 0x17, 0x102980, 0x17, 0x102984, 0x17
		DCD 0x102988, 0x17, 0x102AA8, 0x17, 0x102AAC, 0x17, 0x102AB0
		DCD 0x17, 0x102AB4, 0x17, 0x102AB8, 0x17, 0x102ABC, 0x17
		DCD 0x102AC0, 0x17, 0x102C68, 0x17, 0x102C6C, 0x17, 0x102C70
		DCD 0x17, 0x102C74, 0x17, 0x102C78, 0x17, 0x102C7C, 0x17
		DCD 0x102C80, 0x17, 0x102C88, 0x17, 0x102C8C, 0x17, 0x102C90
		DCD 0x17, 0x102C98, 0x17, 0x102C9C, 0x17, 0x102CA4, 0x17
		DCD 0x102D48, 0x17, 0x102D50, 0x17, 0x102D54, 0x17, 0x102DAC
		DCD 0x17, 0x102DB0, 0x17, 0x102DB4, 0x17, 0x102DB8, 0x17
		DCD 0x102E5C, 0x17, 0x102E60, 0x17, 0x102F8C, 0x17, 0x102F90
		DCD 0x17, 0x102F94, 0x17, 0x1030D8, 0x17, 0x1030DC, 0x17
		DCD 0x1030E4, 0x17, 0x1030E8, 0x17, 0x1030EC, 0x17, 0x103148
		DCD 0x17, 0x10314C, 0x17, 0x103150, 0x17, 0x103344, 0x17
		DCD 0x10334C, 0x17, 0x103350, 0x17, 0x103354, 0x17, 0x103358
		DCD 0x17, 0x10335C, 0x17, 0x103360, 0x17, 0x103364, 0x17
		DCD 0x103368, 0x17, 0x103448, 0x17, 0x10344C, 0x17, 0x103480
		DCD 0x17, 0x103484, 0x17, 0x1034C4, 0x17, 0x1034C8, 0x17
		DCD 0x1034CC, 0x17, 0x103548, 0x17, 0x10354C, 0x17, 0x1035DC
		DCD 0x17, 0x1035E0, 0x17, 0x1035E4, 0x17, 0x1035E8, 0x17
		DCD 0x1035EC, 0x17, 0x1035F0, 0x17, 0x1035F4, 0x17, 0x103738
		DCD 0x17, 0x10373C, 0x17, 0x103740, 0x17, 0x103744, 0x17
		DCD 0x103748, 0x17, 0x10374C, 0x17, 0x103750, 0x17, 0x103754
		DCD 0x17, 0x103758, 0x17, 0x10379C, 0x17, 0x1037A0, 0x17
		DCD 0x103848, 0x17, 0x10384C, 0x17, 0x103850, 0x17, 0x10385C
		DCD 0x17, 0x1038C0, 0x17, 0x1038C4, 0x17, 0x1038C8, 0x17
		DCD 0x1038CC, 0x17, 0x1038D0, 0x17, 0x103B30, 0x17, 0x103B34
		DCD 0x17, 0x103B38, 0x17, 0x103B3C, 0x17, 0x103B44, 0x17
		DCD 0x103B48, 0x17, 0x103B4C, 0x17, 0x103B54, 0x17, 0x103B58
		DCD 0x17, 0x103B5C, 0x17, 0x103B60, 0x17, 0x103B64, 0x17
		DCD 0x103B8C, 0x17, 0x103BE8, 0x17, 0x103BEC, 0x17, 0x103BF0
		DCD 0x17, 0x103C1C, 0x17, 0x103C20, 0x17, 0x103C24, 0x17
		DCD 0x103D28, 0x17, 0x103D2C, 0x17, 0x103D30, 0x17, 0x103D6C
		DCD 0x17, 0x103D70, 0x17, 0x103D74, 0x17, 0x103D78, 0x17
		DCD 0x103E78
		DCD 0x17, 0x103E7C, 0x17, 0x103E80, 0x17, 0x103E84, 0x17
		DCD 0x103E88, 0x17, 0x103E8C, 0x17, 0x103E90, 0x17, 0x103F14
		DCD 0x17, 0x103F18, 0x17, 0x103F1C, 0x17, 0x103F20, 0x17
		DCD 0x103F24, 0x17, 0x103FA4, 0x17, 0x103FA8, 0x17, 0x104030
		DCD 0x17, 0x104034, 0x17, 0x104038, 0x17, 0x10403C, 0x17
		DCD 0x104040, 0x17, 0x104194, 0x17, 0x104198, 0x17, 0x10419C
		DCD 0x17, 0x1041A0, 0x17, 0x1041A4, 0x17, 0x1041A8, 0x17
		DCD 0x1041AC, 0x17, 0x1041B0, 0x17, 0x1041B4, 0x17, 0x1041B8
		DCD 0x17, 0x1041BC, 0x17, 0x1041C0, 0x17, 0x1041C4, 0x17
		DCD 0x1041C8, 0x17, 0x1041CC, 0x17, 0x1041D0, 0x17, 0x1041D4
		DCD 0x17, 0x104238, 0x17, 0x10423C, 0x17, 0x104240, 0x17
		DCD 0x104264, 0x17, 0x1042C8, 0x17, 0x1042D0, 0x17, 0x104374
		DCD 0x17, 0x104378, 0x17, 0x104504, 0x17, 0x104508, 0x17
		DCD 0x104520, 0x17, 0x104574, 0x17, 0x104630, 0x17, 0x104634
		DCD 0x17, 0x1047CC, 0x17, 0x1047D0, 0x17, 0x1047D4, 0x17
		DCD 0x1047D8, 0x17, 0x1047DC, 0x17, 0x1047E4, 0x17, 0x1047EC
		DCD 0x17, 0x104988, 0x17, 0x10498C, 0x17, 0x104990, 0x17
		DCD 0x104994, 0x17, 0x104998, 0x17, 0x10499C, 0x17, 0x1049A0
		DCD 0x17, 0x1049A4, 0x17, 0x104AEC, 0x17, 0x104AF0, 0x17
		DCD 0x104AF4, 0x17, 0x104AF8, 0x17, 0x104AFC, 0x17, 0x104B04
		DCD 0x17, 0x104B08, 0x17, 0x104BE4, 0x17, 0x104D34, 0x17
		DCD 0x104D38, 0x17, 0x104D3C, 0x17, 0x104D40, 0x17, 0x104D44
		DCD 0x17, 0x104D48, 0x17, 0x105010, 0x17, 0x105014, 0x17
		DCD 0x105018, 0x17, 0x10501C, 0x17, 0x105150, 0x17, 0x105154
		DCD 0x17, 0x105158, 0x17, 0x10515C, 0x17, 0x105160, 0x17
		DCD 0x105164, 0x17, 0x1051E4, 0x17, 0x105390, 0x17, 0x105394
		DCD 0x17, 0x1056BC, 0x17, 0x105840, 0x17, 0x105844, 0x17
		DCD 0x105848, 0x17, 0x105850, 0x17, 0x105854, 0x17, 0x105858
		DCD 0x17, 0x10591C, 0x17, 0x105920, 0x17, 0x105924, 0x17
		DCD 0x105928, 0x17, 0x10592C, 0x17, 0x105930, 0x17, 0x105934
		DCD 0x17, 0x105938, 0x17, 0x105990, 0x17, 0x105994, 0x17
		DCD 0x105998, 0x17, 0x10599C, 0x17, 0x1059A0, 0x17, 0x1059A4
		DCD 0x17, 0x1059A8, 0x17, 0x1059AC, 0x17, 0x1059B0, 0x17
		DCD 0x1059B4, 0x17, 0x1059F0, 0x17, 0x105A40, 0x17, 0x105A7C
		DCD 0x17, 0x105AE0, 0x17, 0x105AE4, 0x17, 0x105AF4, 0x17
		DCD 0x105B64, 0x17, 0x105BC4, 0x17, 0x105C2C, 0x17, 0x105C94
		DCD 0x17, 0x105D94, 0x17, 0x105E64, 0x17, 0x105F34, 0x17
		DCD 0x10605C, 0x17, 0x1061A4, 0x17, 0x1062B4, 0x17, 0x1063CC
		DCD 0x17, 0x106518, 0x17, 0x1065A8, 0x17, 0x10666C, 0x17
		DCD 0x1066D0, 0x17, 0x106710, 0x17, 0x1067FC, 0x17, 0x1068EC
		DCD 0x17, 0x10691C, 0x17, 0x106958, 0x17, 0x10698C, 0x17
		DCD 0x106990, 0x17, 0x106A18, 0x17, 0x106E64, 0x17, 0x106E78
		DCD 0x17, 0x106ED0, 0x17, 0x106FC0, 0x17, 0x106FC4, 0x17
		DCD 0x106FC8, 0x17, 0x106FF4, 0x17, 0x106FF8, 0x17, 0x107018
		DCD 0x17, 0x10701C, 0x17, 0x107044, 0x17, 0x107048, 0x17
		DCD 0x107074, 0x17, 0x107078, 0x17, 0x107098, 0x17, 0x10709C
		DCD 0x17, 0x1070B8, 0x17, 0x1070BC, 0x17, 0x107128, 0x17
		DCD 0x1071EC, 0x17, 0x1071F0, 0x17, 0x10721C, 0x17, 0x1072E4
		DCD 0x17, 0x1072E8, 0x17, 0x1072EC, 0x17, 0x1072F0, 0x17
		DCD 0x1072F4, 0x17, 0x107360, 0x17, 0x107364, 0x17, 0x107368
		DCD 0x17, 0x1073CC, 0x17, 0x1073EC, 0x17, 0x107568, 0x17
		DCD 0x10756C, 0x17, 0x107570, 0x17, 0x107624, 0x17, 0x10762C
		DCD 0x17, 0x107630, 0x17, 0x1076D8, 0x17, 0x10780C, 0x17
		DCD 0x107810, 0x17, 0x107814, 0x17, 0x10784C, 0x17, 0x107850
		DCD 0x17, 0x1078A8, 0x17, 0x107BD0, 0x17, 0x107C0C, 0x17
		DCD 0x107CCC, 0x17, 0x107CD0, 0x17, 0x107CD4, 0x17, 0x107CD8
		DCD 0x17, 0x107D8C, 0x17, 0x107DB4, 0x17, 0x10860C, 0x17
		DCD 0x108620, 0x17, 0x109E0C, 0x17, 0x109E10, 0x17
aUsrLibLd_so_1	DCB "/usr/lib/ld.so.1",0 ; DATA XREF: ntrEntry+1Co
					; ntrEntry+54o	...
		DCB 0, 0, 0
		DCD 0, 0, 0, 0,	0
		DCD ntrBase
		DCD 0
		DCD 0x10003, 0
		DCD pid_of_home_menu
		DCD 0
		DCD 0x20003, 1,	0x100100, 0
		DCD 0x10010, 0xE, 0x10951C, 0
		DCD 0x50010, 0x19, 0x10B560, 0
		DCD 0xD0010, 0x745F5F00, 0x5F747865, 0x72617473, 0x5F5F0074
		DCD 0x65646F63,	0x646E655F, 0x655F5F00,	0x5F5F646E, 0
		DCD 3, 6, 3, 4,	5, 0, 0, 0, 0, 0, 0
font		DCD 0, 0		; DATA XREF: ntr2dPaintLetter+2Co
					; ROM:off_100374o
		DCD 0x18181818,	0x180018, 0x6C6C6C, 0
		DCD 0x6CFE6C6C,	0x6C6CFE, 0x7CC07E18, 0x18FC06,	0x18CCC600
		DCD 0xC66630, 0x76386C38, 0x76CCDC, 0x603030, 0
		DCD 0x3030180C,	0xC1830, 0xC0C1830, 0x30180C, 0xFF3C6600
		DCD 0x663C, 0x7E181800,	0x1818,	0
		DCD 0x30181800,	0x7E000000, 0, 0
		DCD 0x181800, 0x30180C06, 0x80C060, 0xF6DECE7C,	0x7CC6E6
		DCD 0x18183818,	0x7E1818, 0x7C06C67C, 0xFEC0C0,	0x3C0606FC
		DCD 0xFC0606, 0xCCCCCC0C, 0xC0CFE, 0x6FCC0FE, 0x7CC606
		DCD 0xFCC0C07C,	0x7CC6C6, 0xC0606FE, 0x303018, 0x7CC6C67C
		DCD 0x7CC6C6, 0x7EC6C67C, 0x7C0606, 0x181800, 0x181800
		DCD 0x181800, 0x30181800, 0x6030180C, 0xC1830, 0x7E0000
		DCD 0x7E, 0x60C1830, 0x30180C, 0x180C663C, 0x180018, 0xDEDEC67C
		DCD 0x7EC0DE, 0xC6C66C38, 0xC6C6FE, 0xFCC6C6FC,	0xFCC6C6
		DCD 0xC0C0C67C,	0x7CC6C0, 0xC6C6CCF8, 0xF8CCC6,	0xF8C0C0FE
		DCD 0xFEC0C0, 0xF8C0C0FE, 0xC0C0C0, 0xC0C0C67C,	0x7CC6CE
		DCD 0xFEC6C6C6,	0xC6C6C6, 0x1818187E, 0x7E1818,	0x6060606
		DCD 0x7CC606, 0xF0D8CCC6, 0xC6CCD8, 0xC0C0C0C0,	0xFEC0C0
		DCD 0xFEFEEEC6,	0xC6C6D6, 0xDEF6E6C6, 0xC6C6CE,	0xC6C6C67C
		DCD 0x7CC6C6, 0xFCC6C6FC, 0xC0C0C0, 0xC6C6C67C,	0x67CDED6
		DCD 0xFCC6C6FC,	0xC6CCD8, 0x7CC0C67C, 0x7CC606,	0x181818FF
		DCD 0x181818, 0xC6C6C6C6, 0xFEC6C6, 0xC6C6C6C6,	0x387CC6
		DCD 0xC6C6C6C6,	0x6CFED6, 0x386CC6C6, 0xC6C66C,	0x7CC6C6C6
		DCD 0xE03018, 0x180C06FE, 0xFE6030, 0x3030303C,	0x3C3030
		DCD 0x183060C0,	0x2060C, 0xC0C0C3C, 0x3C0C0C, 0xC66C3810
		DCD 0, 0
		DCD 0xFF000000,	0xC1818, 0
		DCD 0x67C0000, 0x7EC67E, 0xFCC0C0C0, 0xFCC6C6, 0xC67C0000
		DCD 0x7CC6C0, 0x7E060606, 0x7EC6C6, 0xC67C0000,	0x7CC0FE
		DCD 0x7830361C,	0x783030, 0xC67E0000, 0xFC067EC6, 0xC6FCC0C0
		DCD 0xC6C6C6, 0x18380018, 0x3C1818, 0x6060006, 0x7CC60606
		DCD 0xD8CCC0C0,	0xC6CCF8, 0x18181838, 0x3C1818,	0xFECC0000
		DCD 0xD6D6FE, 0xC6FC0000, 0xC6C6C6, 0xC67C0000,	0x7CC6C6
		DCD 0xC6FC0000,	0xC0C0FCC6, 0xC67E0000,	0x6067EC6, 0xC6FC0000
		DCD 0xC0C0C0, 0xC07E0000, 0xFC067C, 0x187E1818,	0xE1818
		DCD 0xC6C60000,	0x7EC6C6, 0xC6C60000, 0x387CC6,	0xC6C60000
		DCD 0x6CFED6, 0x6CC60000, 0xC66C38, 0xC6C60000,	0xFC067EC6
		DCD 0xCFE0000, 0xFE6038, 0x7018180E, 0xE1818, 0x181818
		DCD 0x181818, 0xE181870, 0x701818, 0xDC76, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0

; =============== S U B	R O U T	I N E =======================================


dumpCmd					; DATA XREF: sub_101EA4+74o
					; ROM:off_101FA4o
		STMFD	SP!, {R0-R12,LR}
		MRS	R0, CPSR
		STMFD	SP!, {R0}
		MOV	R0, SP
		LDR	R1, =0x10AB4D
		LDR	R2, =aInfo	; "info"
		BLX	R2 ; aInfo
		LDMFD	SP!, {R0}
		MSR	CPSR_cf, R0
		LDMFD	SP!, {R0-R12,LR}
		LDR	PC, =0x700D0700
; End of function dumpCmd

; ---------------------------------------------------------------------------
dword_109E0C	DCD 0x10AB4D		; DATA XREF: ntrProcessManager:loc_104C84o
					; ntrProcessManager+C0o ...
off_109E10	DCD aInfo		; DATA XREF: dumpCmd+14r
					; "info"
socketNetErrorCodeMap DCD 0x700D0700, 0x780B6A7D, 0x8C104D09, 0x686F710A, 0x8421792D
					; DATA XREF: socketNetConvertError+10o
					; ROM:off_1059F0o ...
		DCD 0x761B0E11,	0x4778A24, 0x157F0516, 0x7A1F185C, 0x7E735B4A
		DCD 0x3D691772,	0x2E080213, 0x6D230C43,	0x583C3F1C, 0x6C5A1480
		DCD 0x5F061986,	0x4720018B, 0x1E226B7B,	0x3E85031D
		DCB 0x74
aAcU		DCB "ac:u",0            ; DATA XREF: acuWaitInternetConnection+Co
					; ROM:servero
aPatchingSmdh	DCB "patching smdh",0xA,0 ; DATA XREF: callback_patch_smdh+34o
					; ROM:msgo
aFatal_Lr08x	DCB "fatal. LR: %08x",0 ; DATA XREF: fatal_LR+10o ROM:fmto
aFsuser_opendir	DCB "FSUSER_OpenDirectory failed, ret=%08x",0 ; DATA XREF: sub_100F64+98o
					; ROM:off_101110o ...
aNoFileFound_	DCB "no file found.",0  ; DATA XREF: sub_100F64+12Co
					; ROM:off_101114o
aSS		DCB "%s%s",0            ; DATA XREF: sub_100F64+160o
					; ROM:off_101118o
aOpenarchiveFai	DCB "openArchive failed, ret=%08x",0 ; DATA XREF: sub_10111C+54o
					; ROM:off_1011C0o
asc_109EDC	DCB "/",0               ; DATA XREF: sub_10111C:loc_101184o
					; ROM:off_1011C4o
aDebug_flag	DCB "/debug.flag",0     ; DATA XREF: threadNtrHomeInjectee+B0o
					; ROM:off_1013E0o
aInitCfgMemoryF	DCB "init cfg memory failed",0 ; DATA XREF: prepare_config_mem+50o
					; ROM:off_1014D8o
aNtrMain	DCB "ntr main",0
aFirmVersionNot	DCB "firm version not supported",0 ; DATA XREF: main+7Co
					; ROM:off_101874o
aHomemenuVersio	DCB "homemenu version not supported",0 ; DATA XREF: main+90o
					; ROM:off_101878o
aFirmwareVersio	DCB "firmware version not supported",0 ; DATA XREF: main:loc_10168Co
					; ROM:off_10187Co
aPid0_dmp	DCB "/pid0.dmp",0       ; DATA XREF: main+C0o ROM:filenameo
aPid2_dmp	DCB "/pid2.dmp",0       ; DATA XREF: main+CCo ROM:off_101884o
aPid3_dmp	DCB "/pid3.dmp",0       ; DATA XREF: main+D8o ROM:off_101888o
aPidf_dmp	DCB "/pidf.dmp",0       ; DATA XREF: main+E4o ROM:off_10188Co
aAxiwram_dmp	DCB "/axiwram.dmp",0    ; DATA XREF: main+F4o ROM:off_101894o
aCurrentFirmwar	DCB "current firmware not supported. ",0xA ; DATA XREF: main+FCo
					; ROM:off_101898o
		DCB "please send feedback to",0xA
		DCB " cell9@yandex.com.",0
aKernelhaxDone	DCB "kernelhax done",0  ; DATA XREF: main+118o ROM:off_1018A0o ...
aHomemenuVerD	DCB "homemenu ver: %d",0 ; DATA XREF: main+12Co
					; ROM:off_1018A4o
aSendRemainSize	DCB "send remain < size: %08x, %08x",0 ; DATA XREF: sub_101A9C:loc_101AD8o
					; ROM:off_101AECo
aRecvRemainSize	DCB "recv remain < size: %08x, %08x",0 ; DATA XREF: recv_wrapper:loc_101B2Co
					; ROM:off_101B40o
aOpenfileFailed	DCB "openFile failed: %08x",0 ; DATA XREF: handle_savefile_packet+A4o
					; ROM:off_101C7Co ...
aSavedToSSucces	DCB "saved to %s successfully",0xA,0
					; DATA XREF: handle_savefile_packet+114o
					; ROM:off_101C80o
aBpDAlreadyEnab	DCB "bp %d already enabled",0xA,0
					; DATA XREF: debugcmd_enable_breakpoint+2Co
					; ROM:off_101D3Co
aBpDEnabled	DCB "bp %d enabled",0xA,0
					; DATA XREF: debugcmd_enable_breakpoint:loc_101D28o
					; ROM:off_101D40o
aBpDAlreadyDisa	DCB "bp %d already disabled",0xA,0
					; DATA XREF: debugcmd_disable_breakpoint+2Co
					; ROM:off_101DBCo
aBpDDisabled	DCB "bp %d disabled",0xA,0
					; DATA XREF: debugcmd_disable_breakpoint:loc_101DA8o
					; ROM:off_101DC0o
aRtcheckremotem	DCB "rtCheckRemoteMemoryRegionSafeForWrite failed :%08x",0xA,0
					; DATA XREF: sub_101EA4+3Co
					; ROM:off_101FA0o
aCodeBreakpoint	DCB "code breakpoint, id: %d, addr: %08x",0xA,0
					; DATA XREF: debugcmd_init_breakpoint+50o
					; ROM:off_102044o
aInitBreakpoint	DCB "init breakpoint failed.",0xA,0
					; DATA XREF: debugcmd_init_breakpoint+70o
					; ROM:off_102048o
aOpenprocessF_1	DCB "openprocess failed.",0xA,0 ; DATA XREF: handle_queryhandle_packet+38o
					; ROM:off_102114o
aH08xP08x	DCB "h: %08x, p: %08x",0xA,0 ; DATA XREF: handle_queryhandle_packet+90o
					; ROM:off_10211Co
aFreeidD	DCB "freeid: %d",0xA,0  ; DATA XREF: handle_debugcmd_packet+30o
					; ROM:off_1021F0o
aSetResumeFlag	DCB "set resume flag",0 ; DATA XREF: handle_debugcmd_packet+5Co
					; ROM:off_1021F4o
aInvalidBpid	DCB "invalid bpid",0xA,0 ; DATA XREF: handle_debugcmd_packet:loc_1021ACo
					; ROM:off_1021F8o
aArm11_bin	DCB "/arm11.bin",0
aFsfile_getsi_0	DCB "FSFILE_GetSize failed: %08x",0 ; DATA XREF: handle_reload_packet+B0o
					; ROM:off_102374o
aSvc_controlmem	DCB "svc_controlMemory failed: %08x",0 ; DATA XREF: handle_reload_packet+F0o
					; ROM:off_10237Co ...
aFsfile_readFai	DCB "FSFILE_Read failed: %08x",0
aProtectmemoryF	DCB "protectMemory failed: %08x",0 ; DATA XREF: handle_reload_packet+13Co
					; ROM:off_102384o
aGetprocesslist	DCB "getProcessList failed: %08x",0xA,0
					; DATA XREF: handle_listprocess_packet+28o
					; ROM:off_102424o
aGetprocessinfo	DCB "getProcessInfo failed: %08x",0xA,0
					; DATA XREF: handle_listprocess_packet+50o
					; ROM:off_102428o
aPid0x08xPname8	DCB "pid: 0x%08x, pname: %8s, tid: %08x%08x, kpobj: %08x",0xA,0
					; DATA XREF: handle_listprocess_packet+5Co
					; ROM:off_10242Co
aEndOfProcessLi	DCB "end of process list.",0xA,0 ; DATA XREF: handle_listprocess_packet+8Co
					; ROM:off_102430o
aOpenprocessF_2	DCB "openProcess failed: %08x",0xA,0
					; DATA XREF: handle_memlayout_packet+24o
					; ROM:off_1024F8o ...
aValidMemregion	DCB "valid memregions:",0xA,0
					; DATA XREF: handle_memlayout_packet:loc_102474o
					; ROM:off_1024FCo
a08x08xSize08x	DCB "%08x - %08x , size: %08x",0xA,0
					; DATA XREF: handle_memlayout_packet+78o
					; ROM:off_102500o
aEndOfMemlayout	DCB "end of memlayout.",0xA,0 ; DATA XREF: handle_memlayout_packet+A0o
					; ROM:off_102504o
aOpenprocessFai	DCB "openProcess failed: %08x, pid: %08x",0xA,0
					; DATA XREF: handle_writemem_packet+44o
					; ROM:off_102664o ...
aRtcheckremot_0	DCB "rtCheckRemoteMemoryRegionSafeForWrite failed: %08x",0xA,0
					; DATA XREF: handle_writemem_packet+88o
					; ROM:off_10266Co ...
aCopyremotememo	DCB "copyRemoteMemory failed: %08x, addr: %08x",0xA,0
					; DATA XREF: handle_writemem_packet+124o
					; ROM:off_102674o ...
aFinished	DCB "finished",0        ; DATA XREF: handle_writemem_packet:loc_10263Co
					; ROM:off_102678o ...
aGetthreadlistF	DCB "getThreadList failed: %08x",0xA,0 ; DATA XREF: get_remote_PC+34o
					; ROM:off_10297Co ...
aRecommendPc	DCB "recommend pc:",0xA,0 ; DATA XREF: get_remote_PC:loc_102890o
					; ROM:off_102980o
aRecommendLr	DCB "recommend lr:",0xA,0 ; DATA XREF: get_remote_PC:loc_102900o
					; ROM:off_102988o
aTid0x08x	DCB "tid: 0x%08x",0xA,0 ; DATA XREF: handle_listthread_packet+B4o
					; ROM:off_102ABCo
aPc08xLr08x	DCB "pc: %08x, lr: %08x",0xA,0 ; DATA XREF: handle_listthread_packet+E0o
					; ROM:off_102AC0o
aBuf08xSize08x	DCB "buf: %08x, size: %08x",0xA,0
					; DATA XREF: inject_ntr_into_remote_process+24o
					; ROM:off_102C70o
aArm11NotLoaded	DCB "arm11 not loaded",0xA,0 ; DATA XREF: inject_ntr_into_remote_process+3Co
					; ROM:off_102C74o
aMapremotememor	DCB "mapRemoteMemory failed: %08x",0xA,0
					; DATA XREF: inject_ntr_into_remote_process+64o
					; ROM:off_102C78o
aProtectremotem	DCB "protectRemoteMemory failed: %08x",0xA,0
aCopyremoteme_0	DCB "copyRemoteMemory(1) failed: %08x",0xA,0
aRemotepc08x	DCB "remotePC: %08x",0xA,0
					; DATA XREF: inject_ntr_into_remote_process:loc_102B8Co
					; ROM:off_102C8Co
aCopyremoteme_1	DCB "copyRemoteMemory(3) failed: %08x",0xA,0
aCopyremoteme_2	DCB "copyRemoteMemory(2) failed: %08x",0xA,0
aCopyremoteme_3	DCB "copyRemoteMemory(4) failed: %08x",0xA,0
					; DATA XREF: inject_ntr_into_remote_process+188o
					; ROM:off_102CA4o
aWillListenAtPo	DCB "will listen at port %d ",0xA,0
					; DATA XREF: handle_attachprocess_packet+7Co
					; ROM:off_102D54o
aCpsr08x	DCB "cpsr:%08x ",0      ; DATA XREF: send_proc_context_to_client+Co
					; ROM:off_102DACo
aLr08xSp08x	DCB "lr:%08x sp:%08x",0xA,0 ; DATA XREF: send_proc_context_to_client+1Co
					; ROM:off_102DB0o
aRD08x		DCB "r%d:%08x ",0       ; DATA XREF: send_proc_context_to_client+30o
					; ROM:off_102DB4o ...
aBreakpointDHit	DCB "breakpoint %d hit",0xA,0 ; DATA XREF: check_for_bp_hit+74o
					; ROM:off_102E60o
aHello		DCB "hello",0           ; DATA XREF: dispatch_client_cmd+24o
					; ROM:off_102F90o
aBindFailed08x	DCB "bind failed: %08x",0
aListenFailed08	DCB "listen failed: %08x",0 ; DATA XREF: handle_network_client+90o
					; ROM:off_1030E4o
aRtrecvsocketFa	DCB "rtRecvSocket failed: %08x",0 ; DATA XREF: handle_network_client+D0o
					; ROM:off_1030E8o
aBrokenProtocol	DCB "broken protocol: %08x, %08x",0
aRtcheckremot_1	DCB "rtCheckRemoteMemoryRegionSafeForWrite failed: %08x",0
					; DATA XREF: ntrSetupNetworkDebugServer+70o
					; ROM:off_103350o
aSoc_initialize	DCB "SOC_Initialize failed: %08x",0
					; DATA XREF: ntrSetupNetworkDebugServer+BCo
					; ROM:off_10335Co
aSvc_createthre	DCB "svc_createThread failed: %08x",0
					; DATA XREF: ntrSetupNetworkDebugServer+1D4o
					; ROM:off_103368o
aFsUser		DCB "fs:USER",0         ; DATA XREF: plgGetSharedServiceHandle+8o
					; ROM:off_103480o ...
aNsS		DCB "ns:s",0            ; DATA XREF: ntrResetKProcessRefcount+14o
					; ROM:off_103548o
aOpenNsSFailed0	DCB "open ns:s failed: %08x",0 ; DATA XREF: ntrResetKProcessRefcount+24o
					; ROM:off_10354Co
aNtrMenuXY	DCB "NTR Menu: X+Y",0   ; DATA XREF: ntrSetHotkey+8o
					; ROM:off_1035DCo
aNtrMenuLStart	DCB "NTR Menu: L+START",0 ; DATA XREF: ntrSetHotkey+10o
					; ROM:off_1035E0o
aScreenshotDisa	DCB "Screenshot: disabled",0 ; DATA XREF: ntrSetHotkey+18o
					; ROM:off_1035E4o
aScreenshotSele	DCB "Screenshot: SELECT+START",0
aNtrCfw2_2	DCB "NTR CFW 2.2",0     ; DATA XREF: ntrSetHotkey:loc_10357Co
					; ROM:titleo ...
aProcessManager	DCB "Process Manager",0 ; DATA XREF: ntrMenu+Co
					; ROM:off_103738o
aEnableDebugger	DCB "Enable Debugger",0 ; DATA XREF: ntrMenu+18o
					; ROM:off_103740o
aCleanMode	DCB "Clean Mode",0      ; DATA XREF: ntrMenu+24o
					; ROM:off_103744o
aSetHotkey	DCB "Set Hotkey",0
aDebuggerHasAlr	DCB "Debugger has already been enabled.",0 ; DATA XREF: ntrMenu+C4o
					; ROM:off_103758o
aExpandPoolAddr	DCB "expand pool addr: %08x, size: %08x",0xA,0
					; DATA XREF: ntrAllocPluginMemory+38o
					; ROM:off_103850o
aAllocPlgMemory	DCB "alloc plg memory failed: %08x",0xA,0
					; DATA XREF: ntrAllocPluginMemory+80o
					; ROM:off_10385Co
aFsReg		DCB "fs:REG",0          ; DATA XREF: ntrGetFSUserHandle+2Co
					; ROM:off_1038C8o
aFsuser_initial	DCB "FSUSER_Initialize failed: %08x",0xA,0
					; DATA XREF: ntrGetFSUserHandle+48o
					; ROM:off_1038CCo
aFsuserhandle08	DCB "fsUserHandle: %08x",0xA,0 ; DATA XREF: ntrGetFSUserHandle+54o
					; ROM:off_1038D0o ...
aOpenMenuProces	DCB "open menu process failed: %08x",0xA,0
aHmenuprocess08	DCB "hMenuProcess:%08x",0xA,0
					; DATA XREF: inject_into_nintendo_home:loc_103914o
					; ROM:off_103B38o
aLoadPlginfoFai	DCB "load plginfo failed:%08x",0xA,0
					; DATA XREF: inject_into_nintendo_home+84o
					; ROM:off_103B44o
aProctid08x08x	DCB "procTid: %08x%08x",0xA,0 ; DATA XREF: inject_into_nintendo_home+9Co
					; ROM:off_103B48o
aTidMismatch	DCB "tid mismatch",0xA,0 ; DATA XREF: inject_into_nintendo_home:loc_10399Co
					; ROM:off_103B4Co
aAllocPluginMem	DCB "alloc plugin memory failed: %08x",0xA,0
aRwxFailed08x	DCB "rwx failed: %08x",0xA,0 ; DATA XREF: init_all_plugins_0+38o
					; ROM:off_10403Co
aCopyPlginfoFai	DCB "copy plginfo failed: %08x",0xA,0
aLoadPlgFailed0	DCB "load plg failed: %08x",0xA,0
					; DATA XREF: inject_into_nintendo_home+214o
					; ROM:off_103B60o
aAttachProcessF	DCB "attach process failed: %08x",0xA,0
					; DATA XREF: inject_into_nintendo_home+234o
					; ROM:off_103B64o
aRunappletTid00	DCB "runApplet tid0: %08x, tid1: %08x",0xA,0 ; DATA XREF: sub_103B90+2Co
					; ROM:off_103BECo
aPluginS	DCB "/plugin/%s",0      ; DATA XREF: load_ntr_plugins+10o
					; ROM:off_103E78o
aSS_0		DCB "%s/%s",0           ; DATA XREF: load_ntr_plugins+40o
					; ROM:off_103E80o
aLoadingPluginS	DCB "loading plugin: %s, size: %08x, addr: %08x",0xA,0
					; DATA XREF: load_ntr_plugins+70o
					; ROM:off_103E84o
aAllocPluginM_0	DCB "alloc plugin memory failed",0xA,0
aRtloadfiletobu	DCB "rtLoadFileToBuffer failed",0xA,0 ; DATA XREF: load_ntr_plugins+A8o
					; ROM:off_103E8Co
aStartingApplet	DCB "starting applet: %08x%08x",0xA,0 ; DATA XREF: callback_applet_start+1Co
					; ROM:off_103F14o
aGame		DCB "game",0
a08x08x		DCB "%08x%08x",0        ; DATA XREF: callback_applet_start+3Co
					; ROM:off_103F1Co
aPlg08x		DCB "plg: %08x",0xA,0   ; DATA XREF: init_all_plugins_0+5Co
					; ROM:off_104040o ...
aFsuser_openarc	DCB "FSUSER_OpenArchive failed: %08x",0xA,0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+58o
					; ROM:off_1041A4o
aNtr_bin	DCB "/ntr.bin",0        ; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+7Co
					; load_all_plugins_and_inject_ntr_into_pm:loc_1040F8o ...
aArm11BinSize08	DCB "arm11 bin size: %08x",0xA,0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+90o
					; ROM:off_1041B4o
aAllocMemoryFor	DCB "alloc memory for arm11bin failed",0xA,0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+ACo
					; ROM:off_1041B8o
aLoadArm11binFa	DCB "load arm11bin failed",0xA,0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+D0o
					; ROM:off_1041BCo
aHome		DCB "home",0            ; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+110o
					; ROM:off_1041C4o
aOpenprocessFailedRet08x DCB "openProcess failed, ret: %08x",0
					; DATA XREF: ntrGetCurrentProcessHandle+44o
					; ROM:off_1042D0o
aOutaddr08xAddr	DCB "outAddr: %08x, addr: %08x",0 ; DATA XREF: controlRemoteMemory+80o
					; ROM:off_104378o ...
aSvc_flushpro_0	DCB "svc_flushProcessDataCache(hSrc) failed.",0xA,0
aSvc_flushproce	DCB "svc_flushProcessDataCache(hDst) failed.",0xA,0
					; DATA XREF: inter_process_dma_copy+6Co
					; ROM:off_104508o
aReadremotememo	DCB "readRemoteMemory time out %08x",0
					; DATA XREF: inter_process_dma_copy+10Co
					; ROM:off_104520o
aOpenprocessF_0	DCB "openProcess failed: %08x",0 ; DATA XREF: dumpProcessToFile+9Co
					; ROM:off_1047D8o
aDumpFinishedAt	DCB "dump finished at addr: %08x",0 ; DATA XREF: dumpProcessToFile+F8o
					; ROM:off_1047E4o
aReadremoteme_0	DCB "readRemoteMemory failed: %08x",0 ; DATA XREF: dumpProcessToFile+140o
					; ROM:off_1047ECo
aHfile08x	DCB "hfile: %08x",0     ; DATA XREF: sub_1047F0+90o
					; ROM:off_104994o
aDebugactivepro	DCB "debugActiveProcess failed: %08x",0
aHdebug08x	DCB "hdebug: %08x",0    ; DATA XREF: sub_1047F0+C0o
					; ROM:off_10499Co
aReadmemoryAddr	DCB "readmemory addr = %08x, ret = %08x",0 ; DATA XREF: sub_1047F0+130o
					; ROM:off_1049A4o
aDumpcode	DCB "dumpcode",0        ; DATA XREF: dumpMemoryToFile+1Co
					; ROM:off_104AECo
aTestpath	DCB "testpath",0        ; DATA XREF: dumpMemoryToFile+4Co
					; ROM:off_104AF0o
aOpenfile	DCB "openfile",0        ; DATA XREF: dumpMemoryToFile+94o
					; ROM:off_104AFCo
aOpenFileFailed	DCB "open file failed",0 ; DATA XREF: dumpMemoryToFile+B0o
					; ROM:off_104B04o
aPatchSmFailed0	DCB "patch sm failed: %08x",0 ; DATA XREF: patch_sm+30o
					; ROM:off_104BE4o
aGetprocessli_0	DCB "getProcessList failed: %08x",0 ; DATA XREF: ntrProcessManager+40o
					; ROM:off_104D34o
aProcesslist	DCB "processList",0     ; DATA XREF: ntrProcessManager:loc_104C88o
					; ROM:off_104D40o
aDump_pid08x	DCB "/dump_pid%08x",0   ; DATA XREF: ntrProcessManager+ECo
					; ROM:off_104D44o
aPnameS		DCB "pname: %s",0       ; DATA XREF: ntrProcessManager+12Co
					; ROM:off_104D48o
aDump		DCB "dump",0            ; CODE XREF: dumpCmd+18p
aInfo		DCB "info",0            ; DATA XREF: dumpCmd+14o
					; ROM:off_109E10o
aOpenfileFailed08x DCB "openFile failed: %08x",0xA,0 ; DATA XREF: rtGetFileSize+74o
					; ROM:off_105018o ...
aFsfile_getsizeFailed08x DCB "FSFILE_GetSize failed: %08x",0xA,0
					; DATA XREF: rtGetFileSize+A8o
					; ROM:off_10501Co ...
aRtloadfileto_0	DCB "rtLoadFileToBuffer: buffer too small",0xA,0
					; DATA XREF: rtLoadFileToBuffer+C8o
					; ROM:off_105160o
aFsfile_readF_0	DCB "FSFILE_Read failed: %08x",0xA,0 ; DATA XREF: rtLoadFileToBuffer+FCo
					; ROM:off_105164o
aOpenthreadFail	DCB "openThread failed: %08x",0xA,0 ; DATA XREF: rtGetThreadContext+28o
					; ROM:off_1051E4o
aTop_04d_bmp	DCB "/top_%04d.bmp",0   ; DATA XREF: ntrScreenShotGetIndex+10o
					; ROM:off_1056BCo ...
aOut_addr08x	DCB "    out_addr: %08x",0 ; DATA XREF: display_OSD_menu+28o
					; ROM:off_105844o
aBot_04d_bmp	DCB "/bot_%04d.bmp",0   ; DATA XREF: display_OSD_menu+140o
					; ROM:off_105858o
aInitializingSc	DCB "initializing screenshot plugin",0xA,0
					; DATA XREF: ntrScreenShotBuiltinPluginInit+4o
					; ROM:off_10591Co
aTakeScreenshot	DCB "Take Screenshot",0 ; DATA XREF: ntrScreenShotBuiltinPluginInit+14o
					; ROM:off_105928o
aBmpIndexIsD	DCB "bmp index is: %d",0 ; DATA XREF: ntrScreenShotBuiltinPluginInit+48o
					; ROM:off_105938o
aSocU		DCB "soc:U",0           ; DATA XREF: socketInitialize+3Co
					; ROM:off_105AE4o
aSrv		DCB "srv:",0            ; DATA XREF: srvInit+8o ROM:portNameo
		DCB " * ",0
		DCB "   ",0
aHttp44670_orgN	DCB "http://44670.org/ntr",0 ; DATA XREF: showMenu+6Co ROM:so
aPressBToClose_	DCB "Press [B] to close.",0 ; DATA XREF: showMsg+88o
					; ROM:off_107630o
aDbg		DCB "/dbg",0            ; DATA XREF: sub_107748+20o
					; ROM:off_10780Co
a08lx		DCB "%08lX ",0          ; DATA XREF: put_dump+Co
					; ROM:off_107CCCo
a02x		DCB " %02X",0           ; DATA XREF: put_dump+40o
					; ROM:off_107CD0o
a04x		DCB " %04X",0           ; DATA XREF: put_dump:loc_107C94o
					; ROM:off_107CD4o
a08lx_0		DCB " %08LX",0          ; DATA XREF: put_dump:loc_107CACo
					; ROM:off_107CD8o
		DCB 0
		DCD 0x10, 0, 0x527A01, 0x10E7C02, 0xD0C1B, 0x2C, 0x18
		DCD 0xFFFFD47C,	0x224, 0x40E6200
		DCD 0xC4660184
		DCD 0xE56000E
		DCD 0x85028408
		DCB    1
		DCB    2
		DCB 0x9C ; œ
		DCB  0xA
		DCB 0x42 ; B
		DCB 0xC4 ; Ä
		DCB 0xC5 ; Å
		DCB  0xE
		DCB    0
		DCB 0x42 ; B
		DCB  0xB
		DCB 0x52 ; R
		DCB 0xC4 ; Ä
		DCB 0xC5 ; Å
		DCB  0xE
		DCB    0
firmware_version_internal DCD 0		; DATA XREF: ntrInstallo ntrInstall+Cr ...
dword_10ACF8	DCD 0			; DATA XREF: get_nintendo_home_version_info+14w
					; get_nintendo_home_version_info+54w ...
; Handle hFSUser
hFSUser		DCD 0			; DATA XREF: sub_100F64+80r
					; sub_10111C+38r ...
ntrKeyScreenShot DCB	0		; DATA XREF: ntrSetHotkey:loc_1035CCo
					; ROM:off_1035F4o
		DCB    0
		DCB    0
		DCB    0
dword_10AD04	DCD 0			; DATA XREF: main+18w
; u32 allowDirectScreenAccess
allowDirectScreenAccess	DCD 0		; DATA XREF: main+30w sub_107200+4o ...
dword_10AD0C	DCD 0			; DATA XREF: main+1C4w
					; main:loc_1017C4w
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
process_manager_patch_addr DCD 0	; DATA XREF: get_kernel_version_info+28o
					; get_kernel_version_info+38w ...
rthook_return_C821180B DCB    0		; DATA XREF: threadNtrHomeInjectee+28o
					; threadNtrHomeInjectee+34o ...
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCD 0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
nintendo_home_ptr_fsuser_handle	DCD 0	; DATA XREF: get_nintendo_home_version_info:loc_100D68o
					; get_nintendo_home_version_info+C4w ...
rthook_patch_smdh DCB	 0		; DATA XREF: threadNtrHomeInjectee+Co
					; threadNtrHomeInjectee+18o ...
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
		DCB    0
dword_10AE78	DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
					; CODE XREF: callback_patch_smdh+14p
					; DATA XREF: callback_patch_smdh+Co ...
nintendo_home_nss_CardUpdateInitialize_addr DCD	0
					; DATA XREF: get_nintendo_home_version_info+70o
					; get_nintendo_home_version_info+78w ...
nintendo_home_applet_start_hook_addr DCD 0
					; DATA XREF: get_nintendo_home_version_info:loc_100E0Co
					; get_nintendo_home_version_info+168w ...
rthook		DCD 0			; DATA XREF: get_nintendo_home_version_info+64o
					; get_nintendo_home_version_info+6Cw ...
nintendo_home_FlushDataCache_addr DCD 0	; DATA XREF: get_nintendo_home_version_info+58o
					; get_nintendo_home_version_info+60w ...
ntrNetworkDebugServerStack DCD 0	; DATA XREF: sub_101A74o sub_101A74+4r ...
		DCD 0, 0
p_config_memory	DCD 0			; DATA XREF: ntrClosePluginHandle_o
					; ntrClosePluginHandle_+8r ...
dword_10AED8	DCD 0			; DATA XREF: plgRequestMemory:loc_1033E4o
					; plgRequestMemory+20r	...
dword_10AEDC	DCD 0			; DATA XREF: ntrMenu+3Cr
					; plgRegisterMenuEntry+8r ...
; u32 plgMemoryAlloced
plgMemoryAlloced DCD 0			; DATA XREF: ntrAllocPluginMemory+8r
					; ntrAllocPluginMemory+18w ...
					; means	failed when 0x7000000
dword_10AEE4	DCD 0			; DATA XREF: inject_into_nintendo_home+14r
					; inject_into_nintendo_home+34w
arm11BinStart	DCD 0			; DATA XREF: inject_ntr_into_home_menu+1Co
					; inject_ntr_into_home_menu+28w ...
arm11BinSize	DCD 0			; DATA XREF: inject_ntr_into_home_menu+30o
					; inject_ntr_into_home_menu+34w ...
dword_10AEF0	DCD 0			; DATA XREF: sub_103B90+1Cw
dword_10AEF4	DCD 0			; DATA XREF: sub_103B90+28w
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0
dword_10AF84	DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
					; CODE XREF: sub_103B90+54j
					; DATA XREF: sub_103B90+4Co ...
g_plugin_func_ptrs_ DCD	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
					; DATA XREF: ntrMenu+10o ntrMenu+114o	...
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0
some_filename_	DCB 0			; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+30w
		DCB 0, 0, 0
dword_10B39C	DCD 0			; DATA XREF: find_files_+4Co
					; load_all_plugins_and_inject_ntr_into_pm+34w
dword_10B3A0	DCD 0			; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+40w
		DCD 0, 0
p_plgloader_info DCD 0			; DATA XREF: update_plginfo_with_arm11_addresseso
					; update_plginfo_with_arm11_addresses+8r ...
arm11BinEnd2	DCD 0			; DATA XREF: update_plginfo_with_arm11_addresses+18o
					; update_plginfo_with_arm11_addresses+1Cw ...
rthook_applet_start DCD	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
					; DATA XREF: load_all_plugins_and_inject_ntr_into_pm+130o
					; load_all_plugins_and_inject_ntr_into_pm+140o	...
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0
dword_10B440	DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
					; CODE XREF: callback_applet_start+74p
					; DATA XREF: callback_applet_start+70o	...
cur_pid		DCD 0			; DATA XREF: ntrGetCurrentProcessId+4o
					; ntrGetCurrentProcessId+14r ...
hProcess_0	DCD 0			; DATA XREF: ntrGetCurrentProcessHandle+10r
					; ntrGetCurrentProcessHandle+3Cw
dword_10B488	DCD 0			; DATA XREF: display_OSD_menu+8o
					; display_OSD_menu+Cr ...
bmp_idx		DCD 0			; DATA XREF: display_OSD_menu+B4o
					; display_OSD_menu+D8r	...
socketHandle	DCD 0			; DATA XREF: ntrSetupNetworkDebugServer+9Co
					; ntrSetupNetworkDebugServer+A0w ...
dword_10B494	DCD 0			; DATA XREF: socketGetErrno+4r
					; socketBind+50w ...
srcHandle	DCD 0			; DATA XREF: ntrSetupNetworkDebugServer:loc_1031D4o
					; ntrSetupNetworkDebugServer+80r ...
g_arm11_cmd	DCD 0			; DATA XREF: arm11kDispatchCmd+4o
					; arm11kDispatchCmd+8r	...
g_arm11_handle	DCD 0			; DATA XREF: arm11kDispatchCmd+18r
					; arm11kDispatchCmd+48r ...
dword_10B4A4	DCD 0			; DATA XREF: arm11kDispatchCmd+1Cr
					; arm11kCmdUnused5+20r
dword_10B4A8	DCD 0			; DATA XREF: arm11kDispatchCmd+14r
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		DCD 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
; void is_NTR_OSD_requested(void)
is_NTR_OSD_requested DCD 0		; DATA XREF: threadNtrHomeInjectee+DCo
					; threadNtrHomeInjectee+F4r ...
dword_10B520	DCD 0			; DATA XREF: acquire_video+8r
					; release_video+4r ...
		DCD 0, 0
dword_10B52C	DCD 0			; DATA XREF: acquire_video+34o
					; acquire_video+40w ...
dword_10B530	DCD 0			; DATA XREF: acquire_video+48w
					; release_video+30r
dword_10B534	DCD 0			; DATA XREF: acquire_video+50w
					; release_video+3Cr
dword_10B538	DCD 0			; DATA XREF: acquire_video+58w
					; release_video+48r
dword_10B53C	DCD 0			; DATA XREF: acquire_video+60w
					; release_video+54r
		DCD 0, 0, 0, 0,	0
; char *outptr
outptr		DCD 0			; DATA XREF: xputco xputc+8r ...
; unsigned __int8 (*xfunc_in)(void)
xfunc_in	DCD 0			; DATA XREF: xgetso xgets+4r ...
; void (__stdcall *xfunc_out)(unsigned __int8)
xfunc_out	DCD 0			; DATA XREF: init_config_mem+8o
					; init_config_mem+14w ...
; ROM		ends

		END
