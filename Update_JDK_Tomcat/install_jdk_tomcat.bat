
ECHO OFF
set targetJdkDir="C:\jdk1.8.0_172"
set targetJreDir="c:\Program Files\Java\jre1.8.0_172"
set targetTomcatDir="c:\apache-tomcat-8.5.31"
REM set targetTomcatDir="C:\Program Files\Apache Software Foundation\Tomcat 8.5.31"

REM Tomcat release package
set tomcatPackage="apache-tomcat-8.5.31.zip"

REM Install JDK
pushd "\\hyper-v-001\Trillium\TRDEV\WebDev\Deployment package for clients\Softwares_For_Developers"

Echo Installing %targetJdkDir%
jdk-8u172-windows-x64.exe /s ADDLOCAL="ToolsFeature,SourceFeature,PublicjreFeature" INSTALLDIR=%targetJdkDir% /INSTALLDIRPUBJRE=%targetJreDir%

set javaHome=%targetJdkDir%
setx -m JAVA_HOME %javaHome%
setx -m path "%javaHome%\bin\;%path%"

Echo Installing %targetJdkDir% completed.

REM some machines don't have PS 5. Expand-Archive is not supported below PS 5. 
REM PowerShell Expand-Archive -PATH %tomcatPackage% -DestinationPath %targetTomcatDir%

Echo Installing %targetTomcatDir%
javac UnZip.java
java UnZip %tomcatPackage% %targetTomcatDir%

setx -m CATALINA_HOME %targetTomcatDir%

popd

ECHO Installation  %targetTomcatDir% is completed.