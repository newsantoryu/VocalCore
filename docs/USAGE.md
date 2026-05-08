## Uso

Este guia mostra como usar `VocalCore` em um projeto Swift que consome o pacote.

Importação
---------

```swift
import VocalCore
```

Detector YIN (exemplo)
----------------------

```swift
// pcmBuffer: [Float] normalizado [-1, 1]
let detector = YINDetector(bufferSize: 4096, threshold: 0.12)
if let freq = detector.detect(buffer: pcmBuffer, sampleRate: 44100) {
    print("Frequência: \(freq) Hz")
}
```

Pipeline FFT + HPS (exemplo)
----------------------------

```swift
let fft = FFTProcessor(size: 8192)
var buffer = pcmWindowed // janela aplicada (Hann)
let mags = fft.performFFT(input: buffer)
let hps = HarmonicProductSpectrum.apply(to: mags, harmonics: 4)
if let est = FrequencyEstimator().estimate(magnitudes: hps, fftSize: 8192, sampleRate: 44100) {
    print("Estimativa via FFT/HPS: \(est) Hz")
}
```

Conversão para `PitchResult`
---------------------------

```swift
if let pitch = MusicTheory.analyze(frequency: frequency) {
    print(pitch.noteName, pitch.cents)
}
```

Boas práticas
- Use buffers suficientemente grandes para graves (p.ex. 4096–8192)
- Normalize as amostras para evitar saturação
- Prefira `YINDetector` para voz; use FFT/HPS como fallback em sinais complexos
