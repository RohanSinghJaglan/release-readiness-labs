# OrderFlow - Release Readiness Investigation & Production Deployment

OrderFlow is a production-grade Node.js microservice prepared and verified for release **v2.3.0**.

## Application Endpoints
- `GET /` — API welcome message
- `GET /health` — Service health and deployed package version check

## Current Release Information
- **Version:** `v2.3.0`
- **Target Environment:** `production`
- **Release Status:** Approved & Production-Ready
- **Previous Stable Version:** `v2.2.0`

## Production Readiness Summary

| Readiness Gate | Status | Details |
|---|---|---|
| **Pipeline Workflow** | Passed | Validation runs prior to gated production deployment |
| **Secret Management** | Secured | Plaintext credentials replaced with environment vars & SecretKeyRefs |
| **Version Traceability** | Pinned | All artifacts traceable to `v2.3.0` (no `latest` tag) |
| **Approvals & Governance** | Approved | Documented sign-off in `release/approvals.yml` |
| **Rollback Plan** | Automated | Documented in `release/rollback.yml` and tested in `scripts/rollback.sh` |
| **Deployment Checklist** | Verified | Complete checklist in `release/DEPLOYMENT_CHECKLIST.md` |
| **Infrastructure** | Hardened | Production-grade sizing (`t3.large`) with multi-replica HA Kubernetes |

## Release Pack Structure
```
├── .github/
│   └── workflows/
│       └── release.yml          # Repaired CI/CD pipeline (validation -> deploy)
├── app/
│   ├── server.js                # Application entrypoint with /health
│   └── package.json             # Pinned version 2.3.0
├── deployment/
│   ├── kubernetes/
│   │   ├── deployment.yaml      # Rolling update deployment with SecretKeyRefs
│   │   ├── service.yaml         # LoadBalancer service
│   │   └── secret-template.yaml # Production secret template
│   └── terraform/
│       ├── main.tf              # Production-grade EC2 / HA setup
│       └── variables.tf         # Sensitive variables with no hardcoded defaults
├── release/
│   ├── approvals.yml            # Formal stakeholder approvals
│   ├── deployment-config.yml    # Parameterized release configuration
│   ├── release-summary.yml      # Release metadata & deployment status
│   ├── release.json             # Immutable release metadata (v2.3.0)
│   ├── rollback.yml             # Comprehensive rollback procedure to v2.2.0
│   ├── RELEASE_NOTES.md         # Full release documentation
│   └── DEPLOYMENT_CHECKLIST.md  # Production pre/post-deployment checklist
└── scripts/
    ├── deploy.sh                # Production deploy script for v2.3.0
    └── rollback.sh              # Automated rollback script to v2.2.0
```

## Running & Testing

### Run Locally
```bash
cd app
npm install
npm start
```

### Validate Release
```bash
npm test --prefix app
./scripts/deploy.sh
./scripts/rollback.sh
```
