<Cabbage> bounds(0, 0, 0, 0)
form caption("WaveLength") size(800, 600), colour(10, 10, 10), pluginID("def1")
keyboard bounds(0, 505, 800, 95) keyseparatorcolour(255, 255, 255, 102) blacknotecolour(21, 22, 21, 255) whitenotecolour(0, 0, 0, 255)
rslider bounds(12, 14, 70, 70), channel("att"), range(0, 1, 0.01, 1, 0.01), text("Attack") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(82, 14, 70, 70), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(152, 14, 70, 70), channel("sus"), range(0, 1, 0.5, 1, .01), text("Sustain") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(222, 14, 70, 70), channel("rel"), range(0, 1, 0.7, 1, .01), text("Release") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(12, 84, 70, 70), channel("cutoff"), range(0, 22000, 2000, .5, .01), text("Cut-Off") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(82, 84, 70, 70), channel("res"), range(0, 1, 0.7, 1, .01), text("Resonance") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(152, 84, 70, 70), channel("LFOFreq"), range(0, 1, 0.12, 1, 0.01), text("LFO Freq") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
rslider bounds(222, 84, 70, 70), channel("amp"), range(0, 1, 0.7, 1, 0.01), text("Amp") colour(0, 0, 0, 255) markercolour(255, 255, 255, 255) outlinecolour(255, 255, 255, 255) trackercolour(255, 255, 255, 255)
csoundoutput bounds(400, 0, 400, 200) fontcolour(0, 255, 38, 255) fontcolour:0(0, 255, 38, 255) colour(17, 16, 16, 0) colour:0(17, 16, 16, 0)
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