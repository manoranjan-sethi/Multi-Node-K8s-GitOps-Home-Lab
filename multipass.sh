# 1. Check if your CPU supports Virtualization
egrep -c '(vmx|svm)' /proc/cpuinfo
# (If the number is 1 or higher, you are good to go)

# 2. Install Multipass
sudo snap install multipass

# 3. Create your 3-node "Virtual Infrastructure"
multipass launch --name k8s-master --cpus 2 --mem 4G --disk 20G
multipass launch --name k8s-worker-1 --cpus 1 --mem 4G --disk 20G
multipass launch --name k8s-worker-2 --cpus 1 --mem 4G --disk 20G