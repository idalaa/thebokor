__author__ = 'idalaa'

class ConsoleView():
    def print_action(self, action):
        print(action.get_text())

    def get_user_input(self):
        return input("Input command> ")

    def print_text(self, text):
        print(text)

