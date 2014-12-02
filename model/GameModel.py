import mysql.connector

class GameModel():
    def __init__(self, hostname, dbname, uname, pswd):
        print("poista")
        #self.db = mysql.connector.connect(
        #    host=hostname, user=uname, passwd=pswd, db=dbname,buffered=True
        #)

    def get_directions(self, locationid):
        cur = self.db.cursor()
        cur.execute("select direction from passage where fromid = " + locationid)
        return cur.fetchall()

    def get_options(self, locationid):
        cur = self.db.cursor()
        cur.execute("select name, xxx from option where locationid = " + locationid)
        return cur.fetchall()

    def move_to(self):
        print("poista")
        #update ....
