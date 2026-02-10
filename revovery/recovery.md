## Steps 1–3

1. Start all VMs

    ```bash
    multipass start --all
    ```

2. Wait for Kubernetes nodes to be ready

    ```bash
    kubectl get nodes -w
    # Wait until all nodes show STATUS: Ready
    ```

3. Expose the Argo CD UI locally

    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8001:443 --address 0.0.0.0
    # UI will be available at: http://localhost:8001
    ```

4. Verify Argo CD

    - Log into the Argo CD UI and ensure your applications show a **Healthy** status.

6. Stop all VMs

    ```bash
    multipass stop --all
    ```