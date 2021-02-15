pipeline {
    agent any

    environment {
        SOME_VARIABLE = 'some_important_url'
    }

    stages {
        stage('build') {
            steps {
                sh '''
                    echo "Multiline steps work too"
                    echo "The url is ${SOME_VARIABLE}"
                '''
            }
        }
        stage('deploy') {
            steps {
                sh '''
                    pwd
                    ls -a
                '''
                sh 'sh ./deploy_test.sh'
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
