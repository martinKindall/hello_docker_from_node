pipeline {
    agent any

    environment {
        SOME_VARIABLE = 'some_important_url'
        registry = 'mart256/learning-jenkins'
        registryCredential = 'dockerhub'
        dockerImage = ''
        dockerImageName = ''
    }

    stages {
        stage('just checking') {
            steps {
                sh '''
                    echo "Multiline steps work too"
                    echo "The url is ${SOME_VARIABLE}"
                    echo "The branch is ${GIT_BRANCH}"
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
        stage('Build image') {
            steps {
                script {
                    if (env.BRANCH_NAME != 'master') {
                        dockerImageName = registry + ":$GIT_BRANCH"
                    } else {
                        dockerImageName = registry + ":$BUILD_NUMBER"
                    }

                    dockerImage = docker.build dockerImageName
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
                sh "docker rmi $dockerImageName"
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
