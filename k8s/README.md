
 3897  k edit deployments.apps redis-deployment
 3901  k rollout status 
 3902  k rollout status redis-deployment
 3906  k rollout history deployment redis-deployment
 3908  k rollout  undo  deployment redis-deployment 
 3909  k rollout status 
 3910  k get pods
 3915  k describe pod redis-deployment-7d656448c5-72gcs


kubectl annotate deployment/<deployment-name> kubernetes.io/change-cause="reason for the update"