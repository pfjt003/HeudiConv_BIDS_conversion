#!/usr/bin/python

import sys

idmap = {
  '201905071342_19900902HEFE': '1',
  '201909121037_19970718CCBU': '2',
  '202002040947_19800101XXXX': 'phantom'
}

def anon_id(orig_id):
    #return '%.2i' % idmap[orig_id.strip()]
    return idmap[orig_id.strip()].zfill(2)

if __name__ == '__main__':
    orig_id = sys.argv[1]
    if orig_id == 'list':
        print ' '.join(sorted(idmap.keys()))
    else:
        print anon_id(orig_id)
