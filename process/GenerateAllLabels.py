import os
import sys
import subprocess
import multiprocessing
from DistanceLabelGenerator import *

def main(rootdir, out_folder, pts_loc, pickle_loc): 
    pref = os.path.basename(rootdir)
    visited_prefix = set([])
    fileList = []
    for root, subfolders, files in os.walk(rootdir):
        files = filter(lambda z: 'split_0' in z, files)
        for f in files:
            fileList.append(os.path.join(root,f))

    prefix = len(os.path.commonprefix(fileList))
    arglist = [ ] 
    for f in fileList:
      path, fname = os.path.split(f)
      fname = fname[8:-5]
      prefix = path + '/' + fname
      pts_base = path.replace('/', '_') + '-'
      if prefix not in visited_prefix:
        arglist.append((prefix, out_folder, pref, os.path.join(pts_loc, pts_base), pickle_loc))
        visited_prefix.add(prefix)

    #command(arglist[0])
    pool = multiprocessing.Pool(processes=12)
    print pool.map(parseFolder, arglist)

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
