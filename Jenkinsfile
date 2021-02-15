pipeline {
    agent any

    environment {
        SOME_VARIABLE = 'some_important_url'
        registry = 'mart256/learning-jenkins'
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    stages {
        stage('just checking') {
            steps {
                sh '''
                    echo "Multiline steps work too"
                    echo "The url is ${SOME_VARIABLE}"
                '''
            }
        }
        stage('tests') {
            steps {
                sh '''
                    pwd
                    ls -a
                '''
                sh 'sh ./deploy_test.sh'
            }
        }
        stage('Cloning Git') {
            steps {
                git 'https://github.com/martinKindall/hello_docker_from_node.git'
            }
        }
        stage('build docker image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy Image') {
            steps{
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
    post {
        success {
            echo 'Everything worked as expected :)'
        }
        failure {
            echo 'Deploy could not finish.'
        }
    }
}
