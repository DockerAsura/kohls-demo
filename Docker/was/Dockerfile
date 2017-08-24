FROM hub.10.2.2.2:80/openshift/sterlingwas855:v10
MAINTAINER soumyadeep.paul@in.ibm.com
ENV DBSERVERIP 9.109.123.196

# TODO : Download the image at /tmp
RUN touch "/tmp/temp-$$"
RUN echo "$DBSERVERIP     dockerhost" >> /etc/hosts \
&& curl -u szutshi5@in.ibm.com:AKCp2V6d4iDcBVT84QT1K3fftka3d16JF3f65tdtYEEZ7HzNorw9u58JjEiRXhafwdH7LXLaB -o /tmp/smcfs.ear "http://inmyzd0137.in.dst.ibm.com:8081/artifactory/Kohls/smcfs.ear" \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh  server1 \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/wsadmin.sh -c '$AdminApp uninstall "Sterling Applications"' \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/wsadmin.sh -c '$AdminConfig save' \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/wsadmin.sh -c '$AdminApp install "/tmp/smcfs.ear" {-server server1}' \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/wsadmin.sh -c '$AdminConfig save' \
&& /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/stopServer.sh server1\
&& echo '#!/bin/bash' > /script.sh \
&& echo '/opt/IBM/WebSphere/AppServer/profiles/AppSrv01/bin/startServer.sh server1' >> /script.sh \
&& echo 'tail -f /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/logs/server1/SystemOut.log' >> /script.sh \
&& chmod +x /script.sh
CMD ["/script.sh"]
