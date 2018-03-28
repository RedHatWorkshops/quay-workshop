---
layout: lab
title: Adding Build Workers
permalink: /lab/dockerfiles/buildworkers/
module: Dockerfiles
---

Copy the self-signed root ca to worker1 node so Docker can successfully connect to Quay Enterprise.

```
WORKER1=`kubectl get nodes -o jsonpath={$.items[*].metadata.name} | cut -d ' ' -f 1`
scp -o StrictHostKeyChecking=no rootCA.pem core@$WORKER1:/home/core
ssh -t core@$WORKER1 "sudo mkdir -p /etc/docker/certs.d/$QUAY; sudo mv /home/core/rootCA.pem /etc/docker/certs.d/$QUAY/ca.crt"
```

Copy the self-signed root ca to worker2 node so Docker can successfully connect to Quay Enterprise.

```
WORKER2=`kubectl get nodes -o jsonpath={$.items[*].metadata.name} | cut -d ' ' -f 2`
scp -o StrictHostKeyChecking=no rootCA.pem core@$WORKER2:/home/core
ssh -t core@$WORKER2 "sudo mkdir -p /etc/docker/certs.d/$QUAY; sudo mv /home/core/rootCA.pem /etc/docker/certs.d/$QUAY/ca.crt"
```

Copy the self-signed root ca to master node so Docker can successfully connect to Quay Enterprise.

```
MASTER=`kubectl get nodes -o jsonpath={$.items[*].metadata.name} | cut -d ' ' -f 3`
scp -o StrictHostKeyChecking=no rootCA.pem core@$MASTER:/home/core
ssh -t core@$MASTER "sudo mkdir -p /etc/docker/certs.d/$QUAY; sudo mv /home/core/rootCA.pem /etc/docker/certs.d/$QUAY/ca.crt"
```

Open the **Super User Admin Panel** and go to **Registry Settings**.

Go to **Dockerfile Build Support** and enable **Dockerfile Build**.

Select **Save Configuration Changes**.

Restart the Quay Enterprise Deployment via patching the date to the quay-enterprise-app deployment

```
kubectl -n quay-enterprise patch deployment quay-enterprise-app --patch "{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"date\":\"`date +'%s'`\"}}}}}"
```

Open the Quay Enteprise UI and notice that we now have a new section in our namespace called **Builds**.

Create a new Kubernetes secret for our self-signed root CA.

kubectl -n quay-enterprise create secret generic ca.crt --from-file="ca.crt=rootCA.pem"


Deploy the quay-builder image and mount both the Docker socket on the node as well as the self-signed root CA.

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
  replicas: 1
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
        lifecycle:
          postStart:
            exec:
              command: ["/bin/sh", "-c", "sleep 5; /bin/cat /usr/local/share/ca-certificates/ca.crt >> /etc/ssl/certs/ca-certificates.crt"]
        command:
          - quay-builder
        env:
        - name: SERVER
          value: wss://quay-enterprise
        volumeMounts:
        - mountPath: /var/run/docker.sock
          name: docker
        - mountPath: /usr/local/share/ca-certificates/
          name: rootca
      volumes:
      - name: docker
        hostPath:
          path: /var/run/docker.sock
      - name: rootca
        secret:
          secretName: ca.crt
      imagePullSecrets:
        - name: coreos-pull-secret
EOF
```

Verify the quay-builder has successfully connected to the Quay Enterprise host.

```
kubectl -n quay-enterprise logs quay-enterprise-builder-6c58454994-xnrpb -f
```

Try uploading a Dockerfile to the `anothernewrepo` repo via the UI or API.