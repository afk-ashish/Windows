#Requires AutoHotkey v2.0
#SingleInstance Force

;------------------------------------------------
; WINDOW CONTROLS
;------------------------------------------------
#q::WinClose("A")         ; Win+Q closes active window
^x::WinMinimize("A")      ; Ctrl+X minimizes active window
^m::WinMaximize("A")      ; Ctrl+M maximizes active window
^r::WinRestore("A")       ; Ctrl+R restores active window

;------------------------------------------------
; APP TOGGLE FUNCTION
;------------------------------------------------
runApp(appName) {
    shell := ComObject("Shell.Application")
    appsFolder := shell.NameSpace("shell:AppsFolder")
    for app in appsFolder.Items {
        if InStr(app.Name, appName) { ; Using InStr is slightly more flexible than =
            Run("explorer shell:AppsFolder\" app.Path)
            break
        }
    }
}

;------------------------------------------------
; APP SHORTCUTS (Win+Shift+Key)
;------------------------------------------------
#+z:: {
    winTitle := "Zen ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        Sleep(500)
        Run("Zen.exe")
    }
}

;; IMPROVED: Using runApp instead of a hardcoded path.
#+n:: {
    winTitle := "Notepad ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Notepad")
    }
}

;; IMPROVED: Using runApp instead of a hardcoded path.
#+s:: {
    winTitle := "Spotify ahk_class SpotifyMainWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Spotify")
    }
}

;; IMPROVED: Using runApp instead of a hardcoded path.
#+v:: {
    winTitle := "Visual Studio Code ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Visual Studio Code")
    }
}

#+w:: {
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

#+u:: {
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

#+p:: {
    winTitle := "Perplexity ahk_class ApplicationFrameWindow"
    if WinExist(winTitle) {
        if WinActive(winTitle)
            WinMinimize("A")
        else
            WinActivate(winTitle)
    } else {
        runApp("Perplexity") ; ;; IMPROVED: Capitalized app name for better matching.
    }
}

#+i:: {
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

;------------------------------------------------
; SCRIPT & BROWSER SHORTCUTS
;------------------------------------------------
^!r::Reload()  ; Ctrl+Alt+R to reload the script

^+F1::Run('Zen.exe "https://www.youtube.com"')
^+F2::Run('Zen.exe "https://hianime.to/home"')
^+F3::Run('Zen.exe "https://mangabuddy.com/users/bookmark"')
^+g::Run('Zen.exe "https://chatgpt.com/"')

;------------------------------------------------
; TEXT EDITING SHORTCUTS
;------------------------------------------------
^l::Send("{Home}+{End}") ; Ctrl+L :— Select current line

^+Backspace::Send("{Home}+{End}{Backspace}") ; Ctrl+Shift+Backspace :— Delete whole line

;------------------------------------------------
; SYSTEM POWER OPTIONS
;------------------------------------------------
#^+q:: {    ; Win+Ctrl+Shift+Q
    if (MsgBox("Are you sure you want to Shutdown your computer?", "Confirm Shutdown", 308) = "Yes")
        ;; FIXED: Shutdown(1) is for shutdown. Shutdown(2) is for reboot.
        Shutdown(1)
}

;; FIXED: Removed extra colon from #^+r::{
#^+r:: {
    if (MsgBox("Are you sure you want to restart your computer?", "Confirm Restart", 308) = "Yes")
        Shutdown(2) ; ;; IMPROVED: 2 is Reboot. 3 is also Reboot (Forced). 2 is generally fine.
}

;------------------------------------------------
; TEXT SHORTCUTS
;------------------------------------------------
;; FIXED: Removed quotes so the literal path is sent, not a string with quotes.
::adownloads::C:\Users\Ashish\Downloads
::adocuments::C:\Users\Ashish\Documents
::acode::D:\Code

;; FIXED: The stray ')' at the end of the original file has been removed.