<Cabbage> bounds(0, 0, 0, 0)
form caption("WaveLength") size(800, 600), colour(10, 10, 10), pluginID("def1")
image bounds(-2, 0, 800, 600) file("texturebg.jpg")  
groupbox bounds(396, 6, 315, 173) text("LFO")
groupbox bounds(72, 6, 315, 173) text("Presets")
keyboard bounds(69, 505, 665, 95) whiteNoteColour(0, 0, 0, 255) keySeparatorColour(255, 255, 255, 102) blackNoteColour(34, 28, 28, 255) mouseOverKeyColour(255, 255, 255, 255)
rslider bounds(418, 32, 70, 70), channel("att"), range(0, 1, 0.01, 1, 0.01), text("Attack")  trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(486, 32, 70, 70), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(556, 32, 70, 70), channel("sus"), range(0, 1, 0.5, 1, 0.01), text("Sustain") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(626, 32, 70, 70), channel("rel"), range(0, 1, 0.7, 1, 0.01), text("Release") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(456, 100, 70, 70), channel("cutoff"), range(100, 9000, 2000, 0.5, 0.01), text("Cut-Off") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(524, 100, 70, 70), channel("res"), range(0, 0.9, 0.7, 1, 0.01), text("Resonance") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
rslider bounds(594, 100, 70, 70), channel("LFOFreq"), range(0, 10, 0.12, 1, 0.1), text("LFO Freq") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) filmStrip("rslider.png", 111) colour(0, 0, 0, 255)
vslider bounds(644, 301, 88, 203) range(0, 1, 1, 1, 0.001) channel("amp")

image bounds(0, 0, 68, 600) file("wood.png")
image bounds(732, 0, 68, 600) file("wood.png")

;Preset system IT FINALLY WORKED)

combobox bounds(82, 100, 297, 25), populate("*.snaps"), channelType("string") value("") colour(55, 55, 55, 255)
filebutton bounds(82, 32, 145, 49), text("Save", "Save"), populate("*.snaps", "test"), mode("snapshot") value(0) colour:0(55, 55, 55, 255)
filebutton bounds(234, 32, 145, 49), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") value(0) colour:0(55, 55, 55, 255)

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