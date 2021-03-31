<Cabbage>

;Window size and colour.

form caption("Wave-Length") size(600, 350), colour(255, 255, 255, 255), pluginID("def1")

;Groupbox and background widgets.

groupbox bounds(0, 132, 297, 122) text("Lfo") colour(30, 22, 65, 255) fontcolour(255, 255, 255, 255)
groupbox bounds(296, 132, 303, 122) colour(30, 22, 65, 255) fontcolour(255, 255, 255, 255) text("Other")

;Controll widgets:
;Sliders, Keyboard and XY pads.

keyboard bounds(0, 254, 600, 96)

rslider bounds(26, 152, 60, 50), channel("att"), range(0.01, 1, 0.01, 1, 0.01), text("Attack") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(88, 152, 60, 50), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(150, 152, 60, 50), channel("sus"), range(0, 1, 0.5, 1, 0.01), text("Sustain") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(212, 152, 60, 50), channel("rel"), range(0, 1, 0.7, 1, 0.01), text("Release") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(88, 202, 60, 50), channel("cutoff"), range(0, 22000, 0, 0.5, 0.01), text("Cut-Off") colour(0, 0, 0, 255) colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(150, 202, 60, 50), channel("res"), range(0, 1, 0.7, 1, 0.01), text("Resonance") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178)
rslider bounds(306, 152, 60, 50), channel("LFOFreq"), range(0, 1, 0.7, 1, 0.01), text("LFOFreq") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178) popuptext("LFOFreq")
rslider bounds(364, 152, 60, 50), channel("amp"), range(0, 1, 0.7, 1, 0.01), text("amp") colour(0, 0, 0, 255) trackercolour(0, 140, 255, 255) outlinecolour(255, 255, 255, 255) fontcolour(0, 0, 0, 255) markercolour(255, 255, 255, 255) textboxoutlinecolour(0, 0, 0, 178) popuptext("amp")

xypad bounds(0, 0, 150, 133) ballcolour(0, 140, 255, 255) backgroundcolour(255, 255, 255, 100)   textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255) channel("rel", "sus") popuptext("ReSus") rangex(0, 1, 0) rangey(0, 1, 0)
xypad bounds(148, 0, 150, 133) ballcolour(0, 140, 255, 255) backgroundcolour(255, 255, 255, 100)   textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255) channel("att", "dec") popuptext("DeAtt") rangex(0, 1, 0) rangey(0, 1, 0)
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

;Linking variables to knobs (channel fetching).

iAtt chnget "att"
iDec chnget "dec"
iSus chnget "sus"
iRel chnget "rel"
kRes chnget "res"
kCutOff chnget "cutoff"
kLFOFreq chnget "LFOFreq"
kAmp chnget "amp"

;Out opcodes:

;kEnv (Binding envelope controls to variables).
;out (sending out the final processed singal to user speaker or daw mixer channel)
;kLFO lfo 4 means that the lfo shape will be a square cuz the Csound id for a square wave is 4. (it would if I actually knew how to opcode).

kEnv madsr iAtt, iDec, iSus, iRel 
aOut vco2 iAmp, iFreq
kLFO lfo 4, kLFOFreq
aLP moogladder aOut, kLFO*kCutOff, kRes
outs kAmp*(aLP*kEnv), kAmp*(aLP*kEnv)
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>