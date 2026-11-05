# OrderFlow v2.3.0 Production Deployment Checklist

**Target Release:** OrderFlow `v2.3.0`  
**Target Environment:** `production`  
**Release Date:** 2026-11-05  
**Release Lead:** Release Engineering Team  

---

## 1. Pre-Deployment Validation Gate
- [x] **Source Code Validation:** All unit and integration tests passing (`npm test --prefix app`).
- [x] **Version Traceability:** Version consistently pinned to `v2.3.0` across `package.json`, `release.json`, `deployment-config.yml`, and Kubernetes manifests.
- [x] **Pipeline Integrity:** GitHub Actions release workflow updated (`validate-release` runs before `deploy-production`).
- [x] **Security Audit:** All plaintext secrets purged from repository; externalized via environment variables and Kubernetes `secretKeyRef`.
- [x] **Infrastructure Validation:** Terraform and Kubernetes manifests verified for production-grade HA sizing (`t3.large` / multi-replica).

## 2. Release Approvals & Governance
- [x] **QA Sign-off:** Test results verified and approved in `release/approvals.yml`.
- [x] **Security Sign-off:** Credential scanning passed with zero leaks.
- [x] **SRE / Release Manager Approval:** Production deployment window authorized.
- [x] **Environment Protection:** GitHub Actions production environment gates active.

## 3. Rollback & Contingency Plan
- [x] **Rollback Strategy Defined:** Documented in `release/rollback.yml`.
- [x] **Rollback Script Verified:** `scripts/rollback.sh` tested and executable.
- [x] **Target Rollback Version Identified:** Previous stable release `v2.2.0`.
- [x] **Health Check Verification:** Endpoint `GET /health` mapped for automated post-rollback sanity test.

## 4. Production Deployment Execution
- [x] **Deployment Script Verified:** `scripts/deploy.sh` updated to deploy explicit version `v2.3.0` instead of `latest`.
- [x] **Zero-Downtime Rollout:** Kubernetes `RollingUpdate` strategy configured (`maxSurge: 1`, `maxUnavailable: 0`).
- [x] **Post-Deployment Smoke Test:** Automated curl to `/health` returning HTTP 200 and version `2.3.0`.
- [x] **Telemetry & Alerting Active:** Error rate, P99 latency, and container restart monitors active.

---
**Status:** ALL GATES PASSED — RELEASE v2.3.0 APPROVED FOR PRODUCTION.

