#SingleInstance Force
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance Force
SendMode Input

; =========================================================
; Mode Toggle: ①〜③ を モードA / モードB 切替
; 操作: Ctrl + Alt + O
; 旧: ON  -> モードA
; 旧: OFF -> モードB
; =========================================================
global g123ModeA := true

^!o::
    g123ModeA := !g123ModeA
    mode := g123ModeA ? "モードA" : "モードB"
    TrayTip, AHK Keymap, %mode%, 1
return


; =========================================================
; ① Esc → `（トグル対象）
; =========================================================
#InputLevel 1
$Esc::
    if (g123ModeA) {
        SendInput {Text}``
    } else {
        Send {Esc}
    }
return


; =========================================================
; ② Home / NumpadHome / Numpad7 → `（トグル対象）
; =========================================================
$Home::
    if (g123ModeA) {
        SendInput {Text}``
    } else {
        Send {Home}
    }
return

$NumpadHome::
    if (g123ModeA) {
        SendInput {Text}``
    } else {
        Send {NumpadHome}
    }
return

$Numpad7::
    if (g123ModeA) {
        SendInput {Text}``
    } else {
        Send {Numpad7}
    }
return
#InputLevel 0


; =========================================================
; ③ End → Esc（トグル対象）
; =========================================================
End::
    if (g123ModeA) {
        SendLevel 2
        Send {Esc}
        SendLevel 0
    } else {
        Send {End}
    }
return


; =========================================================
; ④ `（物理キー） → IME ON/OFF（常時有効）
; =========================================================
$SC029::Send {vkF3}


; =========================================================
; ⑤ Mac風タブ移動（常時有効）
; =========================================================
!#Right::Send ^{Tab}
!#Left::Send ^+{Tab}


; =========================================================
; ⑥ Chrome限定（右Ctrlのみ・常時有効）
; =========================================================
#IfWinActive ahk_exe chrome.exe
>^Left::Send !{Left}
>^Right::Send !{Right}
#IfWinActive


; =========================================================
; ⑦ Ctrl + Esc → `（モードBのみ有効）
; =========================================================
^Esc::
    if (!g123ModeA) {
        SendInput {Text}``
    } else {
        Send ^{Esc}
    }
return