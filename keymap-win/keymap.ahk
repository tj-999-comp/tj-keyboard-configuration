#SingleInstance Force

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#SingleInstance Force
SendMode Input

; =========================================================
; Toggle: ①〜③ を ON/OFF
; 操作: Ctrl + Alt + O
; =========================================================
global g123Enabled := true

^!o::
    g123Enabled := !g123Enabled
    state := g123Enabled ? "ON" : "OFF"
    TrayTip, AHK Keymap, ①〜③: %state%, 1
return



; =========================================================
; ① Esc → `（ただし①〜③トグル対象）
; =========================================================
#InputLevel 1
$Esc::
    if (g123Enabled) {
        SendInput {Text}``
    } else {
        Send {Esc}
    }
return


; =========================================================
; ② Home（通常） → `（ただし①〜③トグル対象）
; ＋（参考）テンキーHome（NumpadHome / Numpad7）も現状通り ` に
; =========================================================
$Home::
    if (g123Enabled) {
        SendInput {Text}``
    } else {
        Send {Home}
    }
return

$NumpadHome::
    if (g123Enabled) {
        SendInput {Text}``
    } else {
        Send {NumpadHome}
    }
return

$Numpad7::
    if (g123Enabled) {
        SendInput {Text}``
    } else {
        Send {Numpad7}
    }
return
#InputLevel 0


; =========================================================
; ③ End → 本物の Esc（連鎖なし）（ただし①〜③トグル対象）
; =========================================================
End::
    if (g123Enabled) {
        ; Esc→` の影響を受けないよう SendLevel を上げて送る
        SendLevel 2
        Send {Esc}
        SendLevel 0
    } else {
        Send {End}
    }
return


; =========================================================
; ④ `（物理キー） → IME ON/OFF（vkF3）（常時有効）
;  ` キーは環境差が出やすいのでスキャンコードで指定（多くの配列で SC029）
; =========================================================
$SC029::Send {vkF3}


; =========================================================
; ⑤ Mac風タブ移動（常時有効）
; Alt + Win + Right  → Ctrl + Tab
; Alt + Win + Left   → Ctrl + Shift + Tab
; =========================================================
!#Right::Send ^{Tab}
!#Left::Send ^+{Tab}


; =========================================================
; ⑥ Chrome限定（右Ctrlのみ）
; 右Ctrl + Left  → 戻る（Alt + Left）
; 右Ctrl + Right → 進む（Alt + Right）
; （トグル対象外）
; =========================================================
#IfWinActive ahk_exe chrome.exe
>^Left::Send !{Left}
>^Right::Send !{Right}
#IfWinActive