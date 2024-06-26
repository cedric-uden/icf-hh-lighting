#Requires AutoHotkey v2.0
#SingleInstance Force

LOCALAPPDATA := EnvGet("LOCALAPPDATA")
PROG86 := EnvGet("PROGRAMFILES(x86)")
PROG := EnvGet("PROGRAMFILES")
USERPROFILE := EnvGet("USERPROFILE")

SECONDS := 2 * 1000

NAME_loopMIDI := "loopMIDI.exe"
PATH_loopMIDI := PROG86 . "\Tobias Erichsen\loopMIDI\loopMIDI.exe"

NAME_midiOX := "midiox.exe"
PATH_midiOX := PROG86 . "\MIDIOX\midiox.exe"

NAME_midiRelay := "midi-relay.exe"
PATH_midiRelay := LOCALAPPDATA . "\Programs\midi-relay\midi-relay.exe"

NAME_companion := "Companion.exe"
PATH_companion := PROG . "\Companion\Companion.exe"


StartupLoop() {
     ; Run loopMIDI if it's not running
    if !ProcessExist(NAME_loopMIDI) {
        Run(PATH_loopMIDI,,"Hide")
    }

    ; Wait for loopMIDI to start. Only continue if successful within timeout.
    if (ProcessWait(NAME_loopMIDI, 30)) {

        Sleep(SECONDS)


        ; Run MIDIOX if it's not running
        if !ProcessExist(NAME_midiOX) {
            Run(PATH_midiOX,,"Hide")
        }

        ; Wait for MIDIOX to start. Only continue if successful within timeout.
        if (ProcessWait(NAME_midiOX, 30)) {

            Sleep(SECONDS)

            ; Run MIDI Relay if it's not running
            if !ProcessExist(NAME_midiRelay) {
                Run(PATH_midiRelay,,"Hide")
            }

            ; Wait for MIDI Relay to start. Only continue if successful within timeout.
            if (ProcessWait(NAME_midiRelay, 30)) {

                ; Run Companion if it's not running
                if !ProcessExist(NAME_companion) {
                    Run(PATH_companion,,"Hide")
                }
            }
        }    
    }   
}

ShutdownLoop() {
    ProcessClose(NAME_loopMIDI)
    ProcessClose(NAME_midiOX)
    ProcessClose(NAME_midiRelay)
}

RestartLoop() {
    ShutdownLoop()
    Sleep(SECONDS)
    StartupLoop()
}


if (A_Args.Length = 0 or A_Args[1] = "start") {
    StartupLoop()
}  else if (A_Args[1] = "exit") {
    ShutdownLoop()
}   else if (A_Args[1] = "restart") {
    RestartLoop()
} else {
    MsgBox("Did not understand argument. Either pass nothing or `start` to start; `exit` to quit MIDI programs or `restart` to restart.")
}
