## Referência de API (resumo)

Este arquivo lista os componentes públicos mais importantes do pacote.

- `YINDetector`
  - `init(bufferSize: Int = 4096, threshold: Float = 0.12, minFrequency: Float = 80, maxFrequency: Float = 1100)`
  - `func detect(buffer: [Float], sampleRate: Float) -> Float?`
  - Detector de pitch baseado no algoritmo YIN (retorna frequência em Hz).

- `FFTProcessor`
  - `init(size: Int)`
  - `func performFFT(input: [Float]) -> [Float]` — retorna magnitudes.

- `HarmonicProductSpectrum`
  - `static func apply(to magnitudes: [Float], harmonics: Int = 4) -> [Float]`

- `FrequencyEstimator`
  - `func estimate(magnitudes: [Float], fftSize: Int, sampleRate: Float) -> Float?`

- `MusicTheory`
  - `static func analyze(frequency: Float) -> PitchResult?` — converte Hz → `PitchResult`.
  - `static func pitchClass(from noteName: String) -> String`

- `PitchResult` (struct)
  - `frequency: Float`
  - `midNote: Float` (MIDI contínuo)
  - `noteName: String` (ex: "A4")
  - `cents: Float`

Observações
- A maior parte das APIs aceita/retorna tipos primitivos (`Float`, `[Float]`) para
facilitar integração com buffers de áudio. Verifique as assinaturas nos arquivos
em `Sources/VocalCore/` para detalhes mais precisos.
