Train K8s:

Slides: https://docs.google.com/presentation/u/1/d/1xuzLlTix-1rtl3kSU4OkDUYMln28vAZIoXkjgjgF83o/edit#slide=id.p

#1 HEADING

#2
What is kubernetes:
1. Kubernetes is a open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

2. Why is it useful
---

#3 
Kubernetes Components
- When you deploy Kubernetes, you get a cluster.
- A Kubernetes cluster consists of a set of worker machines, called nodes, that run containerized applications. 
- Every cluster has at least one worker node.
- The worker node(s) host the Pods that are the components of the application workload.
- The control plane manages the worker nodes and the Pods in the cluster.


- The control plane's components make global decisions about the cluster Ex:for example, starting up a new pod when a deployment's replicas field is unsatisfied

## Control Plane Components: 
#### kube-apiserver - It exposes the Kubernetes API, It a FRONT_END for K8s Control plane.
#### etcd - Its DATABASE that store Key value paits like REDIS for all cluster data.
#### kube-scheduler - Watches for newly created PODS with no assigned node, it chooses the node for pod to run.

#### kube-controller-manager:

- Continuously looks for pod health status.
- Monitors the state of the system and works towards the bring back to desired state.
Node Controller:
- Every 5s
- Grace peroid 40s

Some types of these controllers are:

- Node controller: Responsible for noticing and responding when nodes go down.

- Job controller: Watches for Job objects that represent one-off tasks, then creates Pods to run those tasks to completion.

- Endpoints controller: Populates the Endpoints object (that is, joins Services & Pods).

- Service Account & Token controllers: Create default accounts and API access tokens for new namespaces.


#### cloud-controller-manager
- The cloud controller manager lets you link your cluster into your cloud provider's API.
- It seperates your clusters

## Node Components:
#### kubelet
- An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.
- The kubelet doesn't manage containers which were not created by Kubernetes.


#### kube-proxy
- It maintains network rules on nodes. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.

Container runtime
- The container runtime is the software that is responsible for running containers.
- Ex: Docker, Containerd, CRI-O


## The Kubernetes API lets you query and manipulate the state of API objects in Kubernetes (for example: Pods, Namespaces, ConfigMaps, and Events). Most operations can be performed through the kubectl command-line interface.

---
#4

## Understanding Kubernetes objects
- We use JSON[JavaScript Object Notation] or YAML formats for CRUD operations in kubernetes.
- We have 2 different approches to create k8s objects. imperative and Declarative
#### Imperative
```
kubectl create deployment --image=nginx nginx #Deployments create
kubectl scale deployment nginx --replicas=4
```
#### Declarative
	- Create YAML files with required resources and use kubectl comands to apply them.

#### Required Fields
In the .yaml file for the Kubernetes object you want to create, you'll need to set values for the following fields:

- apiVersion
	- Which version of the Kubernetes API you're using to create this object
- kind 
	- What kind of object you want to create
- metadata 
	- Data that helps uniquely identify the object, including a name string, UID, and optional namespace
- spec 
	- What state you desire for the object


#5
## Container
- A run time instance.
- Continaer image is ready-to-run software package to run an application.
- It is immutable, if you want to make any changes adjust them in image.

## Workloads
- A workload is an application running on Kubernetes.
- For example, once a pod is running in your cluster then a critical fault on the node where that pod is running means that all the pods on that node fail. Kubernetes treats that level of failure as final: you would need to create a new Pod to recover, even if the node later becomes healthy.

Workload resources: 
- Deployment, ReplicaSet
- StatefulSet
- DeamonSet
- Job and CronJob


NOTE: In Kubernetes, a Pod represents a set of running containers on your cluster.



 ENV=dev; echo "Checking if ANY service is missing in $ENV."; echo "\n"; if [[ -z $(while read line; do if [[ -z $(echo $SVC|grep -w "$line"$) ]; then echo "CRITICAL: $line has no services" | tee  /tmp/NoServiceAppList.txt; else echo > /dev/null ;fi;done  <<< $DEPLOY) ]];then  echo "$ENV: All Deployments and services are UP and Healthy"; else cat /tmp/NoServiceAppList.txt;fi
