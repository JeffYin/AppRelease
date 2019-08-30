import requests
import xml.etree.ElementTree as et
import sys
import os
import searchReplace as sr


oldVer="5.42.00"
newVer="5.42.10"
newJobTab="2019.07"
hudsonURL="http://trdev-001.srb-es.com:8080/hudson"
# hudsonURL="http://localhost:8888/hudson"
jobs=["SchoolAdmin"]
confugureXML="config.xml"
OLD_JOB_NAME_PATTERN="{name}_{ver}"
NEW_JOB_NAME_PATTERN="{name}_{ver}"
HEADERS={'Content-type':"application/x-www-form-urlencoded"}

def updateBranchSpec(configureFile, newVer):
    tree=et.parse(configureFile)
    tree.find(".//hudson.plugins.git.BranchSpec[1]/name").text=newVer
    tree.write(configureFile)
    print("The Hudson Branch was switched to {}".format(newVer))

for job in jobs:
    oldJob=OLD_JOB_NAME_PATTERN.format(name=job, ver=oldVer)
    newJob=NEW_JOB_NAME_PATTERN.format(name=job, ver=newVer)
    newJobConfigURL="{url}/job/{service}/config.xml".format(url=hudsonURL,service=newJob)
    newJobConfig=newJob+".config.xml"

    #Create the new job
    parameter="name={name}&mode=copy&from={oldJob}".format(name=newJob,  oldJob=oldJob)
    createJobURL = "{url}/view/{tab}/createItem".format(url=hudsonURL, tab=newJobTab)
    print(createJobURL)
    res = requests.post(url=createJobURL, data=parameter, headers=HEADERS)
  
   # Download the configuration file
    response = requests.get(newJobConfigURL)
    open(newJobConfig,"wb").write(response.content)

   # Modify the configuration
    # updateBranchSpec(newJobConfig, newVer)
    sr.searchReplace(newJobConfig, oldVer, newVer)

   # Upload the file
    with open(newJobConfig,'r') as f:
          data = f.read()
          requests.post(url=newJobConfigURL, data=data)

