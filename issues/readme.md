# Known Issues

1. Worker nodes failed to join (conntrack not found)

- **Description:** Worker nodes failed to join because the `conntrack` utility was missing.
- **Lesson learned:** Ensure prerequisites are applied across the entire fleet (control plane and workers). Use automation (Ansible, Terraform) to guarantee identical base packages across nodes.

2. Argo CD Repository Connection "Failed" (DNS Resolution Error)

- **Description:** After installing Argo CD, the repository status showed Failed when connecting a public GitHub URL. While the host and the VMs could reach the internet, `the argocd-repo-server` pod was unable to resolve `github.com` due to internal cluster DNS limitations on the home lab network.
- **Root cause:** The pod-level DNS was trapped in a loop or failing to upstream requests from the internal CoreDNS to the public internet
-**Solution** Performed a `kubectl patch` on the `argocd-repo-server` deployment to inject reliable external nameservers (`8.8.8.8` and `1.1.1.1`) directly into the pod's `dnsConfig`.
- **Lesson learned:** Pod networking is an isolated layer from Node networking. In a DevSecOps environment, infrastructure-as-code (IaC) allows us to patch specific service vulnerabilities or networking gaps without disrupting the entire cluster. Always verify the "path of truth" from inside the container using `kubectl exec` when external connections fail.