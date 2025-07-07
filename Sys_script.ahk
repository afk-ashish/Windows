#Requires AutoHotkey v2.0
#SingleInstance Force

MsgBox "Script started!"

#+z:: {
    winTitle := "Zen ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        Sleep(500)  ; Wait 0.5 seconds before launch
        Run("Zen.exe")
    }
}

#+s:: {
    winTitle := "Spotify ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        Sleep(500)  ; Wait 0.5 seconds before launch
        Run("C:\Users\ashis\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Spotify.lnk")
    }
}


#+v:: Run("C:\Users\ashis\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk")  ; Win+V

#q:: Send("!{F4}")  ; Win+Q sends Alt+F4


#+w:: {  ; Win+Shift+W to toggle WhatsApp
    winTitle := "WhatsApp ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("WhatsApp")
    }
}

#+u:: {  ; Win+Shift+U to toggle Unigram
    winTitle := "Unigram ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Unigram")
    }
}

#+i:: {  ; Win+Shift+U to toggle Unigram
    winTitle := "Instagram ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Instagram")
    }
}

runApp(appName) {
    shell := ComObject("Shell.Application")
    appsFolder := shell.NameSpace("shell:AppsFolder")
    for app in appsFolder.Items {
        if app.Name = appName {
            Run("explorer shell:AppsFolder\" app.Path)
            break
        }
    }
}
;-----------------------------------------------------------------------------------------------------------
^!r::Reload()  ; Ctrl+Alt+R to reload the script
;-----------------------------------------------------------------------------------------------------------

^+F1:: Run('Zen.exe "https://www.youtube.com"')
^+F2:: Run('Zen.exe "https://hianime.to/home"')
^+F3:: Run('Zen.exe "https://mangabuddy.com/users/bookmark"')
^+g:: Run('Zen.exe "https://chatgpt.com/"')

;-----------------------------------------------------------------------------------------------------------

#Requires AutoHotkey v2.0

^x::WinMinimize("A")   ; Ctrl + X minimizes active window
^m::WinMaximize("A")   ; Ctrl + M maximizes active window
^r::WinRestore("A")    ; Ctrl + R restores active window    

;-----------------------------------------------------------------------------------------------------------

#Requires AutoHotkey v2.0

^l::  ; Ctrl+L :— Select current line
{
    ; Move to the beginning of the line, anchor selection
    Send("{Home}+{End}")
    ;global SelectionStartLine := A_CaretY
    return
}

^Up::  ; Ctrl+Up :— Expand selection upward line by line
{
    ; Move up one line and extend the selection to the left
    Send("+{Up}")
    return
}

^+Backspace::  ; Ctrl+Shift+Backspace :— Delete whole line
{
    Send("{Home}+{End}{Backspace}")
}


