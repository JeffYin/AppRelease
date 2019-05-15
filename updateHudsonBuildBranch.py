import xml.etree.ElementTree as et
import sys

def updateBranchSpec(configureFile, newVer):
    tree=et.parse(configureFile)
    tree.find(".//hudson.plugins.git.BranchSpec[1]/name").text=newVer
    tree.write(configureFile)
    print("The Hudson Branch was switched to {}".format(newVer))

updateBranchSpec(configureFile = sys.argv[1], newVer=sys.argv[2])

