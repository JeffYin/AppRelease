import json
import requests

API_TOKEN = "_MQBmEhpR7QWrypLxwXf"
GIT_URL_BASE = "https://gitswarm.powerschool.com/api/v3"
HEADERS = {"PRIVATE-TOKEN": API_TOKEN}
NAMESPACE="SRB-Trillium"
PROJECT_PREFIX = "eTrillium"
SCHADMIN_BRANCH_NAME="v.5.40.60"
# SCHADM_PROJECTS = ["ApplicationsForSchoolAdmin", "AdminAttendance", "IncidentTracking",  "ElementaryAchieveSetup", "SecondaryAchievementSetup", "StaffMaintenance", "StudentMaintenance"]
SCHADM_PROJECTS = ["StudentMaintenance"]

# Look for the projectId for the given project name. 
def findAppID(projectName):
    url = '{0}/projects/search/{1}_{2}'.format(GIT_URL_BASE, PROJECT_PREFIX, projectName)
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

# Protect the SchAdmin branches. 
def protectSchAdmin():
    for project in SCHADM_PROJECTS:
        id = findAppID(project)
        print("{project}:{id}".format(project=project, id=id))
        protectBranch(id, SCHADMIN_BRANCH_NAME)

# unProtect the SchAdmin branches. 
def unProtectSchAdmin():
    for project in SCHADM_PROJECTS:
        id = findAppID(project)
        print("{project}:{id}".format(project=project, id=id))
        unProtectBranch(id, SCHADMIN_BRANCH_NAME)

unProtectSchAdmin()



