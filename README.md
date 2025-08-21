# Project 1: Secure Azure Login with OIDC

## 🔍 Project Summary

This project demonstrates how to securely connect GitHub Actions workflows to Azure using OpenID Connect (OIDC), eliminating the need to store long-lived client secrets in CI/CD pipelines. By leveraging federated identity, this approach reduces security risks and simplifies credential management in automated workflows.

---

## ❗ Problem Statement 

Many organisations face challenges with secrets in CI/CD pipelines:

- Manual secret rotation increases operational overhead  
- Storing static secrets in repositories or environments can lead to leaks  
- Maintaining secret access for multiple pipelines slows down delivery velocity  

This project addresses these issues by using token-based authentication with OIDC, providing a secure, automated, and auditable method for managing Azure resources from GitHub workflows.

---

## 🎯 Project Goals

- Enable secure authentication between GitHub Actions and Azure without storing secrets  
- Implement least-privilege access using Azure role assignments  
- Demonstrate a zero-secret authentication flow  
- Confirm access via a GitHub Actions workflow using Azure CLI  

---

## 🧩 Key Components

1. **Azure AD App Registration**  
   - Configured with a federated credential that trusts a GitHub repository and branch  
   - Acts as the identity used for authentication via OIDC  

2. **Federated Credential**  
   - Defines the trust relationship between GitHub and Azure AD  
   - Allows GitHub Actions to request tokens without secrets  

3. **GitHub Actions Workflow**  
   - Uses `azure/login@v1` to authenticate to Azure using OIDC tokens  
   - Executes Azure CLI commands to validate access  

4. **GitHub Secrets (non-sensitive identifiers)**  
   - Stores values such as `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and `AZURE_SUBSCRIPTION_ID`  
   - These are required for the workflow to target the correct Azure resources  
   - While not secrets, storing them in GitHub Secrets avoids hardcoding and improves maintainability  

---

## 💼 Business Impact

- Secures CI/CD pipelines by removing embedded secrets  
- Enables auditable and automated deployments to Azure  
- Reduces operational overhead and improves developer productivity  
- Supports enterprise compliance requirements for identity and access management  

---

## ⚙️ Implementation Steps

1. **Create Azure AD App Registration**  
   - Register a new application in Azure AD  
   - Configure a federated credential for GitHub Actions  
   - Specify the trusted repository and branch for token issuance  

2. **Assign Azure Role to the App Registration**  
   - Use least-privilege roles (e.g., Contributor or a custom role scoped to resources)  
   - Assign the role to the app registration’s identity in the subscription or resource group  

3. **Configure GitHub Repository Secrets**  
   - Store `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, and `AZURE_SUBSCRIPTION_ID`  
   - Ensure `id-token` permission is granted in the workflow  

4. **Create GitHub Actions Workflow**  
   - Place the workflow YAML file under `.github/workflows/`  
   - Configure steps to:  
     - Checkout code  
     - Authenticate to Azure using OIDC  
     - Optionally verify access with Azure CLI  

5. **Test and Validate**  
   - Commit and push the workflow to GitHub  
   - Confirm it triggers on the target branch  
   - Validate that Azure CLI commands execute successfully without secrets  

---

## 🚀 Usage

Once configured:

1. Developers push changes to the target branch (e.g., `main`)  
2. GitHub Actions automatically triggers the workflow  
3. The workflow authenticates to Azure using federated identity  
4. Azure resources are managed securely, with full auditability  

No manual secret management is required in the CI/CD pipeline.

---

## 📋 Prerequisites

- Azure subscription with administrative access  
- GitHub repository with admin permissions  
- Familiarity with GitHub Actions and Azure identity management  

---

## 🧭 Solution Architecture

![Architecture Diagram](https://github.com/tecknosap/secure-azure-oidc-login/blob/main/asset/oidc-architecture.gif)

---

## 🤝 Contributing

Contributions are welcome! Whether it’s bug fixes, workflow improvements, or documentation enhancements, feel free to submit a pull request. Please follow standard GitHub workflow practices:

- Fork the repository  
- Make your changes in a separate branch  
- Submit a pull request for review  

---

## 📄 Licence

This project is licensed under the MIT Licence. You are free to use, modify, and distribute this project in accordance with the licence.

---

## 📚 References

- [Azure AD Workload Identity Federation](https://learn.microsoft.com/en-gb/azure/active-directory/develop/workload-identity-federation-create-trust)  
- [GitHub Actions: Azure Login](https://github.com/Azure/login)

