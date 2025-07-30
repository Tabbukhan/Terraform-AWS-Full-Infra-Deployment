pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')      // secret text
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')      // secret text
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Tabbukhan/Terraform-AWS-Full-Infra-Deployment.git',
                        credentialsId: 'git-credentials'
                    ]]
                ])
            }
        }
        stage('Clean .terraform') {
            steps {
                sh 'rm -rf .terraform terraform.tfstate* tfplan .terraform.lock.hcl'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Lint') {
            steps {
                sh 'tflint --init'
                sh 'tflint'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -var-file=terraform.tfvars'
            }
        }
        stage('Terraform Apply') {
            steps {
                input message: 'Approve apply?', ok: 'Apply'
                sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
            }
        }
    }

    post {
        failure {
            echo 'Terraform pipeline failed.'
        }
        success {
            echo 'Infrastructure provisioned successfully!'
        }
    }
}
