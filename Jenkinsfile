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
                    docker build -t ${imagename}:${imagetag} -f Dockerfile .
                    docker images
                    """
                }
            }
        }
        stage('Run http server in container') {
            steps {
                script {
                    sh """
                    docker run -d -p 8888:8888 --name http-server-container ${imagename}:${imagetag}
                    docker ps
                    """
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh """
                    curl -i http://localhost:8888/hello
                    """
                }
            }
        }
    }
}
