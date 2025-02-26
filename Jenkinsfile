def currentYear = ''
def imagetag = ''

pipeline {
    agent any
    stages {
        stage('Prepare image tag') {
            steps {
                script {
                currentYear = new Date().format('yyyy')
                imagetag = currentYear + '.' + ${BUILD_ID}
                println('Image tag is: ' + imagetag)
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
