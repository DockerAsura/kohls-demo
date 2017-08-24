FROM docker-registry-default.router.default.svc.cluster.local/kohls-demo/sterlingfoundation:v8
MAINTAINER soumyadeep.paul@in.ibm.com

# Download the jar file
#ADD PaymentMock.jar /tmp/PaymentMock.jar

RUN mkdir /tmp/workdir
RUN touch /tmp/kohls-demo-12 && touch /tmp/test10111

RUN echo "9.109.123.196    dockerhost" >> /etc/hosts \
&& echo "9.109.123.196    gitlab-ce2-kohls-demo.router.default.svc.cluster.local" >> /etc/hosts \
&& cat /etc/hosts \
&& cd /tmp/workdir \
&& git clone http://gitlab-ce2-kohls-demo.router.default.svc.cluster.local/epnaveen/Kohls-demo.git \
&& cp -r /tmp/workdir/Kohls-demo/Sterling/extensions/ /opt/RSC/OMS95/ \
&& /opt/RSC/OMS95/bin/deployer.sh -t entitydeployer \
&& /opt/RSC/OMS95/bin/deployer.sh -t resourcejar \
&& /opt/RSC/OMS95/bin/buildear.sh -Dappserver=websphere -Dwarfiles=smcfs,isccs,sbc,wsc -Dearfile=smcfs.ear -Dnowebservice=true -Ddevmode=true -Dnodocear=true -Duidevmode=true -Dnoejb=true -Dsupportmultiwar=true create-ear \
&& date && ls -lhrt /opt/RSC/OMS95/external_deployments/smcfs.ear \
&& echo '#!/bin/bash' > /script.sh \
&& echo 'while true; do echo "running"  ; sleep 2; done' >> /script.sh \
&& chmod +x /script.sh \
&& curl -u szutshi5@in.ibm.com:AKCp2V6d4iDcBVT84QT1K3fftka3d16JF3f65tdtYEEZ7HzNorw9u58JjEiRXhafwdH7LXLaB -X PUT "http://inmyzd0137.in.dst.ibm.com:8081/artifactory/Kohls/smcfs.ear"  -T /opt/RSC/OMS95/external_deployments/smcfs.ear
##&& curl -u szutshi5@in.ibm.com:AKCp2V6d4iDcBVT84QT1K3fftka3d16JF3f65tdtYEEZ7HzNorw9u58JjEiRXhafwdH7LXLaB -X PUT "http://inmyzd0137.in.dst.ibm.com:8081/artifactory/Kohls/smcfs.ear"  -T /etc/hosts
# TODO : Upload the EAR file

# Entrypoint
# Trigger a demo

CMD ["/script.sh"]




