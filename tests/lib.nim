import random


# Generate Random String
proc randBytes*(): string =
    let 
        length: uint64 = rand(9999).uint64
    var buffer = ""

    for i in 0..length:
        let index = rand(255).uint8
        buffer &= char(index)

    return buffer
