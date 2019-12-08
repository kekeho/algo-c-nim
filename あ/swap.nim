proc swap(x: var int, y: var int): void =
    let temp = x
    x = y
    y = temp


when isMainModule:
    var a = 100
    var b = 300
    swap(a, b)

    echo a, " ", b  # 300 100
