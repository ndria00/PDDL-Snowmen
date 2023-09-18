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
        self.map = []
        self.balls = {}
        self.print_map={0:" ",1:"≡",2:"ጰ", 5:"◦", 6:"○", 7:"O", 8:"⦾", 9:"☃"}

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
        for i in range(0,rows):
            self.map.append([0 for _ in range(cols)])
        for str in text:

            m = re.match(r'\s*\(\s*snow\s+loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                    self.map[int(m.groups()[1])-1][int(m.groups()[0])-1] += 1

            m = re.match(r'\s*\(\s*character_at\s+loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                   self.player = Object(int(m.groups()[0])-1, int(m.groups()[1])-1)

            m = re.match(r'\s*\(\s*ball_at\s+([a-zA-Z_0-9]+)\s*loc\_(\d+)\_(\d+).+', str)
            if not (m is None):
                   name = m.groups()[0]
                   self.balls[name].x = int(m.groups()[1]) -1
                   self.balls[name].y = int(m.groups()[2]) -1

    def update_status(self, move):
        pass

    def print(self):
        copy_map = []
        for i in self.map:
            copy_map.append(i.copy())
        copy_map[self.player.y][self.player.x] = 2
        for i in self.balls.values():
            if(copy_map[i.y][i.x]<5):
                copy_map[i.y][i.x]=4+i.size
            elif(copy_map[i.y][i.x]<8): 
                copy_map[i.y][i.x]=8
            else:
                copy_map[i.y][i.x]=9

        for i in range(0,len(copy_map)):
            print("|",sep="",end="")
            for j in copy_map[len(copy_map)-1-i]:
               print(self.print_map[j],sep="",end="|")
            print("",sep="")
        print()


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
    with open(plan , "r") as planfile:
        for line in planfile:
            world.update_status(line)
            world.print()