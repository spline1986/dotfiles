#!/usr/bin/env python3

from os import popen

raw_workspaces = popen("wmctrl -d").read()

workspaces = {}
for line in raw_workspaces.split("\n"):
    w = line.split(" ")
    if len(w) > 1:
        workspaces[w[0]] = w[-1].split(":")[1]

windows = []
raw_windows = popen("wmctrl -l").read()
for line in raw_windows.split("\n"):
    w = line.split(" ")
    if len(w) > 1:
        windows.append([w[2], " ".join(w[4:])])

windows.sort(key=lambda w: w[0])

for w in windows:
    print("{}\t{}".format(workspaces[w[0]], w[1]))