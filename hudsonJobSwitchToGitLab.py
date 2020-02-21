import os


def listGitConfigFiles(rootDir):
    files = []
    filenames= os.listdir (rootDir) # get all files' and folders' names in the current directory

    for filename in filenames: # loop through all the files and folders
        appDir = os.path.join(os.path.abspath(rootDir), filename)
        if os.path.isdir(appDir): # check whether the current object is a folder or not
            gitConfig = os.path.join(appDir, "config.xml")
            if os.path.exists(gitConfig):
                files.append(gitConfig)
                # print(gitConfig)
    return files            

        

def modify(configFile):
    print("Modifying "+configFile)
    with open(configFile, 'r') as file:
        data = file.read()

    newData = data.replace(r"<host>gitswarm.powerschool.com</host>", r"<host>gitlab.powerschool.com</host>")

    with open(configFile, 'w') as file:
        file.write(newData)
        file.close()
    print("------ Completed")
    print()


# configFiles = listGitConfigFiles(r"c:\temp")
configFiles = listGitConfigFiles(r"E:\.hudson\jobs")
for config in configFiles:
     modify(config)

