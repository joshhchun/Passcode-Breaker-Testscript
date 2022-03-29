#!/usr/bin/env python3
from dataclasses import dataclass
from typing import Iterable
import random

@dataclass
class Pair:
    i: int
    a: str
    b: str

    def canBefore(self) -> bool:
        return 0 < self.i

    def canAfter(self, password) -> bool:
        return self.i <= len(password) - 3

def generatePairs(string) -> Iterable[Pair]:
    n = len(string)
    for i in range(n - 1):
        yield Pair(i, string[i], string[i + 1])


def buildTriplets(pairs, password) -> Iterable[tuple]:
    for pair in pairs:
        if pair.canBefore() and pair.canAfter(password):
            isBefore = random.choice([False, True])
            if isBefore:
                letter = random.choice(password[:pair.i])
                yield (letter, pair.a, pair.b)
            else:  # isAfter:
                letter = random.choice(password[pair.i + 2:])
                yield (pair.a, pair.b, letter)
        elif pair.canBefore():
            letter = random.choice(password[:pair.i])
            yield (letter, pair.a, pair.b)
        else:  # pair.canAfter():
            letter = random.choice(password[pair.i + 2:])
            yield (pair.a, pair.b, letter)

length = random.choice(6,11)
password = [str(x) for x in range(length)]

random.shuffle(password)
pairs = generatePairs(password)

triplets = [x for x in buildTriplets(pairs, password)]
random.shuffle(triplets)

print("".join(password))
for triplet in triplets:
    print(triplet[0], triplet[1], triplet[2])
