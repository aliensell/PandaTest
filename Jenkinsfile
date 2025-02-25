pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/aliensell/PandaTest.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building the project...'
                // Add build commands here (e.g., compile code, run make, mvn package, etc.)
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Example: Run tests (e.g., ./run-tests.sh, mvn test, pytest, etc.)
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the application...'
                // Example: Deploy files, restart services, etc.
            }
        }
    }
}
