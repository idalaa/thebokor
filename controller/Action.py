#class Action():

#class HelpAction(Action):

class HelpAction():
    def __init__(self):
        self.commands = {"help", "exit"}

    def add_directions(self, directions):
        for direction in directions:
            self.commands.add("go " + str(direction))

    def get_text(self):
        return self.commands

#class MoveAction():
