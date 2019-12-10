import random

const RAND_MAX = 32767

proc crypt*(input: string, key: int): string =
    random.randomize(key)
    var
        r: int # char
        output: string = ""

    for c in input:
        while true:
            r = int(random.rand(RAND_MAX) / int((RAND_MAX + 1) / 256))
            if r < 256:
                break
        
        output &= char(c.int xor r)
    
    return output


when isMainModule:
    echo crypt("hoge", 123).crypt(123)

    

