#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
from HTMLParser import HTMLParser
import chardet
import textwrap

class MLStripper(HTMLParser):
    def __init__(self, ienc):
        self.reset()
        self.fed = []
        self.ienc = ienc
        self.isstyledata = False
    def handle_data(self, d):
        if self.isstyledata:
            self.isstyledata = False
            pass
        elif self.ienc == 'utf-8':
            self.fed.append(d)
        else:
            self.fed.append(d.decode('iso-8859-1'))
    def handle_starttag(self, tag, attrs):
        if tag == 'br':
            self.fed.append('\n')
        elif tag == 'style':
            self.isstyledata = True
    def get_data(self):
        return ''.join(self.fed)

def rm_multiple_empty_lines(lines):
    if not lines:
        return lines
    elif len(lines) == 1:
        return lines
    elif lines[0] == '' and lines[1] == '':
        return rm_multiple_empty_lines(lines[1:])
    else:
        return lines[:1] + rm_multiple_empty_lines(lines[1:])

def main():
    if len(sys.argv) > 1:
        with open(sys.argv[1], 'r') as f:
            cont = f.read()

            fenc = chardet.detect(cont)['encoding']
            s = MLStripper(fenc)
            s.feed(cont)

            if fenc == 'utf-8':
                r = s.get_data()
            else:
                r = s.get_data().encode('utf-8')

            r = r.strip()
            r = rm_multiple_empty_lines(r.splitlines())
            r = map(lambda s: textwrap.fill(s, width=72), r)
            r = '\n'.join(r)

            print r

if __name__ == '__main__':
    main()
