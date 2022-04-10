import Foundation

class SolutionArrayD {
    func mostWordsFound(_ sentences: [String]) -> Int {
        var currentCount: Int = 0
        var maxCount: Int = 0
        sentences.forEach { sentence in
            let senteceCount = sentence.components(separatedBy: " ").count
            currentCount = senteceCount
            maxCount = max(currentCount, maxCount)
        }
        
        return maxCount
    }
}
