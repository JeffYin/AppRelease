import sys

def searchReplace(resourceFile, oldStr, newStr):
    with open(resourceFile,'r') as file: 
        filedata = file.read()
    filedata = filedata.replace(oldStr, newStr)
    with open(resourceFile, 'w') as file:
        file.write(filedata)
    print("replacement finished.")    

# searchReplace(resourceFile = sys.argv[1], oldStr = sys.argv[2], newStr = sys.argv[3])