# cicd-dualtrack-actions-jenkins

This repository demonstrates a production‑style CI/CD pipeline using both GitHub Actions and Jenkins for the same Node.js service.  It showcases senior‑level engineering practices such as infrastructure as code, pipelines as code, containerisation, Kubernetes deployment, Helm packaging, automated scanning and canary rollouts.

## Start here

- **Problem** – Provide a reproducible demonstration of a dual‑track CI/CD pipeline that builds, scans and deploys the same service using two different orchestrators.
- **Architecture** – A simple service packaged in a container with manifests for Kubernetes and a Helm chart.  The GitHub Actions workflow builds the image, scans it and pushes to the GitHub Container Registry.  The Jenkins pipeline mirrors those steps.  A canary deployment strategy is implemented in the deploy workflow.  You can create your own architecture diagram and place it in `docs/diagrams`.
- **How to run** – Use the Makefile targets (for example: `make test`, `make docker-build`, `make deploy`), or run the GitHub Actions and Jenkins pipelines.
- **Proof** – Add screenshots, charts or metrics into `docs/evidence` to demonstrate improvements in deployment time, cost or reliability.

## Results

| Metric | Before | After | Method |
|------|------:|------:|------|
| Deploy p50 | 17 minutes | 8 minutes | parallel tests and layer caching |
| Monthly cost | 1240 | 969 | rightsizing and caching |
| MTTR | 46 minutes | 21 minutes | runbooks and burn‑rate alerts |

These numbers are illustrative.  Capture your own metrics and update this table.

## Risk assessment

| Risk | Blast radius | Mitigation | Rollback |
|------|-------------|-----------|---------|
| Misconfiguration of production manifests | High | Plan and manual approval in pipelines | Delete the release tag and run a rollback |
| Vulnerable dependencies | Medium | Automated scans in CI and Dependabot | Fix CVEs and issue patch releases |
| Long‑lived credentials | Medium | Use OpenID Connect (OIDC) to AWS/ECR, avoid static secrets | Rotate tokens and update workflows |

## Repository layout

- `.github/` – workflow files and templates.
- `app/` – Node.js service code.
- `jenkins/` – Jenkinsfile for a parallel pipeline.
- `k8s/` – Kubernetes manifests.
- `charts/` – Helm chart.
- `docs/` – Diagrams, ADRs and evidence.
- `Makefile` – Common tasks.

Feel free to extend and modify these files for your own projects.
