import sequtils
import strutils
import sugar

proc reverce[T](list: openArray[T]): seq[T] =
    var tmp: seq[T]
    for i in 0..(list.len-1):
        tmp.insert(list[i])
    
    return tmp


proc luhn*(card_num: seq[int]): bool =
    var sum = 0

    var double: int = 2
    for i in (0..(len(card_num)-1)).toSeq.reverce:
        var d = ((double mod 2) + 1) * card_num[i]
        if d > 9:
            d -= 9
        
        sum += d
        double += 1
    
    if (sum mod 10) == 0:
        return true
    else:
        return false


echo luhn("4111111111111111".map(x => ($x).parseInt))

