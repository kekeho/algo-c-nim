# Test of あ

import unittest
import random
import math
import sequtils
import strutils
import sugar

import あ/swap
import あ/luhn

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

    test "luhn":
        let
            # MOCK
            correct = [
                5555555555554444, 5105105105105100,  # Master
                4111111111111111, 4012888888881881,  # Visa
                3530111333300000, 3566002020360505,  # JCB
                30569309025904, 38520000023237,  # Diners
                378282246310005, 371449635398431, 378734493671000,  # Amex
                6011111111111117, 6011000990139424  # Discover
            ]

            wrong = [6011000990139425]
        
            correct_checked = correct.map(num => luhn( ($num).map(x => ($x).parseInt) ))
            wrong_checked = wrong.map(num => luhn( ($num).map(x => ($x).parseInt) ))
        
        for res in correct_checked:
            assert res
        
        for res in wrong_checked:
            assert (not res)
