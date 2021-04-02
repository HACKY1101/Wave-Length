<Cabbage> bounds(0, 0, 0, 0)
form caption("WaveLength") size(800, 600), colour(10, 10, 10), pluginID("def1")
image bounds(0, 590, 800, 10) file("texturebg.jpg") visible(0)
groupbox bounds(406, 6, 315, 173) text("LFO") imgfile("wavegbox.png") fontcolour(0, 255, 82, 255) outlinecolour(183, 183, 183, 255)
groupbox bounds(72, 6, 315, 173) text("Presets") imgfile("wavegbox.png") fontcolour(149, 0, 255, 255)
groupbox bounds(563, 184, 158, 177) text("Volume and pan") imgfile("wavegbox.png") fontcolour(255, 0, 188, 255)
groupbox bounds(406, 184, 156, 177) text("Pitch and glide") imgfile("wavegbox.png") colour(0, 0, 0, 255) fontcolour(0, 197, 255, 255)

groupbox bounds(72, 256, 315, 244)  imgfile("wavegbox.png")
groupbox bounds(563, 366, 158, 135) text("Reverb") imgfile("wavegbox.png") fontcolour(236, 255, 0, 255)
groupbox bounds(406, 366, 156, 135)  imgfile("wavegbox.png") text("LoFi") fontcolour(255, 0, 0, 255)
keyboard bounds(69, 505, 665, 95) whiteNoteColour(0, 0, 0, 255) keySeparatorColour(255, 255, 255, 102) blackNoteColour(34, 28, 28, 255) mouseOverKeyColour(255, 255, 255, 255)
rslider bounds(424, 32, 70, 70), channel("att"), range(0.01, 1, 0.01, 1, 0.01), text("Attack")  trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(492, 32, 70, 70), channel("dec"), range(0, 1, 0.5, 1, 0.01), text("Decay") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(562, 32, 70, 70), channel("sus"), range(0, 1, 0.5, 1, 0.01), text("Sustain") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(632, 32, 70, 70), channel("rel"), range(0, 1, 0.7, 1, 0.01), text("Release") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(462, 100, 70, 70), channel("cutoff"), range(100, 9000, 2000, 0.5, 0.01), text("Cut-Off") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(530, 100, 70, 70), channel("res"), range(0, 0.9, 0.7, 1, 0.01), text("Resonance") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(600, 100, 70, 70), channel("LFOFreq"), range(0, 10, 0.12, 1, 0.1), text("LFO Freq") colour(0, 0, 0, 255) trackerColour(255, 255, 255, 255) markerColour(255, 255, 255, 255) colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201, "vertical")
rslider bounds(486, 234, 70, 70), channel("pitch"), range(0, 10, 5, 1, 0.1), text("Pitch") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)
rslider bounds(412, 234, 70, 70), channel("glide"), range(0, 10, 0.12, 1, 0.1), text("Glide") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)

;Volume and pan.
vslider bounds(640, 210, 70, 150) range(0, 1, 1, 1, 0.001) channel("amp") filmstrip("j8vslider201.png", 201)
vslider bounds(564, 210, 70, 150) range(0, 1, 0.5, 1, 0.001) channel("pan") filmstrip("j8vslider201.png", 201)

;Wooden borders.
image bounds(0, 0, 68, 600) file("wood.png")
image bounds(724, 0, 76, 600) file("wood.png")

;Preset system IT FINALLY WORKED =)
combobox bounds(85, 100, 288, 25), colour(55, 55, 55, 255), populate("*.snaps"), channeltype("string")
filebutton bounds(82, 32, 145, 49), text("Save", "Save"), colour:0(55, 55, 55, 255), populate("*.snaps", "test"), mode("named snapshot") value(0) imgfile("wavegbox.png")
filebutton bounds(234, 32, 145, 49), text("Remove", "Remove"), colour:0(55, 55, 55, 255), populate("*.snaps", "test"), mode("remove preset") imgfile("wavegbox.png")

image bounds(26, 126, 404, 222) file("Wave Length logo.png") active(0)

;wave form controll.
gentable bounds(82, 276, 293, 150), tablenumber(99.0), identchannel("table1"), fill(0), outlinethickness(3)
combobox bounds(82, 430, 293, 20), , channel("waveform") text("Sine", "Square", "Saw")

;reverb unit.
rslider bounds(642, 396, 70, 70), channel("RvbMix"), range(0, 1.00, 1), text("Mix") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)
rslider bounds(570, 396, 70, 70), channel("RvbSize"), range(0.3, 1.00, 0.4), text("Size") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)

;LoFi unit.
rslider bounds(486, 396, 70, 70), channel("fold"), range(0, 10, 0.12, 1, 0.1), text("Foldover") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)
rslider bounds(412, 396, 70, 70), channel("bits"), range(0, 10, 0.12, 1, 0.1), text("Bits") colour(0, 0, 0, 255)   colour(0, 0, 0, 255) filmstrip("j8rslider201.png", 201)


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
;instrument 1 is a square wave.
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
gkRvbMix	chnget	"RvbMix"
gkRvbSize	chnget	"RvbSize"
ipan chnget pan
  
kWaveform chnget "waveform"
    if changed:k(kWaveform) == 1 then
        tablecopy 99, kWaveform
        chnset "tablenumber(99)", "table1" 
    endif
aL,aR reverbsc	kAmp,kAmp,gkRvbSize,12000
kLFO oscili 1, kLFOFreq, 99
kEnv madsr iAtt, iDec, iSus, iRel 
aOut vco2 iAmp, iFreq
aLP moogladder aOut, abs(kLFO)*kCutOff, kRes
outs kAmp*(aLP*kEnv), kAmp*(aLP*kEnv)
endin

</CsInstruments>
<CsScore>
f99 0 1024 10 1
f1 0 1024 10 1                      ;sine
f2 0 1024 7 1 512 1 0 -1 512 -1     ;square
f3 0 1024 7 -1 512 1 1 -1 511 1     ;saw

;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>