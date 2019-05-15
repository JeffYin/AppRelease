import requests
import xml.etree.ElementTree as et
import sys
import os


oldVer="v.2019.04.00"
newVer="v.2019.06.00"
newJobTab="2019.06"
# hudsonURL="http://trdev-001.srb-es.com:8080/hudson"
hudsonURL="http://localhost:8888/hudson"
jobs=["service-achievement-elem", \
        "service-achievement-sec", \
        "service-attendance", \
        "service-school", \
        "service-staff", \
        "service-student-enrolment", \
        "service-student" \
     ]
confugureXML="config.xml"
JOB_NAME_PATTERN="{name}_{ver}-Git"
HEADERS={'Content-type':"application/x-www-form-urlencoded"}

def updateBranchSpec(configureFile, newVer):
    tree=et.parse(configureFile)
    tree.find(".//hudson.plugins.git.BranchSpec[1]/name").text=newVer
    tree.write(configureFile)
    print("The Hudson Branch was switched to {}".format(newVer))

for job in jobs:
    oldJob=JOB_NAME_PATTERN.format(name=job, ver=oldVer)
    newJob=JOB_NAME_PATTERN.format(name=job, ver=newVer)
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
    updateBranchSpec(newJobConfig, newVer)

   # Upload the file
    with open(newJobConfig,'r') as f:
          data = f.read()
          requests.post(url=newJobConfigURL, data=data)

