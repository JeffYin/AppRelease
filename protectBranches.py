import json
import requests

#SCHADMIN_BRANC_NAME AND FRAME_SERVICE_BRANCH_NAME should be modified. 
SCHADMIN_BRANCH_NAME="v.5.41.20"
FRAME_SERVICE_BRANCH_NAME="v.2019.04.00"

API_TOKEN = "_MQBmEhpR7QWrypLxwXf"
GIT_URL_BASE = "https://gitswarm.powerschool.com/api/v3"
HEADERS = {"PRIVATE-TOKEN": API_TOKEN}
NAMESPACE="SRB-Trillium"
SCHADM_PROJECTS = ["eTrillium_ApplicationsForSchoolAdmin", "eTrillium_AdminAttendance", "eTrillium_IncidentTracking",  "eTrillium_ElementaryAchieveSetup", "eTrillium_SecondaryAchievementSetup", "eTrillium_StaffMaintenance", "eTrillium_StudentMaintenance"]
# SCHADM_PROJECTS = ["StudentMaintenance"]
FRAME_PROJECTS = ["mavenProjectConfig_GlobalConfig", "eTWebFrame_frame-common", "eTWebFrame_frame-dao", "eTWebFrame_frame-service", "eTWebFrame_frame-war", "eTWebFrame_frame-web"]
SERVICE_PROJECTS = ["eTrillium_TrilliumServices_service-achievement-elem", "eTrillium_TrilliumServices_service-achievement-sec", "eTrillium_TrilliumServices_service-attendance", "eTrillium_TrilliumServices_service-school", "eTrillium_TrilliumServices_service-staff", "eTrillium_TrilliumServices_service-student", "eTrillium_TrilliumServices_service-student-enrolment"]
REPORT_PROJECT=["eTrillium_ReportServer"]
# Look for the projectId for the given project name. 
def findAppID(projectName):
    url = '{0}/projects/search/{1}'.format(GIT_URL_BASE,projectName)
    response = requests.get(url, headers = HEADERS)
    if response.status_code == 200:
        projectInfo = json.loads(response.content.decode('utf-8'))
        projectId = projectInfo[0]["id"]
        return projectId
    else:
        return ""    

# Chagne the project status to Protected in GitSwarm
def protectBranch(projectId, branchName):
    url = '{url}/projects/{id}/repository/branches/{branch}/protect'.format(url=GIT_URL_BASE, id=projectId, branch=branchName)
    print("Protecting the branch with url: {}".format(url))
    response = requests.put(url, headers = HEADERS)
    if response.status_code == 200:
        print("Protecting is completed.")
    else:
        print("Protecting failed.")    

# Chagne the project status to UnProtected in GitSwarm
def unProtectBranch(projectId, branchName):
    url = '{url}/projects/{id}/repository/branches/{branch}/unprotect'.format(url=GIT_URL_BASE, id=projectId, branch=branchName)
    print("UnProtecting the branch with url: {}".format(url))
    response = requests.put(url, headers = HEADERS)
    if response.status_code == 200:
        print("UnProtecting is completed.")
    else:
        print("UnProtecting failed.")    

def protectProjects(projectNames, branchName):
     for project in projectNames:
        id = findAppID(project)
        if id:
           print("{project}:{id}".format(project=project, id=id))
           protectBranch(id, branchName)

# unProtect the SchAdmin branches. 
def unProtectProjects(projectNames, branchName):
    for project in projectNames:
        id = findAppID(project)
        if id:
           print("{project}:{id}".format(project=project, id=id))
           unProtectBranch(id, branchName)

# Protect the SchAdmin branches. 
def protectSchAdmin(branchName = SCHADMIN_BRANCH_NAME):
   protectProjects(SCHADM_PROJECTS, branchName)

# Protect Frame branches. 
def protectFrames(branchName=FRAME_SERVICE_BRANCH_NAME):
     protectProjects(FRAME_PROJECTS, branchName)        

# Protect Services. 
def protectServices(branchName=FRAME_SERVICE_BRANCH_NAME):
   protectProjects(SERVICE_PROJECTS, branchName)


# unProtect the SchAdmin branches. 
def unProtectSchAdmin(branchName = SCHADMIN_BRANCH_NAME):
    unProtectProjects(SCHADM_PROJECTS, branchName)

def unProtectFrame(branchName = FRAME_SERVICE_BRANCH_NAME):
     unProtectProjects(FRAME_PROJECTS, branchName)

def unProtectServices(branchName=FRAME_SERVICE_BRANCH_NAME):
   unProtectProjects(SERVICE_PROJECTS, branchName)

# protectSchAdmin()
# protectFrames()
# protectServices()

unProtectSchAdmin()
unProtectFrame()
unProtectServices()

# protectProjects(REPORT_PROJECT, "master")  #lOCK the master of TrilliumReport. 
