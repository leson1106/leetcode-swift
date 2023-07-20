import UIKit

/*
 We are given an array asteroids of integers representing asteroids in a row.

 For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

 Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.
 
 Input: asteroids = [5,10,-5]
 Output: [5,10]
 Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.
 
 Input: asteroids = [8,-8]
 Output: []
 Explanation: The 8 and -8 collide exploding each other.
 
 Input: asteroids = [10,2,-5]
 Output: [10]
 Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
 
 NOTICE: negative one will go left, positive one will go right
 [-2,-1,1,2] => [-2,-1,1,2] cause <--- [-2,-1] & [1, 2] --->. They are will never collided
 */
class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        guard !asteroids.isEmpty else { return [] }
        
        func canCollide(numb1: Int, numb2: Int) -> Bool {
            if  (numb1 < 0 && numb2 < 0) ||
                (numb1 > 0 && numb2 > 0) ||
                (numb1 < 0 && numb2 > 0) {
                return false
            } else {
                return true
            }
        }
        
        var result = [Int]()
        
        for i in 1..<asteroids.count {
            if result.isEmpty {
                result.append(asteroids[i])
                continue
            }
            var j = result.count - 1
            var deletedAll = false
            findCollision: while !result.isEmpty {
            if canCollide(numb1: result[j], numb2: asteroids[i]) {
                if abs(result[j]) < abs(asteroids[i]) {
                    result = result.dropLast()
                    j -= 1
                    deletedAll = result.isEmpty
                } else if abs(result[j]) == abs(asteroids[i]) {
                    result = result.dropLast()
                    break findCollision
                } else {
                    break findCollision
                }
            } else {
                result.append(asteroids[i])
                break findCollision
            }
            }
            if deletedAll {
                result.append(asteroids[i])
            }
        }
        return result
    }
}

//let asteroids = [-2,-1,1,2]
//let asteroids = [-2,-2,1,-2]
//let asteroids = [8,-8]
//let asteroids = [10,2,-5]
//let asteroids = [5,10,-5]
let asteroids = [2,3,5,7,10,-8,-11,-4,-1]
let result = Solution().asteroidCollision(asteroids)
