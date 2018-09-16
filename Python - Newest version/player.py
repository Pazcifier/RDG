from entity import Entity

class Player(Entity):
    """docstring for Player."""
    def __init__(self, name):
        super(Player, self).__init__()
        self.name = name
