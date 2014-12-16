from controller.Action import *
from model.GameModel import GameModel
from view.ConsoleView import ConsoleView


class GameController():
    # alustetaan peli
    def init(self):
        self.deaths = 0
        self.visions = 0
        self.location = 1 # aloitetaan huoneesta, jonka id on 1
        self.console_view = ConsoleView()
        self.game_model = GameModel("localhost", "thebokor", "markusep", "juomalasi")

    # aloitetaan peli
    def start(self):
        self.console_view.print_text("Welcome to thebokor.\nYou start the game as a rat, you wake up confused and after a short while you figure out that someone has cursed you and stolen your body. The only way of getting out of this curse is to evolve using other animals, the first animal is a cat. You need to find a cat. As a rat nobody likes you.")
        self.console_view.print_text("------CHAPTER 1-------\nAfter a while of wandering in the mold written walls fighting your way past dead insects, you find a hole in the wall. From the hole you can see a human making food at the stove and a cat laying on the kitchen table")
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
        
    def unknown_command(self):
        self.console_view.print_text("Unknown command, please type 'help' to see available commands.")

    def execute_desc(self):
        desc = self.game_model.get_desc(self.location)
        print(desc)

    
    def execute_vision(self):
        if self.location == 6 and self.visions == 0:
            self.visions = self.visions + 1
        elif self.location == 16:
            self.visions = self.visions + 1
       

    def execute_ending(self):
        if self.location == 24 and self.visions == 0:
            print("You wonder for the rest of your life who cursed you, but you still win the game(Collect the bonus visions next time for a different ending)")
            print("You died a total of: " +str(self.deaths) + " times")
        elif self.location == 24 and self.visions == 1:
            print("You assume you know who cursed you and you end up cursing the wrong person.(Collect more visions next time)")
            print("You died a total of: " +str(self.deaths) + " times")
        elif self.location == 24 and self.visions >= 2:
            print("As you enter the body you get a final vision everything becomes clear you now know who it was, you curse him into a mosquito.")
            print("You died a total of: " +str(self.deaths) + " times")       
        
    def execute_tryagain(self):
        while self.location == 8:
             self.deaths = self.deaths + 1
             self.console_view.print_text("You have died: " +str(self.deaths) + " time(s)")
             x = input("\nDo you want to try again?[YES/NO]")
             if "yes" in x:
                self.location = 7
                desc = self.game_model.get_desc(self.location)
                print(desc)
             elif "no" in x:
                 self.execute_exit()
             else:
                 self.unknown_command()
                 self.deaths = self.deaths - 1
                 
        while self.location == 10:
            self.deaths = self.deaths + 1
            self.console_view.print_text("You have died " +str(self.deaths) + " time(s)")
            y = input("\nDo you want to try again? [YES/NO]")
            if "yes" in y:
                self.location = 9
                desc = self.game_model.get_desc(self.location)
                print(desc)
            elif "no" in y:
                self.execute_exit()
            else:
                self.unknown_command()
                self.deaths = self.deaths - 1
                
        while self.location == 13:
            self.deaths = self.deaths + 1
            self.console_view.print_text("You have died " +str(self.deaths) + " time(s)")
            z = input("\nDo you want to try again?[YES/NO]")
            if "yes" in z:
                self.location = 12
                desc = self.game_model.get_desc(self.location)
                print(desc)
            elif "no" in z:
                self.execute_exit()
            else:
                self.unknown_command()
                self.deaths = self.deaths - 1
                
        while self.location == 19:
            self.deaths = self.deaths + 1
            self.console_view.print_text("You have died " +str(self.deaths) + " time(s)")
            k = input("\nDo you want to try again?[YES/NO]")
            if "yes" in k:
                self.location = 18
                desc = self.game_model.get_desc(self.location)
                print(desc)
            elif "no" in k:
                self.execute_exit()
            else:
                self.unknown_command()
                self.deaths = self.deaths - 1
                
        while self.location == 22:
            self.deaths = self.deaths + 1
            self.console_view.print_text("You have died " +str(self.deaths)+ " time(s)")
            l = input("\nDo you want to try again?[YES/NO]")
            if "yes" in l:
                 self.location = 21
                 desc = self.game_model.get_desc(self.location)
                 print(desc)
            elif "no" in l:
                self.execute_exit()
            else:
                self.unknown_command()
                self.deaths = self.deaths - 1
        return
       
                 

                
    def parse_command(self, command_text):
        if command_text.upper() == 'HELP': # return value depends on where we are
            self.execute_help() # Help action is complemented with info from model
        elif command_text.upper() == 'EXIT':
            self.execute_exit()
        elif command_text.upper().startswith("GO"):
            self.execute_move(command_text)
            self.execute_desc()
            self.execute_tryagain()
            self.execute_vision()
            self.execute_ending()
        else:
            self.unknown_command()


# Suorituksen aloituskohta
def main():
    game = GameController()
    game.init()
    game.start()

if __name__ == '__main__': main()
