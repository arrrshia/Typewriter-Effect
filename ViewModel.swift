import Foundation

class ViewModel: ObservableObject {
    @Published var text: String = ""
    var currentStringIndex = 0
    private var currentSessionID: UUID? = nil // Unique identifier for each typing session

    func typeWriter() {
        let newSessionID = UUID()
        currentSessionID = newSessionID
        text = ""
        currentStringIndex = 0
        typeNextString(sessionID: newSessionID)
    }

    private func typeNextString(sessionID: UUID) {
        guard sessionID == currentSessionID else { return }
        if currentStringIndex < stringArray.count {
            let stringToType = stringArray[currentStringIndex]
            typeOutString(string: stringToType, sessionID: sessionID) { [weak self] in
                guard let self = self, sessionID == self.currentSessionID else { return }
                self.deleteString(string: stringToType, sessionID: sessionID) {
                    self.currentStringIndex += 1
                    self.typeNextString(sessionID: sessionID)
                }
            }
        } else {
            currentStringIndex = 0
        }
    }
    
    private func typeOutString(string: String, sessionID: UUID, completion: @escaping () -> Void) {
        var position = 0
        var typeCharacter: (() -> Void)!
        typeCharacter = { [weak self] in
            guard let self = self, sessionID == self.currentSessionID else { return }
            if position < string.count {
                let index = string.index(string.startIndex, offsetBy: position)
                DispatchQueue.main.async {
                    self.text.append(string[index])
                }
                position += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    typeCharacter()
                }
            } else {
                completion()
            }
        }
        typeCharacter()
    }
    
    private func deleteString(string: String, sessionID: UUID, completion: @escaping () -> Void) {
        var position = string.count

        var deleteCharacter: (() -> Void)!
        deleteCharacter = { [weak self] in
            guard let self = self, sessionID == self.currentSessionID else { return }
            if position > 0 {
                DispatchQueue.main.async {
                    self.text.removeLast()
                }
                position -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    deleteCharacter()
                }
            } else {
                completion()
            }
        }
        deleteCharacter()
    }

    
}

