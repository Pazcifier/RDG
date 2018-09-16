from abc import ABC, abstractmethod

class Entity(ABC):
    life = 100
    attack = 10
    defense = 10

@abstractmethod
def combat(e1, e2):
    pass
