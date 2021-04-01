<Cabbage> bounds(0, 0, 0, 0)
form caption("WaveLength") size(800, 600), colour(10, 10, 10), pluginID("def1")
image bounds(0, 71, 800, 529) file("texturebg.jpg")  
groupbox bounds(406, 6, 315, 173) text("LFO")
groupbox bounds(72, 6, 315, 173) text("Presets")
groupbox bounds(548, 184, 173, 177) text("Volume and pan")
groupbox bounds(406, 184, 136, 177) text("Pitch and glide")
groupbox bounds(406, 366, 315, 136) text("Distortion and Gain")
groupbox bounds(72, 272, 315, 112) text("WaveForm")
groupbox bounds(72, 390, 315, 112) text("Reverb")
keyboard bounds(69, 505, 665, 95) whiteNoteColour(0, 0, 0, 255) keySeparatorColour(255, 255, 255, 102) blackNoteColour(34, 28, 28, 255) mouseOverKeyColour(255, 255, 255, 255)
rslider bounds(424, 32, 70, 70), channel("att"), range(0.01, 1, 0.01, 1, 0.01), text("Attack")  trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(492, 32, 70, 70), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(562, 32, 70, 70), channel("sus"), range(0, 1, 0.5, 1, 0.01), text("Sustain") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(632, 32, 70, 70), channel("rel"), range(0, 1, 0.7, 1, 0.01), text("Release") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(462, 100, 70, 70), channel("cutoff"), range(100, 9000, 2000, 0.5, 0.01), text("Cut-Off") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(530, 100, 70, 70), channel("res"), range(0, 0.9, 0.7, 1, 0.01), text("Resonance") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(600, 100, 70, 70), channel("LFOFreq"), range(0, 10, 0.12, 1, 0.1), text("LFO Freq") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")

vslider bounds(640, 210, 70, 150) range(0, 1, 1, 1, 0.001) channel("amp") filmstrip("j8vslider201.png", 201)
vslider bounds(558, 210, 70, 150) range(0, 1, 0.5, 1, 0.001) channel("pan") filmstrip("j8vslider201.png", 201)


image bounds(0, 0, 68, 600) file("wood.png")
image bounds(725, 0, 75, 600) file("wood.png")

;Preset system IT FINALLY WORKED =)

combobox bounds(82, 100, 297, 25), colour(55, 55, 55, 255), populate("*.snaps"), channeltype("string")
filebutton bounds(82, 32, 145, 49), text("Save", "Save"), colour:0(55, 55, 55, 255), populate("*.snaps", "test"), mode("named snapshot")
filebutton bounds(234, 32, 145, 49), text("Remove", "Remove"), colour:0(55, 55, 55, 255), populate("*.snaps", "test"), mode("remove preset")

image bounds(30, 126, 416, 222) file("Wave Length logo.png") active(0)

;wave form buttons.

button bounds(86, 302, 80, 64) colour:0(55, 55, 55, 255) text("Square", "-Square-") colour:1(159, 159, 159, 255) fontColour:1(0, 0, 0, 255) identChannel("square_wave") channel("square_wave") radioGroup("2")
button bounds(292, 302, 80, 64) colour:0(55, 55, 55, 255) text("Sine", "-Sine-") colour:1(159, 159, 159, 255) fontColour:1(0, 0, 0, 255) identChannel("sine_wave") channel("sine_wave") radioGroup("2")
button bounds(190, 302, 80, 64) colour:0(55, 55, 55, 255) text("Saw", "-Saw-") colour:1(159, 159, 159, 255) fontColour:1(0, 0, 0, 255) channel("saw_wave") identChannel("saw_wave") radioGroup("2")

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
iPan chnget "pan"

kEnv madsr iAtt, iDec, iSus, iRel 
aOut vco2 iAmp, iFreq, iPan
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