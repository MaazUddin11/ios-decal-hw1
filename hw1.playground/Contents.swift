//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.

var hi = "hi"

import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }
    
    //: ### Are the values passed in to the **init** function and those set to the instance
    //: ### variables the same type? If not, why?
    
    
    //: [EXPLAIN YOUR ANSWER HERE] No they are not the same type. The values passed into **init** 
    //: are wrapped optionals (due to the ? after their type), so there is a possibility of them 
    //: being "nil" or a String. The values set to the instance variables are Strings for sure. We
    //: know this because they have been forcefully unwrapped using the ! symbol.
    
    
    //: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map() {String($0.characters.reverse())}
        var numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
    //: ### Why does the compiler dislike the **for loop**? Fix it.
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    //: [EXPLAIN YOUR ANSWER HERE] 1) The problem with the **for loop** is that the "i" is declared
    //: using a "let" statement (which would give it a permanent value) and not a "var" statement.
    //: 2) Another thing wrong in this function is that there is no boolean being returned when the
    //: "if" statement isn't true and when the loop finishes, and so, we have to add in "return true".
    //: 3) The last thing is that the function must be declared as a "class func" because the code at 
    //: the bottom uses it as a class function and not just a normal function.
    
    
    //: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters = [Character : Int]() //Line X
        var lenA = self.wordA.characters.count
        var lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (letter, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
    //: ### What is the problem with declaring **countLetters** as we do in **Line X**,
    //: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
    //: ### What else is wrong with this function? You may have to refer to (but **not**
    //: ### change) the code at the very bottom. Debug the function.
    
    //: [EXPLAIN YOUR ANSWER HERE] 1) **countLetters** is not being initialized properly. It
    //: must use "=" rather than ":". 2) isAnagram is not a class function, so we must remove
    //: the "class" part in its function declaration. It must also return a "bool" value, and
    //: not "nil". So in the end, we must "return true" since that is the only possiblity for
    //: function to return since all the "false" conditions were not satisfied.    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
