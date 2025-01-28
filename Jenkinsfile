pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1' // Specify your AWS region
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/jonathanorbittoun/my-jenkins-pipeline.git'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo 'Running unit tests...'
                sh './run-tests.sh' // Ensure this script exists in your repository
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    echo 'Initializing Terraform...'
                    withCredentials([
                        [
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: 'ba8c2f05-a57b-44d4-9ea5-3a237faf8767' // Corrected ID from Jenkins
                        ]
                    ]) {
                        sh '''
                            terraform init
                        '''
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    echo 'Applying Terraform configuration...'
                    withCredentials([
                        [
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsId: 'ba8c2f05-a57b-44d4-9ea5-3a237faf8767' // Corrected ID from Jenkins
                        ]
                    ]) {
                        sh '''
                            terraform apply -auto-approve
                        '''
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
