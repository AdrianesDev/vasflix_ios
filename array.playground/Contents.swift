import UIKit
import Foundation



func countPythagoreanTriples(treeNodes: Int, treeFrom: [Int], treeTo: [Int], x: Int, y: Int, z: Int) -> Int {
    // Write your code here
    
    var count = 0
    var tree: [[Int]] = Array(repeating: [], count: treeNodes)
    
    // this build tree
    for i in 0..<treeFrom.count {
        tree[treeFrom[i]].append(treeTo[i])
        tree[treeTo[i]].append(treeFrom[i])
    }
    
    for i in 0..<treeNodes {
        for j in 0..<tree[i].count {
            for k in (j + 1)..<tree[i].count {
                let nodeX = i
                let nodeY = tree[i][j]
                let nodeZ = tree[i][k]
                if isPytharorianTtriplet(x: x + nodeX, y: y + nodeY, z: z + nodeZ) {
                    count += 1
                }
            }
        }
    }
    
    return count
    
}

func isPytharorianTtriplet(x:Int, y:Int, z:Int) -> Bool {
    
    let sides = [x,y,z].sorted()
    let sideX = sides[0] * sides[0]
    let sideY = sides[1] * sides[1]
    let sideZ = sides[2] * sides[2]
    
    return sideX + sideY == sideZ
}


countPythagoreanTriples(treeNodes: 9, treeFrom: [0,1,2,3,4,5,6,7], treeTo: [1,2,3,4,5,6,7,8], x: 3, y: 4, z: 5)
