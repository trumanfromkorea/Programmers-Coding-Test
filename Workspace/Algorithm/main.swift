import Foundation

// let n = 110011
// let k = 10
// let result = solution(n, k)
// print(result)

let test = primes(1000000).map { isPrime($0) }.contains(false)
print(test)

// MARK: - Solution

func solution(_ n: Int, _ k: Int) -> Int {
    var answer = 0
    let radix = String(n, radix: k)

    let numbers = radix
        .components(separatedBy: "0")
        .filter { !$0.isEmpty }

    for number in numbers {
        let decimal = Int(number, radix: 10)!

        answer += isPrime(decimal) ? 1 : 0
    }

    return answer
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }

    let squared = sqrt(Double(n))
    let div = Int(squared)

    for i in 2 ... div + 1 {
        if n % i == 0 {
            return false
        }
    }

    return true
}
