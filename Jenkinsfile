pipeline {
    agent any
    stages {
        stage('Prepare tag') {
            steps {
                script {
                println('BUILD_ID: ' + BUILD_ID)
                println('BUILD_TAG: ' + BUILD_TAG)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                echo 'Running tests...'
                // Example: Run tests (e.g., ./run-tests.sh, mvn test, pytest, etc.)
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                echo 'Deploying the application...'
                // Example: Deploy files, restart services, etc.
                }
            }
        }
    }
}
