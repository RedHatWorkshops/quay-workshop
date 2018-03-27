---
layout: lab
title: Adding Build Workers
permalink: /lab/dockerfiles/buildworkers/
module: Dockerfiles
---


Open the *Super User Admin Panel* and go to *Registry Settings*.

Go to *Dockerfile Build Support* and enable Dockerfile Build.

Select Save Configuration Changes.

Restart the Quay Enterprise Deployment

kubectl patch deployment quay-enterprise-app --patch "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"date\":\"`date +'%s'`\"}}}}}"


Scroll down
Navigate to the 
kubectl create secret generic rootca.crt --from-file="rootCA.crt=rootCA.crt" --namespace=quay-enterprise


sudo mkdir -p /etc/docker/certs.d/$QUAY
sudo cp rootCA.pem /etc/docker/certs.d/$QUAY/ca.crt


docker run --restart on-failure -e SERVER=ws://myquayenterprise -v /var/run/docker.sock:/var/run/docker.sock quay.io/coreos/quay-builder:v2.8.0


```
kubectl create -f - <<EOF
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  namespace: quay-enterprise
  name: quay-enterprise-builder
  labels:
    quay-enterprise-component: builder
spec:
  replicas: 1et 
  selector:
    matchLabels:
      quay-enterprise-component: builder
  template:
    metadata:
      namespace: quay-enterprise
      labels:
        quay-enterprise-component: builder
    spec:
      containers:
      - name: quay-enterprise-builder
        image: quay.io/coreos/quay-builder:v2.8.0
        command:
          - /bin/sleep
          - '6000'
        env:
        - name: SERVER
          value: wss://quay-enterprise
        volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker
        - mountPath: /etc/ssl/certs/
          name: rootca
      volumes:
      - name: docker
        hostPath:
          path: /var/run/docker.sock
      - name: docker-unsigned-cert
        hostPath
          path: /etc/docker/certs.d/$QUAY
          type: Directory
      - name: rootca
        secret:
          secretName: rootca.crt
      imagePullSecrets:
        - name: coreos-pull-secret
EOF
```


     command:
          - '/usr/sbin/update-ca-certificates'






          cd /usr/local/share/ca-certificates/


          /usr/sbin/update-ca-certificates


          cat /etc/ssl/certs/ca-certificates.crt


          openssl s_client -connect quay-enterprise:443 -CAfile /usr/local/share/ca-certificates/rootca.crt
          