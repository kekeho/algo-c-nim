import random

proc crypt*(input: string, key: int): string =
    random.randomize(key)
    var
        r: uint8 # char
        output: string = ""

    for c in input:
        r = random.rand(255).uint8

        output &= char(c.uint8 xor r)
    
    return output


when isMainModule:
    echo crypt("hoge", 123).crypt(123)

    

