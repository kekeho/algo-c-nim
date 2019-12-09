# Test of あ

import unittest
import random
import math
import sequtils
import sugar

import あ/swap

suite "あ test":
    test "swap":
        for i in 0..50:
            let
                A: int = rand(2^32-1)
                B: int = rand(2^32-1)

            var
                # Int
                a = A
                b = B
                # Str
                a_str = $A
                b_str = $B
                # Seq
                a_seq = ($A).map(x => x)
                b_seq = ($B).map(x => x)
            
            swap.swap(a, b)
            swap.swap(a_str, b_str)
            swap.swap(a_seq, b_seq)

            assert a == B
            assert b == A
            assert a_str == $B
            assert b_str == $A
            assert a_seq == ($B).map(x => x)
            assert b_seq == ($A).map(x => x)

