#class Action():

#class HelpAction(Action):

class HelpAction():
    def __init__(self):
        self.commands = {"help"}

    def add_directions(self, directions):
        for direction in directions:
            self.commands.add("go " + direction)

    def get_text(self):
        return self.commands

#class MoveAction():