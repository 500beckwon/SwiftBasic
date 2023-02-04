//
//  main.swift
//  CodingTest
//
//  Created by ByungHoon Ann on 2022/12/19.
//

import Foundation
/*
print(pratice02([4,3,1,2,5]))
print(pratice02([5,4,3,2,1]))
print(pratice02([2, 1, 6, 7, 5, 8, 4, 9, 3, 10]))
print(pratice02( [1, 2, 3, 4, 5]))
print(pratice02( [1, 2, 4, 3, 5]))


print(pratice03("3141592", "271"))
print(pratice03("500220839878", "7"))
print(pratice03("10203", "15"))

 print(pratice04([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]))
 print(pratice05("one4seveneight"))
 print(pratice05("23four5six7"))
 print(pratice05("2three45sixseven"))
 print(pratice05("123"))
 
 print(pratice06("...!@BaT#*..y.abcdefghijklm"))
 print(pratice06("z-+.^."))
 print(pratice06("=.="))
 print(pratice06("123_.def"))
 print(pratice06("abcdefghijklmn.p"))

 print(pratice07([1,3,2,5,4], 9))
 print(pratice07([2,2,3,3], 10))
 print(pratice07([1,1,1,1,1,1], 6))
 print(pratice07([1,5,5,5,6,7,8], 40))
 
 print(pratice09(5, [2, 1, 2, 6, 2, 4, 3, 3]))
 print(pratice09(5, [2, 1, 2, 6, 2, 4, 3, 3]))
 print(pratice09(4, [4, 4, 4, 4, 4]))
 
 print(pratice10(1, 1), "\n")
 print(pratice10(1, 2), "\n")
 print(pratice10(1, 3), "\n")
 print(pratice10(1, 4), "\n")
 print(pratice10(1, 5), "\n")
 print(pratice10(1, 6), "\n")
 print(pratice10(1, 7), "\n")
 print(pratice10(1, 8), "\n")
 print(pratice10(1, 9), "\n")
 print(pratice10(1, 10), "\n")
 print(pratice10(1, 11), "\n")

 print(pratice10(1, 21), "\n")
 print(pratice10(1, 22), "\n")
 print(pratice10(1, 23), "\n")

 print(pratice11([1,5,2,6,3,7,4], [[2,5,3], [4, 4, 1], [1, 7, 3]]))

 print(pratice12("AB", 1))
 print(pratice12("z", 1))
 print(pratice12("a B z", 4))
 print(pratice12("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz", 4))

 
var list1 = [0, 1, 2, 2, 3, 0, 4, 2]
var list2 = [3,2,2,3]
print(removeElement( &list1, 2))
print(removeElement( &list2, 3))
 
 print(pratice13("2022.05.19", ["A 6", "B 12", "C 3"],  ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))

 print(pratice13( "2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"] ))
 print(pratice13( "2020.11.28",  ["A 12"] , ["2019.12.1 A"]))
 print(pratice13("2022.02.28",  ["A 23"], ["2020.01.28 A"] ))
 
 print(Pratice14("aabbaccc"))
 print(Pratice14("ababcdcdababcdcd"))
 print(Pratice14("abcabcdede"))
 print(Pratice14("abcabcabcabcdededededede"))
 print(Pratice14("xababcdcdababcdcd"))
 
 print(pratice15("(()())()" ))
 print(pratice15(")("))
 print(pratice15("()))((()"))
 
 print(searchInsert([1,3,5,6], 5))
 print(searchInsert([1,3,5,6], 2))
 print(searchInsert([1,3,5,6], 7))
 print(searchInsert([1], 1))


let s1 = "A man, a plan, a canal: Panama"
let s2 = "race a car"
let s3 = "`l;`` 1o1 ??;l`"
print(isPalindrome(s1))
print(isPalindrome(s2))
print(isPalindrome(s3))


let logs1 = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
let logs2 = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
let logs3 = ["t kvr", "r 3 1", "i 403", "7 so", "t 54"]
let logs4 = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
let logs5 = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo","a2 act car"]
let logs6 = ["j mo", "5 m w", "g 07", "o 2 0", "t q h"]
print(reorderLogFiles(logs4))
print(reorderLogFiles(logs5))
print(reorderLogFiles(logs6))


let killMe = "L, P! X! C; u! P? w! P. G, S? l? X? D. w? m? f? v, x? i. z; x' m! U' M! j? V; l. S! j? r, K. O? k? p? p, H! t! z' X! v. u; F, h; s? X? K. y, Y! L; q! y? j, o? D' y? F' Z; E? W; W' W! n! p' U. N; w? V' y! Q; J, o! T? g? o! N' M? X? w! V. w? o' k. W. y, k; o' m! r; i, n. k, w; U? S? t; O' g' z. V. N? z, W? j! m? W! h; t! V' T! Z? R' w, w? y? y; O' w; r? q. G, V. x? n, Y; Q. s? S. G. f, s! U? l. o! i. L; Z' X! u. y, Q. q; Q, D; V. m. q. s? Y, U; p? u! q? h? O. W' y? Z! x! r. E, R, r' X' V, b. z, x! Q; y, g' j; j. q; W; v' X! J' H? i' o? n, Y. X! x? h? u; T? l! o? z. K' z' s; L? p? V' r. L? Y; V! V' S. t? Z' T' Y. s? i? Y! G? r; Y; T! h! K; M. k. U; A! V? R? C' x! X. M; z' V! w. N. T? Y' w? n, Z, Z? Y' R; V' f; V' I; t? X? Z; l? R, Q! Z. R. R, O. S! w; p' T. u? U! n, V, M. p? Q, O? q' t. B, k. u. H' T; T? S; Y! S! i? q! K' z' S! v; L. x; q; W? m? y, Z! x. y. j? N' R' I? r? V! Z; s, O? s; V, I, e? U' w! T? T! u; U! e? w? z; t! C! z? U, p' p! r. x; U! Z; u! j; T! X! N' F? n! P' t, X. s; q'"

let killYou = ["m","i","s","w","y","d","q","l","a","p","n","t","u","b","o","e","f","g","c","x"]
print(mostCommonWord(killMe, killYou))
 
 let sample1 = ["eat","tea","tan","ate","nat","bat"]
 let sample2 = [""]
 print(groupAnagrams(sample1))



 
*/

//print(longestPalindrome("babad"))
//print(longestPalindrome("cbbd"))
print(longestPalindrome("a"))
