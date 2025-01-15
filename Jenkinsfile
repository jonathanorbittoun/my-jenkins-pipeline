pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        TF_VAR_key_name = 'terraform'  // Replace with your SSH key name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/jonathanorbittoun/jenkins-pipeline.git'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running unit tests...'
                sh './run-tests.sh'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    echo 'Initializing Terraform...'
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    echo 'Applying Terraform...'
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials-id']]) {
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
