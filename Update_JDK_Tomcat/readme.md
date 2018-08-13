Update to Latest Java 8u172 & Tomcat 8.5.31
--------------------------------------
# Java 6 Desprecated
From Frame 2018.07.00, the source code will be built on Java 8 level. All web applications based on this Frame version should be run with Java 8. They will NOT start up with Java 6 any longer, e.g. TwebSchAdmin 5.40.60, TA 2.91.10 and etc. should use Java 8.

# Package Location of JDK 8u172 & Tomcat8.5.31
We provided the packages of JDK & Tomcat for Java developers at \\\\hyper-v-001\Trillium\TRDEV\WebDev\Deployment package for clients\Softwares_For_Developers:
   - jdk-8u172-windows-x64.exe (Original package)
   - apache-tomcat-8.5.31.zip (Already configured. Not the original version)
   - install_jdk_tomcat.bat (The package installer recommended)
   - UnZip.java (To unzip apache-tomcat-8.5.31.zip. Windows does not provide the built in unzipper. Powershell 5+ has the command for unzipping. However, not all machine has PowerShell 5. So this java file is provided.)
   - Unzip.class (Unzip.java compiled file excutable in Java)
   - readme.md (Markdown file)
   - readme.pdf 

## Tomcat Out-of-the-box
 The package apache-tomcat-8.5.31.zip is completly configured wll for Trillium web apps. Once it is unzipped or installed, it is immediately ready for Trillium app installations. 
 1. Memory Tuned.   
The memory is configured to run Jasper Report, TwebSchAdmin and all other applications
 2. JDBC Drivers Installed.   
Jdbc drivers for MSSQL and Oracle are already in the package
 3.	Admin Account Created  
admin/admin is set. 
 4. App Licenses Pre-Included
You will see these licenses under Tomcat/certs folder

# Automatic Installation with Script
## Overview
A batch file is provided to do the updating. It will silently install JDK/JRE 8u172 to your local machine. It does not require user interaction so that the installation process is very fast and convenient. 

The OS system variable “Java_Home” will be automatically added by the script. No more manual work is required.

## Usage
1. go to \\\\hyper-v-001\Trillium\TRDEV\WebDev\Deployment package for clients\Softwares_For_Developers
2. Right click “install_jdk_tomcat.bat”, and *choose "Run as administrator"*. 
~~~
This batch file must be run as a administrator. Otherwise, some system parameters cannot be set properly. 
~~~

~~~ FYI
 It will install to these folders:
 
1. JDK folder: C:\jdk1.8.0_172
2. JRE folder: C:\Program Files\Java\jre1.8.0_172
3. Tomcat folder:C:\apache-tomcat-8.5.31
Short Tomcat path will help developer quickly locate Tomcat folder. 
~~~ 
If you want different folders, please copy the original install_jdk_tomcat.bat to a different bat file. Change the path variables in the new bat file to your preferred values. 


# Customized Installation
You also can install JDK & Tomcat in your own way instead of the automatic script. 
1. JDK 8U172 Installation  

Double click “jdk-8u172-windows-x64.exe” and follow up the navigation. It has user interfaces to specify customized parameters. 

2. Tomcat 8.5.31 Installation  
Manually unzip “apache-tomcat-8.5.31.zip” to your preferred folder. 

If you want install the original Tomcat package, please go to Tomcat 8.5.31 download web page.
