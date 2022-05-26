import Foundation

let param1 = ["classic", "pop", "classic", "classic", "pop"]
let param2 = [500, 600, 150, 800, 2500]

let result = solution(param1, param2)
print(result)

struct Genre {
    var play: Int
    var index: Int
}

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var sumPlays: [String: Int] = [:]
    var maxGenres: [String: [Genre]] = [:]
    var answer: [Int] = []

    for (i, (key, val)) in zip(genres, plays).enumerated() {
        if let _ = sumPlays[key] {
            sumPlays[key]! += val
        } else {
            sumPlays[key] = val
        }

        if maxGenres[key] == nil {
            maxGenres[key] = [Genre(play: val, index: i)]
        } else {
            maxGenres[key]!.append(Genre(play: val, index: i))
        }
    }

    for genre in sumPlays.sorted(by: { $0.value > $1.value }) {
        let key = genre.key

        let sortedGenre = maxGenres[key]!.sorted(by: { $0.play > $1.play })
        
        answer.append(sortedGenre[0].index)
        if sortedGenre.count > 1 {
            answer.append(sortedGenre[1].index)
        }
    }

    return answer
}
