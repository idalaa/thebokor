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
        self.console_view.print_text("Welcome to thebokor.")
        # Ikuinen luuppi
        while (1):
            command_text = self.console_view.get_user_input()
            action = self.parse_command(command_text)


    def execute_help(self):
        directions = self.game_model.get_directions(self.location) # palauttaa suunnat, joihin pelaaja voi siirtyä
        action = HelpAction()
        action.add_directions(directions)
        self.console_view.print_action(action)

    def execute_exit(self):
        self.console_view.print_text("Bye bye.")
        exit(0)

    def execute_move(self, command_text):
        directions = self.game_model.get_directions(self.location) # Haetaan suunnat joihin voi siirtyä
        direction = command_text[3:]
        if direction not in directions:
            self.unknown_command()  # Suuntaa ei löytynyt
            return
        self.location = self.game_model.move_to(self.location, direction)
        self.execute_help()

    def unknown_command(self):
        self.console_view.print_text("Unknown command, please type 'help' to see available commands.")

    def parse_command(self, command_text):
        if command_text.upper() == 'HELP': # return value depends on where we are
            self.execute_help() # Help action is complemented with info from model
        elif command_text.upper() == 'EXIT':
            self.execute_exit()
        elif command_text.upper().startswith("GO"):
            self.execute_move(command_text)
        else:
            self.unknown_command()


# Suorituksen aloituskohta
def main():
    game = GameController()
    game.init()
    game.start()

if __name__ == '__main__': main()
