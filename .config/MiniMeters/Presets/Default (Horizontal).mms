Loudness {
    int Mode 1
}
Module.Loudness {
    bool enabled true
    int order 2
    bool popout.enabled false
    int size 125
}
Module.Oscilloscope {
    bool enabled true
    int order 5
    bool popout.enabled false
    int size 186
}
Module.Spectrogram {
    bool enabled true
    int order 0
    bool popout.enabled false
    int size 264
}
Module.Spectrum {
    bool enabled true
    int order 6
    bool popout.enabled false
    int size 476
}
Module.Stereometer {
    bool enabled true
    int order 3
    bool popout.enabled false
    int size 256
}
Module.VU {
    bool enabled true
    int order 4
    bool popout.enabled false
    int size 316
}
Module.Waveform {
    bool enabled true
    int order 1
    bool popout.enabled false
    int size 308
}
oscilloscope {
}
spectrogram {
    float contrast 0.500000
    int fft_size 1
    int orientation 1
    int piano 0
    bool scale_use_global false
    float slope 4.500000
    float speed 1.000000
    bool speed_use_global false
}
spectrum {
}
stereometer {
    int color_mode 0
    int correlation 0
    int guides 0
    int mode 0
    int normalize 0
    float point_size 0.000000
    int polarity 0
}
vu {
    float cal 0.000000
    int channel 2
}
waveform {
    int color_mode 1
    float speed 1.000000
    bool speed_use_global false
    int timecode 1
}
window {
    string layout "Horizontal"
    rect {
        num h 128
        num w 1920
        num x 0
        num y 0
    }
}
