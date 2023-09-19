#!/usr/bin/python3
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
        self.print_map={0:" ",1:"≡",2:"ጰ", 5:"◦", 6:"o", 7:"○", 8:"⦾", 9:"☃"}

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
        print(f"applying {move}")
        m = re.match(r'.*\:\s*\(\s*move_character\s+loc\_(\d+)\_(\d+)\s+loc\_(\d+)\_(\d+).+', move) 
        if not (m is None):
            #print("Matched\n")
            self.player = Object(int(m.groups()[2])-1, int(m.groups()[3])-1)
        else:
            #print("Not matched\")
            m = re.match(r'.*\:\s*\(\s*move_ball\s+(ball_\d+)\s+loc\_(\d+)\_(\d+)\s+loc\_(\d+)\_(\d+)\s+loc\_(\d+)\_(\d+).+', move)
            if not (m is None):
                name = m.groups()[0]
                x_to = int(m.groups()[5])-1
                y_to = int(m.groups()[6])-1
                x_from = int(m.groups()[3])-1
                y_from = int(m.groups()[4])-1
                
                self.balls[name].x = x_to
                self.balls[name].y = y_to
                if self.map[y_to][x_to] == 1:
                    if self.balls[name].size < 3:
                        self.balls[name].size += 1 
                count = 0
                for b in self.balls.values():
                        if b.y == y_from and b.x == x_from:
                            count += 1
                            
                self.map[y_to][x_to] = 0
                if count == 0:
                    self.player.x = x_from
                    self.player.y = y_from

                

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
    world.print()
    with open(plan , "r") as planfile:
        for line in planfile:
            world.update_status(line)
            world.print()