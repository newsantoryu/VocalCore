# VocalCore

Biblioteca Swift para detecção de afinação e processamento de sinal vocal.

Visão geral
---------

`VocalCore` fornece detectores de pitch (YIN e pipeline FFT/HPS) e utilitários de
processamento de sinal para aplicações de áudio em iOS/macOS. O foco é precisão
para voz e baixa latência, aproveitando o framework `Accelerate` para desempenho.

Principais funcionalidades
- Detector YIN com interpolação parabólica para precisão sub-sample
- Pipeline FFT + HPS (Harmonic Product Spectrum) como estratégia complementar
- Conversão para representação musical (`PitchResult`: frequência, nota, cents)
- Implementações otimizadas com `vDSP`

Estrutura do repositório
- `Package.swift` — manifesto do Swift Package
- `Sources/VocalCore/` — código fonte principal
    - `VocalCore.swift` — ponto de integração (placeholder)
    - `Models/PitchResult.swift` — modelo de resultado de pitch
    - `Processors/` — implementações: `YINDetector`, `FFTProcessor`, `MusicTheory`
- `Tests/` — testes unitários

Requisitos
- Swift 5.10+
- iOS 16+ (conforme `Package.swift`)

Instalação

Adicione como dependência no seu `Package.swift`:

```swift
.package(url: "https://github.com/SEU_USUARIO/VocalCore.git", from: "0.1.0")
```

Build e Testes

```bash
swift build
swift test
```

Exemplo rápido de uso

```swift
import VocalCore

let detector = YINDetector(bufferSize: 4096)
if let frequency = detector.detect(buffer: pcmBuffer, sampleRate: 44100) {
        print("Frequência detectada: \(frequency) Hz")
}
```

Documentação adicional
- Guia de uso: `docs/USAGE.md`
- Referência da API: `docs/API.md`
- Diretrizes de contribuição: `CONTRIBUTING.md`

Contribuição

PRs são bem-vindos. Antes de abrir um PR, rode `swift test` e siga as
diretrizes em `CONTRIBUTING.md`.

Licença

Adicione aqui a licença do projeto (ex: MIT). Posso criar um arquivo `LICENSE`
se desejar.

