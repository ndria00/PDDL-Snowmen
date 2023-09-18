import re 
import sys


class Object:
    def __init__(self, x: int , y: int) -> None:
        self.x = x
        self.y = y
        
class Ball(Object) :
    def __init__(self, x, y, size) -> None:
        super().__init__(x, y)
        self.size = size

class World:
    def __init__(self) -> None:
        self.player = None
        self.map = None
        self.balls = {}

    def read_map(self, text):
        rows = 0
        cols = 0
        for str in text:
            m = re.match(r'\s*\(=\s*\(\s*ball\_size\s+([a-zA-Z\_0-9]+)\s*\)\s*(\d+).+', str)
            if not (m is None):
                   name = m.groups()[0]
                   self.balls[name] = Ball(0, 0, int(m.groups()[1]))

            m = re.match(r'\s*\(\s*next\s+loc\_(\d+)\_(\d+)\s+loc\_(\d+)\_(\d+)\s+.+', str)
            if not (m is None):
                for i in range(0,2):
                    x1 = int(m.groups()[i])
                    y1 = int(m.groups()[i+2])
                    if rows<x1:
                        rows = x1
                    if cols<y1:
                        cols = y1

        self.map = [[0 for _ in range(cols)]]*rows
        for str in text:
            m = re.match(r'\s*\(\s*snow\s+loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                    self.map[int(m.groups()[0])-1][int(m.groups()[1])-1] = 1

            m = re.match(r'\s*\(\s*character_at\s+loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                   self.player = Object(int(m.groups()[0])-1, int(m.groups()[1])-1)

            m = re.match(r'\s*\(\s*ball_at\s+([a-zA-Z_0-9]+)\s*loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                   name = m.groups()[0]
                   self.balls[name].x = int(m.groups()[1]) 
                   self.balls[name].y = int(m.groups()[2]) 
        for i in self.balls.keys():
            print(f"{i} => {self.balls[i].x} - {self.balls[i].y}")

    def update_status(self, move):
        pass

    def print(self):
        pass

if __name__== '__main__':
    if(len(sys.argv) != 3):
       print("Invalid number of parameters!")
       pass
    encoding = sys.argv[1]
    plan = sys.argv[2]
    text = []
    with open(encoding, "r") as file:
        text = file.read().split("\n")
    file.close()
    world = World()
    world.read_map(text)
    #print(text)