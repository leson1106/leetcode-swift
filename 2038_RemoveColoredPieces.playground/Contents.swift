import UIKit

class Solution {
    ///In this game, Alice moves first.
    ///- Alice is only allowed to remove a piece colored 'A' if both its neighbors are also colored 'A'. She is not allowed to remove pieces that are colored 'B'.
    ///- Bob is only allowed to remove a piece colored 'B' if both its neighbors are also colored 'B'. He is not allowed to remove pieces that are colored 'A'.
    ///- Alice and Bob cannot remove pieces from the edge of the line.
    ///- If a player cannot make a move on their turn, that player loses and the other player wins.
    ///Assuming Alice and Bob play optimally, return true if Alice wins, or return false if Bob wins.
    ///
    ///     Example 1:
    ///     Input: colors = "AAABABB"
    ///     Output: true
    ///     Explanation:
    ///     AAABABB -> AABABB
    ///     Alice moves first.
    ///     She removes the second 'A' from the left since that is the only 'A' whose neighbors are both 'A'.
    ///     Now it's Bob's turn.
    ///     Bob cannot make a move on his turn since there are no 'B's whose neighbors are both 'B'.
    ///     Thus, Alice wins, so return true.
    ///
    ///     Example 2:
    ///     Input: colors = "AA"
    ///     Output: false
    ///     Explanation:
    ///     Alice has her turn first.
    ///     There are only two 'A's and both are on the edge of the line, so she cannot move on her turn.
    ///     Thus, Bob wins, so return false.
    ///
    ///     Example 3:
    ///     Input: colors = "ABBBBBBBAAA"
    ///     Output: false
    ///     Explanation:
    ///     ABBBBBBBAAA -> ABBBBBBBAA
    ///     Alice moves first.
    ///     Her only option is to remove the second to last 'A' from the right.
    ///     ABBBBBBBAA -> ABBBBBBAA
    ///     Next is Bob's turn.
    ///     He has many options for which 'B' piece to remove. He can pick any.
    ///     On Alice's second turn, she has no more pieces that she can remove.
    ///     Thus, Bob wins, so return false.
    ///
    ///Time complexity `O(n - 2)`
    ///Space complexity `O(1)` notice syntax of string index is hard to use so convert it to array and access index directly
    func winnerOfGame(_ colors: String) -> Bool {
        let colors = Array(colors)
        var aliceMove: Int = 0
        var bobMove: Int = 0
        
        for i in 1..<colors.count {
            guard i + 1 < colors.count else { break }
            if colors[i-1] == "A", colors[i] == "A", colors[i+1] == "A" {
                aliceMove += 1
            } else if colors[i-1] == "B", colors[i] == "B", colors[i+1] == "B" {
                bobMove += 1
            }
        }
        
        return aliceMove != 0 && aliceMove > bobMove
    }
}

let res = Solution().winnerOfGame("AAABABB")
let res1 = Solution().winnerOfGame("AA")
let res2 = Solution().winnerOfGame("AAABBBB")
