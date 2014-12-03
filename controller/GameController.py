from controller.Action import *
from model.GameModel import GameModel
from view.ConsoleView import ConsoleView

class GameController():
    # alustetaan peli
    def init(self):
        self.location = 1 # aloitetaan huoneesta, jonka id on 1
        self.console_view = ConsoleView()
        self.game_model = GameModel("localhost", "theborok", "dbuser", "dbpass")

    # aloitetaan peli
    def start(self):
        self.console_view.print_action(None)
        command_text = self.console_view.get_user_input()
        action = self.parse_command(command_text)


    def execute_help(self):
        directions = self.game_model.get_directions(self.location) # palauttaa suunnat, joihin pelaaja voi siirtyä
        action = HelpAction()
        action.add_directions(directions)
        self.console_view.print_help(action)

    def parse_command(self, command_text):
        if command_text.upper() == 'HELP': # return value depends on where we are
            self.execute_help() # Help action is complemented with info from model
        if command_text.upper().startswith("GO"): #
            return MoveAction(command_text) #


# Suorituksen aloituskohta
def main():
    game = GameController()
    game.init()
    game.start()

if __name__ == '__main__': main()
