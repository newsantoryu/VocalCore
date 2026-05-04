//
//  YINDetectorTests.swift
//  VocalCore
//
//  Created by victor almeida on 04/05/26.
//

import Testing
import Foundation
@testable import VocalCore

@Suite("Validação de Algoritimos de Áudio")
struct YINDetectorTests {
    
    @Test("Detecção de frequência controlada")
    func testYINAccuracy() {
        // --- CONFIGURAÇÃO ---
        let sampleRate: Float = 44100.0
        let fequencyToDetect: Float = 440.0 // O " O LÁ central (A4)
        let bufferSize = 4096
        
        // Instancia a classe(public necessario)
        let detector = YINDetector(bufferSize: bufferSize)
        
        // --- GERAÇÃO DE SINAL (MOCK) ---
        //Criamos um buffer de áudio sintético para o detector processar
        var mockBuffer = [Float](repeating: 0, count: bufferSize)
        for i in 0..<bufferSize {
            //Fórmula: sin(2 * pi * f * t)
            let t = Float(i) / sampleRate
            mockBuffer[i] = sin(2.0 * Float.pi * fequencyToDetect * t)
        }
        
        //--- Execução ---
        let result = detector.detect(buffer: mockBuffer, sampleRate: sampleRate)
        
        // --- Validação (ASSERTIONS) ---
        // 1. O resultado não pode ser nulo
        #expect(result != nil, "O detectir deveria ter encontrado uma frequência")
       
        if let detectedFreq = result {
            // 2. A diferença entre o real e o detectado deve ser mínima
            let precisionError: Float = 0.5 // Mergem de erro de 0.5 Hz
            let difference = abs(detectedFreq - fequencyToDetect)
            
            #expect(difference < precisionError, "Diferença muito alta: \(difference)Hz")
            
        }
    }
}
