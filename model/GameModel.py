import mysql.connector

class GameModel():
    def __init__(self, hostname, dbname, uname, pswd):
        self.db = mysql.connector.connect(
            host=hostname, user=uname, passwd=pswd, db=dbname,buffered=True
        )

    def get_directions(self, locationid):
        cur = self.db.cursor()
        cur.execute("select direction from passage where fromid = " + str(locationid))
        directions = []
        result = cur.fetchall()
        for row in result:
            directions.append(row[0])
        return directions

    def get_options(self, locationid):
        cur = self.db.cursor()
        cur.execute("select name, xxx from option where locationid = " + str(locationid))
        options = []
        result = cur.fetchall()
        for row in result:
            options.append(row[0])
        return options

    def move_to(self):
        print("poista")
        #update ....
