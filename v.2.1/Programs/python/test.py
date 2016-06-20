import png
w = 60
h = 40

def makeRainbow():
    global h
    global w
    offset = w
    p = []
    for i in range(0,w):
        for j in range(0,h):
            q = []
            if(i < offset):
                q.append((255,0,0,
                          0,255,0,
                          0,0,255))
        p.append(q)
    return p


def main():
    global w
    global h
    s = makeRainbow()
    print(s)
    f = open('test.png', 'wb')
    w = png.Writer(w,h)
    w.write(f, s)
    f.close()


main()

