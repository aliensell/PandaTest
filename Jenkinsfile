pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                echo 'Building the project...'
                // Add build commands here (e.g., compile code, run make, mvn package, etc.)
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
