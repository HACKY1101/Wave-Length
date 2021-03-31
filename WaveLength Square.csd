<Cabbage> bounds(0, 0, 0, 0)
form caption("WaveLength") size(800, 600), colour(10, 10, 10), pluginID("def1")
image bounds(0, 0, 800, 600) file("texturebg.jpg")  
keyboard bounds(69, 505, 665, 95) whiteNoteColour(0, 0, 0, 255) keySeparatorColour(255, 255, 255, 102) blackNoteColour(34, 28, 28, 255) mouseOverKeyColour(255, 255, 255, 255)
rslider bounds(444, 6, 70, 70), channel("att"), range(0, 1, 0.01, 1, 0.01), text("Attack") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(514, 6, 70, 70), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(584, 6, 70, 70), channel("sus"), range(0, 1, 0.5, 1, 0.01), text("Sustain") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(654, 6, 70, 70), channel("rel"), range(0, 1, 0.7, 1, 0.01), text("Release") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(444, 74, 70, 70), channel("cutoff"), range(100, 9000, 2000, 0.5, 0.01), text("Cut-Off") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(514, 74, 70, 70), channel("res"), range(0, 0.9, 0.7, 1, 0.01), text("Resonance") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(584, 74, 70, 70), channel("LFOFreq"), range(0, 10, 0.12, 1, 0.1), text("LFO Freq") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)
rslider bounds(654, 74, 70, 70), channel("amp"), range(0, 1, 0.7, 1, 0.01), text("Amp") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255)

image bounds(0, 0, 69, 600) file("wood.png")
image bounds(732, 0, 68, 600) file("wood.png")

;Preset system IT FINALLY WORKED)

combobox bounds(76, 58, 193, 25), populate("*.snaps"), channelType("string") value("0.0") colour:0(55, 55, 55, 255)
filebutton bounds(76, 6, 95, 49), text("Save", "Save"), populate("*.snaps", "test"), mode("named snapshot") value(0) colour:0(55, 55, 55, 255)
filebutton bounds(174, 6, 95, 49), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") value(0) colour:0(55, 55, 55, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

;instrument will be triggered by keyboard widget
instr 1
iFreq = p4
iAmp = p5

iAtt chnget "att"
iDec chnget "dec"
iSus chnget "sus"
iRel chnget "rel"
kRes chnget "res"
kCutOff chnget "cutoff"
kLFOFreq chnget "LFOFreq"
kAmp chnget "amp"

kEnv madsr iAtt, iDec, iSus, iRel 
aOut vco2 iAmp, iFreq
kLFO lfo 4, kLFOFreq, 5
aLP moogladder aOut, kLFO*kCutOff, kRes
outs kAmp*(aLP*kEnv), kAmp*(aLP*kEnv)
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>