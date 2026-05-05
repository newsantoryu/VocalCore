# VocalCore
VocalCore 🎙️Módulo de alta performance para processamento de sinal digital (DSP) e análise vocal, desenvolvido em Swift.🚀 Diferenciais Técnicos (Nível Sênior)Algoritmo YIN: Implementação robusta para detecção de frequência fundamental (pitch) com precisão sub-sample através de interpolação parabólica.Performance com vDSP: Utilização do framework Accelerate (Apple) para cálculos de autocorrelação e diferença acumulada, garantindo baixo consumo de CPU.Swift Testing: Cobertura de testes unitários utilizando o novo framework nativo da Apple (WWDC 24), validando a precisão matemática via ondas senoidais sintéticas.Arquitetura Modular: Pacote isolado via Swift Package Manager (SPM), facilitando a reutilização e diminuindo o tempo de compilação do app principal.🛠️ Como utilizarswiftimport VocalCore

let detector = YINDetector(bufferSize: 4096)
if let frequency = detector.detect(buffer: pcmBuffer, sampleRate: 44100) {
    print("Frequência detectada: \(frequency) Hz")
}
Use o código com cuidado.📊 Qualidade de CódigoTestes Unitários: Validação de algoritmos sem dependência de hardware.CI/CD: Integrado com GitHub Actions para validação automática em cada Push.Thread Safety: Desenhado para rodar em threads de processamento de áudio de baixa latência.
