def imagetag = ''
def imagename = 'python_http_server'

pipeline {
    agent any
    stages {
        stage('Prepare image tag') {
            steps {
                script {
                    def currentYear = new Date().format('yyyy')
                    imagetag = currentYear + '.' + BUILD_ID
                    println('Image tag is: ' + imagetag)
                }
            }
        }
        stage('Build image') {
            steps {
                script {
                    sh """
                    docker build -t ${imagename}:${imagetag} -f Dockerfile
                    docker images
                    """
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
