pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = 'AKIAWRCOA7OPACU5DR7A'       // Replace with your AWS Access Key ID
        AWS_SECRET_ACCESS_KEY = 'HQB6kbgi7s804Ru6G4MWyS2cUCTuEdRICh0thopt' // Replace with your AWS Secret Access Key
        AWS_REGION = 'us-east-1'                         // Specify your AWS region
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
                    sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        terraform init
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    echo 'Applying Terraform configuration...'
                    sh '''
                        export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                        export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                        terraform apply -auto-approve
                    '''
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

